import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';
import { Form, Button } from 'react-bootstrap';
import { useState } from 'react';
import { forgotPassword } from '~/services/LoginServices';
import { Link } from 'react-router-dom';
const ForgotPassword = () => {
    const [email, setEmail] = useState('');
    const [isEmailValid, setIsEmailValid] = useState(false); // Đặt là false mặc định
    const [sendStatus, setSendStatus] = useState('idle'); // idle, success, error

    const validateEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    };

    const handleEmailChange = (e) => {
        const newEmail = e.target.value;
        setEmail(newEmail);
        setIsEmailValid(validateEmail(newEmail));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        if (isEmailValid && email) {
            setSendStatus('pending');
            forgotPassword(email)
                .then((response) => {
                    // Xử lý response thành công
                    if (response.status === 500) {
                        setSendStatus('error');
                        return;
                    }

                    setSendStatus('success');
                })
                .catch((error) => {
                    // Xử lý lỗi

                    setSendStatus('error');
                });
        }
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
                            <Form onSubmit={handleSubmit}>
                                <div className="d-flex align-items-center mb-3 pb-1">
                                    <h2 className="fw-bold mb-0">Bạn quên mật khẩu?</h2>
                                </div>

                                <h5 className="fw-normal mb-3 pb-3">
                                    Vui lòng nhập email của bạn, chúng tôi sẽ gửi mật khẩu mới, hãy dùng nó để đăng nhập hoặc thay đổi mật khẩu
                                </h5>

                                <Form.Group className="mb-4">
                                    <Form.Label>Email</Form.Label>
                                    <div className="input-group">
                                        <Form.Control
                                            className="inputCSS"
                                            type="text"
                                            placeholder="Nhập email"
                                            value={email}
                                            onChange={handleEmailChange}
                                        />
                                    </div>
                                    <p
                                        className={`warning ${sendStatus === 'success'
                                            ? 'd-block'
                                            : sendStatus === 'error'
                                                ? 'd-block'
                                                : !isEmailValid
                                                    ? 'd-block'
                                                    : 'd-none'
                                            }`}
                                    >
                                        {sendStatus === 'success'
                                            ? 'Đã gửi thành công, vui lòng kiểm tra email để lấy mật khẩu'
                                            : sendStatus === 'error'
                                                ? 'Không tìm thấy email của bạn'
                                                : !isEmailValid
                                                    ? 'Vui lòng nhập email hợp lệ!'
                                                    : ''}
                                    </p>
                                </Form.Group>
                                <Link to="/dang-nhap" className="small text-muted">
                                    Đăng nhập ngay
                                </Link>
                                {/* <Form.Group className="mb-4">
                                    <Form.Label>Mã khôi phục</Form.Label>
                                    <Form.Control type="number" required placeholder="Nhập mã khôi phục" />
                                </Form.Group> */}

                                <div className="pt-1 mb-4">
                                    <Button
                                        className="btn box-color-primary"
                                        type="submit"
                                        disabled={!isEmailValid}
                                    >
                                        Lấy lại mật khẩu
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

export default ForgotPassword;
