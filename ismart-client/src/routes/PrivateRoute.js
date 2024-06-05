import { Routes, Route } from 'react-router-dom';
import { useContext, useEffect, useState } from 'react';
import { UserContext } from '../context/UserContext';
import Alert from 'react-bootstrap/Alert';
import Button from 'react-bootstrap/Button';


const PrivateRoute = (props) => {
    const { user } = useContext(UserContext);
    const [show, setShow] = useState(true);
    if (user && !user.auth) {
        return <>
            <div className="access-denied">
                <Alert show={show} variant="success">
                    <Alert.Heading>My Alert (còn cái Nịt)</Alert.Heading>
                    <p>
                        Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget
                        lacinia odio sem nec elit. Cras mattis consectetur purus sit amet
                        fermentum.
                    </p>
                    <hr />
                    <div className="d-flex justify-content-end">
                        <Button onClick={() => setShow(false)} variant="outline-success">
                            Close me
                        </Button>
                    </div>
                </Alert>

                {!show && <Button onClick={() => setShow(true)}>Show Alert</Button>}
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