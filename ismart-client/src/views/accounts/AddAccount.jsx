import { useState, useEffect } from "react";
import { Modal, Button, Row, Col, Form, DropdownButton, Dropdown, DropdownItem } from "react-bootstrap"
import { toast } from 'react-toastify';
import { validateEmail, validatePhone, validateText, validateTextRequired, isStrongPassword, removeWhiteSpace } from "~/validate";
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
        setFullName(null);
        setUserCode(null);
        setUserName(null);
        setPhone(null);
        setPassword(null);
        setEmail(null);


    }
    // Điều kiện login
    const handleSave = async () => {
<<<<<<< HEAD
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
=======
        // if (!email && !validateEmail.test(email)) {
        //     toast.warning("Email không hợp lệ");
        // }
        // //  if (!isStrongPassword.test(password)) {
        // //     toast.warning("Mật khẩu phải có ít nhất 6 chữ số và 1 chữ cái");
        // // } 
        // else if (!userName) {
        //     toast.warning("Tên đăng nhập không được để trống");
        // }
        // else if (!selectedWarehouseId) {
        //     toast.warning("Vui lòng chọn kho");
        // }
        if (!image) {
            toast.warning("Vui lòng chọn hình ảnh");
        }
        else if (!selectedWarehouseId) {
            toast.error("vui lòng chọn kho");
        }
        else if (!validateTextRequired.test(userName)) {
            toast.error("Tên đăng nhập không được để trống hoặc chứa ký tự đặc biệt");
        }
        else if (!selectedOptionRole) {
            toast.error('vui lòng chọn role cho người dùng.');
        }
        else if (userName.trim() === '') {
            toast.error('Không được để khoảng trắng.');
        }
        else if (address.trim() === '') {
            toast.error('Không được để khoảng trắng.');
        } else if (fullName.trim() === '') {
            toast.error('Không được để khoảng trắng.');
        }
        else if (!validatePhone.test(phone)) {
            toast.error("Sai định dạng số điện thoại");
        } else if (!validateEmail.test(email)) {
            toast.error("Sai định dạng email");
        }
        else {
>>>>>>> origin/tungvthe150237
            let res = await addUser(selectedWarehouseId,
                email.trim(), password,
                phone.trim(), selectedOptionRole,
                1,
<<<<<<< HEAD
                userName.trim(),
                userCode,
                address.trim(),
                image,
                fullName.trim());
=======
                removeWhiteSpace(userName),
                userCode,
                removeWhiteSpace(address),
                image,
                removeWhiteSpace(fullName));
            // console.log("res: ", image);
>>>>>>> origin/tungvthe150237
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
<<<<<<< HEAD
                <Row >
                        <Col md={5}>
=======
                    <Row>
                        <Col md={6}>
                            <label>Mã nhân viên</label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={userCode} onChange={handleChangeUserCode} />
                        </Col>
                        <Col md={6}>
                            <label>Họ và tên</label>
                            <input type="text" className="form-control inputCSS" value={fullName} onChange={handleChangeFullName} />
                        </Col>
                    </Row>
                    <Row>
                        <Col md={6}>
                            <label>Vai trò</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleSelectChange}>
                                <option value="">Vai trò</option>
                                <option value="2">WarehouseManager</option>
                                <option value="3">WarehouseStaff</option>
                                <option value="4">Accountant</option>
                            </Form.Select>
                        </Col>
                        <Col md={6}>
                            <label>Tất cả Kho</label>
>>>>>>> origin/tungvthe150237
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
<<<<<<< HEAD
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
                            <label >Vai trò</label>
                            <Form.Select aria-label="Default select example" className='formSelectCSS' onChange={handleSelectChange}>
                                <option value="">Vai trò</option>
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
=======
                            <label>Tên Đăng Nhập</label>
                            <input type="text" className="form-control inputCSS" value={userName} onChange={handleChangeUserName} />
                        </Col>
                        <Col md={6}>
                            <label>Email</label>
>>>>>>> origin/tungvthe150237
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={email} onChange={handleChangeEmail} />
                        </Col>
                    </Row>
                    <Row>
<<<<<<< HEAD
                        <Col md={12}>
                            <label >Địa chỉ</label>
=======
                        <Col md={6}>
                            <label>Số điện thoại</label>
                            <input type="number" className="form-control inputCSS" value={phone} onChange={handleChangePhone} />
                        </Col>
                        <Col md={6}>
                            <label>Địa chỉ</label>
>>>>>>> origin/tungvthe150237
                            <input type="text" className="form-control inputCSS" value={address} onChange={handleChangeAddress} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <Col md={12}>
                            <label>Hình ảnh</label>
                            <div>
                                <input type="file" accept="image/*" onChange={handleChangeImage} />
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