import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';
import {
    MDBBtn,
    MDBContainer,
    MDBRow,
    MDBCol,
    MDBInput
}
    from 'mdb-react-ui-kit';
import GlobalStyles from '~/components/GlobalStyles';
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


            loginContext(username, res.token.accessToken, res.UserId, res.roleId);
            navigate("/quan-ly-tai-khoan");
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
        // <section className="h-100">
        //     <div className="container-fluid">
        //         <div className="row" style={{ padding: '50px' }}>
        //             <div className="col-lg-2"></div>
        //             <div className="col-lg-4 d-flex align-items-center justify-content-center">
        //                 <div
        //                     className="w-100 d-flex flex-column align-items-center justify-content-center custom-rounded"
        //                     style={{ backgroundColor: '#f8f7fa', minHeight: '80vh', position: 'relative' }}
        //                 >
        //                     <img
        //                         className="mb-5"
        //                         style={{ width: '300px' }}
        //                         src={logo}
        //                         alt="WAREHOUSE MANAGEMENT SYSTEM"
        //                     />
        //                     <img
        //                         className="mb-5"
        //                         style={{ width: '400px', position: 'absolute', bottom: '210px' }}
        //                         src={shape}
        //                         alt="WAREHOUSE MANAGEMENT SYSTEM"
        //                     />
        //                     <h1 className="text-center" style={{ fontWeight: '650' }}>
        //                         WAREHOUSE
        //                         <br />
        //                         MANAGEMENT SYSTEM
        //                     </h1>
        //                 </div>
        //             </div>
        //             <div className="col-lg-4 d-flex align-items-center justify-content-center">
        //                 <div className="card-body p-4 p-lg-5 text-black">
        //                     <Form>
        //                         <div className="d-flex align-items-center mb-3 pb-1">
        //                             <h2 className="fw-bold mb-0">Chào mừng tới với WMS!</h2>
        //                         </div>

        //                         <h5 className="fw-normal mb-3 pb-3">
        //                             Vui lòng đăng nhập tài khoản để tiếp tục sử dụng dịch vụ
        //                         </h5>

        //                         <Form.Group className="mb-4">
        //                             <Form.Label>Tài khoản</Form.Label>
        //                             <div className="input-group">
        //                                 <Form.Control type="text" required placeholder="Tài khoản" onChange={(event) => setUsername(event.target.value)} />
        //                             </div>
        //                         </Form.Group>

        //                         <Form.Group className="mb-4">
        //                             <Form.Label>Mật khẩu</Form.Label>
        //                             <div className="input-group">
        //                                 <Form.Control type="password" required placeholder="Mật khẩu" onChange={(event) => setPassword(event.target.value)} />
        //                             </div>

        //                             <Link to="/quen-mat-khau" className="small text-muted">
        //                                 Quên mật khẩu?
        //                             </Link>
        //                         </Form.Group>

        //                         <div className="pt-1 mb-4">
        //                             <Button className="btn btn-lg btn-block w-100 box-color-primary" type="button" onClick={() => handleLogin()}
        //                             >
        //                                 Đăng nhập
        //                             </Button>
        //                         </div>

        //                         {showWarning && (
        //                             <p className="warning d-flex align-items-center justify-content-center">
        //                                 Sai tên tài khoản hoặc mật khẩu!
        //                             </p>
        //                         )}
        //                     </Form>
        //                 </div>
        //             </div>
        //             <div className="col-lg-2"></div>
        //         </div>
        //     </div >
        // </section >


        <MDBContainer className="my-5 gradient-form">

            <MDBRow>

                <MDBCol col='6' className="mb-5">
                    <div className="d-flex flex-column ms-5">

                        <div className="text-center">
                            <img src={logo}
                                style={{ width: '185px' }} alt="logo" />
                            <h4 className="mt-1 mb-5 pb-1">We are The iSmart</h4>
                        </div>

                        <p>Please login to your account</p>

                        <MDBInput wrapperClass='mb-4' label='Usename' id='form1' type='type' onChange={(event) => setUsername(event.target.value)} />
                        <MDBInput wrapperClass='mb-4' label='Password' id='form2' type='password' onChange={(event) => setPassword(event.target.value)} />


                        <div className="text-center pt-1 mb-5 pb-1">
                            <MDBBtn className="mb-4 w-100 gradient-custom-2" type="button" onClick={() => handleLogin()} >Sign in</MDBBtn>
                            <Link to="/quen-mat-khau" className="text-muted" >Forgot password?
                            </Link>
                        </div>

                        {/* Tạo account mới */}
                        {/* <div className="d-flex flex-row align-items-center justify-content-center pb-4 mb-4">
                            <p className="mb-0">Don't have an account?</p>
                            <MDBBtn outline className='mx-2' color='danger'>
                                Danger
                            </MDBBtn>
                        </div> */}

                    </div>

                </MDBCol>

                <MDBCol col='6' className="mb-5">
                    <div className="d-flex flex-column  justify-content-center gradient-custom-2 h-100 mb-4">

                        <div className="text-white px-3 py-4 p-md-5 mx-md-4">
                            <h4 class="mb-4">We are more than just a company</h4>
                            <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        </div>

                    </div>

                </MDBCol>

            </MDBRow>

        </MDBContainer>





    );
};

export default Login;
