import { Routes, Route } from 'react-router-dom';
// import NotFoundPage from './NotFoundPage';
import Login from '../views/pages/authentication/Login';
import ForgotPassword from '../views/pages/authentication/ForgotPassword';
import ChangePassword from '../views/pages/authentication/ChangePassword';
import NavbarCom from '../views/components/NavbarCom';
import GoodList from '../views/goods/GoodList';
import WarehouseThree from '../views/warehousethreejs/warehousethree';
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
import { Navigate } from 'react-router-dom';
import { useContext } from 'react';
const AppRoutes = () => {
    const roleId = parseInt(localStorage.getItem('RoleId'), 10);

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
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <SupplierList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                />

                <Route
                    path="/cac-kho-hang"
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <StorageList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                />

                <Route
                    path="/cac-danh-muc"
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <CategoryList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                />
                <Route
                    path="/cac-lo-hang-nhap"
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ImportOrderList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                />

                <Route
                    path="/cac-lo-hang-xuat"
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ExportOrderList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                />
                <Route path='/thong-ke'
                    element={
                        // roleId === 1 || roleId === 2 || roleId === 4 ? (
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <Doashboard className="overflow-auto" />
                                    </Col>
                                </Row>
                            </Container>
                        </PrivateRoute>
                        // ) : (
                        //     <Navigate to="/NotFoundPage" replace />
                        // )
                    }

                >

                </Route >
                <Route path='/ben-van-chuyen'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <DeliveryList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }

                ></Route>
                <Route path='/du-an'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary">
                                        <NavbarCom />
                                        <ProjectList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }

                ></Route>
                <Route path='/kiem-ke'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />

                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <StockTakeList />
                                    </Col>
                                </Row>
                            </Container></PrivateRoute>
                    }
                >
                </Route >

                <Route path='/danh-sach-mat-hang'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />
                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <GoodList />
                                    </Col>
                                </Row>
                            </Container>
                        </PrivateRoute>
                    }
                />
                <Route path='/kho-3d'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />
                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <WarehouseThree />
                                    </Col>
                                </Row>
                            </Container>
                        </PrivateRoute>
                    }
                />

                <Route path='/quan-ly-tai-khoan'
                    element={
                        <PrivateRoute>
                            <Container fluid>
                                <Row className="flex-nowrap">
                                    <Sidebar />
                                    <Col className="py-3 background-primary overflow-auto">
                                        <NavbarCom />
                                        <ListAccount />
                                    </Col>
                                </Row>
                            </Container>
                        </PrivateRoute>
                    }
                />
            </Routes >

        </>
    )
}

export default AppRoutes;