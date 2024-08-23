import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button, Table } from "react-bootstrap";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";
import { fetchAllGoodsInWarehouse } from "~/services/GoodServices";
import { fetchGoodinWarehouseById } from "~/services/GoodServices";
import { getBatchInventoryForExportgoods } from "~/services/ImportOrderDetailServices";

const AddRowDataExportOrderInternal = ({ selectedStorageId, isShow, handleClose, onChange }) => {
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [quantityInStock, setQuantityInStock] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);
    const [dataMethod, setDataMethod] = useState(null);
    const [selectedMethod, setSelectedMethod] = useState('');
    const [selectImportOrderDetailId, setSelectImportOrderDetailId] = useState(null);

    useEffect(() => {
        getAllGoods();
    }, [selectedStorageId])

    // useEffect(() => {
    //     if (selectedGoodId) {
    //         let res = getGoodinWarehouseById(selectedGoodId);
    //     }

    // }, [selectedGoodId])

    useEffect(() => {
        setDataMethod();
    }, [selectedMethod])
    const getAllGoods = async () => {
        if (selectedStorageId !== null) {
            let res = await fetchAllGoodsInWarehouse(selectedStorageId);
            setTotalGoods(res);
        }
    }

    const handleGoodClick = async (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
        let res = await fetchGoodinWarehouseById(selectedStorageId, good.goodsId);
        setQuantityInStock(res.inStock);
    }



    const handleSelectMethod = async (method) => {
        if (!selectedGoodId || !selectedStorageId || quantity <= 0) {
            toast.warning("Vui lòng chọn sản phẩm và số lượng trước khi chọn phương thức xuất kho");
            return;
        }
        setSelectedMethod(method);
        let res = await getBatchInventoryForExportgoods(selectedStorageId, selectedGoodId, quantity, method);
        setDataMethod(res);
        setSelectImportOrderDetailId(res[0].importOrderDetailId);
    };


    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    }



    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity === 0) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else if (quantity > quantityInStock) {
            toast.warning("Vui lòng nhập số lượng nhỏ hơn số lượng trong kho");
        } else {
            // Tạo mảng từ dataMethod để gửi đi
            const inputQuantitiesArray = dataMethod.map(item => ({
                importOrderDetailId: item.importOrderDetailId,
                quantity: item.quantity,
                batchCode: item.batchCode
            }));

            // Tạo mảng mới với thông tin sản phẩm cho mỗi importOrderDetailId
            const exportDataArray = inputQuantitiesArray.map(item => ({
                costPrice: 0,
                goodsId: selectedGoodId,
                goodsCode: selectedGoodCode,
                quantity: item.quantity,
                importOrderDetailId: item.importOrderDetailId,
                batchCode: item.batchCode
            }));

            onChange(exportDataArray);
            console.log("ExportOrderManual: ", exportDataArray);
            handleCloseModal();
        }
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();

    }

    const handleReset = () => {
        setSelectedMethod(null);
        // setSelectedSupplier(null);
        // setSelectedSupplierId(null);
        setSelectedGoodCode(null);
        setSelectedGoodId(null);
        setQuantityInStock(0);
        setQuantity(0);
        setCostPrice(0);
    }

    return (

        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
                <Modal.Title>Chọn sản phẩm</Modal.Title>
            </Modal.Header>
            <Modal.Body><Row>

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

                                {/* {totalGoods.length === 0 && (
                                    <Dropdown.Item key="empty" disabled>
                                        Không có mặt hàng
                                    </Dropdown.Item>
                                )} */}
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col>

                <Col md={3}>
                    <div className="form-group mb-3">
                        <label>Phương thức xuất kho</label>
                        <Dropdown style={{ position: 'relative' }}>
                            <Dropdown.Toggle as={CustomToggle}
                                className="DropdownButtonCSS ButtonCSSDropdown">
                                {/* <span style={{ color: 'white' }}>{selectedMethod || 'Chọn phương thức'}</span> */}
                                <span style={{ color: 'white' }}>{selectedMethod ? selectedMethod : "Chọn phương thức"}</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu style={{ position: 'absolute', zIndex: '9999' }}>
                                <Dropdown.Item
                                    onClick={() => handleSelectMethod('LIFO')}
                                >LIFO (Last In, First Out)</Dropdown.Item>
                                <Dropdown.Item
                                    onClick={() => handleSelectMethod('FIFO')}
                                >FIFO (First In, First Out)</Dropdown.Item>
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col>


            </Row >
                <Row style={{ marginTop: "20px" }}>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Số lượng trong kho</label>
                            <input type="number" className="form-control inputCSS" value={quantityInStock} disabled />
                        </div>
                    </Col>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Số lượng</label>
                            <input type="number" className="form-control inputCSS" value={quantity} onChange={handleChangeQuantity} />
                        </div>
                    </Col>


                </Row>
            </Modal.Body>
            <Table >
                <thead>
                    <tr>
                        <th>Mã Lô Hàng</th>
                        <th>Ngày Sản Xuất</th>
                        <th>Ngày Hết Hạn</th>
                        <th>Ngày Nhập Lô</th>
                        <th>Số Lượng</th>
                        <th>Vị Trí Trong Kho</th>
                    </tr>
                </thead>
                <tbody>
                    {dataMethod && dataMethod.map((d, index) => (
                        <tr key={index}>
                            <td>{d.batchCode}</td>
                            <td>{new Date(d.manufactureDate).toLocaleDateString()}</td>
                            <td>{new Date(d.expiryDate).toLocaleDateString()}</td>
                            <td>{new Date(d.importDate).toLocaleDateString()}</td>
                            <td>{d.quantity}</td>
                            <td>{d.location || 'N/A'}</td>
                        </tr>
                    ))}
                </tbody>
            </Table>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleConfirmRowData}>
                    Xác nhận xuất kho
                </Button>
            </Modal.Footer>
        </Modal >
    )
}

export default AddRowDataExportOrderInternal