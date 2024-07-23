import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";

const EditRowDataReturnOrder = ({ isShow, handleClose, data, dataAfterEdit }) => {
    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();
    const [costPrice, setCostPrice] = useState();
    const [batchCode, setBatchCode] = useState();


    useEffect(() => {
        setBatchCode(data[0].batchCode);
        setGoodsCode(data[0].goodsCode);
        setGoodsId(data[0].goodsId);
        setQuantity(data[0].quantity);

    }, [])
    //console.log("dataEditRowDataOrder: ", data[0]);

    useEffect(() => {
        //setTotalOneGoodPrice(quantity * costPrice);
    }, [quantity, costPrice]);
    // console.log("dataEdit: ", data);
    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
        //setTotalOneGoodPrice(event.target.value * costPrice);
    }

    const handleReset = () => {
        setBatchCode(data.batchCode);
        setGoodsCode(data.goodsCode);
        setGoodsId(data.goodsId);
        setQuantity(data.quantity);
    }
    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }

    const handleEditRowData = () => {
        if (quantity <= 0) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0");
        } else {
            dataAfterEdit({
                // ...data,
                batchCode: batchCode,
                goodsCode: goodsCode,
                goodsId: goodsId,
                quantity: quantity,
            });
            console.log("dataAfterEdit: ", quantity);
            handleClose();
        };
    }





    return (
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Xác nhận lô hàng trả</Modal.Title>
            </Modal.Header>
            <Modal.Body><Row>

                <Col md={3}>
                    <div className="form-group mb-3">
                        <label >Mã Sản phẩm</label>
                        <input type="text" className="form-control" defaultValue={goodsCode} disabled />
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
                        <input type="text" className="form-control" value={totalOneGoodPrice} disabled />
                    </div>
                </Col> */}
                {/* <Col md={2}>
                    <div className="form-group mb-3">
                        <label >Mã lô hàng</label>
                        <input type="text" className="form-control" value={batchCode} onChange={handleChangeBatchCode} />
                    </div>
                </Col> */}
                {/* <Col md={3}>
                    <div className="form-group mb-3">
                        <label >Nhà cung cấp</label>
                        <input type="text" className="form-control" value={supplierName} disabled />
                    </div>
                </Col> */}

                {/* <Col md={3}>
                    <div className="form-group mb-3">
                        <label >Ngày sản xuất</label>
                        <input type="date" className="form-control" value={manufactureDate} onChange={handleChangemMnufactureDate} />
                    </div>
                </Col>
                <Col md={3}>
                    <div className="form-group mb-3">
                        <label >Ngày hết hạn</label>
                        <input type="date" className="form-control" value={expiryDate} on onChange={handleChangeExpiryDate} />
                    </div>
                </Col> */}


            </Row>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleEditRowData} >
                    Xác nhận
                </Button>
            </Modal.Footer>
        </Modal >
    )
}


export default EditRowDataReturnOrder;