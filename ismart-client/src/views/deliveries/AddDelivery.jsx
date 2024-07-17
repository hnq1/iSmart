import { useState } from "react";
import { Modal, Button } from "react-bootstrap"
import { toast } from 'react-toastify';
import { createNewDelivery } from "~/services/DeliveryServices";
import { validateEmail, validatePhone, validateText, validateTextRequired, removeWhiteSpace } from "~/validate";

const ModelAddDelivery = ({ isShow, handleClose, updateTableSupplier }) => {
    const [nameSupplier, setNameSupplier] = useState("");

    const handleSave = async () => {
        if (!validateTextRequired.test(nameSupplier)) {
            toast.error("Tên nhà cung cấp không được để trống hoặc chứa ký tự đặc biệt");
        }
        else if (nameSupplier.trim() === '') {
            toast.error('Không được để khoảng trắng.');
        } else {
            let res = await createNewDelivery(removeWhiteSpace(nameSupplier));
            toast.success("Thêm bên vận chuyển thành công", {
                className: 'toast-success',

            });
            updateTableSupplier();
            handleCloseModal();
        }


    };

    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }
    const handleReset = () => {
        setNameSupplier("");
    }
    return (<>
        <Modal show={isShow} onHide={handleCloseModal}>
            <Modal.Header closeButton>
                <Modal.Title>Thêm bên vận chuyển</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <div className="form-group mb-3">
                        <label >Tên bên vận chuyển</label>
                        <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={nameSupplier} onChange={(event) => setNameSupplier(event.target.value)} />
                    </div>

                </div>
            </Modal.Body>
            <Modal.Footer>

                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave}>
                    Lưu
                </Button>
            </Modal.Footer>
        </Modal>
    </>)
}

export default ModelAddDelivery;