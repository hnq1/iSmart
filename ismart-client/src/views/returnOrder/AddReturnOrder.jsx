import { useEffect, useState } from "react";
import { Modal, Button, Row, Col, DropdownButton, Dropdown } from "react-bootstrap"
import uploadImage from "~/services/ImageServices";
import { fetchAllStorages } from '~/services/StorageServices';
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { get } from "lodash";
import { fetchAllDelivery } from "~/services/DeliveryServices";
import ModelAddNote from "./AddNote";
import { toast } from "react-toastify";

const ModelAddReturnOrder = ({ isShow, handleClose, updateTable }) => {

    const [imageExportOrder, setImageExportOrder] = useState(null);

    const [exportCode, setExportCode] = useState('');

    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    const [totalDelivery, setTotalDelivery] = useState([]);
    const [selectedDelivery, setSelectedDelivery] = useState(null);
    const [selectedDeliveryId, setSelectedDeliveryId] = useState(null);

    const [minDate, setMinDate] = useState();
    const [selectedDate, setSelectedDate] = useState('');

    const [isShowNote, setIsShowNote] = useState(false);

    useEffect(() => {
        getAllStorages();
        getAllDelivery();
    }, [])

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }


    const handleStorageClickTotal = () => {
        setSelectedWarehouseId("");
        setSelectedWarehouse("Tất cả kho");
    }

    const handleStorageClick = async (warehouse) => {
        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
    }

    const getAllDelivery = async () => {
        let res = await fetchAllDelivery();
        setTotalDelivery(res);
    }

    const handleDeliveryClick = (delivery, event) => {
        setSelectedDelivery(delivery.deliveryName);
        setSelectedDeliveryId(delivery.deliveyId);
        console.log(delivery);
    }

    const handleChooseFile = async (event) => {
        const file = event.target.files[0];
        let res = await uploadImage(file);
        const urlImage = res.url;
        setImageExportOrder(urlImage);
    }

    const handleDateChange = (event) => {
        setSelectedDate(event.target.value);
    };
    // render rowsData
    const renderReturnData = () => {
        // return rowsData.map((data, index) => (
        //     <RowDataExportOrderManual key={index} data={rowsData[index]} index={index}
        //         updateRowData={updateRowData} deleteRowData={deleteRowData}
        //     />
        // ))


    }
    // mở modal AddRowDataExport
    const handleAddRowDataReturn = () => {
        if (selectedWarehouseId) {
            // setIsShowRowDataExport(true);
        } else {
            toast.warning("Vui lòng điền kho")
        }
    }
    const handleReset = () => {
        // reset form
    }
    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }
    return (
        <>
            <Modal show={isShow} onHide={handleCloseModal} size="xl">
                <Modal.Header closeButton>
                    <Modal.Title>Thêm lô trả hàng</Modal.Title>
                </Modal.Header>


                <Modal.Body>
                    <div className="body-add-new">
                        <Row className="align-items-center">
                            <Col md={2}>
                                <div className="form-group ">
                                    <input type="text" className="form-control inputCSS" placeholder="Mã đơn hàng" value={exportCode} onChange={(event) => setExportCode(event.target.value)} />
                                </div>
                            </Col>
                            <Col md={2}>
                                <DropdownButton
                                    className="DropdownButtonCSS ButtonCSSDropdown"
                                    title={selectedWarehouse !== null ? selectedWarehouse : "Tất cả Kho"}
                                    variant="success"
                                    style={{ zIndex: 999 }}
                                >
                                    <Dropdown.Item eventKey=""
                                        onClick={() => handleStorageClickTotal()}>Tất cả kho</Dropdown.Item>

                                    {totalWarehouse && totalWarehouse.length > 0 && totalWarehouse.map((c, index) => (
                                        <Dropdown.Item
                                            key={`warehouse ${index}`}
                                            eventKey={c.warehouseName}
                                            onClick={(e) => handleStorageClick(c, e)}
                                        >
                                            {c.warehouseName}
                                        </Dropdown.Item>
                                    ))}
                                </DropdownButton>
                            </Col>

                            <Col md={2}>
                                <div className="col-auto ButtonCSSDropdown">
                                    <button
                                        className="btn btn-success border-left-0 rounded"
                                        type="button"
                                        onClick={() => setIsShowNote(true)}
                                    >
                                        Lí do

                                    </button>
                                </div>

                            </Col>


                            <Col md={2} style={{ width: '220px' }}>
                                <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                    <Dropdown style={{ position: 'relative' }}>
                                        <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                            <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedDelivery !== null ? selectedDelivery : "Bên vận chuyển"}</span>
                                        </Dropdown.Toggle>

                                        <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                            {totalDelivery && totalDelivery.length > 0 && totalDelivery.map((s, index) => (
                                                <Dropdown.Item key={`delivery ${index}`} eventKey={s.deliveryName} onClick={(e) => handleDeliveryClick(s, e)}>
                                                    {s.deliveryName}
                                                </Dropdown.Item>
                                            ))}
                                        </Dropdown.Menu>
                                    </Dropdown>
                                </div>
                            </Col>

                            <Col md={2}>
                                <div>
                                    <input type="date" className="datepickerCSS" id="datepicker" min={minDate} value={selectedDate} onChange={handleDateChange} />
                                </div>
                            </Col>



                        </Row>

                        <Row style={{ marginTop: '20px' }}>
                            <Col md={2}>
                                <div>
                                    <input
                                        type="file"
                                        accept="image/*" // Chỉ chấp nhận các loại file ảnh
                                        onChange={handleChooseFile} // Hàm xử lý sự kiện khi người dùng chọn file
                                    />
                                </div>
                            </Col>
                            <Col md={7}>
                            </Col>
                            <Col md={3} className="mt-3">
                                <div className="ButtonCSSDropdown">
                                    <button
                                        className="btn btn-success border-left-0 rounded"
                                        type="button"
                                        onClick={handleAddRowDataReturn}
                                    ><i className="fa-solid fa-plus"></i>
                                        &nbsp;
                                        Thêm sản phẩm
                                    </button>
                                </div>
                            </Col>
                        </Row>



                        {/* <hr /> */}

                        <Row style={{ maxHeight: '400px', overflowY: 'auto' }}>
                            {renderReturnData()}

                        </Row>
                    </div>

                </Modal.Body>
                <Modal.Footer>
                    <Button variant="primary" className="ButtonCSS"
                    // onClick={handleAddReturnOrder}
                    >
                        Lưu
                    </Button>
                </Modal.Footer>
            </Modal>

            <ModelAddNote isShow={isShowNote}
                handleClose={() => setIsShowNote(false)}
            // updateTable={updateTable}
            />


        </>
    )

};

export default ModelAddReturnOrder;