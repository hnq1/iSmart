import { useEffect, useState } from "react";
import { Modal, Button, Table } from "react-bootstrap"
import { fetchHistoryGood } from "~/services/GoodServices";
import { formatDate } from "~/validate";


const ModalGoodHistory = ({ isShow, dataGood, handleClose }) => {
    const [goodHistory, setGoodHistory] = useState([]);

    useEffect(() => {
        if (dataGood.goodsId) {
            getHistoryGood();
        }
    }, [dataGood])

    const getHistoryGood = async () => {
        let res = await fetchHistoryGood(dataGood.goodsId);
        console.log(res);
        setGoodHistory(res);

    }
    const handleCloseModal = () => {
        handleClose();
    }

    const handleReset = () => {

    }



    return (<>
        <Modal show={isShow} onHide={handleCloseModal} size="xl">
            <Modal.Header closeButton>
                <Modal.Title>Lịch sử tồn hàng  <br /><span style={{ color: "green" }}>Hàng: {dataGood.goodsName}</span></Modal.Title>

            </Modal.Header>
            <Modal.Body>
                <Table className="table text-center table-border table-hover  border-primary table-sm " style={{ maxHeight: '200px', overflow: 'auto' }}>
                    <thead className='sticky-top' style={{ zIndex: 5 }}>
                        <tr>
                            <th className="align-middle text-nowrap">Mã N/X/KK</th>
                            <th className="align-middle text-nowrap">Nhân viên</th>
                            <th className="align-middle textColor text-nowrap">Hoạt động</th>
                            <th className="align-middle text-nowrap">Số lượng thay đổi</th>
                            <th className="align-middle text-nowrap">Số lượng tồn kho</th>
                            <th className="align-middle text-nowrap">Ngày ghi nhận</th>
                        </tr>
                    </thead>
                    <tbody>
                        {goodHistory && goodHistory.length > 0 &&
                            goodHistory.map((g, index) => (
                                <tr style={{ backgroundColor: index % 2 === 0 ? "red" : "blue" }} key={`goodHistory${index}`} >
                                    <td className="align-middle text-color-primary">{g.orderCode}</td>
                                    <td className="align-middle text-color-primary">{g.userName}</td>
                                    <td className="align-middle text-color-primary">{g.actionType}</td>
                                    <td className="align-middle text-color-primary">{g.quantityDifferential}</td>
                                    <td className="align-middle text-color-primary">{g.quantity}</td>
                                    <td className="align-middle text-color-primary">{formatDate(g.date)}</td>


                                </tr>
                            ))
                        }
                    </tbody>
                </Table>
            </Modal.Body>

            <Modal.Footer>

            </Modal.Footer>
        </Modal>
    </>)
}

export default ModalGoodHistory