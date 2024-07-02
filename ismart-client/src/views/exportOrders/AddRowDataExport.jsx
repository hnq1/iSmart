import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { fetchAllSuppliers } from "~/services/SupplierServices";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { fetchGoodById } from "~/services/GoodServices";
import { toast } from "react-toastify";
import { fetchAllGoodsInWarehouse } from "~/services/GoodServices";
import { fetchGoodinWarehouseById } from "~/services/GoodServices";

const AddRowDataExportOrder = ({ selectedStorageId, isShow, handleClose, onChange }) => {
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [quantityInStock, setQuantityInStock] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);

    // const [totalSuppliers, setTotalSuppliers] = useState([]);
    // const [selectedSupplier, setSelectedSupplier] = useState(null);
    // const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    // useEffect(() => {
    //     getAllSuppliers();
    // }, [])

    useEffect(() => {
        getAllGoods();
    }, [selectedStorageId])

    // useEffect(() => {
    //     if (selectedGoodId) {
    //         let res = getGoodinWarehouseById(selectedGoodId);
    //     }

    // }, [selectedGoodId])


    const getAllGoods = async () => {
        if (selectedStorageId !== null) {
            let res = await fetchAllGoodsInWarehouse(selectedStorageId);
            // console.log("getAllGoods: ", res);
            setTotalGoods(res);
        }
    }



    // const getAllSuppliers = async () => {
    //     let res = await fetchAllSuppliers();
    //     setTotalSuppliers(res);
    // }

    const handleGoodClick = async (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
        let res = await fetchGoodinWarehouseById(selectedStorageId, good.goodsId);
        setQuantityInStock(res.inStock);
        // console.log("selectedGoodId: ", selectedStorageId, good.goodsId);
    }

    // const handleSupplierClick = (supplier, event) => {
    //     setSelectedSupplier(supplier.supplierName);
    //     setSelectedSupplierId(supplier.supplierId)
    // }

    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    }

    // const handleChangePrice = (event) => {
    //     setCostPrice(event.target.value);
    // }

    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity === 0) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else if (quantity > quantityInStock) {
            toast.warning("Vui lòng nhập số lượng nhỏ hơn số lượng trong kho");
        } else {
            onChange({
                costPrice: 0,
                quantity: quantity,
                goodsId: selectedGoodId,
                goodsCode: selectedGoodCode,
                totalOneGoodPrice: 0,
                importOrderDetailId: null
            });
            // console.log("selectedGoodId: ", quantity);
            handleCloseModal();
        }

    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();

    }

    const handleReset = () => {
        // setSelectedSupplier(null);
        // setSelectedSupplierId(null);
        setSelectedGoodCode(null);
        setSelectedGoodId(null);
        setQuantityInStock(0);
        setQuantity(0);
        setCostPrice(0);
    }

    return (
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Chọn sản phẩm</Modal.Title>
            </Modal.Header>
            <Modal.Body><Row>
                {/* Nhà cung cấp */}
                {/* <Col md={3}>
                    <label>Nhà cung cấp</label>
                    <div>
                        <Dropdown style={{ position: 'relative' }}>
                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                <span style={{ color: 'white' }}>{selectedSupplier !== null ? selectedSupplier : "Nhà cung cấp"}</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((g, index) => (
                                    <Dropdown.Item key={`supplier ${index}`} eventKey={g.supplierName} onClick={(e) => handleSupplierClick(g, e)}>
                                        {g.supplierName}
                                    </Dropdown.Item>
                                ))}

<<<<<<< HEAD
                                {/* {totalGoods.length === 0 && (
                                    <Dropdown.Item key="empty" disabled>
                                        Không có mặt hàng
                                    </Dropdown.Item>
                                )} */}
=======

                                {totalGoods.length === 0 && (
                                    <Dropdown.Item key="empty" disabled>
                                        Không có mặt hàng
                                    </Dropdown.Item>
                                )}


>>>>>>> main
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col> */}

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
<<<<<<< HEAD
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col>

                <Col md={3}>
                    <label>Lô hàng</label>
                    <div>
                        <Dropdown style={{ position: 'relative' }}>
                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                <span style={{ color: 'white' }}>{selectedGoodCode !== null ? selectedGoodCode : "Lô hàng"}</span>
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
=======
>>>>>>> main
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col>

                <Col md={3}>
                    <div className="form-group mb-3">
                        <label>Phương thức xuất kho</label>
                        <Dropdown style={{ position: 'relative' }}>
                            <Dropdown.Toggle variant="success" id="dropdown-custom-components" >
                                <span style={{ color: 'white' }}>Chọn phương thức</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu>
                                <Dropdown.Item href="#/action-1">LIFO (Last In, First Out)</Dropdown.Item>
                                <Dropdown.Item href="#/action-2">FIFO (First In, First Out)</Dropdown.Item>
                            </Dropdown.Menu>
                        </Dropdown>
                    </div>
                </Col>

            </Row>
                <Row style={{ marginTop: "20px" }}>

                    <Col md={3}>
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

                    {/* <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Giá tiền</label>
                            <input type="number" className="form-control inputCSS" value={costPrice} onChange={handleChangePrice} />
                        </div>
                    </Col>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Tổng giá tiền</label>
                            <input type="number" className="form-control inputCSS" value={costPrice * quantity} disabled />
                        </div>
                    </Col> */}



                </Row>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleConfirmRowData}>
                    Xác nhận xuất kho
                </Button>
            </Modal.Footer>
        </Modal >)
}

export default AddRowDataExportOrder