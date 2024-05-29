import { useEffect, useState } from "react";
import { Modal, Button } from "react-bootstrap";
import { toast } from 'react-toastify';
import { EditAccount } from "~/services/AccountServices";
import { validatePhone, validateText, validateTextRequired, removeWhiteSpace } from "~/validate";


const ModelEditAccount = ({ isShow, handleClose, dataUpdateAccount, updateTableAccount }) => {
    const [accountName, setAccountName] = useState("");
    const [accountPhone, setAccountPhone] = useState("");
    const [accountEmail, setAccountEmail] = useState("");
    const [accountAddress, setAccountAddress] = useState("");
    const [accountRole, setAccountRole] = useState("");
    const [accountStatus, setAccountStatus] = useState("");
    useEffect(() => {
        if (isShow) {
            setAccountName(dataUpdateAccount.accountName);
            setAccountPhone(dataUpdateAccount.phone);
            setAccountEmail(dataUpdateAccount.email);
            setAccountAddress(dataUpdateAccount.address);
            setAccountRole(dataUpdateAccount.roleId);
            setAccountStatus(dataUpdateAccount.status);
        }
    }, [dataUpdateAccount])
    const handleSave = async () => {
        if (!validateTextRequired.test(accountName)) {
            toast.error("Tên không được trống và chứa ký tự đặc biệt");
        } else if (!validatePhone.test(accountPhone)) {
            toast.error("Số điện thoại không đúng định dạng");
        } else if (!validateText.test(accountAddress)) {
            toast.error("Địa chỉ không được chứa ký tự đặc biệt");
        } else if (!validateText.test(accountRole)) {
            toast.error("Vui lòng chọn quyền");
        } else if (!validateText.test(accountStatus)) {
            toast.error("Vui lòng chọn trạng thái");
        } else {
            let res = await EditAccount(dataUpdateAccount.accountId, removeWhiteSpace(accountName), removeWhiteSpace(accountPhone), removeWhiteSpace(accountEmail), removeWhiteSpace(accountAddress), removeWhiteSpace(accountRole), removeWhiteSpace(accountStatus));
            toast.success("Sửa thông tin tài khoản thành công", {
                className: 'toast-success',
            });
            updateTableAccount();
            handleClose();
        }
    }

    const handleReset = () => {
        setAccountName(dataUpdateAccount.accountName);
        setAccountPhone(dataUpdateAccount.phone);
        setAccountEmail(dataUpdateAccount.email);
        setAccountAddress(dataUpdateAccount.address);
        setAccountRole(dataUpdateAccount.roleId);
        setAccountStatus(dataUpdateAccount.status);
    }
    const handleCloseModal = () => {
        handleClose();
    }

    return (<>
        <Modal show={isShow} onHide={handleCloseModal}>
            <Modal.Header closeButton>
                <Modal.Title>Sửa thông tin tài khoản</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <div className="form-group mb-3">
                        <label >Tên tài khoản</label>
                        <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={accountName} onChange={(event) => setAccountName(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Số điện thoại</label>
                        <input type="text" className="form-control inputCSS" value={accountPhone} onChange={(event) => setAccountPhone(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Email</label>
                        <input type="text" className="form-control inputCSS" value={accountEmail} onChange={(event) => setAccountEmail(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Địa chỉ</label>
                        <input type="text" className="form-control inputCSS" value={accountAddress} onChange={(event) => setAccountAddress(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Quyền</label>
                        <input type="text" className="form-control inputCSS" value={accountRole} onChange={(event) => setAccountRole(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Trạng thái</label>
                        <input type="text" className="form-control inputCSS" value={accountStatus} onChange={(event) => setAccountStatus(event.target.value)} />
                    </div>
                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" onClick={handleSave}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal>
    </>)
}
export default ModelEditAccount;