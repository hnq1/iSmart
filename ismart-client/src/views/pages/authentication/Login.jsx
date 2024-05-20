import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';
import { Form, Button } from 'react-bootstrap';
import { toast } from 'react-toastify';
import { useEffect, useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { UserContext } from '../../../context/UserContext';
import { loginApi } from '~/services/LoginServices';
import { Link } from 'react-router-dom';
const Login = () => {
    const navigate = useNavigate();
    const { loginContext } = useContext(UserContext);
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [showWarning, setShowWarning] = useState(false);

    useEffect(() => {
        let token = localStorage.getItem('token');
        if (token) {
            navigate('/danh-sach-mat-hang');
        }
    });
    const handleLogin = async () => {

        if (!username || !password) {
            toast.error('Vui lòng nhập tài khoản và mật khẩu');
            return;
        }


        let res = await loginApi(username, password);


        if (res && res.status === 400) {
            setShowWarning(true);
        } else if (res.token && res.token.accessToken) {
            setShowWarning(false);


            loginContext(username, res.token.accessToken, res.userId, res.roleId);
            navigate("/thong-ke");
            // Xử lý đăng nhập thành công
        }

        return (
            <div>
                {showWarning && (
                    <p className="warning d-flex align-items-center justify-content-center">
                        Sai tên tài khoản hoặc mật khẩu!
                    </p>
                )}
                {/* Phần còn lại của form đăng nhập */}
                <button onClick={handleLogin}>Đăng nhập</button>
            </div>
        );



    }
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
                            <Form>
                                <div className="d-flex align-items-center mb-3 pb-1">
                                    <h2 className="fw-bold mb-0">Chào mừng tới với WMS!</h2>
                                </div>

                                <h5 className="fw-normal mb-3 pb-3">
                                    Vui lòng đăng nhập tài khoản để tiếp tục sử dụng dịch vụ
                                </h5>

                                <Form.Group className="mb-4">
                                    <Form.Label>Tài khoản</Form.Label>
                                    <div className="input-group">
                                        <Form.Control type="text" required placeholder="Tài khoản" onChange={(event) => setUsername(event.target.value)} />
                                    </div>
                                </Form.Group>

                                <Form.Group className="mb-4">
                                    <Form.Label>Mật khẩu</Form.Label>
                                    <div className="input-group">
                                        <Form.Control type="password" required placeholder="Mật khẩu" onChange={(event) => setPassword(event.target.value)} />
                                    </div>

                                    <Link to="/quen-mat-khau" className="small text-muted">
                                        Quên mật khẩu?
                                    </Link>
                                </Form.Group>

                                <div className="pt-1 mb-4">
                                    <Button className="btn btn-lg btn-block w-100 box-color-primary" type="button" onClick={() => handleLogin()}
                                    >
                                        Đăng nhập
                                    </Button>
                                </div>

                                {showWarning && (
                                    <p className="warning d-flex align-items-center justify-content-center">
                                        Sai tên tài khoản hoặc mật khẩu!
                                    </p>
                                )}
                            </Form>
                        </div>
                    </div>
                    <div className="col-lg-2"></div>
                </div>
            </div >
        </section >
    );
};

export default Login;
