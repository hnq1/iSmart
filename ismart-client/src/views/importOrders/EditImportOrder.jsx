import { useEffect, useState } from "react";
import React from 'react';
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import { updateImportOrder } from "~/services/ImportOrderServices";
import { getImportOrderDetailByImportId, updateImportOrderDetail } from "~/services/ImportOrderDetailServices";
import { formatDateImport, formattedAmount } from "~/validate";
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import AddRowDataImportOrder from "./AddRowDataImport";
import RowDataEditImportOrder from './RowDataEditImportOrder';
import { format, addDays } from 'date-fns';

import RowDataImportOrder from "./RowDataImport";
import { toast } from "react-toastify";


const ModalEditImportOrder = ({ isShow, handleClose, detailOrderEdit, updateTable }) => {



    const [rowsData, setRowsData] = useState([]);
    const [totalPrice, setTotalPrice] = useState(0);

    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    const [selectedDelivery, setSelectedDelivery] = useState(null);
    const [selectedDeliveryId, setSelectedDeliveryId] = useState(null);

    const [importCode, setImportCode] = useState(null);

    const [selectedDate, setSelectedDate] = useState(null);

    const userId = parseInt(localStorage.getItem('userId'), 10);


    useEffect(() => {
        if (detailOrderEdit.importId) {
            getTotalOrderDetail(detailOrderEdit.importId);

            setSelectedStorage(detailOrderEdit.storageName);
            setSelectedStorageId(detailOrderEdit.storageId);

            setSelectedSupplier(detailOrderEdit.supplierName);
            setSelectedSupplierId(detailOrderEdit.supplierId);

            setSelectedDelivery(detailOrderEdit.deliveryName);
            setSelectedDeliveryId(detailOrderEdit.deliveryId);

            setImportCode(detailOrderEdit.importCode);

            setSelectedDate(formatDateImport(detailOrderEdit.importedDate));
        }
        // console.log("rowsData: ",rowsData);
        console.log("detailOrderEdit: ", detailOrderEdit);

    }, [detailOrderEdit])

    const getTotalOrderDetail = async (importId) => {
        let res = await getImportOrderDetailByImportId(importId);
        // console.log(res);
        setRowsData(res);
        setTotalPrice(detailOrderEdit.totalCost);
    }

    // const takeRowDataImportOrder = (importData) => {
    //     importData.supplierId = selectedSupplierId;
    //     importData.supplierName = selectedSupplier;

    //     // Kiểm tra xem sản phẩm đã tồn tại trong danh sách hay chưa
    //     const existingProductIndex = rowsData.findIndex(row => row.goodsId === importData.goodsId);

    //     if (existingProductIndex !== -1) {
    //         // Nếu sản phẩm đã tồn tại, cập nhật số lượng và các giá trị mới
    //         const updatedRowsData = [...rowsData];

    //         updatedRowsData[existingProductIndex].quantity += importData.quantity; // Cập nhật số lượng
    //         updatedRowsData[existingProductIndex] = { ...updatedRowsData[existingProductIndex], ...importData }; // Cập nhật các giá trị mới

    //         setRowsData(updatedRowsData);

    //         //setTotalCost(prevTotalCost => prevTotalCost + importData.totalOneGoodPrice); // Cập nhật tổng chi phí
    //         toast.info("Sản phẩm đã tồn tại trong danh sách, số lượng và thông tin đã được cập nhật.");
    //     } else {
    //         // Nếu sản phẩm chưa tồn tại, thêm vào danh sách và cập nhật tổng chi phí
    //         const updateDataImport = [...rowsData, importData];
    //         setRowsData(updateDataImport);

    //     }

    // }


    // render rowsData
    const renderImportData = () => {
        return rowsData.map((data, index) => (
            <RowDataEditImportOrder key={index} data={rowsData[index]} index={index}
                deleteRowData={deleteRowData} updateRowData={updateRowData} />
        ))


    }

    // xóa 1 row của rowsData ở RowDataImport
    const deleteRowData = (rowdel) => {
        const updateDataImport = rowsData.filter((item, index) => index !== rowdel);
        const deletePrice = rowsData[rowdel].costPrice * rowsData[rowdel].quantity;
        setRowsData(updateDataImport);
        setTotalPrice(x => x - deletePrice ? x - deletePrice : 0);
    }

    // update 1 row data từ RowDataImport
    const updateRowData = (rowUpdate, updateData) => {
        // console.log(updateData);
        const updateDataImport = [...rowsData];
        updateDataImport[rowUpdate] = updateData;
        // setTotalPrice(x => x - rowsData[rowUpdate].costPrice * rowsData[rowUpdate].quantity + updateData.costPrice * updateData.quantity);
        setRowsData(updateDataImport);
    }

    const handleUpdateImportOrder = async () => {
        // if (totalPrice === 0) {
        //     toast.warning("Vui lòng nhập mặt hàng nhập");
        // } else {
        console.log(detailOrderEdit.importId);
        let res = await updateImportOrder(detailOrderEdit.importId,
            userId,
            selectedSupplierId,
            0,
            "",
            detailOrderEdit.createdDate,
            detailOrderEdit.importedDate,
            3,
            importCode,
            selectedStorageId,
            selectedDeliveryId,
            detailOrderEdit.image,
            null);
        console.log("handleUpdateImportOrder: ", res);
        if (rowsData && rowsData.length > 0) {
            await Promise.all(rowsData.map(async (data, index) => {
                await updateImportOrderDetail(
                    detailOrderEdit.importId,
                    data.costPrice,
                    data.detailId,// chưa lấy được
                    data.goodsId,
                    data.quantity,
                    data.manufactureDate,
                    data.expiryDate,
                    data.batchCode
                );
                console.log("data: ", detailOrderEdit.importId,
                    data.costPrice,
                    data.detailId,
                    data.goodsId,
                    data.quantity,
                    data.manufactureDate,
                    data.expiryDate,
                    data.batchCode);
            }));
        }
        toast.success("Thêm lô hàng nhập thành công");
        updateTable();
        handleCloseModal();
        // }

    }
    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }

    const handleReset = () => {
        // setRowsData([]);
        setTotalPrice()

    }

    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
<<<<<<< HEAD
                <Modal.Title>Sửa lô hàng nhập</Modal.Title>
=======
                <Modal.Title>Sửa đơn hàng nhập</Modal.Title>
>>>>>>> 1556425138f8676ee477c77d1153d8f69a0fe1f8
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row style={{ display: 'flex', alignItems: 'center' }} >
                        <Col md={2}>

                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" placeholder="Mã đơn hàng" value={importCode} disabled />

                        </Col>
                        <Col md={2}>
                            <DropdownButton className="ButtonCSSDropdown" title={selectedStorage} variant="success" disabled>
                            </DropdownButton>
                        </Col>

                        <Col md={3}>
                            <DropdownButton className="ButtonCSSDropdown" title={selectedSupplier} variant="success" disabled>
                            </DropdownButton>
                        </Col>



                        <Col md={2}>
                            <div>
                                <input type="date" className="datepickerCSS" id="datepicker" value={selectedDate} disabled />
                            </div>
                        </Col>



                        <Col >
                            <DropdownButton className="ButtonCSSDropdown" title={selectedDelivery} variant="success" disabled>
                            </DropdownButton>
                        </Col>






                    </Row>

                    <Row style={{ marginTop: '20px' }}>
                        <Col md={7}></Col>

                    </Row>



                    <hr />
                    <Row style={{ maxHeight: '400px', overflowY: 'auto' }}>
                        {renderImportData()}

                    </Row>


                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleUpdateImportOrder}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal >

    </>)
}

export default ModalEditImportOrder