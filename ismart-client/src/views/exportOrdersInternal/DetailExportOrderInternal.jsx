import { useEffect, useState } from "react";
import { Modal, Button, Col, Row } from "react-bootstrap";
import { getExportOrderDetailByExportId } from "~/services/ExportOrderDetailService";
import { formattedAmount } from "~/validate";
import { toast } from 'react-toastify';


const ModalDetailExportOrderInternal = ({ isShow, handleClose, detailOrder }) => {
    const [totalOrderDetail, setTotalOrderDetail] = useState([]);

    useEffect(() => {
        if (detailOrder.exportId) {
            getTotalOrderDetail(detailOrder.exportId);
        }
        console.log(detailOrder);

    }, [detailOrder])

    const handleCloseModal = () => {
        handleClose();
    }

    const getTotalOrderDetail = async (exportId) => {
        let res = await getExportOrderDetailByExportId(exportId);
        console.log(res);
        setTotalOrderDetail(res);
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Thông tin chi tiết đơn hàng xuất kho</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row>
                        <Col md={2}>
                            <div className="form-group mb-3">
                                <label >Kho hàng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailOrder.storageName}</button>
                            </div>
                        </Col>

                        <Col md={3}>
                            <div className="form-group mb-3">
                                <label >Tổng giá trị đơn hàng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{formattedAmount(detailOrder.totalPrice)}</button>
                            </div>
                        </Col>
                        <Col md={2}>
                            <div className="form-group mb-3">
                                <label >Tình trạng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailOrder.statusType == "On Progress" ? "Đang tiến hành" : detailOrder.statusType == "Completed" ? "Đã hoàn thành" : "Đã hủy"}</button>
                            </div>
                        </Col>
                    </Row>


                    {totalOrderDetail && totalOrderDetail.length > 0
                        && totalOrderDetail.map((o, index) => (

                            <Row key={`orderDetail${index}`}>
                                <Col >

                                    <label >Mã hàng hóa</label>
                                    <input type="text" className="form-control inputCSS" value={o.goodsCode} readOnly />

                                </Col>
                                <Col >

                                    <label >Số lượng</label>
                                    <input type="number" className="form-control inputCSS" value={o.quantity} readOnly />

                                </Col>
                                <Col >

                                    <label >Giá tiền</label>
                                    <input type="number" className="form-control inputCSS" value={o.price} readOnly />

                                </Col>

                                <Col >

                                    <label >Tổng giá tiền</label>
                                    <input type="number" className="form-control inputCSS" value={o.quantity * o.price} readOnly />

                                </Col>
                            </Row>
                        ))
                    }

                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className=" ButtonRed">
                    Đóng
                </Button>
            </Modal.Footer>
        </Modal >
    </>)
}

export default ModalDetailExportOrderInternal