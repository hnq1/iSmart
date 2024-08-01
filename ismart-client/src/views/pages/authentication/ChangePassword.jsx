import logo from '../../../assets/images/logo.png';
import shape from '../../../assets/images/Shape.png';

import {
    MDBBtn,
    MDBContainer,
    MDBRow,
    MDBCol,
    MDBInput
} from 'mdb-react-ui-kit';
import GlobalStyles from '~/components/GlobalStyles';
import { Form, Button } from 'react-bootstrap';
import { useState } from 'react';
import { changePassword } from '~/services/LoginServices';
import { Link } from 'react-router-dom';
// import { useNavigate } from 'react-router-dom';

const ChangePassword = () => {
    const [oldPassword, setOldPassword] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [errorMessage, setErrorMessage] = useState('');
    // const navigate = useNavigate(); 

    const userIdString = localStorage.getItem('userId');
    const userId = parseInt(userIdString, 10);

    const handleChangePassword = async (e) => {
        e.preventDefault();


        let response = await changePassword(userId, newPassword, oldPassword);

        // Cần thêm điều kiên thay đổi mật khẩu như yêu cầu add tài khoản và đổi mật khẩu
        if (response.status === 400) {
            setErrorMessage(response.data);
            return;
        }
        setErrorMessage('Đổi mật khẩu thành công');
        // logout();
    };

    // const logout = () => {
    //     localStorage.removeItem('warehouseId'); 
    //     localStorage.removeItem('token');
    //     localStorage.removeItem('roleId');
    //     localStorage.removeItem('userName');
    // };
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
        //                     <Form onSubmit={handleChangePassword}>
        //                         <div className="d-flex align-items-center mb-3 pb-1">
        //                             <h2 className="fw-bold mb-0">Đổi mật khẩu</h2>
        //                         </div>

        //                         <h5 className="fw-normal mb-3 pb-3">Vui lòng nhập mật khẩu mà bạn muốn đổi</h5>

        //                         <Form.Group className="mb-4">
        //                             <Form.Label>Mật khẩu cũ</Form.Label>
        //                             <div className="input-group">
        //                                 <Form.Control
        //                                     type="password"
        //                                     id="password1"
        //                                     className="form-control form-control-lg inputCSS"
        //                                     value={oldPassword}
        //                                     onChange={(e) => setOldPassword(e.target.value)}
        //                                     required
        //                                 />
        //                             </div>
        //                         </Form.Group>

        //                         <Form.Group className="mb-4">
        //                             <Form.Label>Mật khẩu mới</Form.Label>
        //                             <Form.Control
        //                                 type="password"
        //                                 id="password2"
        //                                 className="form-control form-control-lg inputCSS"
        //                                 value={newPassword}
        //                                 onChange={(e) => setNewPassword(e.target.value)}
        //                             />
        //                             {errorMessage && (
        //                                 <p className="warning">{errorMessage}</p>
        //                             )}

        //                         </Form.Group>
        //                         <Link to="/dang-nhap" className="small text-muted">
        //                             Đăng nhập ngay
        //                         </Link>
        //                         <div className="pt-1 mb-4">
        //                             <Button className="btn btn-lg btn-block w-100 box-color-primary" type="submit">
        //                                 Đổi mật khẩu
        //                             </Button>
        //                         </div>
        //                     </Form>
        //                 </div>
        //             </div>
        //             <div className="col-lg-2"></div>
        //         </div>
        //     </div>
        // </section>

        <MDBContainer className="my-5 gradient-form">

            <MDBRow>

                <MDBCol col='6' className="mb-5">
                    <div className="d-flex flex-column ms-5">
                        <Form onSubmit={handleChangePassword}>
                            <div className="text-center">
                                <img src={logo}
                                    style={{ width: '185px' }} alt="logo" />
                                <h4 className="mt-1 mb-5 pb-1">We are The iSmart</h4>
                            </div>

                            <p>Vui lòng nhập mật khẩu</p>

                            <MDBInput wrapperClass='mb-4' label='Mật khẩu cũ' type='password' id="password1"
                                value={oldPassword}
                                onChange={(e) => setOldPassword(e.target.value)}
                                required />
                            <MDBInput wrapperClass='mb-4' label='Mật khẩu mới' type='password' id="password2"
                                value={newPassword}
                                onChange={(e) => setNewPassword(e.target.value)} />
                            {errorMessage && (
                                <p className="warning">{errorMessage}</p>
                            )}

                            <div className="text-center pt-1 mb-5 pb-1">
                                <MDBBtn className="mb-4 w-100 gradient-custom-2" type="submit" >Đổi mật khẩu</MDBBtn>
                                <Link to="/dang-nhap" className="text-muted" >Đăng nhập ngay
                                </Link>
                            </div>
                        </Form>

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

export default ChangePassword;
