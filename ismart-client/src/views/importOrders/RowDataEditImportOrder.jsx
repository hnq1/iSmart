import { useEffect, useState } from "react";
import { Row, Col, Dropdown } from "react-bootstrap";
import EditRowDataOrder from "./EditRowData";

const RowDataEditImportOrder = ({ data, index, deleteRowData, updateRowData }) => {

    const [isShowEditRowData, setIsShowEditRowData] = useState(false);

    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();
    const [costPrice, setCostPrice] = useState();
    const [detailId, setDetailId] = useState();
    const [importId, setImportId] = useState();

    useEffect(() => {
        console.log(data);
        setGoodsId(data.goodsId);
        setGoodsCode(data.goodsCode);
        setQuantity(data.quantity);
        setCostPrice(data.costPrice);
        setDetailId(data.detailId);
        setImportId(data.importId);
    }, [data])

    const handleEditRowData = () => {
        setIsShowEditRowData(true);
    }

    const handleDeleteRowData = () => {
        deleteRowData(index);
    }

    const dataAfterEdit = (data) => {
        setQuantity(data.quantity);
        setCostPrice(data.costPrice);
        updateRowData(index, { costPrice: data.costPrice, detailId: detailId, quantity: data.quantity, goodsId: goodsId, goodsCode: goodsCode, importId: importId })
    }



    return (<><Row>

        <Col md={3}>
            <div className="form-group mb-3">
                <label >Mã Sản phẩm</label>
                <input type="text" className="form-control" defaultValue={goodsCode} disabled />
            </div>
        </Col>

        <Col md={2}>
            <div className="form-group mb-3">
                <label >Số lượng</label>
                <input type="number" className="form-control" defaultValue={quantity} disabled />
            </div>
        </Col>
        <Col md={2}>
            <div className="form-group mb-3">
                <label >Giá tiền</label>
                <input type="number" className="form-control" defaultValue={costPrice} disabled />
            </div>
        </Col>

        {/* <Col md={2}>
            <div className="form-group mb-3">
                <label >Tổng giá tiền</label>
                <input type="text" className="form-control" defaultValue={data.totalOneGoodPrice} disabled />
            </div>
        </Col> */}

        <Col md={1}>
            <div className="form-group mb-3 ButtonCSSDropdown">
                <button
                    className="btn btn-success border-left-0 rounded mt-4"
                    type="button"
                    onClick={() => handleEditRowData(data)}
                >
                    Sửa
                </button>
            </div>
        </Col>

        {/* <Col md={1}>
            <div className="form-group mb-3 ButtonCSSDropdown red">
                <button
                    className="btn btn-success border-left-0 rounded  mt-4 "
                    type="button"
                    onClick={() => handleDeleteRowData(data)}
                >
                    Xóa
                </button>
            </div>
        </Col> */}



    </Row>

        <EditRowDataOrder isShow={isShowEditRowData} handleClose={() => setIsShowEditRowData(false)} data={data} dataAfterEdit={dataAfterEdit} />
    </>)
}


export default RowDataEditImportOrder