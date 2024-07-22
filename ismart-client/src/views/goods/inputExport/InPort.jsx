import { set } from 'lodash';
import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import { uploadExcel } from '~/services/ExcelService';

<<<<<<< HEAD
function InportGoodsListModal({ isShow, handleClose }) {
=======
function InportGoodsListModal({ isShow, handleClose, updateTable }) {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);
>>>>>>> origin/thanhdthe150750
    const [file, setFile] = useState(null);
    const [overwriteProductInfo, setOverwriteProductInfo] = useState(false);
    const [overwriteQuantity, setOverwriteQuantity] = useState(false);

<<<<<<< HEAD
    const handleFileChange = async (event) => {
        const file = event.target.files[0];
        console.log("file: ", file);
        let res = uploadExcel(file);
        const urlExcel = res.url;
        setFile(urlExcel);
        console.log("urlExcel: ", urlExcel);
=======
    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    useEffect(() => {
        getAllStorages();
    }, []);

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

    const handleFileChange = (event) => {
        setFile(event.target.files[0]);
>>>>>>> origin/thanhdthe150750
    };

    const handleOverwriteProductInfoChange = (event) => {
        setOverwriteProductInfo(event.target.checked);
    };

    const handleOverwriteQuantityChange = (event) => {
        setOverwriteQuantity(event.target.checked);
    };

<<<<<<< HEAD
    const handleSave = () => {
=======
    const handleSave = async (event) => {
        event.preventDefault();
        if (!selectedWarehouseId) {
            toast.warning("Chưa chọn kho!");
            return;
        }
>>>>>>> origin/thanhdthe150750
        if (!file) {
            alert("Vui lòng chọn tệp tin");
            return;
        }
<<<<<<< HEAD
        // Handle file upload and options here
        console.log("File:", file);
        console.log("Overwrite Product Info:", overwriteProductInfo);
        console.log("Overwrite Quantity:", overwriteQuantity);
=======
        let res;
        if (roleId === 1) {
            res = await uploadExcel(file, selectedWarehouseId, overwriteProductInfo, overwriteQuantity);
        } else {
            res = await uploadExcel(file, userId, overwriteProductInfo, overwriteQuantity);
        }

        res.results.forEach(result => {
            if (result.includes("Lỗi")) {
                toast.error(result);
            } else {
                toast.success(result);
            }
        });

        updateTable();
>>>>>>> origin/thanhdthe150750
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
<<<<<<< HEAD
                        <Form.Label>Tải file mẫu nhập danh sách sản phẩm <a href="#">tại đây</a></Form.Label>
                        <Form.Control type="file" onChange={handleFileChange} />
                    </Form.Group>

                    <Form.Group controlId="formOverwriteProductInfo">
                        <a>Ghi đè thông tin các sản phẩm đã có</a>

=======
                        <Form.Label>Tải file mẫu nhập danh sách sản phẩm <a href="https://localhost:7033/api/excel/download-template">tại đây</a></Form.Label>
                        {
                            roleId === 1 &&
                            <Col md={2}>
                                <label>Kho</label>
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
                                            onClick={() => handleStorageClick(c)}
                                        >
                                            {c.warehouseName}
                                        </Dropdown.Item>
                                    ))}
                                </DropdownButton>
                            </Col>
                        }
                        <br />
                        <Form.Control type="file" accept=".xlsx,.xls" onChange={handleFileChange} />
                    </Form.Group>

                    <Form.Group controlId="formOverwriteProductInfo">
                        <Form.Check
                            type="checkbox"
                            label="Không ghi đè thông tin các sản phẩm đã có"
                            checked={overwriteProductInfo}
                            onChange={handleOverwriteProductInfoChange}
                        />
>>>>>>> origin/thanhdthe150750
                    </Form.Group>
                    <Form.Group controlId="formOverwriteQuantity">
                        <Form.Check
                            type="checkbox"
                            label="Không ghi đè số lượng sản phẩm vào các kho hàng đã có"
                            checked={overwriteQuantity}
                            onChange={handleOverwriteQuantityChange}
                        />
                    </Form.Group>
<<<<<<< HEAD
                    <Form>
                        <div style={{ fontSize: '12px', color: '#888' }}>
                            <p>- Việc ghi đè sẽ xóa hết các thông tin cũ của sản phẩm bị ghi đè để lưu thông tin mới.</p>
                            <p>- Tính năng này không dùng để cập nhật hàng loạt sản phẩm.</p>
                        </div>
                    </Form>

=======
                    <Form.Text className="text-muted">
                        {/* <p>- Việc ghi đè sẽ xóa hết các thông tin cũ của sản phẩm bị ghi đè để lưu thông tin mới.</p> */}
                        <p>- Tính năng này không dùng để cập nhật hàng loạt sản phẩm.</p>
                    </Form.Text>
>>>>>>> origin/thanhdthe150750
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
