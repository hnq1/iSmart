
import { useEffect, useState } from "react";
import { Modal, Button, Col, Row } from "react-bootstrap";
import { formatDate, formattedAmount } from '~/validate';
import { toast } from 'react-toastify';

import ModalShipmentProduct from "./ModalShipmentProduct";


const StockTakeDetail = ({ handleClose, isShow, detailData }) => {
    const [totalStockTake, setTotalStockTake] = useState([]);

    const [isShowDetailProduct, setIsShowDetailProduct] = useState(false);

    const [detailShipment, setDetailShipment] = useState([]);

    useEffect(() => {
        setTotalStockTake(detailData.inventoryCheckDetails);
    }, [detailData])


    const handleCloseModal = () => {
        handleClose();
    }

    const handleShowDetail = (data) => {
        setIsShowDetailProduct(true);
        console.log(data);
        setDetailShipment(data);
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
                    </Row>


                    {totalStockTake && totalStockTake.length > 0
                        && totalStockTake.map((o, index) => (

                            <Row key={`stockTake${index}`}>
                                <Col >

                                    <label >Mã hàng hóa</label>
                                    <input type="text" className="form-control inputCSS" value={o.goodCode} readOnly />

                                </Col>
                                <Col >

                                    <label >Số lượng trên web</label>
                                    <input type="number" className="form-control inputCSS" value={o.expectedQuantity} readOnly />

                                </Col>

                                <Col > <label >Số lượng thực tế</label>
                                    <input type="text" className="form-control inputCSS" value={o.actualQuantity} readOnly />
                                </Col>

                                <Col> <label >Ghi chú</label>
                                    <input type="text" className="form-control inputCSS" value={o.note} readOnly />
                                </Col>

                                <Col md={2}>
                                    <label >Chi tiết</label>
                                    <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >
                                        <i className="fa-solid fa-circle-info actionButtonCSS" title="Chi tiết" onClick={() => handleShowDetail(o)}></i>
                                    </button>
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

        <ModalShipmentProduct isShow={isShowDetailProduct} handleClose={() => setIsShowDetailProduct(false)}
            detailShipment={detailShipment} warehouseId={detailData.warehouseId}/>
    </>)
}

export default StockTakeDetail