import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";

const AddRowDataImportOrder = ({ selectedSupplierId, selectedWarehouseId, isShow, handleClose, onChange }) => {
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(0);



    useEffect(() => {
        getAllGoods();
    }, [selectedWarehouseId, selectedSupplierId])

    const getAllGoods = async () => {
        if (selectedWarehouseId && selectedSupplierId) {
            let res = await fetchGoodsWithStorageAndSupplier(storageId, selectedSupplierId);
            console.log("resss: ", res);
            setTotalGoods(res);
        }

    }

    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity <= 0 || !quantity) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else if (costPrice <= 0 || !costPrice) {
            toast.warning("Vui lòng nhập giá tiền lớn hơn 0")
        } else {
            onChange({ costPrice: costPrice, quantity: quantity, goodsId: selectedGoodId, goodsCode: selectedGoodCode, totalOneGoodPrice: costPrice * quantity });
            handleCloseModal();
        }

    }


    const handleGoodClick = (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);

        console.log("selectedGoodCode: ", selectedGoodCode);
    }

    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    }

    const handleChangePrice = (event) => {
        setCostPrice(event.target.value);
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();

    }

    const handleReset = () => {
        setSelectedGoodCode(null);
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
                    Xác nhận nhập kho
                </Button>
            </Modal.Footer>
        </Modal >)
}


export default AddRowDataImportOrder