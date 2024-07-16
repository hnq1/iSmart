import { useEffect, useState } from "react";
import React from 'react';
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchAllDelivery } from "~/services/DeliveryServices";
import { fetchAllCustomer } from "~/services/CustomerServices";
import { addNewExportOrder, fetchExportOrderNewest } from "~/services/ExportOrderService";
import { createNewExportOrderDetail } from "~/services/ExportOrderDetailService";
import { format, addDays } from 'date-fns';
import { formatDateImport, formattedAmount } from "~/validate";
import { toast } from "react-toastify";
import uploadImage from "~/services/ImageServices";

import AddRowDataExportOrderManual from "./AddRowDataExportManual";
import RowDataExportOrderManual from "./RowDataExportManual";
import { forEach, set } from "lodash";

const ModelAddExportOrderManual = ({ isShow, handleClose, updateTable }) => {

    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [exportCode, setExportCode] = useState('');
    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    const [totalDelivery, setTotalDelivery] = useState([]);
    const [selectedDelivery, setSelectedDelivery] = useState(null);
    const [selectedDeliveryId, setSelectedDeliveryId] = useState(null);

    const [totalCustomer, setTotalCustomer] = useState([]);
    const [selectedCustomer, setSelectedCustomer] = useState(null);
    const [selectedCustomerId, setSelectedCustomerId] = useState(null);

    const [minDate, setMinDate] = useState();
    const [selectedDate, setSelectedDate] = useState('');

    const [isShowRowDataExport, setIsShowRowDataExport] = useState(false);

    const [rowsData, setRowsData] = useState([]);

    const [totalPrice, setTotalPrice] = useState(0);

    const [imageExportOrder, setImageExportOrder] = useState(null);




    useEffect(() => {
        getAllStorages();
        getAllCustomer();
        getAllDelivery();
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

    const handleStorageClick = async (warehouse) => {
        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
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

    const getAllCustomer = async () => {
        let res = await fetchAllCustomer();
        setTotalCustomer(res);
    }


    const handleCustomerClick = (c, event) => {
        setSelectedCustomer(c.customerName);
        setSelectedCustomerId(c.customerId);
    }

    const handleDateChange = (event) => {
        setSelectedDate(event.target.value);
    };

    // mở modal AddRowDataExport
    const handleAddRowDataExport = () => {
        if (selectedWarehouseId) {
            setIsShowRowDataExport(true);
        } else {
            toast.warning("Vui lòng điền kho")
        }
    }

    // xóa rowdata ở rowdataImport
    const deleteRowData = (rowdel) => {
        const updateDataExport = rowsData.filter((item, index) => index !== rowdel);
        const deletePrice = rowsData[rowdel].totalOneGoodPrice;
        setRowsData(updateDataExport);
        setTotalPrice(x => x - deletePrice ? x - deletePrice : 0);
    }


    // nhận data từ AddRowDataExport
    const takeRowDataExportOrder = (exportData) => {
        console.log("exportData:", exportData);
        const updateDataExport = [...rowsData, exportData];

        setRowsData(updateDataExport);
        console.log("updateDataExport:", updateDataExport);
        setTotalPrice(x => x + exportData.totalOneGoodPrice);

    }

    // update 1 row data từ RowDataImport
    const updateRowData = (rowUpdate, updateData) => {
        console.log(updateData);
        const updateDataImport = [...rowsData];
        updateDataImport[rowUpdate] = updateData;
        setTotalPrice(x => x - rowsData[rowUpdate].totalOneGoodPrice + updateData.totalOneGoodPrice);
        setRowsData(updateDataImport);
    }

    // render rowsData
    const renderExportData = () => {
        return rowsData.map((data, index) => (
            <RowDataExportOrderManual key={index} data={rowsData[index]} index={index}
                updateRowData={updateRowData} deleteRowData={deleteRowData}
            />
        ))


    }

    const handleChooseFile = async (event) => {
        const file = event.target.files[0];
        let res = await uploadImage(file);
        const urlImage = res.url;
        setImageExportOrder(urlImage);
    }

    const handleAddExportOrder = async () => {
        if (!exportCode.trim()) {
            toast.warning("Vui lòng nhập mã đơn hàng");
        }
        else if (!selectedWarehouse) {
            toast.warning("Vui lòng chọn kho xuất hàng");
        } else if (!selectedDate) {
            toast.warning("Vui lòng nhập ngày xuất hàng");
            // } else if (totalPrice === 0) {
            //     toast.warning("Vui lòng nhập mặt hàng xuất");
        } else if (!selectedDelivery) {
            toast.warning("Vui lòng chọn bên giao hàng");
        } else if (!selectedCustomer) {
            toast.warning("Vui lòng chọn khách hàng");
        } else {
            const userId = parseInt(localStorage.getItem('userId'), 10);
            console.log("userId", userId);
            let isInternalTransfer = false;
            let res = await addNewExportOrder(isInternalTransfer,
                userId,
                exportCode,
                0,
                "",
                formatDateImport(selectedDate),
                selectedWarehouseId,
                "2024-07-03T16:51:26.339Z",
                selectedDeliveryId,
                imageExportOrder,
                selectedCustomerId,
                0
            );
            // console.log("addNewExportOrder:", res);
            if (res.isSuccess == true) {
                let resExportId = await fetchExportOrderNewest();
                // const importOrderDetailIds = rowsData.map(data => parseInt(data.importOrderDetailId, 10));
                if (rowsData && rowsData.length > 0) {
                    await Promise.all(rowsData.map(async (data, index) => {
                        data.forEach(item => {
                            createNewExportOrderDetail(resExportId,
                                item.costPrice,
                                item.goodsId,
                                item.quantity,
                                item.importOrderDetailId);
                        })
                    }))

                }
                toast.success("Thêm lô hàng xuất thành công");
                updateTable();
                handleCloseModal();
            } else {
                toast.warning("Mã đơn hàng đã tồn tại");
            }

        }
    }

    const handleReset = () => {
        setRowsData([]);
        setExportCode(null);
        setSelectedWarehouse(null);
        setSelectedWarehouseId(null);
        setSelectedDelivery(null);
        setSelectedDeliveryId(null);
        setSelectedCustomer(null);
        setSelectedCustomerId(null);
        // setSelectedProject(null);
        // setSelectedProjectId(null);
        setSelectedDate('');
        setTotalPrice(0);
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }





    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
                <Modal.Title>Thêm lô hàng xuất</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row className="align-items-center">
                        <Col md={2}>
                            <div className="form-group ">
                                <input type="text" className="form-control inputCSS" placeholder="Mã đơn hàng" value={exportCode} onChange={(event) => setExportCode(event.target.value)} />
                            </div>
                        </Col>
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





                        <Col md={3} >
                            <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                <Dropdown style={{ position: 'relative' }}>
                                    <Dropdown.Toggle className="ButtonCSSDropdown" as={CustomToggle} id="dropdown-custom-components">
                                        <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedCustomer !== null ? selectedCustomer : "Khách hàng"}</span>
                                    </Dropdown.Toggle>

                                    <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                        {totalCustomer && totalCustomer.length > 0 && totalCustomer.map((s, index) => (
                                            <Dropdown.Item key={`delivery ${index}`} eventKey={s.customerName} onClick={(e) => handleCustomerClick(s, e)}>
                                                {s.customerName}
                                            </Dropdown.Item>
                                        ))}
                                    </Dropdown.Menu>
                                </Dropdown>
                            </div>
                        </Col>

                        <Col md={2} style={{ width: '220px' }}>
                            <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                <Dropdown style={{ position: 'relative' }}>
                                    <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                        <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedDelivery !== null ? selectedDelivery : "Bên vận chuyển"}</span>
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

                        <Col md={2}>
                            <div>
                                <input type="date" className="datepickerCSS" id="datepicker" min={minDate} value={selectedDate} onChange={handleDateChange} />
                            </div>
                        </Col>


                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <Col md={2}>
                            <div>
                                <input
                                    type="file"
                                    accept="image/*" // Chỉ chấp nhận các loại file ảnh
                                    onChange={handleChooseFile} // Hàm xử lý sự kiện khi người dùng chọn file
                                />
                            </div>
                        </Col>
                    </Row>
                    <Row>

                        <Col md={3} className="mt-3">
                            <div className="ButtonCSSDropdown">
                                <button
                                    className="btn btn-success border-left-0 rounded"
                                    type="button"
                                    onClick={handleAddRowDataExport}
                                ><i className="fa-solid fa-plus"></i>
                                    &nbsp;
                                    Thêm sản phẩm
                                </button>
                            </div>
                        </Col>
                    </Row>



                    <Row style={{ maxHeight: '400px', overflowY: 'auto' }}>
                        {renderExportData()}

                    </Row>


                </div>
            </Modal.Body>

            <Modal.Footer>
                {/* <div className=" ">
                    <button
                        className="btn  border-left-0 rounded ButtonRed"
                        type="button"

                    >
                        Tổng giá tiền: {formattedAmount(totalPrice)}
                    </button>

                </div> */}
                <Button variant="primary" className="ButtonCSS" onClick={handleAddExportOrder}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal >

        <AddRowDataExportOrderManual isShow={isShowRowDataExport} selectedStorageId={selectedWarehouseId}
            onChange={(exportData) => takeRowDataExportOrder(exportData)}
            handleClose={() => setIsShowRowDataExport(false)} />
    </>)

}

export default ModelAddExportOrderManual