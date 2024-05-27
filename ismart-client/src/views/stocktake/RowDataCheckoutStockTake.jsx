import { useEffect, useState } from "react"
import { Row, Col } from "react-bootstrap";
import ModalEditRowDataCheckout from "./EditRowDataCheckout";

const RowDataCheckoutStockTake = ({ data, index, updateRowData }) => {

    const [goodsCode, setGoodsCode] = useState();
    const [currentStock, setCurrentStock] = useState();
    const [actualStock, setActualStock] = useState();
    const [reason, setReason] = useState();

    const [isShowModalEditCheckout, setIsShowModalEditCheckout] = useState(false);
    const [dataEditCheckout, setDataEditCheckout] = useState([]);



    useEffect(() => {
        console.log(data);
        if (Object.keys(data).length !== 0) {
            setGoodsCode(data.goodsCode);
            setCurrentStock(data.currentStock);
            console.log(data);
        }
    }, [data])

    const handleEditRowData = (data) => {
        setIsShowModalEditCheckout(true);
        setDataEditCheckout(data);
    }

    const dataAfterEdit = (dataEdit) => {
        setActualStock(dataEdit.actualStock);
        setReason(dataEdit.option);
        updateRowData(index, {
            actualStock: dataEdit.actualStock, amountDifferential: currentStock - dataEdit.actualStock, currentStock: currentStock,
            detailId: data.detailId, goodsCode: data.goodsCode, goodsId: data.goodsId, note: dataEdit.option, stocktakeId: data.stocktakeId
        });
    }

    return (<>
        <Row >
            <Col md={2}>
                <div className="form-group mb-3">
                    <label >Mã hàng hóa</label>
                    <input type="text" className="form-control inputCSS" defaultValue={goodsCode} readOnly />
                </div>
            </Col>
            <Col md={2}>
                <div className="form-group mb-3">
                    <label >Số lượng</label>
                    <input type="number" className="form-control inputCSS" defaultValue={currentStock} disabled />
                </div>
            </Col>
            <Col md={4}>
                <div className="form-group mb-3">
                    <label >Số lượng thực tế</label>
                    <input type="number" className="form-control inputCSS" defaultValue={actualStock} disabled />
                </div>
            </Col>

            <Col md={2}>
                <label >lý do</label>
                <input type="text" className="form-control inputCSS" defaultValue={reason} disabled />
            </Col>
            <Col md={2}>
                <button
                    className="btn btn-success border-left-0 rounded mt-4"
                    type="button"
                    onClick={() => handleEditRowData(data)}
                >
                    Xác nhận
                </button>
            </Col>
        </Row>

        <ModalEditRowDataCheckout isShow={isShowModalEditCheckout} handleClose={() => setIsShowModalEditCheckout(false)}
            data={dataEditCheckout} dataAfterEdit={dataAfterEdit} />

    </>)
}

export default RowDataCheckoutStockTake