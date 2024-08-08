import { useEffect, useState } from "react";
import { Modal, Button, Col, Row } from "react-bootstrap";
import { toast } from 'react-toastify';
import { updateInventoryCheck } from "~/services/StockTakeServices";
import { fetchAllStorages } from "~/services/StorageServices";

const ConfirmStockTake = ({ isShow, handleClose, dataStock, updateTableStock }) => {
    const [totalStockTake, setTotalStockTake] = useState([]);
    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [isShowDetailProduct, setIsShowDetailProduct] = useState(false);
    const [detailShipment, setDetailShipment] = useState([]);

    const date = new Date(dataStock.checkDate);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    const formattedDate = `${day}-${month}-${year}`;

    useEffect(() => {
        setTotalStockTake(dataStock.inventoryCheckDetails);
        console.log('total: ', dataStock);
        getAllStorages();
    }, [dataStock])

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }

    const handleCloseModal = () => {
        handleClose();
    }

    const warehouse = totalWarehouse.find(wh => wh.warehouseId === dataStock.warehouseId);

    const SaveAddStockTake = async () => {
        const convertTotalStockTake = (totalStockTake) => {
            const batchData = totalStockTake.map(item => ({
                batchCode: item.batchDetails[0].batchCode,
                actualQuantity: item.batchDetails[0].actualQuantity
            }));

            const convertedData = {};
            batchData.forEach(({ batchCode, actualQuantity }) => {
                convertedData[batchCode] = actualQuantity;
            });
            return convertedData;
        };
        const convertedBatchData = convertTotalStockTake(totalStockTake);
        // Gọi hàm updateInventoryCheck và truyền dữ liệu tổng kiểm kê
        console.log("convertedBatchData", convertedBatchData);
        const res = await updateInventoryCheck(convertedBatchData);
        console.log("resresres", res);
        // Kiểm tra mã trạng thái của phản hồi
        if (res.message === 'Batch quantities updated successfully.') {
            toast.success("Xác nhận kiểm kê thành công");
            updateTableStock(dataStock.warehouseId);
            handleClose();
        } else {
            toast.warning("Xác nhận kiểm kê thất bại");
        }
    }

    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Xác nhận kiểm kê</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row>
                        <Col md={3}>
                            <div className="form-group mb-3">
                                <label >Kho hàng</label>
                                <br />
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{warehouse ? warehouse.warehouseName : "Kho không tồn tại"}</button>
                            </div>
                        </Col>

                        <Col md={3}>
                            <div className="form-group mb-3">
                                <label >Ngày kiểm tra</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{formattedDate}</button>
                            </div>
                        </Col><Col md={3}>
                            <div className="form-group mb-3">
                                <label >Tình trạng</label>
                                <button type="button" className="btn btn-success border-left-0 rounded ButtonCSS" >{dataStock.status == "On Progress" ? "Đang tiến hành" : dataStock.status == "Completed" ? "Đã hoàn thành" : "Đã hủy"}</button>
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
                                    <label >Mã lô hàng</label>
                                    <input type="text" className="form-control inputCSS" value={o.batchDetails[0].batchCode} readOnly />
                                </Col>
                                <Col >
                                    <label >SL trên hệ thống</label>
                                    <input type="number" className="form-control inputCSS" value={o.batchDetails[0].expectedQuantity} readOnly />

                                </Col>
                                <Col > <label >Số lượng thực tế</label>
                                    <input type="text" className="form-control inputCSS" value={o.batchDetails[0].actualQuantity} readOnly />
                                </Col>
                                <Col> <label >Ghi chú</label>
                                    <input type="text" className="form-control inputCSS" value={o.note} readOnly />
                                </Col>
                            </Row>
                        ))
                    }
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={SaveAddStockTake}>
                    Xác nhận
                </Button>
            </Modal.Footer>
        </Modal >
    </>)
}


export default ConfirmStockTake