import { useEffect, useState } from "react";
import { Modal, Button } from "react-bootstrap"
import { toast } from 'react-toastify';
import { EditStorage } from "~/services/StorageServices";
import { validatePhone, validateText, validateTextRequired, removeWhiteSpace } from "~/validate";


const ModelEditStorage = ({ isShow, handleClose, dataUpdateStorage, updateTableStorage }) => {
    const [storageName, setStorageName] = useState("");
    const [storageAddress, setStorageAddress] = useState("");
    const [storagePhone, setStoragePhone] = useState("");
    useEffect(() => {
        if (isShow) {
            setStorageName(dataUpdateStorage.storageName);
            setStorageAddress(dataUpdateStorage.storageAddress);
            setStoragePhone(dataUpdateStorage.storagePhone);
        }
    }, [dataUpdateStorage])

    const handleSave = async () => {

        if (!validatePhone.test(storagePhone.trim())) {
            toast.error("Định dạng số điện thoại sai");
        }

        else if (!validateTextRequired.test(storageName)) {
            toast.error("Tên không được trống và chứa ký tự đặc biệt");
        } else if (!validateText.test(storageAddress)) {
            toast.error("Địa chỉ không được chứa ký tự đặc biệt");
        }

        else {
            let res = await EditStorage(dataUpdateStorage.storageId, removeWhiteSpace(storageName), removeWhiteSpace(storageAddress), storagePhone);
            toast.success("Sửa thông tin nhà cung cấp thành công", {
                className: 'toast-success',
            });
            updateTableStorage();
            handleClose();
        }
    }

    const handleReset = () => {

        setStorageName(dataUpdateStorage.storageName);
        setStorageAddress(dataUpdateStorage.storageAddress ? dataUpdateStorage.storageAddress : "");
        setStoragePhone(dataUpdateStorage.storagePhone ? dataUpdateStorage.storagePhone : "");

    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }

    return (<>
        <Modal show={isShow} onHide={handleCloseModal}>
            <Modal.Header closeButton>
                <Modal.Title>Sửa thông tin nhà cung cấp</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <div className="form-group mb-3">
                        <label >Tên kho hàng</label>
                        <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" placeholder="Tên kho hàng" value={storageName} onChange={(event) => setStorageName(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Địa chỉ</label>
                        <input type="text" className="form-control inputCSS" placeholder="Địa chỉ" value={storageAddress} onChange={(event) => setStorageAddress(event.target.value)} />
                    </div>
                    <div className="form-group mb-3">
                        <label >Số điện thoại nhà cung cấp</label>
                        <input type="text" className="form-control inputCSS" placeholder="0123xxx" value={storagePhone} onChange={(event) => setStoragePhone(event.target.value)} />
                    </div>



                </div>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleReset}>
                    Xóa thông tin thay đổi
                </Button>
                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave}>
                    Lưu thay đổi
                </Button>
            </Modal.Footer>
        </Modal>
    </>)
}

export default ModelEditStorage;