import { Navbar, Nav, NavDropdown, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import { useContext, useEffect, useState } from 'react';
import { UserContext } from '../../context/UserContext'
import ProfileDetail from '../profiles/ProfileDetail';

function NavbarCom() {

    const { logout, user } = useContext(UserContext);
    const [hideHeader, setHideHeader] = useState(false);

    const [isShowProfileDetail, setIsShowProfileDetail] = useState(false);
    const [dataProfile, setDataProfile] = useState([]);

    const userId = parseInt(localStorage.getItem('userId'), 10);


    useEffect(() => {
        if (window.location.pathname === '/dang-nhap' || window.location.pathname === '/') {
            setHideHeader(true);
        }
    }, []);
    const navigate = useNavigate();
    const handleLogout = () => {

        logout();
        toast.success("Đăng xuất thành công");
        navigate('/dang-nhap');

    };

    return (
        <>
            <Navbar bg="body-tertiary"
                expand="lg" style={{ background: 'linear-gradient(to right, #a5e6c8, #b4ead1, #c4eedb, #d3f3e4, #e2f7ed, #f2fbf7)' }}>
                {!hideHeader &&

                    <Container>
                        <Navbar.Toggle aria-controls="navbarSupportedContent" />
                        <Navbar.Collapse id="navbarSupportedContent">
                            <Nav className="me-auto">
                            </Nav>
                            <Nav className="d-flex align-items-center">
                                <i class="fa-duotone fa-user"></i>
                                <NavDropdown
                                    title={

                                        <span>Chào bạn {user.userName}</span>
                                    }
                                    id="navbarDropdownMenuAvatar" className='ButtonCSSDropdown'
                                >
                                    {user && user.auth === true ? <NavDropdown.Item onClick={() => setIsShowProfileDetail(true)}>Hồ sơ</NavDropdown.Item> : ''}
                                    <NavDropdown.Item as={Link} to="/doi-mat-khau">Đổi mật khẩu</NavDropdown.Item>
                                    {user && user.auth === true ? <NavDropdown.Item onClick={() => handleLogout()}>Đăng xuất</NavDropdown.Item> : <NavDropdown.Item as={Link} to="/dang-nhap">Đăng nhập</NavDropdown.Item>}
                                </NavDropdown>
                            </Nav>
                        </Navbar.Collapse>
                    </Container>
                }
            </Navbar>

            <ProfileDetail isShow={isShowProfileDetail} handleClose={() => setIsShowProfileDetail(false)} userId={userId} />
        </>
    );

}

export default NavbarCom;
