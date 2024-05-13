import { Container, Row, Col } from 'react-bootstrap';
import Login from '../views/pages/Login';

const AppRoutes = () => {
  return (
    <>
      <Routes
         Route
        path="/dang-nhap"
            element={
                <Container fluid>
                    <Login />
            }
        Routes/>
      
    </>
  );
};

export default AppRoutes;   