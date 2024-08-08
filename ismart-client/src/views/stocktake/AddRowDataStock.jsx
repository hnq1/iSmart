import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button, Table } from "react-bootstrap";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";
import { fetchAllGoodsInWarehouse } from "~/services/GoodServices";
import { fetchGoodinWarehouseById } from "~/services/GoodServices";
import { getAvailableBatch } from "~/services/ImportOrderDetailServices";








const AddRowDataStock = ({ selectedStorageId, isShow, handleClose, onChange }) => {


    const [totalGoods, setTotalGoods] = useState([]);
    const [totalBatchs, setTotalBatchs] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedBatchCode, setSelectedBatchCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);
    const [dataMethod, setDataMethod] = useState(null);
    const [selectedMethod, setSelectedMethod] = useState('');
    const [selectImportOrderDetailId, setSelectImportOrderDetailId] = useState(null);
    const [actualQuantity, setActualQuantity] = useState(0);
    const [oldActualQuantity, setOldActualQuantity] = useState(0);
    const [totalActualQuantity, setTotalActualQuantity] = useState(0);
    const [totalQuantity, setTotalQuantity] = useState('');
    const [inputActualQuantity, setInputActualQuantity] = useState(0);


    useEffect(() => {
        getAllGoods();
    }, [selectedStorageId])




    useEffect(() => {
        setDataMethod();
    }, [selectedMethod])


    useEffect(() => {
        if (dataMethod) {
            setActualQuantity(dataMethod.actualQuantity);
            setOldActualQuantity(dataMethod.actualQuantity);
            setInputActualQuantity(dataMethod.actualQuantity);
        }
    }, [dataMethod]);


    const getAllGoods = async () => {
        if (selectedStorageId !== null) {
            let res = await fetchAllGoodsInWarehouse(selectedStorageId);
            setTotalGoods(res);
        }
    }


    const handleGoodClick = async (good, event) => {
        setDataMethod(null);
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
        let m = await getAvailableBatch(selectedStorageId, good.goodsId);
        const totalActualGoodQuantity = m.reduce((sum, item) => sum + item.actualQuantity, 0);
        setTotalActualQuantity(totalActualGoodQuantity);
        const totalGoodQuantity = m.reduce((sum, item) => sum + item.quantity, 0);
        setTotalQuantity(totalGoodQuantity);
        if (m.length === 0) {
            toast.warning("Không có lô hàng nào");
        } else {
            setTotalBatchs(m);
            // setDataMethod(m);


            // const importOrderDetailIds = m.map(item => ({
            //     importOrderDetailId: item.importOrderDetailId,
            //     batchCode: item.batchCode,
            //     actualQuantity: item.actualQuantity,
            //     quantity: item.quantity
            // }));


            // setSelectImportOrderDetailId(importOrderDetailIds);
        }
    }


    const handleBatchClick = async (batch, event) => {
        setSelectedBatchCode(batch.batchCode);
        console.log("res: ", batch);
        setDataMethod(batch);


        const importOrderDetailIds = {
            goodId: selectedGoodId,
            goodCode: selectedGoodCode,
            batchCode: batch.batchCode,
            actualQuantity: batch.actualQuantity,
            quantity: batch.quantity
        };
        setInputActualQuantity(batch.actualQuantity);
        //setQuantity(batch.quantity);
        setSelectImportOrderDetailId(importOrderDetailIds);
    }


    const handleInputQuantityChange = (event) => {
        const numericValue = Number(event.target.value);
        if (isNaN(numericValue) || numericValue < 0) {
            toast.warning("Vui lòng nhập số lớn hơn hoặc bằng 0");
            setActualQuantity('');
            setInputActualQuantity('');
            return;
        }
        setActualQuantity(numericValue);
        setInputActualQuantity(numericValue);
        console.log("Updated actualQuantity: ", numericValue); // Debugging line
    };




    const handleConfirmRowData = () => {
        const batchCode = selectImportOrderDetailId?.batchCode || '';
        const quantity = selectImportOrderDetailId?.quantity || 0;
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm");
        }
        if (!batchCode) {
            toast.warning("Vui lòng chọn lô hàng");
            return;
        }
        else {
            // Tạo mảng từ inputQuantities để gửi đi
            const inputQuantitiesArray = {
                actualQuantity: totalActualQuantity,
                expectedQuantity: totalQuantity,
                goodId: selectedGoodId,
                goodCode: selectedGoodCode,
                batchDetails: [
                    {
                        batchCode: batchCode,
                        expectedQuantity: quantity,
                        actualQuantity: actualQuantity,
                        oldActualQuantity: oldActualQuantity
                    }
                ]
            };




            onChange(inputQuantitiesArray);
            //console.log("exportDataArray: ", inputQuantitiesArray);
            handleCloseModal();
        }
    }


    const handleCloseModal = () => {
        handleReset();
        handleClose();


    }


    const handleReset = () => {
        setSelectedMethod(null);
        setDataMethod(null);
        setSelectedGoodCode(null);
        setSelectedGoodId(null);
        setSelectedBatchCode(null);
    }
    return (


        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
                <Modal.Title>Chọn sản phẩm</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Row>
                    <Col md={3}>
                        <label>Mã sản phẩm</label>
                        <div>
                            <Dropdown style={{ position: 'relative' }}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white' }}>{selectedGoodCode !== null ? selectedGoodCode : "Mã Sản phẩm"}</span>
                                </Dropdown.Toggle>


                                <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                    {totalGoods && totalGoods.length > 0 && totalGoods.map((g, index) => (
                                        <Dropdown.Item key={`good ${index}`} eventKey={g.goodsCode} onClick={(e) => handleGoodClick(g, e)}>
                                            {g.goodsCode}
                                        </Dropdown.Item>
                                    ))}
                                </Dropdown.Menu>
                            </Dropdown>


                        </div>
                    </Col>
                    <Col md={3}>
                        <label>Mã lô hàng</label>
                        <div>
                            <Dropdown style={{ position: 'relative' }}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white' }}>{selectedBatchCode !== null ? selectedBatchCode : "Mã lô hàng"}</span>
                                </Dropdown.Toggle>


                                <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                    {totalBatchs && totalBatchs.length > 0 && totalBatchs.map((g, index) => (
                                        <Dropdown.Item key={`good ${index}`} eventKey={g.batchCode} onClick={(e) => handleBatchClick(g, e)}>
                                            {g.batchCode}
                                        </Dropdown.Item>
                                    ))}
                                </Dropdown.Menu>
                            </Dropdown>


                        </div>
                    </Col>
                </Row >


            </Modal.Body>
            <Table >
                <thead>
                    <tr>
                        <th>Mã Lô Hàng</th>
                        <th>Ngày sản xuất</th>
                        <th>Ngày hết hạn</th>
                        <th>SL trên hệ thống</th>
                        <th>SL thực tế</th>
                    </tr>
                </thead>
                <tbody>
                    {dataMethod && (
                        <tr>
                            <td>{dataMethod.batchCode}</td>
                            <td>{new Date(dataMethod.manufactureDate).toLocaleDateString()}</td>
                            <td>{new Date(dataMethod.expiryDate).toLocaleDateString()}</td>
                            <td>{oldActualQuantity}</td>
                            <td>
                                <input
                                    min="0"
                                    type="number"
                                    className="form-control"
                                    value={inputActualQuantity}
                                    onChange={handleInputQuantityChange}
                                />
                            </td>
                        </tr>
                    )}
                </tbody>
            </Table>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS"
                    onClick={handleConfirmRowData}
                >
                    Xác nhận
                </Button>
            </Modal.Footer>
        </Modal >
    )
}








export default AddRowDataStock


























