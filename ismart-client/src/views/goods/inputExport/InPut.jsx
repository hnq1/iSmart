import { set } from 'lodash';
import React, { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import { uploadExcel } from '~/services/ExcelService';

function InportGoodsListModal({ isShow, handleClose }) {
    const [file, setFile] = useState(null);
    const [overwriteProductInfo, setOverwriteProductInfo] = useState(false);
    const [overwriteQuantity, setOverwriteQuantity] = useState(false);

    const handleFileChange = async (event) => {
        const file = event.target.files[0];
        console.log("file: ", file);
        let res = uploadExcel(file);
        const urlExcel = res.url;
        setFile(urlExcel);
        console.log("urlExcel: ", urlExcel);
    };

    const handleOverwriteProductInfoChange = (event) => {
        setOverwriteProductInfo(event.target.checked);
    };

    const handleOverwriteQuantityChange = (event) => {
        setOverwriteQuantity(event.target.checked);
    };

    const handleSave = () => {
        if (!file) {
            alert("Vui lòng chọn tệp tin");
            return;
        }
        // Handle file upload and options here
        console.log("File:", file);
        console.log("Overwrite Product Info:", overwriteProductInfo);
        console.log("Overwrite Quantity:", overwriteQuantity);
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
                        <Form.Label>Tải file mẫu nhập danh sách sản phẩm <a href="#">tại đây</a></Form.Label>
                        <Form.Control type="file" onChange={handleFileChange} />
                    </Form.Group>
                    <Form.Group controlId="formOverwriteProductInfo">
                        <Form.Check
                            type="checkbox"
                            label="Ghi đè thông tin các sản phẩm đã có"
                            checked={overwriteProductInfo}
                            onChange={handleOverwriteProductInfoChange}
                        />
                    </Form.Group>
                    <Form.Group controlId="formOverwriteQuantity">
                        <Form.Check
                            type="checkbox"
                            label="Ghi đè số lượng sản phẩm vào các kho hàng đã có"
                            checked={overwriteQuantity}
                            onChange={handleOverwriteQuantityChange}
                        />
                    </Form.Group>
                    <div style={{ fontSize: '12px', color: '#888' }}>
                        <p>- Việc ghi đè sẽ xóa hết các thông tin cũ của sản phẩm bị ghi đè để lưu thông tin mới.</p>
                        <p>- Tính năng này không dùng để cập nhật hàng loạt sản phẩm.</p>
                    </div>
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
