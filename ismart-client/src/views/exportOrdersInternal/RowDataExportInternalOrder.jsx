import { useEffect, useState } from "react";
import { Row, Col, Dropdown } from "react-bootstrap";
import EditRowDataExportOrderInternal from "./EditRowDataExportOrderInternal";

const RowDataExportInternalOrder = ({ data, index, deleteRowData, updateRowData }) => {

    const [isShowEditRowData, setIsShowEditRowData] = useState(false);

    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [quantity, setQuantity] = useState();

    useEffect(() => {
        // Tính tổng số lượng

        // Thiết lập tổng số lượng
        

            setGoodsCode(data.goodsCode);
            setGoodsId(data.goodsId);
            setQuantity(data.quantity);


        




        // console.log("dataRowDataExportOrder: ", data[0].goodsId);
    }, [data])

    const handleEditRowData = () => {
        setIsShowEditRowData(true);
    }

    const handleDeleteRowData = () => {
        deleteRowData(index);
    }

    const dataAfterEdit = (data) => {
        setQuantity(data.quantity);
        updateRowData(index, { costPrice: 0, quantity: data.quantity, goodsId: goodsId, goodsCode: goodsCode, totalOneGoodPrice: 0 })
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
       
{/* 
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
        </Col> */}

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

        <EditRowDataExportOrderInternal isShow={isShowEditRowData} handleClose={() => setIsShowEditRowData(false)} data={data} dataAfterEdit={dataAfterEdit} />
    </>)
}


export default RowDataExportInternalOrder