import React, { useState, useEffect } from 'react';
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from 'react-bootstrap';
import { updateUser } from "~/services/UserServices";
import { validatePhone, validateTextRequired, removeWhiteSpace } from "~/validate";
import { toast } from 'react-toastify';

const ModalEditAccount = ({ isShow, handleClose, dataUpdateUser, updateTableUser }) => {
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

    useEffect(() => {
        console.log('ModalEditAccount - isShow:', isShow);
        console.log('ModalEditAccount - dataUpdateUser:', dataUpdateUser);
        if (isShow && dataUpdateUser) {
            console.log("Modal is showing. Data Update User: ", dataUpdateUser);

            setEmail(dataUpdateUser.email ? dataUpdateUser.email : "");
            setPhone(dataUpdateUser.phone ? dataUpdateUser.phone : "");
            setUserName(dataUpdateUser.userName ? dataUpdateUser.userName : "");
            setRoleId(dataUpdateUser.roleId ? dataUpdateUser.roleId : "");
            setStatusId(dataUpdateUser.statusId ? dataUpdateUser.statusId : "");
            setStorageId(dataUpdateUser.storageId ? dataUpdateUser.storageId : "");
            setUserCode(dataUpdateUser.userCode ? dataUpdateUser.userCode : "");
            setAddress(dataUpdateUser.address ? dataUpdateUser.address : "");
            setImage(dataUpdateUser.image ? dataUpdateUser.image : "");
            setFullName(dataUpdateUser.fullName ? dataUpdateUser.fullName : "");

            console.log("Email: ", dataUpdateUser.email);
            console.log("Phone: ", dataUpdateUser.phone);
            console.log("UserName: ", dataUpdateUser.userName);
            console.log("RoleId: ", dataUpdateUser.roleId);
            console.log("StatusId: ", dataUpdateUser.statusId);
            console.log("StorageId: ", dataUpdateUser.storageId);
            console.log("UserCode: ", dataUpdateUser.userCode);
            console.log("Address: ", dataUpdateUser.address);
            console.log("Image: ", dataUpdateUser.image);
            console.log("FullName: ", dataUpdateUser.fullName);
            console.log("RoleName: ", dataUpdateUser.roleName);
        }
        else {
            console.log("Modal is not showing or dataUpdateUser is not available.");
        }
    }, [isShow, dataUpdateUser]);

    const handleSave = async () => {
        if (!validateTextRequired.test(email)) {
            toast.error('Email không được để trống');
            return;
        }
        if (!validatePhone.test(phone)) {
            toast.error('Số điện thoại không hợp lệ');
            return;
        }
        const data = {
            email: removeWhiteSpace(email),
            phone: removeWhiteSpace(phone),
            userName: removeWhiteSpace(userName),
            roleId: roleId,
            statusId: statusId,
            storageId: storageId,
            userCode: removeWhiteSpace(userCode),
            address: removeWhiteSpace(address),
            image: image,
            fullName: removeWhiteSpace(fullName)
        };
        const result = await updateUser(data);
        if (result.status === 200) {
            toast.success('Cập nhật tài khoản thành công');
            updateTableUser();
            handleClose();
        } else {
            toast.error('Cập nhật tài khoản thất bại');
        }
    };

    return (
        <Modal show={isShow} onHide={handleClose}>
            <Modal.Header closeButton>
                <Modal.Title>Chỉnh sửa tài khoản</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form.Group>
                    <Form.Label>Mã nhân viên</Form.Label>
                    <Form.Control type="text" value={roleName} onChange={(e) => setRoleName(e.target.value)} />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Họ và tên</Form.Label>
                    <Form.Control type="text" value={fullName} onChange={(e) => setFullName(e.target.value)} />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Phone</Form.Label>
                    <Form.Control type="tel" value={phone} onChange={(e) => setPhone(e.target.value)} />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Địa chỉ</Form.Label>
                    <Form.Control type="text" value={address} onChange={(e) => setAddress(e.target.value)} />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Ảnh</Form.Label>
                    <Form.Control type="file" onChange={(e) => setImage(e.target.files[0])} />
                </Form.Group>
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