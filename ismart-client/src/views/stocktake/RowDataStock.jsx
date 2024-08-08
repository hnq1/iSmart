import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button, Table } from "react-bootstrap";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";
import EditRowDataStock from "./EditRowDataStock";



const RowDataStock = ({ data, index, deleteRowData, updateRowData }) => {
    const [isShowEditRowData, setIsShowEditRowData] = useState(false);

    const [goodsId, setGoodsId] = useState();
    const [goodsCode, setGoodsCode] = useState();
    const [importOrderDetailId, setImportOrderDetail] = useState();
    const [batchCode, setBatchCode] = useState();
    const [quantity, setQuantity] = useState();
    const [actualQuantity, setActualQuantity] = useState();

    useEffect(() => {
        console.log("item: ", data.batchDetails[0].batchCode);
        setGoodsCode(data.goodsCode);
        setGoodsId(data.goodsId);
        setImportOrderDetail(data.importOrderDetailId);
        setQuantity(data.batchDetails[0].expectedQuantity);
        setBatchCode(data.batchDetails[0].batchCode);
        setActualQuantity(data.batchDetails[0].actualQuantity);

    }, [data])

    const handleEditRowData = () => {
        setIsShowEditRowData(true);
    }

    const handleDeleteRowData = () => {
        deleteRowData(index);
    }

    const dataAfterEdit = (editedData) => {
        setActualQuantity(editedData.actualQuantity);
        updateRowData(index, {
            ...data,
            batchDetails: [{
                ...data.batchDetails[0],
                actualQuantity: editedData.actualQuantity
            }]
        });
    };


    return (<>
        <Row>

            <Col md={3}>
                <div className="form-group mb-3">
                    <label >Mã lô hàng</label>
                    <input type="text" className="form-control" defaultValue={batchCode} disabled />
                </div>
            </Col>

            <Col md={3}>
                <div className="form-group mb-3">
                    <label >SL trên hệ thống</label>
                    <input type="number" className="form-control" defaultValue={quantity} disabled />
                </div>
            </Col>

            <Col md={2}>
                <div className="form-group mb-3">
                    <label >SL thực tế</label>
                    <input type="number" className="form-control" defaultValue={actualQuantity} disabled />
                </div>
            </Col>


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

        <EditRowDataStock isShow={isShowEditRowData} handleClose={() => setIsShowEditRowData(false)} data={data} dataAfterEdit={dataAfterEdit} />
    </>)
}




export default RowDataStock











