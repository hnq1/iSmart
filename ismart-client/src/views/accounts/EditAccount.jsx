import React, { useState, useEffect } from 'react';
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from 'react-bootstrap';
import { updateUser, fetchAllRole } from "~/services/UserServices";
import { toast } from 'react-toastify';
import uploadImage from '~/services/ImageServices';
import { set } from 'lodash';

const ModalEditAccount = ({ isShow, handleClose, dataUpdateUser, updateTableUser }) => {
    // Define state for roles and selected role
    const [totalRoles, setTotalRoles] = useState([]);
    const [selectedRole, setSelectedRole] = useState(null);
    const [selectedRoleId, setSelectedRoleId] = useState(null);

    // Define state for account details
    const [userCode, setUserCode] = useState();
    const [userName, setUserName] = useState();
    const { phone, setPhone } = useState();
    const [address, setAddress] = useState();
    const [image, setImage] = useState();
    const [email, setEmail] = useState(null);

    // Fetch roles when component mounts
    useEffect(() => {
        getAllByRole();
    }, [])

    // Update state when dataAccountEdit changes
    useEffect(() => {
        if (dataUpdateUser) {
            console.log(dataUpdateUser);

            setSelectedRole(dataUpdateUser.roleId);
            setSelectedRoleId(dataUpdateUser.roleId);

            setUserCode(dataUpdateUser.userCode);
            setUserName(dataUpdateUser.userName);
            setPhone(dataUpdateUser.phone);
            setEmail(dataUpdateUser.email);
            setAddress(dataUpdateUser.address);
            setImage(dataUpdateUser.image);
            ;
        }
    }, [dataUpdateUser]);

    // Fetch all roles
    const getAllByRole = async () => {
        let res = await fetchAllRole();
        setTotalRoles(res);
    }

    // Handle role change
    const handRoleClick = (role, event) => {
        setSelectedRoleId(role.roleId);
        setSelectedRole(role.roleName);
    }
    const handleChooseFile = async (event) => {
        const file = event.target.files[0];
        let res = await uploadImage(file);
        setImage(res);
        console.log(res);
    }
    // const handleUserCode = (event) => {
    //     setUserCode(event.target.value);
    // }
    const handleUserName = (event) => {
        setUserName(event.target.value);
    }

    const handleEmail = (event) => {
        setEmail(event.target.value);
    }

    const handlePhone = (event) => {
        setPhone(event.target.value);
    }
    const handleAddress = (event) => {
        setAddress(event.target.value);
    }

    const handleCloseModal = () => {
        handleClose();
    }
    const handleSave = async () => {
        let res = await updateUser(dataUpdateUser.userId,
            email,
            //  password,
            phone,
            selectedRoleId,
            // roleId,
            // statusId,
            userName,
            // storageId,
            userCode,
            address,
            image,
            // fullName
        );
        console.log(res);
        updateTableUser();
        toast.success("Cập nhật tài khoản thành công");
        handleCloseModal();


    };
    return (

        <>
            <Modal show={isShow} >
                <Modal.Header closeButton>
                    <Modal.Title>Chỉnh sửa tài khoản
                        {dataUpdateUser.userName}
                    </Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className='body-add-new'>
                        <Row>
                            <label>
                                Mã Nhân Viên
                            </label>

                            <col md={5}>
                                <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedRole !== null ? selectedRole : "Tất cả Role"} variant="success" style={{ zIndex: 999 }}>
                                    {totalRoles && totalRoles.length > 0 && totalRoles.map((role, index) => (
                                        <Dropdown.Item key={`role ${index}`} eventKey={role.roleName} onClick={(e) => handRoleClick(role, e)}>{role.roleName}</Dropdown.Item>
                                    ))}
                                </DropdownButton>
                            </col>
                        </Row>
                        <Row>
                            <label>
                                Tên Đăng Nhập & userName
                            </label>
                            <input type="text" className="form-control inputCSS" value={userName} onChange={handleUserName} />
                        </Row>
                        <Row>
                            <label>
                                Email
                            </label>
                            <input type="text" className="form-control inputCSS" value={email} onChange={handleEmail} />
                        </Row>

                        <Row>
                            <label>
                                Số Điện Thoại
                            </label>
                            <input type="text" className="form-control inputCSS" value={phone} onChange={handlePhone} />
                        </Row>
                        <Row>
                            <label>
                                Địa Chỉ
                            </label>
                            <input type="text" className="form-control inputCSS" value={address} onChange={handleAddress} />
                        </Row>
                        <Row>
                            <label>
                                Ảnh
                            </label>
                            <input type="file" className="form-control inputCSS" onChange={handleChooseFile} />
                        </Row>
                    </div>
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