import { getStockTakeDetail } from "~/services/StockTakeDetailServices";
import { useEffect, useState } from "react";
import { Row, Col, Modal, Button } from "react-bootstrap";

const ModalStockTakeDetail = ({ isShow, handleClose, dataModalCheckout }) => {

    const [totalStockTakeDetail, setTotalStockTakeDetail] = useState([]);

    const [goodsCode, setGoodsCode] = useState(null);
    const [currentStock, setCurrentStock] = useState(null);
    const [actualStock, setActualStock] = useState(null);
    const [note, setNote] = useState(null);


    useEffect(() => {
        if (dataModalCheckout) {
            getTotalStockDetail();
        }
    }, [dataModalCheckout])


    const getTotalStockDetail = async () => {
        if (dataModalCheckout.stocktakeId) {
            let res = await getStockTakeDetail(dataModalCheckout.stocktakeId);
            console.log(res);
            setTotalStockTakeDetail(res);
        }

    }

    const handleReset = () => {
    }

    const handleCloseModal = () => {
        handleClose();
        handleReset();
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Thông tin chi tiết</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    {totalStockTakeDetail && totalStockTakeDetail.length > 0
                        && totalStockTakeDetail.map((o, index) => (

                            <Row key={`stockTakeDetail${index}`}>
                                <Col md={2}>
                                    <div className="form-group mb-3">
                                        <label >Mã hàng hóa</label>
                                        <input type="text" className="form-control inputCSS" value={o.goodsCode} readOnly />
                                    </div>
                                </Col>
                                <Col md={2}>
                                    <div className="form-group mb-3">
                                        <label >Số lượng</label>
                                        <input type="number" className="form-control inputCSS" value={o.currentStock} disabled />
                                    </div>
                                </Col>
                                <Col md={4}>
                                    <div className="form-group mb-3">
                                        <label >Số lượng thực tế</label>
                                        <input type="number" className="form-control inputCSS" value={o.actualStock} disabled />
                                    </div>
                                </Col>

                                <Col md={4}>
                                    <div className="form-group mb-3">
                                        <label >Lý do</label>
                                        <input type="text" className="form-control inputCSS" value={o.note} disabled />
                                    </div>
                                </Col>
                            </Row>
                        ))
                    }


                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleClose}>
                    Đóng
                </Button>
            </Modal.Footer>
        </Modal >
    </>)
}

export default ModalStockTakeDetail