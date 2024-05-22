import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";

const ModalEditRowDataCheckout = ({ isShow, handleClose, data, dataAfterEdit }) => {
    // const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();
    const [actualStock, setActualStock] = useState();

    const [selectedOption, setSelectedOption] = useState();


    useEffect(() => {
        // setGoodsId(data.goodsId);
        console.log(data);

        if (Object.keys(data).length !== 0) {
            setGoodsCode(data.goodsCode);
            setQuantity(data.currentStock);
        }


    }, [data])

    const handleChangeQuantity = (event) => {
        setActualStock(event.target.value);
    }


    const handleCloseModal = () => {
        handleClose();
    }

    const handleSelect = (eventKey) => {
        setSelectedOption(eventKey);
    }

    const handleEditRowData = () => {
        if (actualStock > quantity) {
            toast.warning("Số lượng thực tế không được lớn hơn số lượng trong dữ liệu");
        } else if (actualStock == quantity) {
            dataAfterEdit({ actualStock: actualStock, option: "" });
            handleClose();
        } else if (actualStock < 0) {
            toast.warning("Số lượng thực tế không được nhỏ hơn không")
        } else {
            dataAfterEdit({ actualStock: actualStock, option: selectedOption });
            handleClose();
        }

    }

    return (
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Xác nhận kiểm kê mặt hàng {goodsCode}</Modal.Title>
            </Modal.Header>
            <Modal.Body><Row>

                <Col md={3}>
                    <div className="form-group mb-3">
                        <label >Mã Sản phẩm</label>
                        <input type="text" className="form-control" defaultValue={goodsCode} disabled />
                    </div>
                </Col>
                <Col md={3}>

                    <div className="form-group mb-3">
                        <label >Số lượng thực tế</label>
                        <input type="text" className="form-control inputCSS" defaultValue={quantity} disabled />
                    </div>
                </Col>

                <Col md={2}>

                    <div className="form-group mb-3">
                        <label >Số lượng</label>
                        <input type="number" className="form-control inputCSS" value={actualStock} onChange={handleChangeQuantity} />
                    </div>
                </Col>


                <Col md={2}>
                    <label >Lựa chọn</label>

                    <Dropdown onSelect={handleSelect}>
                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                            {selectedOption ? selectedOption : "Lý do"}
                        </Dropdown.Toggle>

                        <Dropdown.Menu>
                            <Dropdown.Item eventKey="Bị hỏng">Bị hỏng</Dropdown.Item>
                            <Dropdown.Item eventKey="Bị mất">Bị mất</Dropdown.Item>
                            <Dropdown.Item eventKey="Khác">Khác</Dropdown.Item>

                        </Dropdown.Menu>

                    </Dropdown>
                </Col>



            </Row>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleEditRowData}>
                    Xác nhận kiểm kê
                </Button>
            </Modal.Footer>
        </Modal >)
}

export default ModalEditRowDataCheckout