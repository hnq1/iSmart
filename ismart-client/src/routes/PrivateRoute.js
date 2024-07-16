import { Routes, Route } from 'react-router-dom';
import { useContext, useEffect, useState } from 'react';
import { UserContext } from '../context/UserContext';
import Alert from 'react-bootstrap/Alert';
import Button from 'react-bootstrap/Button';


const PrivateRoute = (props) => {
    const { user } = useContext(UserContext);
    const [show, setShow] = useState(true);
    if (!user || !user.auth) {
        return <>
            <div
                className="access-denied "
            >
                <h1>Bạn không có quyền truy cập vào đây</h1>
            </div>
        </>
    }

    return (
        <>
            {props.children}
        </>
    )
}

export default PrivateRoute;