import { Navbar, Nav, NavDropdown, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import { useContext, useEffect, useState } from 'react';
import { UserContext } from '../../context/UserContext'
import ProfileDetail from '../profiles/ProfileDetail';
import ConfirmImportOrderN from '../importOrdersN/ConfirmImportOrderN';


function NavbarCom() {

    const { logout, user } = useContext(UserContext);
    const [hideHeader, setHideHeader] = useState(false);

    const [isShowProfileDetail, setIsShowProfileDetail] = useState(false);
    const [dataProfile, setDataProfile] = useState([]);

    const userId = parseInt(localStorage.getItem('userId'), 10);
    const [showNotifications, setShowNotifications] = useState(false);
    const [readNotifications, setReadNotifications] = useState(new Set());
    const [isShowModelConfirm, setIsShowModelConfirm] = useState(false); // State để điều khiển hiển thị modal
    const [dataImportOrder, setDataImportOrder] = useState(null); // Dữ liệu đơn hàng cần nhập
    const [updateTable, setUpdateTable] = useState(false); // State để cập nhật bảng sau khi nhập đơn hàng

    const [webSocketMessages, setWebSocketMessages] = useState([]);

    const navigate = useNavigate();
    useEffect(() => {
        if (window.location.pathname === '/dang-nhap' || window.location.pathname === '/') {
            setHideHeader(true);
        }
    }, []);

    useEffect(() => {

        const roleId = parseInt(localStorage.getItem('roleId'), 10); // Lấy roleId từ localStorage
        // if (roleId === 2) { // Chỉ thiết lập WebSocket nếu roleId là 2
            const socket = new WebSocket('wss://localhost:7033/ws'); // Thay đổi URL và port tương ứng với server của bạn

            socket.onopen = () => {
                console.log('WebSocket connected');
            };

            socket.onmessage = (event) => {
                const message = event.data;

                console.log('Received message from server:', message);
                setWebSocketMessages(prevMessages => [...prevMessages, message]);

            };

            return () => {
                socket.close();
            };
        // }

    }, []);
    // cũ
    // const handleNotificationClick = (index) => {
    //     setReadNotifications(prevReadNotifications => new Set(prevReadNotifications).add(index));
    //     // Xử lý khi người dùng nhấp vào thông báo ở vị trí index
    //     const updatedMessages = [...webSocketMessages];
    //     updatedMessages.splice(index, 1); // Xóa thông báo khỏi danh sách
    //     const selectedMessage = updatedMessages[index];
    //     setWebSocketMessages(updatedMessages);


    //     setIsShowModelConfirm(true);
    //     setDataImportOrder(selectedMessage);
    // };


    //mới
    const handleNotificationClick = (index) => {
        const selectedMessage = webSocketMessages[index];
        const importId = selectedMessage.importId; // Assuming the message contains importId
        navigate(`/confirm-import-order/${importId}`);
        setReadNotifications(prevReadNotifications => new Set(prevReadNotifications).add(index));
        setWebSocketMessages(prevMessages => prevMessages.filter((_, i) => i !== index));
    };

    const handleLogout = () => {

        logout();
        toast.success("Đăng xuất thành công");
        navigate('/dang-nhap');

    };

    return (
        <>
            <Navbar bg="body-tertiary" expand="lg" style={{ background: 'linear-gradient(to right, #a5e6c8, #b4ead1, #c4eedb, #d3f3e4, #e2f7ed, #f2fbf7)' }}>
                {!hideHeader &&
                    <Container>
                        <Navbar.Toggle aria-controls="navbarSupportedContent" />
                        <Navbar.Collapse id="navbarSupportedContent">
                            <Nav className="me-auto">
                            </Nav>
                            <Nav className="d-flex align-items-center">
                                <div style={{ position: 'relative' }}>
                                    <i className="fa-solid fa-bell" onClick={() => setShowNotifications(!showNotifications)}></i>
                                    {webSocketMessages.length > 0 && (
                                        <span className="notification-count" style={{
                                            position: 'absolute',
                                            top: '-5px',
                                            right: '-5px',
                                            background: 'red',
                                            borderRadius: '50%',
                                            color: 'white',
                                            fontSize: '10px',
                                            width: '15px',
                                            height: '15px',
                                            display: 'flex',
                                            justifyContent: 'center',
                                            alignItems: 'center',
                                        }}>{webSocketMessages.length}</span> // Hiển thị số lượng thông báo
                                    )}
                                </div>
                                <NavDropdown
                                    id="navbarDropdownMenuAvatar"
                                    className='ButtonCSSDropdown'
                                    show={showNotifications} // Hiển thị dropdown khi biểu tượng chuông được nhấp
                                    onMouseLeave={() => setShowNotifications(false)} // Tự động ẩn khi rời khỏi dropdown
                                >
                                    {/* Render các thông báo từ WebSocket */}
                                    {webSocketMessages.length === 0 ? (
                                        <NavDropdown.Item>Không có thông báo mới</NavDropdown.Item>
                                    ) : (
                                        webSocketMessages.map((message, index) => (
                                            <NavDropdown.Item key={index}
                                                onClick={() => handleNotificationClick(index)}>{message}</NavDropdown.Item>
                                        ))
                                    )}
                                    {/* Thêm nút để xem tất cả thông báo */}
                                    {/* <NavDropdown.Divider /> */}
                                    {/* <NavDropdown.Item as={Link} to="/thong-bao">Xem tất cả thông báo</NavDropdown.Item> */}
                                </NavDropdown>
                                <span style={{ margin: '0 10px' }}></span> {/* Adjust the margin as needed */}
                                <i className="fa-duotone fa-user"></i>
                                <NavDropdown
                                    title={<span>Chào bạn {user.userName}</span>}
                                    id="navbarDropdownMenuAvatar"
                                    className='ButtonCSSDropdown'
                                >
                                    {user && user.auth === true ? <NavDropdown.Item onClick={() => setIsShowProfileDetail(true)}>Hồ sơ</NavDropdown.Item> : ''}
                                    <NavDropdown.Item as={Link} to="/doi-mat-khau">Đổi mật khẩu</NavDropdown.Item>
                                    {user && user.auth === true ? <NavDropdown.Item onClick={handleLogout}>Đăng xuất</NavDropdown.Item> : <NavDropdown.Item as={Link} to="/dang-nhap">Đăng nhập</NavDropdown.Item>}
                                </NavDropdown>
                            </Nav>
                        </Navbar.Collapse>
                    </Container>
                }
            </Navbar>

            <ProfileDetail isShow={isShowProfileDetail} handleClose={() => setIsShowProfileDetail(false)} userId={userId} />
            {/* <ConfirmImportOrderN
                isShow={isShowModelConfirm}
                handleClose={() => setIsShowModelConfirm(false)}
                dataImportOrder={dataImportOrder}
                updateTable={() => setUpdateTable(prev => !prev)} // Cập nhật bảng sau khi nhập đơn hàng thành công
            /> */}
        </>
    );
};

export default NavbarCom;
