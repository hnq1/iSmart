import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';
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
            navigate('/thong-ke');
        }
    });
    const handleLogin = async () => {

        if (!username || !password) {
            toast.error('Vui lòng nhập tài khoản và mật khẩu');
            return;
        }
        // console.log('Attempting login with username:', username, 'and password:', password);

        let res = await loginApi(username, password);
        // console.log('Response from loginApi:', res);
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


                loginContext(username, res.token.accessToken, res.userId, res.roleId);
                if (res.roleId === 1 || res.roleId === 2 || res.roleId === 4) {
                    navigate("/thong-ke");
                } else if (res.roleId === 3) {
                    navigate("/cac-lo-hang-nhap-ngoai");
                }
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


        <div className="flex min-h-full flex-1 flex-col justify-center px-6 py-12 lg:px-8">
            <div className="sm:mx-auto sm:w-full sm:max-w-sm">
                <img
                    className="mx-auto h-10 w-auto"
                    src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
                    alt="Your Company"
                />
                <h2 className="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">
                    Sign in to your account
                </h2>
            </div>

            <div className="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form className="space-y-6" action="#" method="POST">
                    <div>
                        <label htmlFor="UserName" className="block text-sm font-medium leading-6 text-gray-900">
                            UserName
                        </label>
                        <div className="mt-2">
                            <input
                                id="UserName"
                                name="UserName"
                                style={{ paddingLeft: '10px' }}
                                type="text"
                                autoComplete="UserName"
                                required
                                className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                onChange={(event) => setUsername(event.target.value)}
                            />
                        </div>
                    </div>

                    <div>
                        <div className="flex items-center justify-between">
                            <label htmlFor="password" className="block text-sm font-medium leading-6 text-gray-900">
                                Password
                            </label>
                            <div className="text-sm">
                                {/* <link to="/quen-mat-khau" className="font-semibold text-indigo-600 hover:text-indigo-500">
                                    Forgot password?
                                </link> */}
                                {/* <a href="#" className="font-semibold text-indigo-600 hover:text-indigo-500">
                                    Forgot password?
                                </a> */}
                            </div>
                        </div>
                        <div className="mt-2">
                            <input
                                id="password"
                                name="password"
                                style={{ paddingLeft: '10px' }}
                                type="password"
                                autoComplete="current-password"
                                required
                                className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                                onChange={(event) => setPassword(event.target.value)}
                            />
                        </div>
                    </div>

                    <div>
                        <button
                            type="button"
                            className="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                            onClick={() => handleLogin()}
                        >
                            Sign in
                        </button>
                    </div>
                    {showWarning && <div>Login failed</div>}
                </form>

            </div>
        </div>




    );
};

export default Login;
