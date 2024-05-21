import { useState, useEffect } from "react";
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from "react-bootstrap"
import { toast } from 'react-toastify';
import { validateEmail, validatePhone, validateText, validateTextRequired, isStrongPassword } from "~/validate";
import { fetchAllStorages } from "~/services/StorageServices";
import { addUser } from "~/services/UserServices";

const ModalAddAccount = ({ isShow, handleClose, updateTable }) => {
    const [selectedOptionRole, setSelectedOption] = useState('3'); // Giá trị mặc định cho tùy chọn được chọn

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [userCode, setUserCode] = useState();
    const [userName, setUserName] = useState();
    const [password, setPassword] = useState();
    const [email, setEmail] = useState(null);

    useEffect(() => {
        getAllStorages();
    }, [])


    const handleSelectChange = (event) => {
        setSelectedOption(event.target.value); // Cập nhật giá trị tùy chọn được chọn
    };

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
    }

    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }

    const handleChangeUserCode = (event) => {
        setUserCode(event.target.value);
    }

    const handleChangeUserName = (event) => {
        setUserName(event.target.value);
    }

    const handleChangePassword = (event) => {
        setPassword(event.target.value);
    }

    const handleChangeEmail = (event) => {
        setEmail(event.target.value);
    }

    const handleReset = () => {
        setSelectedStorage(null);
        setSelectedStorageId(null);

        setUserCode(null);
        setUserName(null);

        setPassword(null);
        setEmail(null);


    }

    const handleSave = async () => {
        if (!email && !validateEmail.test(email)) {
            toast.warning("Email không hợp lệ");
        } else if (!isStrongPassword.test(password)) {
            toast.warning("Mật khẩu phải có ít nhất 6 chữ số và 1 chữ cái");
        } else if (!userName) {
            toast.warning("Tên đăng nhập không được để trống");
        } else if (!selectedStorageId) {
            toast.warning("Vui lòng chọn kho");
        } else {
            let res = await addUser(email, password, '', selectedOptionRole, 1, userName, selectedStorageId, userCode, "", "", "");
            if (res.isSuccess) {
                toast.success("Thêm mới tài khoản thành công");
                updateTable();
                handleClose();
            } else {
                toast.warning("Người dùng đã tồn tại");

            }
        }

    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal}>
            <Modal.Header closeButton>
                <Modal.Title>Thêm tài khoản</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row>
                        <Col md={5}>
                            <label >Mã nhân viên</label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={userCode} onChange={handleChangeUserCode} />
                        </Col>

                    </Row>
                    <Row>
                        <Col md={5}>
                            <label >Vai trò</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleSelectChange}>
                                <option value="3">Thủ kho</option>
                                <option value="2">Quản trị dự án</option>
                                <option value="4">Kế toán</option>
                            </Form.Select>
                        </Col>

                        <Col md={5}>
                            <label >Kho làm việc</label>
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                    <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>
                    </Row>
                    <Row>
                        <Col md={5}>
                            <label >Tên Đăng Nhập</label>
                            <input type="text" className="form-control inputCSS" value={userName} onChange={handleChangeUserName} />
                        </Col>
                        <Col md={5}>
                            <label >Mật khẩu</label>
                            <input type="password" className="form-control inputCSS" value={password} onChange={handleChangePassword} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={5}>
                            <label >Email</label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={email} onChange={handleChangeEmail} />
                        </Col>
                    </Row>

                </div>
            </Modal.Body>
            <Modal.Footer>

                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave}>
                    Thêm tài khoản mới
                </Button>
            </Modal.Footer>
        </Modal>
    </>)
}

export default ModalAddAccount