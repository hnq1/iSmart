import { useEffect, useState } from "react";
import React from 'react';
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchDeliveryActive } from "~/services/DeliveryServices";
// import { fetchAllCustomer } from "~/services/CustomerServices";
import { addNewExportOrder, fetchExportOrderNewest } from "~/services/ExportOrderService";
import { createNewExportOrderDetail } from "~/services/ExportOrderDetailService";
import { format, addDays } from 'date-fns';
import { formatDateImport, formattedAmount } from "~/validate";
import { toast } from "react-toastify";
import uploadImage from "~/services/ImageServices";
import { getUserIdWarehouse } from "~/services/UserWarehouseServices";
import AddRowDataExportOrderInternalManual from "./AddRowDataExportInternalManual";
import RowDataExportInternalOrder from "./RowDataExportInternalOrder";
import { set } from "lodash";

const ModelAddExportOrderInternalManual = ({ isShow, handleClose, updateTable }) => {

    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [exportCode, setExportCode] = useState('');

    const [totalDelivery, setTotalDelivery] = useState([]);
    const [selectedDelivery, setSelectedDelivery] = useState(null);
    const [selectedDeliveryId, setSelectedDeliveryId] = useState(null);

    // const [totalCustomer, setTotalCustomer] = useState([]);
    const [selectedCustomer, setSelectedCustomer] = useState(null);
    const [selectedCustomerId, setSelectedCustomerId] = useState(null);

    const [minDate, setMinDate] = useState();
    const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]);

    const [isShowRowDataExport, setIsShowRowDataExport] = useState(false);

    const [rowsData, setRowsData] = useState([]);

    const [totalPrice, setTotalPrice] = useState(0);

    const [imageExportOrder, setImageExportOrder] = useState(null);

    const [totalWarehouse1, setTotalWarehouse1] = useState([]);
    const [totalWarehouse2, setTotalWarehouse2] = useState([]);

    // Trạng thái cho kho nhập (Import)
    const [selectedWarehouseImport, setSelectedWarehouseImport] = useState(null);
    const [selectedWarehouseImportId, setSelectedWarehouseImportId] = useState(null);

    // Trạng thái cho kho xuất (Export)
    const [selectedWarehouseExport, setSelectedWarehouseExport] = useState(null);
    const [selectedWarehouseExportId, setSelectedWarehouseExportId] = useState(null);



    useEffect(() => {
        getAllStorages1();
        getAllStorages2();
        // getAllCustomer();
        getAllDelivery();
    }, [])

    useEffect(() => {
        const currentDate = new Date();
        const formattedDate = format(currentDate, 'yyyy-MM-dd');
        setMinDate(formattedDate);
    }, [])

    useEffect(() => {
        wh();
    }, [userId]);

    const getAllDelivery = async () => {
        let res = await fetchDeliveryActive();
        setTotalDelivery(res);
    }

    const handleDeliveryClick = (delivery, event) => {
        setSelectedDelivery(delivery.deliveryName);
        setSelectedDeliveryId(delivery.deliveyId);
        console.log(delivery);
    }

    // const getAllCustomer = async () => {
    //     let res = await fetchAllCustomer();
    //     setTotalCustomer(res);
    // }


    // const handleCustomerClick = (c, event) => {
    //     setSelectedCustomer(c.customerName);
    //     setSelectedCustomerId(c.customerId);
    // }

    const handleDateChange = (event) => {
        setSelectedDate(event.target.value);
    };

    // mở modal AddRowDataExport
    const handleAddRowDataExport = () => {
        if (roleId === 3 || selectedWarehouseExportId) {
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
        console.log(exportData);
        const updateDataExport = [...rowsData, exportData];
        setRowsData(updateDataExport);

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
            <RowDataExportInternalOrder key={index} data={rowsData[index]} index={index}
                updateRowData={updateRowData} deleteRowData={deleteRowData}
            />
        ))


    }

    const wh = async () => {
        if (roleId === 1) {
            getAllStorages1();
        } else if (roleId === 3) {
            const uwh = await getWarehouseById(userId);
            let allwh = await fetchAllStorages();
            // Lọc danh sách kho hàng để loại bỏ kho hàng của người dùng hiện tại
            if (uwh && uwh.warehouseId) {
                allwh = allwh.filter(storage => storage.warehouseId !== uwh.warehouseId);
                console.log("allwh2: ", allwh);
            }

            setTotalWarehouse2(allwh); // Giả sử setTotalWarehouse là hàm setState đã được định nghĩa ở nơi khác
        };
    }
    const getAllStorages1 = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse1(res);
    }

    const getAllStorages2 = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse2(res);
    }

    // Xử lý chọn "Tất cả kho Nhập"
    const handleStorageClickTotalImport = async () => {
        await getAllStorages2(); //QH
        setSelectedWarehouseImportId("");
        setSelectedWarehouseImport("Tất cả kho Nhập");
    }


    const handleStorageClickImport = async (warehouse) => {
        await getAllStorages2(); //QH
        setSelectedWarehouseImport(warehouse.warehouseName);
        setSelectedWarehouseImportId(warehouse.warehouseId);
        setTotalWarehouse2(x => x.filter(w => w.warehouseId !== warehouse.warehouseId)); //QH
    }

    // Xử lý chọn "Tất cả kho Xuất"
    const handleStorageClickTotalExport = async () => {
        await getAllStorages1(); //QH
        setSelectedWarehouseExportId("");
        setSelectedWarehouseExport("Tất cả kho Xuất");
    }


    const handleStorageClickExport = async (warehouse) => {
        await getAllStorages1(); //QH
        setSelectedWarehouseExport(warehouse.warehouseName);
        setSelectedWarehouseExportId(warehouse.warehouseId);
        setTotalWarehouse1(x => x.filter(w => w.warehouseId !== warehouse.warehouseId)); //QH
    }
    const getWarehouseById = async (userId) => {
        let res = await getUserIdWarehouse(userId);
        return res[0];
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

        } else if (!selectedDate) {
            toast.warning("Vui lòng nhập ngày xuất hàng");
            // } else if (totalPrice === 0) {
            //     toast.warning("Vui lòng nhập mặt hàng xuất");
        }  else if (rowsData.length === 0) {
            toast.warning("Hãy thêm lô hàng");
        }  
        else if (!selectedDelivery) {
            toast.warning("Vui lòng chọn bên giao hàng");
        } else {
            const userId = parseInt(localStorage.getItem('userId'), 10);
            console.log("userId", userId);
            let warehouse = await getWarehouseById(userId);
            const warehouseIdToUse = roleId === 1 ? selectedWarehouseImportId : warehouse.warehouseId;
            let isInternalTransfer = true;
            let res = await addNewExportOrder(isInternalTransfer,
                userId,
                exportCode,
                0,
                "",
                formatDateImport(selectedDate),
                warehouseIdToUse,
                "2024-07-03T16:51:26.339Z",
                selectedDeliveryId,
                imageExportOrder,
                selectedCustomerId,
                selectedWarehouseExportId
            );
            // console.log("addNewExportOrder:", warehouseIdToUse);
            if (res.isSuccess == true) {
                let resExportId = await fetchExportOrderNewest();
                console.log("resExportId: ", resExportId);
                if (rowsData && rowsData.length > 0) {
                    await Promise.all(rowsData.map(async (data, index) => {
                        data.forEach(item => {
                            createNewExportOrderDetail(resExportId, item.costPrice, item.goodsId, item.quantity, item.importOrderDetailId);
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
        setSelectedDelivery(null);
        setSelectedDeliveryId(null);
        // setSelectedCustomer(null);
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
                <Modal.Title>Thêm lô hàng xuất nội bộ thủ công</Modal.Title>
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
                                title={selectedWarehouseImport !== null ? selectedWarehouseImport : "Tất cả Kho Nhập"}
                                variant="success"
                                style={{ zIndex: 999 }}
                            >
                                <Dropdown.Item eventKey=""
                                    onClick={() => handleStorageClickTotalImport()}>Tất cả kho Nhập</Dropdown.Item>

                                {totalWarehouse1 && totalWarehouse1.length > 0 && totalWarehouse1.map((c, index) => (
                                    <Dropdown.Item
                                        key={`warehouse ${index}`}
                                        eventKey={c.warehouseName}
                                        onClick={(e) => handleStorageClickImport(c, e)}
                                    >
                                        {c.warehouseName}
                                    </Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>


                        <Col md={2}>
                            <DropdownButton
                                className="DropdownButtonCSS ButtonCSSDropdown"
                                title={selectedWarehouseExport !== null ? selectedWarehouseExport : "Tất cả Kho Xuất"}
                                variant="success"
                                style={{ zIndex: 999 }}
                            >
                                <Dropdown.Item eventKey="" onClick={() => handleStorageClickTotalExport()}>Tất cả kho Xuất</Dropdown.Item>
                                {totalWarehouse2 && totalWarehouse2.length > 0 && totalWarehouse2.map((c, index) => (
                                    <Dropdown.Item
                                        key={`warehouse ${index}`}
                                        eventKey={c.warehouseName}
                                        onClick={(e) => handleStorageClickExport(c, e)}
                                    >
                                        {c.warehouseName}
                                    </Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>


                        {/* <Col md={3} >
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
                        </Col> */}

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
               
                <Button variant="primary" className="ButtonCSS" onClick={handleAddExportOrder}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal >

        <AddRowDataExportOrderInternalManual isShow={isShowRowDataExport} selectedStorageId={selectedWarehouseExportId}
            onChange={(exportData) => takeRowDataExportOrder(exportData)}
            handleClose={() => setIsShowRowDataExport(false)} />
    </>)

}

export default ModelAddExportOrderInternalManual