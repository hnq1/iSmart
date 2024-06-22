import React from 'react';
import { Container, Row, Col, Nav, Navbar, NavDropdown, Image } from 'react-bootstrap';
import logo from '../../assets/images/logo.png';
import { Link } from 'react-router-dom';

const Sidebar = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);

    return (

        <Col sm={3} md={3} xl={2} className="px-sm-2  px-0  
        " style={{
                width: '240px',
                // background: 'linear-gradient(to right, #5dd29c, #71d7a8, #85ddb4)'
            }}>

            {/* Thêm nút bấm thụt ra thụt vào của full menu */}

            <div className="d-flex flex-column  align-items-center px-3 pt-2 text-white min-vh-100">
                <div
                    href="/"
                    className="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-sidebar text-decoration-none"
                >
                    {/* Logo */}
                    {/* cần thay đổi logo */}
                    {/* <Navbar.Brand href="#" className="p-1">
                        <img src={logo} className="px-2 ms-2" height="40" alt="MDB Logo" loading="lazy" />
                    </Navbar.Brand> */}

                    <span className="fs-5 d-none d-sm-inline fw-bold ">ISM</span>
                </div>
                <Nav
                    className="nav-pills flex-column  mb-sm-auto mb-0 align-items-center align-items-sm-start"
                    id="menu"
                >
                    {
                        (roleId == 1 || roleId == 2 || roleId == 4) ?
                            <Nav.Item className="mb-2 ">
                                <Nav.Link as={Link} to="/thong-ke"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i className="fa-duotone fa-chart-simple fa-xl "></i>
                                        </div>
                                        <div>
                                            <span className=" d-none d-sm-inline ">Thống kê</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className=" fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }

                    {
                        (roleId == 1 || roleId == 2 || roleId == 4) ?
                            <Nav.Item className="mb-2">
                                <Nav.Link as={Link} to="/kho-3d"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i className="fa-duotone fa-clipboard fa-xl"></i>
                                        </div>
                                        <div>
                                            <span className="ms-1 d-none d-sm-inline">Tạo Kho 3D</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className="fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }

                    {
                        (roleId == 1 || roleId == 2 || roleId == 4) ?
                            <Nav.Item className="mb-2">
                                <Nav.Link as={Link} to="/danh-sach-mat-hang"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i className="fa-duotone fa-clipboard fa-xl"></i>
                                        </div>
                                        <div>
                                            <span className="ms-1 d-none d-sm-inline">Quản lý hàng hóa</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className="fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }

                    <Nav.Item className="mb-2">
                        <Nav.Link as={Link} to="/cac-lo-hang-nhap-ngoai"
                            className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                            style={{ width: 180 }}
                        >
                            <div className="d-flex">
                                <div style={{ width: 30 }}>
                                    <i className="fa-duotone fa-file-import fa-xl"></i>
                                </div>
                                <div>
                                    <span className="ms-1 d-none d-sm-inline">Nhập hàng Ngoại</span>
                                </div>
                            </div>
                            <div>
                                <i className="fa-solid fa-angle-right"></i>
                            </div>
                        </Nav.Link>
                    </Nav.Item>

                    <Nav.Item className="mb-2">
                        <Nav.Link as={Link} to="/cac-lo-hang-nhap-noi"
                            className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                            style={{ width: 180 }}
                        >
                            <div className="d-flex">
                                <div style={{ width: 30 }}>
                                    <i className="fa-duotone fa-file-import fa-xl"></i>
                                </div>
                                <div>
                                    <span className="ms-1 d-none d-sm-inline">Nhập hàng Nội</span>
                                </div>
                            </div>
                            <div>
                                <i className="fa-solid fa-angle-right"></i>
                            </div>
                        </Nav.Link>
                    </Nav.Item>


                    <Nav.Item className="mb-2">
                        <Nav.Link as={Link} to="/cac-lo-hang-xuat"
                            className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                            style={{ width: 180 }}
                        >
                            <div className="d-flex">
                                <div style={{ width: 30 }}>
                                    <i className="fa-duotone fa-file-export fa-xl"></i>
                                </div>
                                <div>
                                    <span className="ms-1 d-none d-sm-inline">Xuất hàng</span>
                                </div>
                            </div>
                            <div>
                                <i className="fa-solid fa-angle-right"></i>
                            </div>
                        </Nav.Link>
                    </Nav.Item>

                    {
                        (roleId == 1 || roleId == 2 || roleId == 4) ?
                            <Nav.Item className="mb-2">
                                <Nav.Link as={Link} to="/kiem-ke"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i className="fa-xl fa-duotone fa-badge-check fa-swap-opacity"></i>
                                        </div>
                                        <div>
                                            <span className="ms-1 d-none d-sm-inline">Kiểm hàng</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className="fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }


                    {

                        <Nav.Item className="mb-2">
                            <Nav.Link as={Link} to="/cac-danh-muc"
                                className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                style={{ width: 180 }}
                            >
                                <div className="d-flex">
                                    <div style={{ width: 30 }}>
                                        <i className="fa-light fa-list"></i>
                                    </div>
                                    <div>
                                        <span className="ms-1 d-none d-sm-inline">Danh mục</span>
                                    </div>
                                </div>
                                <div>
                                    <i className="fa-solid fa-angle-right"></i>
                                </div>
                            </Nav.Link>
                        </Nav.Item>

                    }

                    {
                        // (roleId == 1 || roleId == 2 || roleId == 4) ?
                        <Nav.Item className="mb-2">
                            <Nav.Link as={Link} to="/nha-cung-cap"
                                className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                style={{ width: 180 }}
                            >
                                <div className="d-flex">
                                    <div style={{ width: 30 }}>
                                        <i class="fa-duotone fa-boxes-packing"></i>
                                    </div>
                                    <div>
                                        <span className="ms-1 d-none d-sm-inline">Nhà cung cấp</span>
                                    </div>
                                </div>
                                <div>
                                    <i className="fa-solid fa-angle-right"></i>
                                </div>
                            </Nav.Link>
                        </Nav.Item>
                        // : ''
                    }

                    {
                        // (roleId == 1 || roleId == 2) ?
                        <Nav.Item className="mb-2">
                            <Nav.Link as={Link} to="/cac-kho-hang"
                                className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                style={{ width: 180 }}
                            >
                                <div className="d-flex">
                                    <div style={{ width: 30 }}>
                                        <i className="fa-sharp fa-solid fa-warehouse"></i>
                                    </div>
                                    <div>
                                        <span className="ms-1 d-none d-sm-inline">Kho hàng</span>
                                    </div>
                                </div>
                                <div>
                                    <i className="fa-solid fa-angle-right"></i>
                                </div>
                            </Nav.Link>
                        </Nav.Item>
                        // : ''
                    }

                    {
                        // (roleId == 1 || roleId == 2) ?
                        <Nav.Item className="mb-2">
                            <Nav.Link as={Link} to="/ben-van-chuyen"
                                className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                style={{ width: 180 }}
                            >
                                <div className="d-flex">
                                    <div style={{ width: 30 }}>
                                        <i class="fa-duotone fa-truck"></i>
                                    </div>
                                    <div>
                                        <span className="ms-1 d-none d-sm-inline">Bên vận chuyển</span>
                                    </div>
                                </div>
                                <div>
                                    <i className="fa-solid fa-angle-right"></i>
                                </div>
                            </Nav.Link>
                        </Nav.Item>
                        // : ''
                    }

                    {
                        (roleId == 1) ?
                            <Nav.Item className="mb-2">
                                <Nav.Link as={Link} to="/du-an"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i class="fa-solid fa-diagram-project"></i>
                                        </div>
                                        <div>
                                            <span className="ms-1 d-none d-sm-inline">Dự án</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className="fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }


                    {
                        roleId == 1 ?
                            <Nav.Item className="mb-2">
                                <Nav.Link as={Link} to="/quan-ly-tai-khoan"
                                    className="align-middle sidebar-item text-sidebar px-0 d-flex justify-content-between"
                                    style={{ width: 180 }}
                                >
                                    <div className="d-flex">
                                        <div style={{ width: 30 }}>
                                            <i className="fa-xl fa-duotone fa-file-doc "></i>
                                        </div>
                                        <div>
                                            <span className="ms-1 d-none d-sm-inline">Quản lý tài khoản</span>
                                        </div>
                                    </div>
                                    <div>
                                        <i className="fa-solid fa-angle-right"></i>
                                    </div>
                                </Nav.Link>
                            </Nav.Item>
                            : ''
                    }
                </Nav>
            </div>
        </Col>
    );
};

export default Sidebar;
