import { useEffect, useState } from "react";
import { Row, Col, Dropdown } from "react-bootstrap";

const RowDataStockTake = ({ data, index, deleteRowData }) => {

    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();

    useEffect(() => {
        setGoodsId(data.goodsId);
        setGoodsCode(data.goodsCode);
        setQuantity(data.quantityInStock);
    }, [data])


    const handleDeleteRowData = () => {
        deleteRowData(index);
    }


    return (<>
        <Row>

            <Col md={3}>
                <div className="form-group mb-3">
                    <label >Mã Sản phẩm</label>
                    <input type="text" className="form-control" defaultValue={goodsCode} disabled />
                </div>
            </Col>

            <Col md={2}>
                <div className="form-group mb-3">
                    <label >Số lượng</label>
                    <input type="text" className="form-control" defaultValue={quantity} disabled />
                </div>
            </Col>

            <Col md={1}>
                <div className="form-group mb-3 ButtonCSSDropdown red">
                    <button
                        className="btn btn-success border-left-0 rounded  mt-4 "
                        type="button"
                        onClick={() => handleDeleteRowData(data)}
                    >
                        Xóa
                    </button>
                </div>
            </Col>



        </Row>
    </>)
}

export default RowDataStockTake