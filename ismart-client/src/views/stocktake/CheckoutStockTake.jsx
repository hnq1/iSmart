import { useEffect, useState } from "react";
import { toast } from "react-toastify";

import { Modal, Button, Col, Row, Dropdown } from "react-bootstrap";

import { getStockTakeDetail, updateStockTakeDetail } from "~/services/StockTakeDetailServices";
import { updateGoodHistoryAfterChekckout } from "~/services/StockTakeServices";
import { editStockTake } from "~/services/StockTakeServices";
import RowDataCheckoutStockTake from "./RowDataCheckoutStockTake";

const ModalCheckoutStockTake = ({ isShow, handleClose, dataModalCheckout, updateTable }) => {

    const userId = parseInt(localStorage.getItem('userId'), 10);



    const [rowsData, setRowsData] = useState([]);


    useEffect(() => {
        if (dataModalCheckout) {
            getTotalStockDetail();
        }
    }, [dataModalCheckout])


    const getTotalStockDetail = async () => {
        if (dataModalCheckout.stocktakeId) {
            let res = await getStockTakeDetail(dataModalCheckout.stocktakeId);
            console.log(res);
            setRowsData(res);
        }

    }

    const updateRowData = (rowUpdate, updateData) => {
        console.log(updateData);
        const updateDataImport = [...rowsData];
        updateDataImport[rowUpdate] = updateData;
        setRowsData(updateDataImport);
    }

    const renderImportData = () => {
        return rowsData.map((data, index) => (
            <RowDataCheckoutStockTake key={index} data={rowsData[index]} index={index}
                updateRowData={updateRowData} />
        ))
    }

    const handleSaveCheckoutStock = async () => {

        if (rowsData && rowsData.length > 0) {
            await editStockTake(dataModalCheckout.stocktakeId, "", userId, "");
            await Promise.all(rowsData.map(async (data, index) => {
                await updateStockTakeDetail(data.detailId, data.stocktakeId, data.goodsId,
                    data.currentStock, data.actualStock, data.currentStock - data.actualStock, data.note);
            }));

            await Promise.all(rowsData.map(async (data, index) => {
                await updateGoodHistoryAfterChekckout(data.goodsId,
                    data.currentStock, data.actualStock, "", dataModalCheckout.stockTakeCode, userId);
            }));
        }
        toast.success("Kiểm kê hàng hóa thành công");
        updateTable();
        handleCloseModal();
    }

    const handleCloseModal = () => {
        handleClose();
    }


    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Tiến hành kiểm kê</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    {/* {totalStockTakeDetail && totalStockTakeDetail.length > 0
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
                                        <input type="number" className="form-control inputCSS" value={actualStock} onChange={(event) => handleChangeQuantity(event, index)} />
                                    </div>
                                </Col>

                                <Col md={2}>
                                    <label >Lựa chọn</label>

                                    <Dropdown onSelect={handleSelect}>
                                        <Dropdown.Toggle variant="success" id="dropdown-basic">
                                            {selectedOption ? selectedOption : "Lý do"}
                                        </Dropdown.Toggle>

                                        <Dropdown.Menu>
                                            <Dropdown.Item eventKey="Bị hỏng">Bị hỏng</Dropdown.Item>
                                            <Dropdown.Item eventKey="Bị mất">Bị mất</Dropdown.Item>
                                            <Dropdown.Item eventKey="Khác">Khác</Dropdown.Item>

                                        </Dropdown.Menu>

                                    </Dropdown>
                                </Col>
                            </Row>
                        ))
                    } */}

                    {renderImportData()}

                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleSaveCheckoutStock}>
                    Xác nhận kiểm kê
                </Button>
            </Modal.Footer>
        </Modal >
    </>)
}
export default ModalCheckoutStockTake