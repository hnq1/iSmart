import React, { useEffect, useState } from 'react';

import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { Form, Button, Modal, Row, Col, Dropdown, DropdownButton } from 'react-bootstrap';
import { fetchAllSupplierActive } from "~/services/SupplierServices";
import { fetchAllCategories } from '~/services/CategoryServices';
import { fetchAllStorages } from '~/services/StorageServices';
import uploadImage from '~/services/ImageServices';
import { addGood, addGoodinAdmin } from '~/services/GoodServices';
import { toast } from 'react-toastify';
import { select } from '@material-tailwind/react';
import { create } from 'lodash';


function ModalAddGood({ isShow, handleClose, updateTable }) {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10); // Lấy userId từ local storage


    const [totalCategories, setTotalCategories] = useState([]);
    const [selectedCategory, setSelectedCategory] = useState(null);
    const [selectedCategoryId, setSelectedCategoryId] = useState(null);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    // const [totalStorages, setTotalStorages] = useState([]);
    // const [selectedStorage, setSelectedStorage] = useState(null);
    // const [selectedStorageId, setSelectedStorageId] = useState(null);


    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);


    const [goodName, setGoodName] = useState(null);
    const [goodCode, setGoodCode] = useState(null);

    const [warrantyTime, setWarrantyTime] = useState(0);
    const [description, setDescription] = useState(null);
    const [measuredUnit, setMeasuredUnit] = useState(null);
    const [imageGood, setImageGood] = useState(null);
    const [stockPrice, setStockPrice] = useState(0);
    const [maxStock, setMaxStock] = useState(0);
    const [minStock, setMinStock] = useState(0);
    const [createdDate, setCreatedDate] = useState(null);


    const [barCode, setBarCode] = useState(null);

    useEffect(() => {
        getAllStorages();
        getAllCategories();
        getAllSuppliers();

    }, [])

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }

    // const handleStorageClick = (storage) => {
    //     setSelectedStorage(storage.storageName);
    //     setSelectedStorageId(storage.storageId);
    // }
    const getAllCategories = async () => {
        let res = await fetchAllCategories();
        setTotalCategories(res);
    }

    const handleCategoryClick = (category, event) => {
        setSelectedCategory(category.categoryName);
        setSelectedCategoryId(category.categoryId)
    }

    const getAllSuppliers = async () => {
        let res = await fetchAllSupplierActive();
        setTotalSuppliers(res);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }



    const handleChooseFile = async (event) => { //validate file ảnh and size ảnh
        const file = event.target.files[0];
        let res = await uploadImage(file)
        const urlImage = res.url;
        setImageGood(urlImage);
    }


    const handleStorageTotalClick = () => {
        setSelectedWarehouse("Tất cả Kho");
        setSelectedWarehouseId("");
    }


    const handleStorageClick = (warehouse) => {
        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
    }

    const handleGoodName = (event) => {
        setGoodName(event.target.value);
    }

    const handleGoodCode = (event) => {
        setGoodCode(event.target.value);
    }

    const handleChangeWarranty = (event) => {
        setWarrantyTime(event.target.value);
    }

    const handleChangeDescription = (event) => {
        setDescription(event.target.value);
    }

    const handleChangeBarCode = (event) => {
        setBarCode(event.target.value);
    }

    function generateRandomBarCode() {
        // Nhóm 1: Ba chữ số đầu tiên đại diện cho quốc gia
        const countryPrefix = "893"; // Ví dụ: "893" cho quốc gia Việt Nam

        // Nhóm 2: Bốn chữ số tiếp theo là doanh nghiệp
        const businessCode = "2001"; // Ví dụ: "4567" cho doanh nghiệp giả định

        // Nhóm 3: Năm chữ số tiếp theo là mã số sản phẩm
        // const productCode = "89012"; // Ví dụ: "89012" cho mã sản phẩm giả định

        const productCode = Math.floor(1000 + Math.random() * 9000).toString();

        // Nhóm 4: Số cuối cùng là số kiểm tra, tính bằng cách lấy tổng các số trước đó chia 10 lấy phần dư
        const digits = countryPrefix + businessCode + productCode;
        let sum = 0;
        for (let i = 0; i < digits.length; i++) {
            sum += parseInt(digits[i], 10);
        }
        const checkDigit = sum % 10;

        // Kết hợp tất cả các phần để tạo ra mã vạch hoàn chỉnh
        const customBarCode = `${countryPrefix}${businessCode}${productCode}${checkDigit}`;
        return customBarCode;
    }



    const handleUnitClick = (unit) => {
        setMeasuredUnit(unit);
    }

    const handleChangeCreatedDate = (event) => {
        setCreatedDate(event.target.value);
    }


    const handleCloseModal = () => {
        handleReset();
        handleClose();
    }

    const handleReset = () => {
        setSelectedCategoryId(null);
        setSelectedCategory(null);

        setSelectedWarehouse(null);
        setSelectedWarehouseId(null);

        setSelectedSupplier(null);
        setSelectedSupplierId(null);

        setBarCode(null);
        setGoodCode(null);
        setGoodName(null);

        setDescription(null);
        setWarrantyTime(0);

        setImageGood(null);
    }

    const handleSave = async () => {
        if (!goodName) {
            toast.warning("Vui lòng nhập tên mặt hàng");
        } else if (!goodCode) {
            toast.warning("Vui lòng nhập mã mặt hàng");
        } else if (!selectedCategoryId) {
            toast.warning("Vui lòng chọn danh mục");
        } else if (!selectedSupplierId) {
            toast.warning("Vui lòng chọn nhà phân phối");
        } else if (!measuredUnit) {
            toast.warning("Vui lòng chọn đơn vị");
        }
        else if (!imageGood) {
            toast.warning("Vui lòng chọn hình ảnh");
        }
        else if (warrantyTime <= 0) {
            toast.warning("Vui lòng chọn thời gian bảo hành lớn hơn 0");
        }
        else if (!imageGood) {/////
            toast.warning("Vui lòng chọn file ảnh");
        }
        else if (warrantyTime <= 0) {
            toast.warning("Vui lòng chọn thời gian bảo hành lớn hơn 0");

        }
        else if (maxStock <= 0) {///////
            toast.warning("Vui lòng nhập maxstock lớn hơn 0");
        } else if (minStock <= 0) {/////////
            toast.warning("Vui lòng nhập minstock lớn hơn 0");
        } else {
            let res;
            if (roleId === 1) {
                res = await addGoodinAdmin(selectedWarehouseId,
                    goodName, goodCode, selectedCategoryId,
                    description,
                    selectedSupplierId,
                    measuredUnit,
                    imageGood,
                    1,
                    0,
                    createdDate,
                    warrantyTime,
                    barCode,
                    maxStock,
                    minStock
                );
            } else {
                res = await addGood(userId,
                    goodName, goodCode, selectedCategoryId,
                    description,
                    selectedSupplierId,
                    measuredUnit,
                    imageGood,
                    1,
                    0,
                    createdDate,
                    warrantyTime,
                    barCode,
                    maxStock,
                    minStock
                );
            }
            // console.log("resAddProduct: ", res);
            // console.log("stockPrice: ", stockPrice);
            toast.success("Thêm mặt hàng mới thành công");
            handleCloseModal();
            updateTable();
            // console.log("resAddProduct: ", res);
        }

    }

    return (
        <Modal show={isShow} onHide={handleCloseModal} size="xs">
            <Modal.Header closeButton>
                <Modal.Title>Thêm hàng hóa mới</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    <Row style={{ display: 'flex', alignItems: 'center' }}>
                        {
                            roleId === 1 ?
                                <Col md={2}>
                                    <label >Kho</label>
                                    <DropdownButton
                                        className="DropdownButtonCSS ButtonCSSDropdown"
                                        title={selectedWarehouse !== null ? selectedWarehouse : "Tất cả Kho"}
                                        variant="success"
                                        style={{ zIndex: 999 }}
                                    >
                                        <Dropdown.Item eventKey="Tất cả Kho" onClick={handleStorageTotalClick}>Tất cả Kho</Dropdown.Item>

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
                                : ''
                        }

                        <Col md={5}></Col>

                        <Col md={3}>
                            <label >Đơn vị </label>
                            <DropdownButton
                                className="DropdownButtonCSS ButtonCSSDropdown"
                                title={measuredUnit !== null ? measuredUnit : "Chọn đơn vị"}
                                variant="success"
                                style={{ zIndex: 999 }}
                            >


                                <Dropdown.Item eventKey="Kilogram" onClick={(e) => handleUnitClick("Kg", e)}>Kilogram</Dropdown.Item>
                                <Dropdown.Item eventKey="Thùng" onClick={(e) => handleUnitClick("Thùng", e)}>Thùng</Dropdown.Item>
                            </DropdownButton>
                        </Col>

                    </Row>

                    <Row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >Tên hàng </label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={goodName} onChange={handleGoodName} />
                        </Col>

                        <Col md={5}>
                            <label >Mã hàng </label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={goodCode} onChange={handleGoodCode} />
                        </Col>
                    </Row>

                    <Row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >Danh mục</label>

                            <Dropdown style={{ position: 'relative' }}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedCategory !== null ? selectedCategory : "Danh mục"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                    {totalCategories && totalCategories.length > 0 && totalCategories.map((c, index) => (
                                        <Dropdown.Item key={`category ${index}`} eventKey={c.categoryName} onClick={(e) => handleCategoryClick(c, e)}>
                                            {c.categoryName}
                                        </Dropdown.Item>
                                    ))}
                                </Dropdown.Menu>
                            </Dropdown>
                        </Col>

                        <Col md={5}>
                            <label >Nhà cung cấp </label>
                            <Dropdown style={{ position: 'relative' }}>
                                <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                    <span style={{ color: 'white', fontWeight: 'bold' }}>{selectedSupplier !== null ? selectedSupplier : "Nhà cung cấp"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                    {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((s, index) => (
                                        <Dropdown.Item key={`supplier ${index}`} eventKey={s.supplierName} onClick={(e) => handleSupplierClick(s, e)}>
                                            {s.supplierName}
                                        </Dropdown.Item>
                                    ))}
                                </Dropdown.Menu>
                            </Dropdown>
                        </Col>

                    </Row>

                    <Row style={{ marginTop: '15px' }}>
                        <Col md={6}>
                            <label>BarCode </label>
                            <div className="input-group">
                                <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={barCode} onChange={handleChangeBarCode} />
                                <div className="input-group-append">
                                    <button className="btn btn-outline-secondary" type="button" onClick={() => setBarCode(generateRandomBarCode())}>Tạo</button>
                                </div>
                            </div>
                        </Col>

                        <Col md={5}>
                            <label >Hạn bảo hành </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={warrantyTime} onChange={handleChangeWarranty} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <Col md={12}>
                            <label >Thông tin chi tiết </label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={description} onChange={handleChangeDescription} />
                        </Col>


                    </Row>

                    <Row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >Ngày tạo </label>
                            <input type="date" className="form-control inputCSS" aria-describedby="emailHelp" value={createdDate} onChange={handleChangeCreatedDate} />
                        </Col>
                        {/* <Col md={5}>
                            <label >Giá nhập </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={stockPrice} onChange={(e) => setStockPrice(e.target.value)} />
                        </Col> */}
                    </Row>

                    <Row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >MaxStock </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={maxStock} onChange={(e) => setMaxStock(e.target.value)} />
                        </Col>
                        <Col md={5}>
                            <label >MinStock </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={minStock} onChange={(e) => setMinStock(e.target.value)} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <label >Hình ảnh </label>

                        <Col md={2}>
                            <div>
                                <input
                                    type="file"
                                    accept="image/*" // Chỉ chấp nhận các loại file ảnh
                                    onChange={handleChooseFile} // Hàm xử lý sự kiện khi người dùng chọn file
                                />
                            </div>
                        </Col>
                    </Row>

                </div>
            </Modal.Body>
            <Modal.Footer>

                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave}>
                    Thêm hàng hóa mới
                </Button>
            </Modal.Footer>
        </Modal>
    );
}

export default ModalAddGood;