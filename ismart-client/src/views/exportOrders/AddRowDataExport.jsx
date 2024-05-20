import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { fetchAllSuppliers } from "~/services/SupplierServices";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { fetchGoodById } from "~/services/GoodServices";
import { toast } from "react-toastify";

const AddRowDataExportOrder = ({ selectedStorageId, isShow, handleClose, onChange }) => {
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [quantityInStock, setQuantityInStock] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    useEffect(() => {
        getAllSuppliers();
    }, [])

    useEffect(() => {
        getAllGoods();
    }, [selectedStorageId, selectedSupplierId])

    useEffect(() => {
        if (selectedGoodId) {
            let res = getGoodById(selectedGoodId);
        }

    }, [selectedGoodId])


    const getAllGoods = async () => {
        if (selectedStorageId && selectedSupplierId) {
            let res = await fetchGoodsWithStorageAndSupplier(selectedStorageId, selectedSupplierId);
            console.log(res);
            setTotalGoods(res);
        }

    }

    const getGoodById = async (id) => {
        let res = await fetchGoodById(id);
        setQuantityInStock(res.inStock)
    }

    const getAllSuppliers = async () => {
        let res = await fetchAllSuppliers();
        setTotalSuppliers(res);
    }

    const handleGoodClick = (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }

    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    }

    const handleChangePrice = (event) => {
        setCostPrice(event.target.value);
    }

    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity === 0) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else if (costPrice === 0) {
            toast.warning("Vui lòng nhập giá tiền lớn hơn 0")
        } else if (quantity > quantityInStock) {
            toast.warning("Vui lòng nhập số lượng nhỏ hơn số lượng trong kho");
        } else {
            onChange({ costPrice: costPrice, quantity: quantity, goodsId: selectedGoodId, goodsCode: selectedGoodCode, totalOneGoodPrice: costPrice * quantity });
            handleCloseModal();
        }

    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();

    }

    const handleReset = () => {
        setSelectedSupplier(null);
        setSelectedSupplierId(null);
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

                <Col md={3}>
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

                                {totalGoods.length === 0 && (
                                    <Dropdown.Item key="empty" disabled>
                                        Không có mặt hàng
                                    </Dropdown.Item>
                                )}
                            </Dropdown.Menu>
                        </Dropdown>

                    </div>
                </Col>

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

                                {totalGoods.length === 0 && (
                                    <Dropdown.Item key="empty" disabled>
                                        Không có mặt hàng
                                    </Dropdown.Item>
                                )}
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
                    <Col md={2}>
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
                    </Col>



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