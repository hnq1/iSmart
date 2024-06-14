import { useEffect, useState } from "react";
import React from 'react';
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { fetchAllSuppliers } from '~/services/SupplierServices';
import { fetchAllSupplierActive } from "~/services/SupplierServices";
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchAllDelivery } from "~/services/DeliveryServices";
import { addNewImportOrder, fetchImportOrderNewest } from "~/services/ImportOrderServices";
import { createNewImportOrderDetail } from "~/services/ImportOrderDetailServices";
import { formatDateImport, formattedAmount } from "~/validate";
import AddRowDataImportOrder from "./AddRowDataImport";
import { format, addDays } from 'date-fns';

import RowDataImportOrder from "./RowDataImport";
import { toast } from "react-toastify";

import uploadImage from "~/services/ImageServices";


const ModelAddImportOrder = ({ isShow, handleClose, updateTable }) => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [importCode, setImportCode] = useState('');

    const [selectUserId, setSelectUserId] = useState(0);


    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);



    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    const [totalDelivery, setTotalDelivery] = useState([]);
    const [selectedDelivery, setSelectedDelivery] = useState(null);
    const [selectedDeliveryId, setSelectedDeliveryId] = useState(null);

    const [rowsData, setRowsData] = useState([]);

    const [totalCost, setTotalCost] = useState(0);

    const [selectedDate, setSelectedDate] = useState('');

    const [isShowRowDataImport, setIsShowRowDataImport] = useState(false);

    const [minDate, setMinDate] = useState();

    const [imageImportOrder, setImageImportOrder] = useState(null);


    useEffect(() => {
        getAllStorages();
        getAllSuppliers();
        getAllDelivery();
    }, [])

    useEffect(() => {
        setRowsData([]);
        console.log("selectedWarehouseIdsetRowsData: ", selectedWarehouseId, selectedSupplierId);
    }, [selectedWarehouseId, selectedSupplierId])


    useEffect(() => {
        setTotalCost(0);
    }, [])

    useEffect(() => {
        const currentDate = new Date();
        const formattedDate = format(currentDate, 'yyyy-MM-dd');
        setMinDate(formattedDate);
    }, [])
    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }

    const handleStorageClickTotal = () => {
        setSelectedWarehouseId("");
        setSelectedWarehouse("Tất cả kho");
    }

    const handleStorageClick = (warehouse) => {
        // let res = await setSelectedStorage(storage.storageName);

        setSelectedWarehouse(warehouse.warehouseName);
        //console.log("warehouse.warehouseId: ", warehouse.warehouseId);
        setSelectedWarehouseId(warehouse.warehouseId);
        //console.log("setSelectedWarehouse: ", warehouse.warehouseName);
        // getUsers(1);
        // console.log("warehouse: ", warehouse.warehouseId);
    }



    const getAllSuppliers = async () => {
        let res = await fetchAllSupplierActive();
        setTotalSuppliers(res);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }

    const getAllDelivery = async () => {
        let res = await fetchAllDelivery();
        setTotalDelivery(res);
    }

    const handleDeliveryClick = (delivery, event) => {
        setSelectedDelivery(delivery.deliveryName);
        setSelectedDeliveryId(delivery.deliveyId);
        console.log(delivery);
    }




    const handleDateChange = (event) => {
        setSelectedDate(event.target.value);
    };



    const handleReset = () => {
        setRowsData([]);
        setSelectedWarehouse(null);
        setSelectedWarehouseId(null);
        setSelectedSupplier(null);
        setSelectedSupplierId(null);
        setSelectedDelivery(null);
        setSelectedDeliveryId(null);
        setSelectedDate('');
        setTotalCost(0);
        setImportCode(null);
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }

    // nhận dữ liệu từ addRowDataImport
    const takeRowDataImportOrder = (importData) => {
        const updateDataImport = [...rowsData, importData];
        // updateDataImport[rowsData.length - 1] = importData;
        setRowsData(updateDataImport);

        setTotalCost(x => x + importData.totalOneGoodPrice);

    }


    // mở addRowDataImport
    const handleAddRowDataImport = () => {
        if (selectedWarehouseId && selectedSupplierId) {
            setIsShowRowDataImport(true);
            // setRowsData([...rowsData, {}])
        } else {
            toast.info("Vui lòng điền kho hoặc nhà cung cấp")
        }
    }

    // render rowsData
    const renderImportData = () => {
        return rowsData.map((data, index) => (
            <RowDataImportOrder key={index} data={rowsData[index]} index={index}
                deleteRowData={deleteRowData} updateRowData={updateRowData} />
        ))


    }

    // xóa 1 row của rowsData ở RowDataImport
    const deleteRowData = (rowdel) => {
        const updateDataImport = rowsData.filter((item, index) => index !== rowdel);
        const deletePrice = rowsData[rowdel].totalOneGoodPrice;
        setRowsData(updateDataImport);
        setTotalCost(x => x - deletePrice ? x - deletePrice : 0);
    }

    // update 1 row data từ RowDataImport
    const updateRowData = (rowUpdate, updateData) => {
        console.log(updateData);
        const updateDataImport = [...rowsData];
        updateDataImport[rowUpdate] = updateData;
        setTotalCost(x => x - rowsData[rowUpdate].totalOneGoodPrice + updateData.totalOneGoodPrice);
        setRowsData(updateDataImport);
    }

    const handleChooseFile = async (event) => {
        const file = event.target.files[0];
        let res = await uploadImage(file);
        const urlImage = res.url;
        setImageImportOrder(urlImage);
    }

    // Thêm 1 lô hàng 
    const handleAddImportOrder = async () => {
        if (!importCode.trim()) {
            toast.warning("Vui lòng nhập mã đơn hàng");
        }
        else if (!selectedDate) {
            toast.warning("Vui lòng nhập ngày nhập hàng");
        } else if (totalCost === 0) {
            toast.warning("Vui lòng nhập mặt hàng nhập");
        } else {
            let res = await addNewImportOrder(userId,
                selectedSupplierId,
                totalCost,
                "",
                "2024-03-24T08:47:56.243Z",
                formatDateImport(selectedDate),
                3, importCode,
                selectedWarehouseId,
                selectedDeliveryId,
                imageImportOrder,
                null);
            console.log("res them  1 lo hang moi: ", res);
            if (res.isSuccess == true) {
                let resImportId = await fetchImportOrderNewest();
                console.log("ResImportID :", resImportId);

                if (rowsData && rowsData.length > 0) {
                    await Promise.all(rowsData.map(async (data, index) => {
                        await createNewImportOrderDetail(resImportId, data.costPrice, data.goodsId, data.quantity);
                    }));
                }
                toast.success("Thêm lô hàng nhập thành công");
                updateTable();
                handleCloseModal();
            } else {
                toast.warning("Mã đơn hàng đã tồn tại");
            }

        }

    }






    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
                <Modal.Title>Thêm lô hàng nhập</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row style={{ display: 'flex', alignItems: 'center' }} >
                        <Col md={2}>

                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" placeholder="Mã đơn hàng" value={importCode} onChange={(event) => setImportCode(event.target.value)} />

                        </Col>
                        {
                            (roleId === 1) ?
                                <Col md={2}>
                                    <DropdownButton
                                        className="DropdownButtonCSS ButtonCSSDropdown"
                                        title={selectedWarehouse !== null ? selectedWarehouse : "Tất cả Kho"}
                                        variant="success"
                                        style={{ zIndex: 999 }}
                                    >
                                        <Dropdown.Item eventKey=""
                                            onClick={() => handleStorageClickTotal()}>Tất cả kho</Dropdown.Item>

                                        {totalWarehouse && totalWarehouse.length > 0 && totalWarehouse.map((c, index) => (
                                            <Dropdown.Item
                                                key={`warehouse ${index}`}
                                                eventKey={c.warehouseName}
                                                onClick={(e) => handleStorageClick(c, e)}
                                            >
                                                {c.warehouseName}
                                            </Dropdown.Item>
                                        ))}
                                    </DropdownButton>
                                </Col>
                                : ''
                        }

                        <Col md={3}>
                            <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                <Dropdown style={{}}>
                                    <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                        <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedSupplier !== null ? selectedSupplier : "Chọn nhà cung cấp"}</span>
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} >
                                        {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((s, index) => (
                                            <Dropdown.Item key={`supplier ${index}`} eventKey={s.supplierName} onClick={(e) => handleSupplierClick(s, e)}>
                                                {s.supplierName}
                                            </Dropdown.Item>
                                        ))}
                                    </Dropdown.Menu>
                                </Dropdown>
                            </div>
                        </Col>



                        <Col md={2}>
                            <div>
                                <input type="date" className="datepickerCSS" id="datepicker" min={minDate} value={selectedDate} onChange={handleDateChange} />
                            </div>
                        </Col>



                        <Col >
                            <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                <Dropdown style={{ position: 'relative' }}>
                                    <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                        <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedDelivery !== null ? selectedDelivery : "Chọn nhà vận chuyển"}</span>
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                        {totalDelivery && totalDelivery.length > 0 && totalDelivery.map((s, index) => (
                                            <Dropdown.Item key={`delivery ${index}`} eventKey={s.deliveryName} onClick={(e) => handleDeliveryClick(s, e)}>
                                                {s.deliveryName}
                                            </Dropdown.Item>
                                        ))}
                                    </Dropdown.Menu>
                                </Dropdown>
                            </div>
                        </Col>






                    </Row>

                    <Row style={{ marginTop: '20px' }}>
                        <Col md={2}>
                            <div>
                                <input
                                    type="file"
                                    accept="image/*" // Chỉ chấp nhận các loại file ảnh
                                    onChange={handleChooseFile} // Hàm xử lý sự kiện khi người dùng chọn file
                                />
                            </div>
                        </Col>
                        <Col md={7}></Col>
                        <Col md={3}>
                            <div className="ButtonCSSDropdown">
                                <button
                                    className="btn btn-success border-left-0 rounded"
                                    type="button"
                                    onClick={handleAddRowDataImport}
                                ><i className="fa-solid fa-plus"></i>
                                    &nbsp;
                                    Thêm sản phẩm
                                </button>
                            </div>
                        </Col>
                    </Row>



                    <hr />
                    <Row style={{ maxHeight: '400px', overflowY: 'auto' }}>
                        {renderImportData()}

                    </Row>
                    <div className="">
                        <button
                            className="btn rounded ButtonRed"
                            type="button"

                        >
                            Tổng giá tiền: {formattedAmount(totalCost)}
                        </button>

                    </div>

                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleAddImportOrder}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal >

        <AddRowDataImportOrder isShow={isShowRowDataImport}
            selectedSupplierId={selectedSupplierId} selectedStorageId={selectedWarehouseId}
            onChange={(importData) => takeRowDataImportOrder(importData)}
            handleClose={() => setIsShowRowDataImport(false)} />
    </>)
}

export default ModelAddImportOrder;