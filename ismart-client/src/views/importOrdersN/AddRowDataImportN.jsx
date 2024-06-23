import { useState, useEffect } from "react";
import { Row, Col, Dropdown, Modal, Button } from "react-bootstrap";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { toast } from "react-toastify";
import { getUserIdWarehouse } from "~/services/UserWarehouseServices";
import { set } from "lodash";
import { fetchGoodsWithSupplier } from "~/services/GoodServices";
import { fetchAllSupplierActive } from "~/services/SupplierServices";

const AddRowDataImportOrderN = ({ selectedStorageId, isShow, handleClose, onChange }) => {

    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [selectedImportId, setSelectedImportId] = useState(null);
    const [selectedBatchCode, setSelectedbatchCode] = useState(null);
    const [manufactureDate, setManufactureDate] = useState(null);
    const [expiryDate, setExpiryDate] = useState(null);
    const [costPrice, setCostPrice] = useState(0);
    const [quantity, setQuantity] = useState(0);

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(0);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [SupplierId, setSupplierId] = useState(null);

    useEffect(() => {
        getAllGoods();
        getAllSuppliers();
    }, [selectedStorageId, SupplierId])

    // useEffect(() => {
    //     console.log("setbatchCode:", setbatchCode);
    // }, [setbatchCode]);
    const getAllGoods = async () => {
        if (roleId === 1) {
            if (SupplierId) {
                let res = await fetchGoodsWithSupplier(
                    SupplierId
                );

                setTotalGoods(res);
            }
        } else if (roleId === 4 || roleId === 3 || roleId === 2) {
            // Nhân viên: lấy danh sách kho cụ thể mà họ quản lý
            // let rs = await getUserIdWarehouse(userId);
            // Lấy ra tất cả mã sản phẩm của kho và nhà cung cấp
            if (SupplierId !== null) {
                let res = await fetchGoodsWithSupplier(
                    SupplierId
                );
                // console.log("res:", res);
                setTotalGoods(res);
            }
        }
    }

    const handleConfirmRowData = () => {
        if (!selectedGoodCode) {
            toast.warning("Vui lòng chọn sản phẩm")
        } else if (quantity <= 0 || !quantity) {
            toast.warning("Vui lòng nhập số lượng lớn hơn 0")
        } else if (costPrice <= 0 || !costPrice) {
            toast.warning("Vui lòng nhập giá tiền lớn hơn 0")
        } else {
            onChange({
                batchCode: selectedBatchCode,
                costPrice: costPrice,
                expiryDate: expiryDate,
                goodsCode: selectedGoodCode,
                goodsId: selectedGoodId,
                importId: selectedImportId,
                manufactureDate: manufactureDate,
                quantity: quantity,
                supplierId: SupplierId,
                supplierName: selectedSupplier,
                totalOneGoodPrice: costPrice * quantity
            });
            // console.log("supplierName: ", selectedSupplier);
            handleCloseModal();
        }

    }

    const getAllSuppliers = async () => {
        let res = await fetchAllSupplierActive();
        setTotalSuppliers(res);
        // console.log("getAllSuppliers:", res);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSupplierId(supplier.supplierId);
    }
    const handleGoodClick = (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
        // console.log("selectedGoodCode: ", good.goodsId);
    }

    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    }

    const handleChangePrice = (event) => {
        setCostPrice(event.target.value);
    }

    const handleCloseModal = () => {
        handleReset();
        handleClose();

    }

    const handleReset = () => {
        setSelectedSupplier(null);
        setSelectedGoodCode(null);
        setQuantity(0);
        setCostPrice(0);
        setSelectedbatchCode(null);
        setManufactureDate(null);
        setExpiryDate(null);
    }


    return (
        <Modal show={isShow} onHide={handleCloseModal} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Chọn sản phẩm</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Row>

                    <Col md={3}>
                        <div className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                            <Dropdown style={{}}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedSupplier !== null ? selectedSupplier : "Chọn nhà cung cấp"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} >
                                    {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((s, index) => (
                                        <Dropdown.Item key={`supplier ${index}`} eventKey={s.supplierName} onClick={(e) => handleSupplierClick(s, e)}>
                                            {s.supplierName}
                                        </Dropdown.Item>
                                    ))}
                                </Dropdown.Menu>
                            </Dropdown>
                        </div>
                    </Col>

                    <Col md={3}>
                        <label>Mã sản phẩm</label>
                        <div>
                            <Dropdown style={{ position: 'relative' }}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white' }}>{selectedGoodCode !== null ? selectedGoodCode : "Mã Sản phẩm"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                    {totalGoods && totalGoods.length > 0 && totalGoods.map((g, index) => (
                                        <Dropdown.Item key={`good ${index}`} eventKey={g.goodsCode} onClick={(e) => handleGoodClick(g, e)}>
                                            {g.goodsCode}
                                        </Dropdown.Item>
                                    ))}

                                    {totalGoods.length === 0 && (
                                        <Dropdown.Item key="empty" disabled>
                                            Không có mặt hàng
                                        </Dropdown.Item>
                                    )}
                                </Dropdown.Menu>
                            </Dropdown>

                        </div>
                    </Col>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Số lượng</label>
                            <input type="number" className="form-control inputCSS" value={quantity} onChange={handleChangeQuantity} />
                        </div>
                    </Col>
                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Giá tiền</label>
                            <input type="number" className="form-control inputCSS" value={costPrice} onChange={handleChangePrice} />
                        </div>
                    </Col>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Tổng giá tiền</label>
                            <input type="number" className="form-control inputCSS" value={costPrice * quantity} disabled />
                        </div>
                    </Col>

                    <Col md={2}>
                        <div className="form-group mb-3">
                            <label >Mã lô hàng</label>
                            <input type="text" className="form-control inputCSS" value={selectedBatchCode} onChange={(e) => setSelectedbatchCode(e.target.value)} />
                        </div>
                    </Col>

                    <Col md={3}>
                        <div className="form-group mb-3">
                            <label >Ngày sản xuất</label>
                            <input type="date" className="form-control inputCSS" value={manufactureDate} onChange={(e) => setManufactureDate(e.target.value)} />
                        </div>
                    </Col>

                    <Col md={3}>
                        <div className="form-group mb-3">
                            <label >Ngày hết hạn</label>
                            <input type="date" className="form-control inputCSS" value={expiryDate} onChange={(e) => setExpiryDate(e.target.value)} />
                        </div>
                    </Col>



                </Row>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="primary" className="ButtonCSS" onClick={handleConfirmRowData}>
                    Xác nhận nhập kho
                </Button>
            </Modal.Footer>
        </Modal >
    )
}


export default AddRowDataImportOrderN;