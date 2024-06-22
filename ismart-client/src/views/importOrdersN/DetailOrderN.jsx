
import { useEffect, useState } from "react";
import { Modal, Button, Col, Row } from "react-bootstrap";
import { addSuccessFullImportOrder } from "~/services/ImportOrderServices";
import { fetchGoodById } from "~/services/GoodServices";
import { getImportOrderDetailByImportId } from "~/services/ImportOrderDetailServices";
import { formattedAmount } from "~/validate";
import { toast } from 'react-toastify';

const ModalDetailOrderN = ({ isShow, handleClose, detailOrder }) => {
    const [totalOrderDetail, setTotalOrderDetail] = useState([]);

    useEffect(() => {
        if (detailOrder.importId) {
            getTotalOrderDetail(detailOrder.importId);
        }
        console.log(detailOrder);

    }, [detailOrder])

    const handleCloseModal = () => {
        handleClose();
    }

    const getTotalOrderDetail = async (importId) => {
        let res = await getImportOrderDetailByImportId(importId);
        console.log("getTotalOrderDetail: ", res);
        setTotalOrderDetail(res);
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Thông tin chi tiết đơn hàng nhập kho</Modal.Title>
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

                        <Col md={2}>
                            <div className="form-group mb-3">
                                <label >Nhà cung cấp</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{detailOrder.supplierName}</button>
                            </div>
                        </Col>

                        <Col md={3}>
                            <div className="form-group mb-3">
                                <label >Tổng giá trị đơn hàng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{formattedAmount(detailOrder.totalCost)}</button>
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
                                    <input type="number" className="form-control inputCSS" value={o.costPrice} readOnly />

                                </Col>

                                <Col >

                                    <label >Tổng giá tiền</label>
                                    <input type="number" className="form-control inputCSS" value={o.quantity * o.costPrice} readOnly />

                                </Col>

                                <Col > <label >Mã đơn hàng</label>
                                    <input type="text" className="form-control inputCSS" value={o.batchCode} readOnly />
                                </Col>

                                <Col> <label >Ngày sản xuất</label>
                                    <input type="text" className="form-control inputCSS" value={o.manufactureDate} readOnly />
                                </Col>


                                <Col > <label >Ngày hết hạn </label>
                                    <input type="text" className="form-control inputCSS" value={o.expiryDate} readOnly />
                                </Col>
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

export default ModalDetailOrderN