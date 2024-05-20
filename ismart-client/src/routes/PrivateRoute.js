import { Routes, Route } from 'react-router-dom';
import { useContext, useEffect } from 'react';
import { UserContext } from '../context/UserContext';
const PrivateRoute = (props) => {
    const { user } = useContext(UserContext);
    if (user && !user.auth) {
        return <>
            <div className="access-denied">
                <div className="message">BẠN KHÔNG CÓ QUYỀN TRUY CẬP VÀO TRANG NÀY</div>
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