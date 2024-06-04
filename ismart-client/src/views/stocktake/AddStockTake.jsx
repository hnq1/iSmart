import { fetchAllStorages } from '~/services/StorageServices';
import { useEffect, useState } from "react";
import React from 'react';
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import RowDataStockTake from './RowDataStockTake';
import AddRowDataStockTake from './AddRowDataStockTake';
import { addStockTake, fetchNewestStockTake } from '~/services/StockTakeServices';
import { createNewStockTakeDetail } from '~/services/StockTakeDetailServices';

import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { toast } from 'react-toastify';


const ModalAddStockTake = ({ isShow, handleClose, updateTable }) => {
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [stockTakeCode, setStockTakeCode] = useState('');

    const [isShowAddRowDataStockTake, setIsShowAddRowDataStockTake] = useState(false);

    const [rowsData, setRowsData] = useState([]);


    useEffect(() => {
        getAllStorages();
    }, [])

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
    }


    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }

    const handleAddRowDataStockTake = () => {
        if (selectedStorageId) {
            setIsShowAddRowDataStockTake(true);
        } else {
            toast.warning("Vui lòng nhập kho");
        }
    }

    const takeRowDataStockTake = (data) => {
        const updateData = [...rowsData, data];
        setRowsData(updateData);
    }

    const renderData = () => {
        return rowsData.map((data, index) => (
            <RowDataStockTake key={index} data={rowsData[index]} index={index} deleteRowData={deleteRowData}
            />
        ))


    }

    const deleteRowData = (rowdel) => {
        const updateData = rowsData.filter((item, index) => index !== rowdel);
        setRowsData(updateData);
    }

    const handleSaveStockTake = async () => {
        if (!stockTakeCode.trim()) {
            toast.warning("Vui lòng nhập mã đơn kiểm hàng");
        }
        else if (!selectedStorage) {
            toast.warning("Vui lòng chọn kho kiểm hàng");
        } else {
            let res = await addStockTake("2024-03-24T08:47:56.243Z", null, null, 3, null, selectedStorageId, "", userId, stockTakeCode);
            console.log(res);
            if (res.isSuccess == true) {
                let resId = await fetchNewestStockTake();
                console.log(rowsData);
                if (rowsData && rowsData.length > 0) {
                    await Promise.all(rowsData.map(async (data, index) => {
                        await createNewStockTakeDetail(resId, data.goodsId, data.quantityInStock, 0, 0, "");
                    }));
                }
                toast.success("Thêm đơn kiểm hàng mới thành công");
                updateTable();
                handleCloseModal();
            } else {
                toast.warning("Mã kiểm hàng đã tồn tại");
            }

        }
    }


    const handleReset = () => {
        setRowsData([]);
        setStockTakeCode('');
        setSelectedStorage(null);
        setSelectedStorageId(null);
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Thêm đơn kiểm hàng</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row style={{ marginBottom: '20px' }}>
                        <Col md={3}>
                            <div className="form-group mb-3">
                                <input type="text" className="form-control inputCSS" aria-describedby="emailHelp"
                                    placeholder="Mã đơn kiểm" value={stockTakeCode} onChange={(event) => setStockTakeCode(event.target.value)} />
                            </div>
                        </Col>
                        <Col md={3}>
                            <DropdownButton className="ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 9999 }}>
                                {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                    <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>
                        <Col md={2}></Col>

                        <Col md={4}>
                            <div className="ButtonCSSDropdown">
                                <button
                                    className="btn btn-success border-left-0 rounded"
                                    type="button"
                                    onClick={handleAddRowDataStockTake}
                                ><i className="fa-solid fa-plus"></i>
                                    &nbsp;
                                    Thêm mặt hàng kiểm
                                </button>
                            </div>
                        </Col>


                    </Row>

                    <hr />
                    <Row style={{ maxHeight: '400px', overflowY: 'auto' }}>
                        {renderData()}

                    </Row>

                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleSaveStockTake}>
                    Tạo đơn kiểm hàng
                </Button>
            </Modal.Footer>
        </Modal>
        <AddRowDataStockTake
            isShow={isShowAddRowDataStockTake}
            handleClose={() => setIsShowAddRowDataStockTake(false)}
            onChange={(data) => takeRowDataStockTake(data)}
            selectedStorageId={selectedStorageId} />
    </>)
}

export default ModalAddStockTake