import React, { useState, useEffect } from 'react';
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from 'react-bootstrap';
import { updateUser } from "~/services/UserServices";
import { validatePhone, validateTextRequired, removeWhiteSpace } from "~/validate";
import { toast } from 'react-toastify';

const ModalEditAccount = ({ isShow, handleClose, dataUpdateUser, updateTableUser }) => {

    const [selectedOptionRole, setSelectedOption] = useState('3'); // Giá trị mặc định cho tùy chọn được chọn


    const [email, setEmail] = useState("");
    const [phone, setPhone] = useState("");
    const [userName, setUserName] = useState("");
    const [roleId, setRoleId] = useState("");
    const [statusId, setStatusId] = useState("");
    const [storageId, setStorageId] = useState("");
    const [userCode, setUserCode] = useState("");
    const [address, setAddress] = useState("");
    const [image, setImage] = useState("");
    const [fullName, setFullName] = useState("");
    const [roleName, setRoleName] = useState("");




    
    const handleCloseModal = () => {
        handleClose();
    }
    return (
        <Modal show={isShow} onHide={handleCloseModal}>
            <Modal.Header closeButton>
                <Modal.Title>Chỉnh sửa tài khoản</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row>
                        <Col md={5}>
                            <label >Mã nhân viên</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleChangeUserCode} >
                                <option value="3">Administrator	</option>
                                <option value="2">ProjectManager</option>
                                <option value="4">Storekeeper </option>
                            </Form.Select>
                        </Col>

                    </Row>
                    {/* <Row>
                        <Col md={5}>
                            <label >Vai trò</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleSelectChange}>
                                <option value="3">Thủ kho</option>
                                <option value="2">Quản trị dự án</option>
                                <option value="4">Kế toán</option>
                            </Form.Select>
                        </Col>
                    </Row> */}
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    Đóng
                </Button>
                <Button variant="primary" onClick={handleSave}>
                    Cập nhật tài khoản
                </Button>
            </Modal.Footer>
        </Modal>
    );
};

export default ModalEditAccount;