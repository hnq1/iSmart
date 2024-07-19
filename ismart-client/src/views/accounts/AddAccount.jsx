import { useState, useEffect } from "react";
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown, DropdownItem } from "react-bootstrap"
import { toast } from 'react-toastify';
import { validateEmail, validatePhone, validateText, validateTextRequired, isStrongPassword } from "~/validate";
import { fetchAllStorages } from "~/services/StorageServices";
import uploadImage from "~/services/ImageServices";
import { addUser } from "~/services/UserServices";

const ModalAddAccount = ({ isShow, handleClose, updateTable }) => {
    const [selectedOptionRole, setSelectedOption] = useState('4'); // Giá trị mặc định cho tùy chọn được chọn

    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    const [userCode, setUserCode] = useState("");
    const [userName, setUserName] = useState();
    const [password, setPassword] = useState();
    const [email, setEmail] = useState();
    const [phone, setPhone] = useState();
    const [address, setAddress] = useState();
    const [image, setImage] = useState();
    const [fullName, setFullName] = useState();

    useEffect(() => {
        getAllStorages();
    }, [])


    const handleSelectChange = (event) => {
        setSelectedOption(event.target.value); // Cập nhật giá trị tùy chọn được chọn
    };

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }
    const handleStorageTotalClick = () => {
        setSelectedWarehouse("Tất cả Kho");
        setSelectedWarehouseId("");
    }
    const handleStorageClick = (warehouse) => {
        // let res = await setSelectedStorage(storage.storageName);

        setSelectedWarehouse(warehouse.warehouseName);
        // console.log("warehouse.warehouseId: ", warehouse.warehouseId);
        setSelectedWarehouseId(warehouse.warehouseId);
        // console.log("setSelectedWarehouse: ", warehouse.warehouseName);
        // getUsers(1);
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
    const handleChangePhone = (event) => {
        setPhone(event.target.value);
    }
    const handleChangeAddress = (event) => {
        setAddress(event.target.value);
    }
    const handleChangeImage = async (event) => {
        const file = event.target.files[0];
        // console.log("file: ", file);
        let res = await uploadImage(file);
        const urlImage = res.url;
        setImage(urlImage);
    }
    const handleChangeFullName = (event) => {
        setFullName(event.target.value);
    }



    const handleReset = () => {
        setSelectedWarehouse(null);
        setSelectedWarehouseId(null);

        setUserCode(null);
        setUserName(null);

        setPassword(null);
        setEmail(null);


    }
    // Điều kiện login
    const handleSave = async () => {
        if (!email.trim() || !validateEmail.test(email.trim())) {
            toast.warning("Email không hợp lệ");
        } else if (!userName.trim()) {
            toast.warning("Tên đăng nhập không được để trống");
        } else if (!selectedWarehouseId) {
            toast.warning("Vui lòng chọn kho");
        } else if (!phone.trim() || !validatePhone.test(phone.trim())) {
            toast.warning("Số điện thoại không hợp lệ");
        } else if (!address.trim()) {
            toast.warning("Địa chỉ không được để trống");
        } else if (!fullName.trim()) {
            toast.warning("Họ và tên không được để trống");
        } else if (!userCode) {
            toast.warning("Mã nhân viên không được để trống");
        } else {
            let res = await addUser(selectedWarehouseId,
                email.trim(), password,
                phone.trim(), selectedOptionRole,
                1,
                userName.trim(),
                userCode,
                address.trim(),
                image,
                fullName.trim());
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
                    <Row >
                        <Col md={5}>
                            <DropdownButton
                                className="DropdownButtonCSS ButtonCSSDropdown"
                                title={selectedWarehouse !== null ? selectedWarehouse : "Tất cả Kho"}
                                variant="success"
                                style={{ zIndex: 999 }}
                            >
                                <DropdownItem eventKey="1" onClick={handleStorageTotalClick}>Tất cả Kho</DropdownItem>
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
                    </Row>
                    <Row>
                        <Col md={6}>
                            <label >Mã nhân viên</label>
                            {/* <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={userCode} onChange={handleChangeUserCode} /> */}
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleChangeUserCode}>
                                <option value="">Mã nhân viên</option>
                                <option value="WarehouseManager">WarehouseManager</option>
                                <option value="WarehouseStaff">WarehouseStaff</option>
                                <option value="Accountant">Accountant</option>
                            </Form.Select>
                        </Col>
                        <Col md={6}>
                            <label >Chức Vụ</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleSelectChange}>
                                <option value="">Chức vụ</option>
                                <option value="2">WarehouseManager</option>
                                <option value="3">WarehouseStaff</option>
                                <option value="4">Accountant</option>
                            </Form.Select>
                        </Col>
                    </Row>
                    <Row>
                        <Col md={6}>
                            <label >Họ và tên</label>
                            <input type="text" className="form-control inputCSS" value={fullName} onChange={handleChangeFullName} />
                        </Col>
                        <Col md={6}>
                            <label >Số điện thoại</label>
                            <input type="number" className="form-control inputCSS" value={phone} onChange={handleChangePhone} />
                        </Col>
                    </Row>

                    <Row>
                        <Col md={6}>
                            <label >Tên Đăng Nhập</label>
                            <input type="text" className="form-control inputCSS" value={userName} onChange={handleChangeUserName} />
                        </Col>
                        {/* <Col md={5}>
                            <label >Mật khẩu</label>
                            <input type="password" className="form-control inputCSS" value={password} onChange={handleChangePassword} />
                        </Col> */}
                        <Col md={6}>
                            <label >Email</label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={email} onChange={handleChangeEmail} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={12}>
                            <label >Địa chỉ</label>
                            <input type="text" className="form-control inputCSS" value={address} onChange={handleChangeAddress} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <label >Hình ảnh </label>

                        <Col md={2}>
                            <div>
                                <input
                                    type="file"
                                    accept="image/*" // Chỉ chấp nhận các loại file ảnh
                                    onChange={handleChangeImage} // Hàm xử lý sự kiện khi người dùng chọn file
                                />
                            </div>
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