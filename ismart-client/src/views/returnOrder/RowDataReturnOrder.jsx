import { useEffect, useState } from "react";
import { Row, Col, Dropdown } from "react-bootstrap";
import EditRowDataReturnOrder from './EditRowDataReturnOrder';


const RowDataReturnOrderManual = ({ data, index, deleteRowData, updateRowData }) => {

    const [isShowEditRowData, setIsShowEditRowData] = useState(false);

    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();
    const [batchCode, setBatchCode] = useState();

    useEffect(() => {
        // Tính tổng số lượng
        if (Array.isArray(data)) {
            const totalQuantity = data.reduce((total, item) => total + item.quantity, 0);

            // Thiết lập tổng số lượng
            setQuantity(totalQuantity);

            data.forEach(item => {
                console.log("item: ", item);
                setGoodsCode(item.goodsCode);
                setGoodsId(item.goodsId);
                setBatchCode(item.batchCode);
            });
        } else {
            console.error("data is not an array");
        }
    }, [data])

    const handleEditRowData = () => {
        setIsShowEditRowData(true);
    }

    const handleDeleteRowData = () => {
        deleteRowData(index);
    }

    const dataAfterEdit = (data) => {
        setQuantity(data.quantity);
        updateRowData(index, { quantity: data.quantity, goodsId: goodsId, goodsCode: goodsCode, batchCode: batchCode })
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
                <input type="number" className="form-control" value={quantity} onChange={(e) => setQuantity(Number(e.target.value))} disabled />
            </div>
        </Col>
        <Col md={2}>
            <div className="form-group mb-3">
                <label >Lô hàng</label>
                <input type="text" className="form-control" defaultValue={data.batchCode} disabled />
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

        <EditRowDataReturnOrder isShow={isShowEditRowData} handleClose={() => setIsShowEditRowData(false)} data={data} dataAfterEdit={dataAfterEdit} />
    </>
    )
}


export default RowDataReturnOrderManual