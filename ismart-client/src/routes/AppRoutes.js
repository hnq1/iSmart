import { Routes, Route } from 'react-router-dom';
import {
    MDBContainer,
    MDBNavbar,
    MDBNavbarBrand,
    MDBNavbarToggler,
    MDBIcon,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBNavbarLink,
    MDBDropdown,
    MDBDropdownToggle,
    MDBDropdownMenu,
    MDBDropdownItem,
    MDBDropdownLink,
    MDBCollapse,
    MDBRipple,
    MDBBadge,
    MDBInput,
    MDBListGroup,
    MDBListGroupItem
} from 'mdb-react-ui-kit';
import Login from '../views/pages/authentication/Login';
import ForgotPassword from '../views/pages/authentication/ForgotPassword';
import ChangePassword from '../views/pages/authentication/ChangePassword';
import NavbarCom from '../views/components/NavbarCom';
import GoodList from '../views/goods/GoodList';
import SupplierList from '../views/suppliers/SuppliersList';
import StorageList from '../views/storages/StorageList';
import CategoryList from '../views/categories/CategoryList';
import ImportOrderList from '../views/importOrders/ImportOrdersList';
import ExportOrderList from '../views/exportOrders/ExportOrderList';
import StockTakeList from '~/views/stocktake/StockTakeList';
import DeliveryList from '~/views/deliveries/ListDelivery';
import Sidebar from '../views/components/Sidebar';
import ListAccount from '~/views/accounts/AccountList';
import ProjectList from '~/views/project/ProjectList';
import { Container, Row, Col } from 'react-bootstrap';
import Doashboard from '~/views/doashboard/Doashboard';
import PrivateRoute from './PrivateRoute';
const AppRoutes = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    return (
        <>
            <Routes>
                <Route
                    path="/"
                    element={
                        <Container fluid>
                            <NavbarCom />
                            <Login />
                        </Container>
                    }
                />
                <Route
                    path="/dang-nhap"
                    element={
                        <Container fluid>
                            <NavbarCom />
                            <Login />
                        </Container>
                    }
                />
                <Route
                    path="/quen-mat-khau"
                    element={
                        <Container fluid>
                            <NavbarCom />
                            <ForgotPassword />
                        </Container>
                    }
                />

                <Route path='/doi-mat-khau'
                    element={

                        <Container fluid>
                            <NavbarCom />
                            <ChangePassword />
                        </Container>

                    }

                />


                <Route
                    path="/nha-cung-cap"
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <SupplierList />
                                    </MDBCollapse>

                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                />

                <Route
                    path="/cac-kho-hang"
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <StorageList />
                                    </MDBCollapse>
                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                />

                <Route
                    path="/cac-danh-muc"
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <CategoryList />
                                    </MDBCollapse>

                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                />
                <Route
                    path="/cac-lo-hang-nhap"
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ImportOrderList />
                                    </MDBCollapse>

                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                />

                <Route
                    path="/cac-lo-hang-xuat"
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ExportOrderList />
                                    </MDBCollapse>

                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                />
                <Route path='/thong-ke'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <Doashboard className="overflow-auto" />
                                    </MDBCollapse>

                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }

                >

                </Route >
                <Route path='/ben-van-chuyen'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <DeliveryList />
                                    </MDBCollapse>
                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }

                ></Route>
                <Route path='/du-an'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ProjectList />
                                    </MDBCollapse>
                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }

                ></Route>
                <Route path='/kiem-ke'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <StockTakeList />
                                    </Col>
                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }
                >
                </Route >
                <Route path='/danh-sach-mat-hang'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />
                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <GoodList />
                                    </MDBCollapse>
                                </Row>
                            </MDBContainer>
                        </PrivateRoute>
                    }

                />
                <Route path='/quan-ly-tai-khoan'
                    element={
                        <PrivateRoute>
                            <MDBContainer className="d-flex justify-content-center">
                                <Row className="flex-nowrap">
                                    <Sidebar />
                                    <MDBCollapse className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ListAccount />
                                    </MDBCollapse>
                                </Row>
                            </MDBContainer >
                        </PrivateRoute>
                    }

                />
            </Routes >

        </>
    )
}

export default AppRoutes;