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
        // console.log('Attempting login with username:', username, 'and password:', password);

        let res = await loginApi(username, password);

        // console.log('Response from loginApi:', res.token);
        // console.log('Response from loginApi:', res.roleId);
        // console.log('Response from loginApi:', res.token.accessToken);



        try {
            if (res && res.status === 400) {

                setShowWarning(true);
                toast.error('Bạn không có quyền truy cập vào đây');

            } else if (res.token) {
                setShowWarning(false);

                // console.log('Response from loginApi:', res);
                // console.log('Login successful:', res);

                if (res.roleId === 1) {
                    loginContext(username, res.token.accessToken, res.UserId, res.roleId);
                    // toast.error('Bạn không có quyền truy cập vao day');
                    navigate("/danh-sach-mat-hang");

                    // Xử lý đăng nhập thành công
                }
                // else {
                //     toast.error('Bạn không có quyền truy cập');
                // }
            }
            else {
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
        } catch (error) {
            setShowWarning(true);
            console.error('Login error:', error);
            toast.error('Đã xảy ra lỗi, vui lòng thử lại sau.');
        }
    }
    return (



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

                        <MDBInput wrapperClass='mb-4' label='Usename' id='form1' type='type'
                            onChange={(event) => setUsername(event.target.value)} />
                        <MDBInput wrapperClass='mb-4' label='Password' id='form2' type='password'
                            onChange={(event) => setPassword(event.target.value)} />


                        <div className="text-center pt-1 mb-5 pb-1">
                            <MDBBtn className="mb-4 w-100 gradient-custom-2" type="button"
                                onClick={() => handleLogin()} >
                                Sign in
                            </MDBBtn>
                            {showWarning && <div>Login failed</div>}
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