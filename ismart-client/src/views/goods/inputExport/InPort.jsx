import { set } from 'lodash';
import React, { useEffect, useState } from 'react';
import { fetchAllStorages } from '~/services/StorageServices';
import { Modal, Button, Form, Col, DropdownButton, Dropdown } from 'react-bootstrap';
import { uploadExcel } from '~/services/ExcelService';
import { toast } from 'react-toastify';


function InportGoodsListModal({ isShow, handleClose, updateTable }) {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);
    const [file, setFile] = useState(null);
    const [overwriteProductInfo, setOverwriteProductInfo] = useState(false);
    const [overwriteQuantity, setOverwriteQuantity] = useState(false);


    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);


    useEffect(() => {
        getAllStorages();
    }, [])


    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }


    const handleStorageTotalClick = () => {
        setSelectedWarehouse("Tất cả Kho");
        setSelectedWarehouseId("");
    }


    const handleStorageClick = (warehouse) => {
        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
    }


    const handleFileChange = async (event) => {
        setFile(event.target.files[0]);
        console.log(file);
        console.log(selectedWarehouseId);
        console.log(roleId);
        console.log(userId);




    };


    const handleOverwriteProductInfoChange = (event) => {
        setOverwriteProductInfo(event.target.checked);
    };


    const handleOverwriteQuantityChange = (event) => {
        setOverwriteQuantity(event.target.checked);
    };


    const handleSave = async (event) => {
        event.preventDefault();
        if (!selectedWarehouseId) {
            toast.warning("Chưa chọn kho!");
            return;
        }
        if (!file) {
            toast.warning("Chưa có file nào được chọn!");
            return;
        }
        let res;
        if (roleId === 1) {
            res = await uploadExcel(file, selectedWarehouseId);


            if (Array.isArray(res.results)) {
                res.results.forEach(result => {
                    // Hiển thị thông báo lỗi nếu có từ "Lỗi" trong thông báo
                    if (result.includes("Lỗi")) {
                        toast.error(result);
                    } else {
                        // Hiển thị thông báo thành công nếu không có từ "Lỗi"
                        toast.success(result);
                    }
                });
            } else {
                // Nếu res.results không phải là mảng, hiển thị thông báo lỗi
                console.error('Unexpected format for res.results:', res.results);
                toast.error("Đã xảy ra lỗi không xác định.");
            }




        }
        else {
            res = await uploadExcel(file, userId);


            if (Array.isArray(res.results)) {
                res.results.forEach(result => {
                    // Hiển thị thông báo lỗi nếu có từ "Lỗi" trong thông báo
                    if (result.includes("Lỗi")) {
                        toast.error(result);
                    } else {
                        // Hiển thị thông báo thành công nếu không có từ "Lỗi"
                        toast.success(result);
                    }
                });
            } else {
                // Nếu res.results không phải là mảng, hiển thị thông báo lỗi
                console.error('Unexpected format for res.results:', res.results);
                toast.error("Đã xảy ra lỗi không xác định.");
            }




        }
        updateTable();
        handleClose();
    };


    return (
        <Modal show={isShow} onHide={handleClose} size="md">
            <Modal.Header closeButton>
                <Modal.Title>Nhập danh sách sản phẩm</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group>
                        <Form.Label>Tải file mẫu nhập danh sách sản phẩm <a href="https://localhost:7033/api/excel/download-template">tại đây</a></Form.Label>
                        {
                            roleId === 1 ?
                                <Col md={2}>
                                    <label >Kho</label>
                                    <DropdownButton
                                        className="DropdownButtonCSS ButtonCSSDropdown"
                                        title={selectedWarehouse !== null ? selectedWarehouse : "Tất cả Kho"}
                                        variant="success"
                                        style={{ zIndex: 999 }}
                                    >
                                        <Dropdown.Item eventKey="Tất cả Kho" onClick={handleStorageTotalClick}>Tất cả Kho</Dropdown.Item>


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
                        <br />
                        <Form.Control type="file" onChange={handleFileChange} />
                    </Form.Group>


                    <Form.Group controlId="formOverwriteProductInfo">
                        <a>Ghi đè thông tin các sản phẩm đã có</a>


                    </Form.Group>
                    <Form.Group controlId="formOverwriteQuantity">
                        <a>Ghi đè số lượng sản phẩm vào các kho hàng đã có</a>
                    </Form.Group>
                    <Form>
                        <div style={{ fontSize: '12px', color: '#888' }}>
                            <p>- Việc ghi đè sẽ xóa hết các thông tin cũ của sản phẩm bị ghi đè để lưu thông tin mới.</p>
                            <p>- Tính năng này không dùng để cập nhật hàng loạt sản phẩm.</p>
                        </div>
                    </Form>


                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave}>
                    Nhập danh sách
                </Button>
            </Modal.Footer>
        </Modal>
    );
}


export default InportGoodsListModal;





