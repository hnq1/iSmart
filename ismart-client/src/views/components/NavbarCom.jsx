import { Navbar, Nav, NavDropdown, Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import { useContext, useEffect, useState } from 'react';
import { UserContext } from '../../context/UserContext'
import ProfileDetail from '../profiles/ProfileDetail';
import ConfirmImport from '../confirm/ConfirmImport';
import ConfirmExport from '../confirm/ConfirmExport';
import ConfirmReturn from '../confirm/ConfirmReturn';
// import ModalConfirm from '../returnOrder/ModalConfirm';


function NavbarCom() {

    const { logout, user } = useContext(UserContext);
    const [hideHeader, setHideHeader] = useState(false);

    const [isShowProfileDetail, setIsShowProfileDetail] = useState(false);
    const [dataProfile, setDataProfile] = useState([]);

    const userId = parseInt(localStorage.getItem('userId'), 10);
    const [showNotifications, setShowNotifications] = useState(false);
    const [readNotifications, setReadNotifications] = useState(new Set());
    const [isShowModelConfirmEmport, setIsShowModelConfirmEmport] = useState(false);
    const [isShowModelConfirmImport, setIsShowModelConfirmImport] = useState(false);
    const [isShowModelConfirmReturn, setIsShowModelConfirmReturn] = useState(false);

    const [dataImportOrder, setDataImportOrder] = useState({});
    const [dataEmportOrder, setDataEmportOrder] = useState({});
    const [dataReturnOrder, setDataReturnOrder] = useState({});

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
            console.log('Received message from server:', event.data);
            // Sử dụng regular expression để tìm ID trong thông báo
            const idMatch = message.match(/ID (\d+)/);
            if (idMatch) {
                const importId = idMatch[1]; // Lấy giá trị của ID từ chuỗi
                console.log("importId: ", importId);

                // Lưu ID vào localStorage
                localStorage.setItem('importOrderId', importId);


                // Lưu thông báo vào state để hiển thị
                setWebSocketMessages(prevMessages => [...prevMessages, message]);
            } else {
                console.warn("Message does not contain a valid ID: ", message);
                setWebSocketMessages(prevMessages => [...prevMessages, message]);
            }

        };

        return () => {
            socket.close();
        };
        // }

    }, []);



    //mới
    const handleNotificationClick = (index) => {
        const selectedMessage = webSocketMessages[index];
        const idMatch = selectedMessage.match(/ID (\d+)/);
        const codeMatch = selectedMessage.match(/mã (\w+)/); // Tìm mã thông báo

        if (idMatch && codeMatch) {
            const Id = idMatch[1];
            const code = codeMatch[1]; // Lấy giá trị của mã từ chuỗi

            localStorage.setItem('importOrderId', Id);

            if (code.startsWith('IM')) {
                setIsShowModelConfirmImport(true);
                setDataImportOrder({
                    importId: Id,

                });
            } else if (code.startsWith('XH')) {
                setIsShowModelConfirmEmport(true);
                setDataEmportOrder({
                    exportId: Id,
                })
            }
            else if (code.startsWith('RO')) {
                setIsShowModelConfirmReturn(true);
                setDataReturnOrder({
                    returnId: Id,
                })
            }
            setReadNotifications(prevReadNotifications => new Set(prevReadNotifications).add(index));
        } else {
            console.warn("Selected message does not contain a valid ID or code: ", selectedMessage);
        }
    };

    const handleLogout = () => {

        logout();
        toast.success("Đăng xuất thành công");
        navigate('/dang-nhap');

    };

    return (
        <>
            <Navbar expand="lg" style={{ background: '#2275b7 ' }}>
                {!hideHeader &&
                    <Container>
                        <Navbar.Toggle aria-controls="navbarSupportedContent" />
                        <Navbar.Collapse id="navbarSupportedContent">
                            <Nav className="me-auto">
                            </Nav>
                            <Nav className="d-flex align-items-center">
                                <div style={{ position: 'relative', display: 'inline-block' }}>
                                    <i className="fa-solid fa-bell text-white" style={{ cursor: 'pointer' }} onClick={() => setShowNotifications(!showNotifications)}></i>
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
                                        }}>{webSocketMessages.length}</span>
                                    )}
                                </div>

                                <div style={{ position: 'absolute', left: '70%', transform: 'translateX(-50%)' }}>
                                    <NavDropdown
                                        id="navbarDropdownMenuAvatar"
                                        className='ButtonCSSDropdown'
                                        style={{ color: 'white' }}
                                        show={showNotifications}
                                        onMouseLeave={() => setShowNotifications(false)}
                                    >
                                        {webSocketMessages.length === 0 ? (
                                            <NavDropdown.Item>Không có thông báo mới</NavDropdown.Item>
                                        ) : (
                                            webSocketMessages.map((message, index) => (
                                                <NavDropdown.Item key={index}
                                                    onClick={() => handleNotificationClick(index)}>{message}</NavDropdown.Item>
                                            ))
                                        )}
                                    </NavDropdown>
                                </div>
                                <span style={{ margin: '0 10px' }}></span> {/* Adjust the margin as needed */}
                                <i className="fa-solid fa-user text-white"></i>
                                <NavDropdown
                                    title={<span className="text-white">Chào bạn {user.userName}</span>}
                                    id="navbarDropdownMenuAvatar"
                                    className='ButtonCSSDropdown text-white'
                                    style={{ color: 'white' }}
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
            <ConfirmImport isShow={isShowModelConfirmImport}
                handleClose={() => setIsShowModelConfirmImport(false)}
                dataImportOrder={dataImportOrder}
            // updateTable={updateTable}
            />
            <ConfirmExport isShow={isShowModelConfirmEmport}
                handleClose={() => setIsShowModelConfirmEmport(false)}
                dataEmportOrder={dataEmportOrder}
            // updateTable={updateTable}
            />
            <ConfirmReturn isShow={isShowModelConfirmReturn}
                handleClose={() => setIsShowModelConfirmReturn(false)}
                dataReturnOrder={dataReturnOrder}
            // updateTable={updateTable}
            />
            {/* <ConfirmReturn isShow={isShowModelConfirmReturn}
                handleClose={() => setIsShowModelConfirmReturn(false)}
                // dataEmportOrder={dataEmportOrder}
            // updateTable={updateTable}
            /> */}
        </>
    );
};

export default NavbarCom;
