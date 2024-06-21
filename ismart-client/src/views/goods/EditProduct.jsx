import React, { useEffect, useState } from 'react';

import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import { Form, Button, Modal, Row, Col, Dropdown, DropdownButton } from 'react-bootstrap';
import { fetchAllSuppliers } from '~/services/SupplierServices';
import { fetchAllCategories } from '~/services/CategoryServices';
import { fetchAllStorages } from '~/services/StorageServices';
import uploadImage from '~/services/ImageServices';
import { toast } from 'react-toastify';

import { updateGood } from '~/services/GoodServices';
import { set } from 'lodash';


function ModalEditGood({ isShow, handleClose, dataGoodEdit, updateTable }) {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);

    const [totalCategories, setTotalCategories] = useState([]);
    const [selectedCategory, setSelectedCategory] = useState(null);
    const [selectedCategoryId, setSelectedCategoryId] = useState(null);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [goodName, setGoodName] = useState(null);
    const [goodCode, setGoodCode] = useState(null);
    const [measuredUnit, setMeasuredUnit] = useState(null);
    const [warrantyTime, setwarrantyTime] = useState(0);
    const [description, setDescription] = useState(null);
    const [stockPrice, setStockPrice] = useState(0);
    const [maxStock, setMaxStock] = useState(0);
    const [minStock, setMinStock] = useState(0);
    const [imageGood, setImageGood] = useState(null);

    const [barCode, setBarCode] = useState(null);


    useEffect(() => {
        console.log(dataGoodEdit);

        setSelectedCategory(dataGoodEdit.categoryName);
        setSelectedCategoryId(dataGoodEdit.categoryId);

        setSelectedSupplier(dataGoodEdit.supplierName);
        setSelectedSupplierId(dataGoodEdit.supplierId);

        setSelectedStorage(dataGoodEdit.storageName);
        setSelectedStorageId(dataGoodEdit.storageId);

        setStockPrice(dataGoodEdit.stockPrice);
        setMaxStock(dataGoodEdit.maxStock);
        setMinStock(dataGoodEdit.minStock);
        setMeasuredUnit(dataGoodEdit.measuredUnit);
        setGoodName(dataGoodEdit.goodsName);
        setGoodCode(dataGoodEdit.goodsCode);

        setwarrantyTime(dataGoodEdit.warrantyTime);
        setDescription(dataGoodEdit.description);

        setImageGood(dataGoodEdit.image);
        setBarCode(dataGoodEdit.barcode);

    }, [dataGoodEdit])

    useEffect(() => {
        getAllStorages();
        getAllCategories();
        getAllSuppliers();

    }, [])
    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
    }

    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }
    const getAllCategories = async () => {
        let res = await fetchAllCategories();
        setTotalCategories(res);
    }

    const handleCategoryClick = (category, event) => {
        setSelectedCategory(category.categoryName);
        setSelectedCategoryId(category.categoryId)
    }

    const getAllSuppliers = async () => {
        let res = await fetchAllSuppliers();
        setTotalSuppliers(res);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }





    const handleChooseFile = async (event) => { //validate file ảnh and size ảnh
        const file = event.target.files[0];

        // Check if file is selected
        if (!file) {
            setImageGood(null);
            return;
        }

        // Check if file type is image
        if (!file.type.startsWith('image')) {
            toast.warning("Vui lòng chọn một file ảnh.");
            setImageGood(null);
            return;
        }

        // Check file size (max 5MB)
        if (file.size > 5 * 1024 * 1024) {
            toast.warning("File ảnh quá lớn, vui lòng chọn file dưới 5MB.");
            setImageGood(null);
            return;
        }

        let res = await uploadImage(file);
        const urlImage = res.url;
        setImageGood(urlImage);
    };





    const handleGoodName = (event) => {
        setGoodName(event.target.value);
    }

    const handleGoodCode = (event) => {
        setGoodCode(event.target.value);
    }

    const handleChangeWarranty = (event) => {
        setwarrantyTime(event.target.value);
    }
    const handleUnitClick = (unit, event) => {
        setMeasuredUnit(unit);
    }
    const handleChangeDescription = (event) => {
        setDescription(event.target.value);
    }

    const handleChangeBarCode = (event) => {
        setBarCode(event.target.value);
    }

    const handleCloseModal = () => {
        handleClose();
    }
    const handleSave = async () => {
        if (warrantyTime <= 0) {/////
            toast.warning("Vui lòng chọn thời gian bảo hành lớn hơn 0");
        }
        else if (stockPrice <= 0) {///////
            toast.warning("Vui lòng nhập giá lớn hơn 0");
        }
        else if (!imageGood) {/////////
            toast.warning("Vui lòng nhập file ảnh");
        }
        else if (maxStock <= 0) {///////
            toast.warning("Vui lòng nhập maxstock lớn hơn 0");
        } else if (minStock <= 0) {//////////
            toast.warning("Vui lòng nhập minstock lớn hơn 0");
        }
        else {
            let res = await updateGood(dataGoodEdit.goodsId,
                goodName,
                goodCode,
                selectedCategoryId,
                description,
                selectedSupplierId,
                measuredUnit,
                0,
                imageGood,
                1,
                stockPrice,
                warrantyTime,
                barCode,
                selectedStorageId,
                maxStock,
                minStock);
            // console.log("RES UPDATE", res);
            updateTable();
            toast.success("Sửa mặt hàng thành công");
            handleCloseModal();
        }
    }

    const handleReset = () => {

    }
    return (
        <Modal show={isShow} onHide={handleCloseModal} size="xs">
            <Modal.Header closeButton>
                <Modal.Title>Sửa thông tin mặt hàng {dataGoodEdit.goodsName}</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <div className="body-add-new">
                    {roleId == 1 ?
                        <Row>
                            <label >Kho</label>

                            <Col md={5}>
                                <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                    {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                        <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                    ))}
                                </DropdownButton>
                            </Col>
                        </Row>
                        : ''
                    }
                    <Col md={2}>
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
                                    <span style={{ color: 'white' }}>{selectedCategory !== null ? selectedCategory : "Danh mục"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
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
                                    <span style={{ color: 'white' }}>{selectedSupplier !== null ? selectedSupplier : "Nhà cung cấp"}</span>
                                </Dropdown.Toggle>

                                <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
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
                        <Col md={5}>
                            <label >BarCode </label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={barCode} onChange={handleChangeBarCode} />
                        </Col>

                        <Col md={5}>
                            <label >Hạn bảo hành </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={warrantyTime} onChange={handleChangeWarranty} min={0} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
                        <Col md={12}>
                            <label >Thông tin chi tiết </label>
                            <input type="text" className="form-control inputCSS" aria-describedby="emailHelp" value={description} onChange={handleChangeDescription} />
                        </Col>


                    </Row>

                    <row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >Giá nhập </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={stockPrice} onChange={(e) => setStockPrice(e.target.value)} min={0} />
                        </Col>
                    </row>
                    <Row style={{ marginTop: '15px' }}>
                        <Col md={5}>
                            <label >MaxStock </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={maxStock} onChange={(e) => setMaxStock(e.target.value)} min={0} />
                        </Col>
                        <Col md={5}>
                            <label >MinStock </label>
                            <input type="number" className="form-control inputCSS" aria-describedby="emailHelp" value={minStock} onChange={(e) => setMinStock(e.target.value)} min={0} />
                        </Col>
                    </Row>
                    <Row style={{ marginTop: '15px' }}>
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



                    <Button className="ButtonRed" onClick={handleReset} style={{ marginTop: '15px' }} >
                        Xóa thông tin thay đổi
                    </Button>
                </div>
            </Modal.Body>
            <Modal.Footer>

                <Button variant="secondary" onClick={handleCloseModal}>
                    Đóng
                </Button>
                <Button variant="primary" className="ButtonCSS" onClick={handleSave} >
                    Lưu thay đổi
                </Button>
            </Modal.Footer>
        </Modal >
    );
}


export default ModalEditGood;