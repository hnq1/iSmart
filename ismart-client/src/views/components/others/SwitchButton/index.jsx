import { Form } from 'react-bootstrap';
import './SwitchButton.css'

const SwitchButton = ({ status, handleChangeStatus }) => {
    return (
        <Form>
            <Form.Check
                type="switch"
                className="custom-switch"
                id="custom-switch"
                label={status === "Active" ? "Đang hợp tác" : "Ngừng hợp tác"}
                checked={status === "Active" ? true : false}
                onChange={handleChangeStatus}
            />
        </Form>
    )
}

export default SwitchButton