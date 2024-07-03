import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button, Table } from "react-bootstrap";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";
import { fetchAllGoodsInWarehouse } from "~/services/GoodServices";
import { fetchGoodinWarehouseById } from "~/services/GoodServices";
import { getBatchInventoryForExportgoods } from "~/services/ImportOrderDetailServices";
import { getAvailableBatch } from "~/services/ImportOrderDetailServices";

const AddRowDataExportOrderManual = ({ selectedStorageId, isShow, handleClose, onChange }) => {
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [quantityInStock, setQuantityInStock] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);
    const [dataMethod, setDataMethod] = useState(null);
    const [selectedMethod, setSelectedMethod] = useState('');
    const [selectImportOrderDetailId, setSelectImportOrderDetailId] = useState(null);
    const [inputQuantities, setInputQuantities] = useState({});
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
            // console.log("getAllGoods: ", res);
            setTotalGoods(res);
        }
    }

    const handleGoodClick = async (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
        let res = await fetchGoodinWarehouseById(selectedStorageId, good.goodsId);
        setQuantityInStock(res.inStock);
        // console.log("selectedGoodId: ", selectedStorageId, good.goodsId);
    }

    const handleChangeTotalQuantity = (event) => {
        setQuantity(event.target.value);
    }

    const handleInputQuantityChange = (index, value) => {
        const newInputQuantities = { ...inputQuantities, [index]: Number(value) };
        setInputQuantities(newInputQuantities);

        // Calculate the new total quantity
        const newTotalQuantity = Object.values(newInputQuantities).reduce((acc, curr) => acc + curr, 0);
        setQuantity(newTotalQuantity);
    }

    const handleManualClick = async () => {
        let m = await getAvailableBatch(selectedStorageId, selectedGoodId);
        setDataMethod(m);
        setSelectImportOrderDetailId(m[0].importOrderDetailId);
        console.log("dataMethod: ", m[0].importOrderDetailId);
    }


    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity === 0) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else {
            onChange({
                costPrice: 0,
                quantity: quantity,
                goodsId: selectedGoodId,
                goodsCode: selectedGoodCode,
                totalOneGoodPrice: 0,
                importOrderDetailId: selectImportOrderDetailId
            });
            console.log("selectedGoodId: ", selectImportOrderDetailId);
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
        setInputQuantities({});
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
                                className="DropdownButtonCSS ButtonCSSDropdown"
                                onClick={handleManualClick}
                            >
                                <span style={{ color: 'white' }}>{"Chọn lô hàng"}</span>
                            </Dropdown.Toggle>
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
                            <input type="number" className="form-control inputCSS" value={quantity} onChange={handleChangeTotalQuantity} readOnly />
                        </div>
                    </Col>


                </Row>
            </Modal.Body>
            <Table >
                <thead>
                    <tr>
                        <th>Batch Code</th>
                        <th>Manufacture Date</th>
                        <th>Expiry Date</th>
                        <th>Quantity</th>
                        <th>Location</th>
                        <th>Input Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    {dataMethod && dataMethod.map((d, index) => (
                        <tr key={index}>
                            <td>{d.batchCode}</td>
                            <td>{new Date(d.manufactureDate).toLocaleDateString()}</td>
                            <td>{new Date(d.expiryDate).toLocaleDateString()}</td>
                            <td>{d.quantity}</td>
                            <td>{d.location || 'N/A'}</td>
                            <td>
                                <input
                                    type="number"
                                    className="form-control"
                                    value={inputQuantities[index] || ''}
                                    onChange={(e) => handleInputQuantityChange(index, e.target.value)}
                                />
                            </td>
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

export default AddRowDataExportOrderManual