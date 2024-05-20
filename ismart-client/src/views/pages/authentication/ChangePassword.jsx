import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';
import { Form, Button } from 'react-bootstrap';
import { useState } from 'react';
import { changePassword } from '~/services/LoginServices';
import { Link } from 'react-router-dom';
const ChangePassword = () => {
    const [oldPassword, setOldPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [errorMessage, setErrorMessage] = useState('');

    const userIdString = localStorage.getItem('userId');
    const userId = parseInt(userIdString, 10);

    const handleChangePassword = async (e) => {
        e.preventDefault();


        const response = await changePassword(userId, newPassword, oldPassword);

        if (response.status === 400) {
            setErrorMessage(response.data);
            return;
        }
        setErrorMessage('Đổi mật khẩu thành công');
    };
    return (
        <section className="h-100">
            <div className="container-fluid">
                <div className="row" style={{ padding: '50px' }}>
                    <div className="col-lg-2"></div>
                    <div className="col-lg-4 d-flex align-items-center justify-content-center">
                        <div
                            className="w-100 d-flex flex-column align-items-center justify-content-center custom-rounded"
                            style={{ backgroundColor: '#f8f7fa', minHeight: '80vh', position: 'relative' }}
                        >
                            <img
                                className="mb-5"
                                style={{ width: '300px' }}
                                src={logo}
                                alt="WAREHOUSE MANAGEMENT SYSTEM"
                            />
                            <img
                                className="mb-5"
                                style={{ width: '400px', position: 'absolute', bottom: '210px' }}
                                src={shape}
                                alt="WAREHOUSE MANAGEMENT SYSTEM"
                            />
                            <h1 className="text-center" style={{ fontWeight: '650' }}>
                                WAREHOUSE
                                <br />
                                MANAGEMENT SYSTEM
                            </h1>
                        </div>
                    </div>
                    <div className="col-lg-4 d-flex align-items-center justify-content-center">
                        <div className="card-body p-4 p-lg-5 text-black">
                            <Form onSubmit={handleChangePassword}>
                                <div className="d-flex align-items-center mb-3 pb-1">
                                    <h2 className="fw-bold mb-0">Đổi mật khẩu</h2>
                                </div>

                                <h5 className="fw-normal mb-3 pb-3">Vui lòng nhập mật khẩu mà bạn muốn đổi</h5>

                                <Form.Group className="mb-4">
                                    <Form.Label>Mật khẩu cũ</Form.Label>
                                    <div className="input-group">
                                        <Form.Control
                                            type="password"
                                            id="password1"
                                            className="form-control form-control-lg inputCSS"
                                            value={oldPassword}
                                            onChange={(e) => setOldPassword(e.target.value)}
                                            required
                                        />
                                    </div>
                                </Form.Group>

                                <Form.Group className="mb-4">
                                    <Form.Label>Mật khẩu mới</Form.Label>
                                    <Form.Control
                                        type="password"
                                        id="password2"
                                        className="form-control form-control-lg inputCSS"
                                        value={newPassword}
                                        onChange={(e) => setNewPassword(e.target.value)}
                                    />
                                    {errorMessage && (
                                        <p className="warning">{errorMessage}</p>
                                    )}

                                </Form.Group>
                                <Link to="/dang-nhap" className="small text-muted">
                                    Đăng nhập ngay
                                </Link>
                                <div className="pt-1 mb-4">
                                    <Button className="btn btn-lg btn-block w-100 box-color-primary" type="submit">
                                        Đổi mật khẩu
                                    </Button>
                                </div>
                            </Form>
                        </div>
                    </div>
                    <div className="col-lg-2"></div>
                </div>
            </div>
        </section>
    );
};

export default ChangePassword;
