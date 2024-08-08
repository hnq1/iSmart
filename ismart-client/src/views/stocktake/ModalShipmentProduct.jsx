import { useEffect, useState } from "react";
import { Modal, Button, Col, Row } from "react-bootstrap";
import { formatDate, formattedAmount } from '~/validate';
import { toast } from 'react-toastify';
import { getAvailableBatch } from "~/services/ImportOrderDetailServices";

const ModalShipmentProduct = ({ isShow, handleClose, detailShipment, warehouseId }) => {

    const [totalShipment, setTotalShipment] = useState([]);

    useEffect(() => {
        getTotalShipment();
    }, [detailShipment])


    const getTotalShipment = async () => {
        let res = await getAvailableBatch(warehouseId, detailShipment.goodId);
        console.log(res);
        setTotalShipment(res);
    }

    const handleCloseModal = () => {
        handleClose();
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Thông tin chi tiết lô hàng của sản phẩm {detailShipment.goodCode}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    {/* <Row>
                        <Col md={2}>
                            <div className="form-group mb-3">
                                <label >Kho hàng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailData.warehouseId}</button>
                            </div>
                        </Col>

                        <Col md={2}>
                            <div className="form-group mb-3">
                                <label >Ngày kiểm tra</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailData.checkDate}</button>
                            </div>
                        </Col>

                        <Col md={2}>

                        </Col>

                        <Col md={3}>
                            <div className="form-group mb-3">
                                <label >Tình trạng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailData.status == "On Progress" ? "Đang tiến hành" : detailData.statusType == "Completed" ? "Đã hoàn thành" : "Đã hủy"}</button>
                            </div>
                        </Col>
                    </Row> */}


                    {totalShipment && totalShipment.length > 0
                        && totalShipment.map((o, index) => (

                            <Row key={`shipment${index}`}>
                                <Col >

                                    <label >Mã lô hàng</label>
                                    <input type="text" className="form-control inputCSS" value={o.batchCode} readOnly />

                                </Col>
                                <Col >

                                    <label >S trên hệ thống</label>
                                    <input type="number" className="form-control inputCSS" value={o.quantity} readOnly />

                                </Col>

                                <Col > <label >Số lượng thực tế</label>
                                    <input type="text" className="form-control inputCSS" value={o.actualQuantity} readOnly />
                                </Col>

                                {/* <Col > <label >Ngày sản xuất</label>
                                    <input type="text" className="form-control inputCSS" value={o.manufactureDate} readOnly />
                                </Col>

                                <Col > <label >Ngày hết hạn</label>
                                    <input type="text" className="form-control inputCSS" value={o.expiryDate} readOnly />
                                </Col> */}

                            </Row>
                        ))
                    }

                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className=" ButtonRed" onClick={handleClose}>
                    Đóng
                </Button>
            </Modal.Footer>
        </Modal >
    </>)
}

export default ModalShipmentProduct;