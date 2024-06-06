import React, { useState, useEffect } from 'react';
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from 'react-bootstrap';
import { updateUser, fetchAllRole } from "~/services/UserServices";
import { toast } from 'react-toastify';
import uploadImage from '~/services/ImageServices';
import { set } from 'lodash';

const ModalEditAccount = ({ isShow, handleClose, updateTable, dataUserEdit, }) => {
    const [selectedOptionRole, setSelectedOption] = useState('3');

    // Define state for account details
    const [userCode, setUserCode] = useState("");
    const [userName, setUserName] = useState("");
    const [fullName, setFullName] = useState("");
    const [phone, setPhone] = useState();
    const [email, setEmail] = useState();
    const [address, setAddress] = useState();
    const [image, setImage] = useState();


    useEffect(() => {
        if (isShow) {

            setUserName(dataUserEdit.userName);
            setUserCode(dataUserEdit.userCode);
            setFullName(dataUserEdit.fullName);
            setPhone(dataUserEdit.phone);
            setEmail(dataUserEdit.email);
            setAddress(dataUserEdit.address);

        }
    }, [dataUserEdit])


    const handleUserName = (event) => {
        setUserName(event.target.value);
    }
    const handleUserCode = (event) => {
        setUserCode(event.target.value);
    }
    const handleFullName = (event) => {
        setFullName(event.target.value);
    }
    const handlePhone = (event) => {
        setPhone(event.target.value);
    }
    const handleEmail = (event) => {
        setEmail(event.target.value);
    }

    const handleAddress = (event) => {
        setAddress(event.target.value);
    }

    const handleChooseFile = async (event) => {
        const file = event.target.files[0];
        console.log("file: ", file);
        let res = await uploadImage(file);
        setImage(res);
        console.log("upload image: ", res);
    }


    const handleSave = async () => {
        let res = await updateUser(dataUserEdit.userId,
            email, null, phone,
            dataUserEdit.roleId,
            1, userName,
            1, userCode,
            address, image, fullName);
        console.log("check res: ", res)
        if (res) { // Check if the update was successful
            toast.success("Cập nhật thông tin người dùng thành công");
            updateTable(); // Update the user list
            handleCloseModal(); // Close the modal
        } else {
            toast.error("Có lỗi xảy ra khi cập nhật thông tin người dùng");
        }
    }
    const handleCloseModal = () => {
        handleClose();
    }



    return (

        <>
            <Modal show={isShow} onHide={handleCloseModal} >
                <Modal.Header closeButton>
                    <Modal.Title>Chỉnh sửa tài khoản
                        {dataUserEdit.fullName}
                    </Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Row>
                        <Col md={7}>
                            <label >UseCode</label>
                            <input type="text" className="form-control inputCSS" value={userCode} onChange={handleUserCode} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={7}>
                            <label >FullName</label>
                            <input type="text" className="form-control inputCSS" value={fullName} onChange={handleFullName} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={7}>
                            <label >Tên Đăng Nhập</label>
                            <input type="text" className="form-control inputCSS" value={userName} onChange={handleUserName} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={7}>
                            <label >Số điện thoại</label>
                            <input type="number" className="form-control inputCSS" value={phone} onChange={handlePhone} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={7}>
                            <label >Email</label>
                            <input type="text" className="form-control inputCSS" value={email} onChange={handleEmail} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={7}>
                            <label >Adress</label>
                            <input type="text" className="form-control inputCSS" value={address} onChange={handleAddress} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <label >Hình ảnh </label>

                        <Col md={2}>
                            <div>
                                <input
                                    type="file"
                                    accept="image/" // Chỉ chấp nhận các loại file ảnh
                                    onChange={handleChooseFile} // Hàm xử lý sự kiện khi người dùng chọn file
                                />
                            </div>
                        </Col>
                    </Row>


                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleCloseModal}>
                        Đóng
                    </Button>
                    <Button variant="primary" onClick={handleSave}>
                        Cập nhật tài khoản
                    </Button>
                </Modal.Footer>

            </Modal>
        </>
    );
}

export default ModalEditAccount;