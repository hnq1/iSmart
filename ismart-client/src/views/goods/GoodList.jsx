import React, { useEffect, useState } from 'react';
import { Table, DropdownButton, Col } from 'react-bootstrap';
import { fetchGoodsWithFilter } from '~/services/GoodServices';
import Dropdown from 'react-bootstrap/Dropdown';
import { fetchAllCategories } from '~/services/CategoryServices';
import { fetchAllSuppliers } from '~/services/SupplierServices';
import { fetchAllStorages } from '~/services/StorageServices';
import { CustomToggle, CustomMenu } from '../components/others/Dropdown';
import ReactPaginate from 'react-paginate';
import { formatDate, formattedAmount } from '~/validate';
import ModalGoodHistory from './GoodHistory';
import ModalEditGood from './EditProduct';
import ModalAddGood from './AddProduct';
import { fetchUserByUserId } from '~/services/UserServices';

import ModalZoomImage from "../components/others/Image/ModalZoomImage";


function MyTable() {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);;
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [listGoods, setListGoods] = useState({});
    const [totalCategories, setTotalCategories] = useState([]);
    const [selectedCategory, setSelectedCategory] = useState(null);
    const [selectedCategoryId, setSelectedCategoryId] = useState(null);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [totalPages, setTotalPages] = useState(5);
    const [currentPage, setcurrentPage] = useState(0);

    const [keywordSearch, setKeywordSearch] = useState("");

    const [sortedByPriceId, setSortedByPriceId] = useState();
    const [sortedByPriceName, setSortedByPriceName] = useState("");
    const [sortOptions, setSortOptions] = useState([]);

    const [isShowGoodHistory, setIsShowGoodHistory] = useState(false);
    const [dataGood, setDataGood] = useState({});

    const [isShowModalZoomImage, setIsShowModalZoomImage] = useState(false);
    const [imageUrl, setImageUrl] = useState("");

    const [isShowModelEditGood, setIsShowModelEditGood] = useState(false);
    const [dataGoodEdit, setDataGoodEdit] = useState([]);

    const [isShowModelAddGood, setIsShowModelAddGood] = useState(false);

    useEffect(() => {
        let res = getGoods(1, selectedStorageId, selectedCategoryId, selectedSupplierId);
        getAllCategories();
        getAllSuppliers();
        getAllStorages();
        setSortOptions([{ idSort: null, nameSort: "Giá" },
        { idSort: 1, nameSort: "Giá Từ bé đến lớn" },
        { idSort: 2, nameSort: "Giá Từ lớn đến bé" }]);

        if (roleId !== 2 || roleId !== 4) {
            getStorageIdByUser();
        }
    }, [])

    useEffect(() => {
        getGoods(1, selectedStorageId, selectedCategoryId, selectedSupplierId, sortedByPriceId, keywordSearch);
        setcurrentPage(0);
    }, [selectedStorage, selectedCategory, selectedSupplier, sortedByPriceId])

    const getStorageIdByUser = async () => {
        let res = await fetchUserByUserId(userId);
        setSelectedStorageId(res.storageId);
        setSelectedStorage(res.storageName);
    }

    const getGoods = async (page, storageId, categoryId, supplierId, sortPrice, wordSearch) => {
        let res = await fetchGoodsWithFilter(page, storageId, categoryId, supplierId, sortPrice, wordSearch);
        setListGoods(res.data);
        setTotalPages(res.totalPages);
        setcurrentPage(page - 1);
        return res;
    }

    const getAllCategories = async () => {
        let res = await fetchAllCategories();
        setTotalCategories(res);
    }

    const getAllSuppliers = async () => {
        let res = await fetchAllSuppliers();
        setTotalSuppliers(res);
    }

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
    }

    const handleCategoryClick = (category, event) => {
        setSelectedCategory(category.categoryName);
        setSelectedCategoryId(category.categoryId)
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }

    const handleSupplierClickTotal = () => {
        setSelectedSupplier("Nhà cung cấp");
        setSelectedSupplierId("");
    }

    const handleCategoryClickTotal = () => {
        setSelectedCategory("Các danh mục");
        setSelectedCategoryId("");
    }

    const handleStorageClickTotal = () => {
        setSelectedStorage("Tất cả kho");
        setSelectedStorageId("");
    }

    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }

    const handlePageClick = (event) => {
        setcurrentPage(+event.selected);
        getGoods(+event.selected + 1, selectedStorageId, selectedCategoryId, selectedSupplierId, sortedByPriceId, keywordSearch);
    }

    const handleSearch = () => {
        getGoods(1, selectedStorageId, selectedCategoryId, selectedSupplierId, sortedByPriceId, keywordSearch);
    }

    const handleSortPirceClick = (sort) => {
        setSortedByPriceId(sort.idSort);
        setSortedByPriceName(sort.nameSort);
        getGoods(1, selectedStorageId, selectedCategoryId, selectedSupplierId, sort.idSort, keywordSearch);
    }

    const handleShowGoodHistory = (good) => {
        setIsShowGoodHistory(true);
        setDataGood(good);
        console.log(good);
    }

    const handleZoomImage = (image) => {
        setIsShowModalZoomImage(true);
        setImageUrl(image);
    }

    const showModelEditGood = (good) => {
        setIsShowModelEditGood(true);
        setDataGoodEdit(good);
    }

    const updateTable = () => {
        getGoods(currentPage + 1);
    }
    return (
        <div className="container" style={{ maxWidth: "1600px" }}>
            <div className="row justify-content-center">
                <div className="col-sm-12">
                    <h5 style={{ color: '#a5a2ad' }}>Quản lý hàng hóa</h5>
                    <div className="row no-gutters my-3 ">
                        {roleId == 2 || roleId == 4 || roleId == 1 ? <div className="col-2">
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                <Dropdown.Item eventKey="" onClick={() => handleStorageClickTotal()}>Tất cả kho</Dropdown.Item>
                                {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                    <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </div> : <Col md={2}>
                            <input type="text" className="form-control inputCSS"
                                aria-describedby="emailHelp" value={selectedStorage} disabled /></Col>}

                        <div className="col-2">
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={sortedByPriceName ? sortedByPriceName : "Giá"} variant="success" style={{ zIndex: 999 }}>
                                {sortOptions.map((s, index) => (
                                    <Dropdown.Item key={`sort ${index}`} eventKey={s.nameSort} onClick={(e) => handleSortPirceClick(s, e)}>{s.nameSort}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </div>

                        <div className="col">

                        </div>
                        <div className="col">
                            <div className="input-group">
                                <input
                                    className="form-control border-secondary inputCSS"
                                    type="search"
                                    placeholder='Tìm kiếm...'
                                    id="example-search-input4"
                                    onChange={(event) => setKeywordSearch(event.target.value)}

                                    readOnly={false}
                                />
                                <div className="input-group-append">
                                    <button
                                        className="btn btn-outline-secondary border-left-0 rounded-0 rounded-right"
                                        type="button"
                                        onClick={handleSearch}
                                    >
                                        <i className="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        {roleId !== 4 ? <div className="col-auto">

                            <button
                                className="btn btn-success border-left-0 rounded ButtonCSS"
                                type="button"
                                onClick={() => setIsShowModelAddGood(true)}
                            ><i className="fa-solid fa-plus"></i>
                                &nbsp;Thêm hàng hóa
                            </button>

                        </div> : ''}
                    </div>

                    <div className=" table-responsive" style={{ overflowY: 'auto', overflowX: 'auto', zIndex: 3 }}>
                        <Table className="table text-center table-border table-hover  border-primary table-sm " >

                            <thead className='sticky-top' style={{ zIndex: 5 }}>
                                <tr>
                                    <th className="align-middle text-nowrap">STT</th>
                                    <th className="align-middle text-nowrap">Mã SP</th>
                                    <th className="align-middle textColor text-nowrap">TÊN SẢN PHẨM</th>
                                    <th className="align-middle text-nowrap">HÌNH ẢNH</th>

                                    <th className="align-middle text-nowrap " style={{ overflow: 'visible' }}>
                                        <Dropdown style={{ position: 'relative' }}>
                                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                                <span style={{ color: 'white' }}>{selectedSupplier !== null ? selectedSupplier : "Nhà cung cấp"}</span>
                                            </Dropdown.Toggle>

                                            <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                                <Dropdown.Item onClick={handleSupplierClickTotal}>
                                                    Nhà cung cấp
                                                </Dropdown.Item>
                                                {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((s, index) => (
                                                    <Dropdown.Item key={`supplier ${index}`} eventKey={s.supplierName} onClick={(e) => handleSupplierClick(s, e)}>
                                                        {s.supplierName}
                                                    </Dropdown.Item>
                                                ))}
                                            </Dropdown.Menu>
                                        </Dropdown>
                                    </th>

                                    <th className="align-middle text-nowrap" style={{ overflow: 'visible' }}>
                                        <Dropdown style={{ position: 'relative' }}>
                                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                                <span style={{ color: 'white' }}>{selectedCategory !== null ? selectedCategory : "Danh mục"}</span>
                                            </Dropdown.Toggle>

                                            <Dropdown.Menu className="ButtonCSSDropdown" as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }}>
                                                <Dropdown.Item onClick={handleCategoryClickTotal}>
                                                    Các danh mục
                                                </Dropdown.Item>
                                                {totalCategories && totalCategories.length > 0 && totalCategories.map((c, index) => (
                                                    <Dropdown.Item key={`category ${index}`} eventKey={c.categoryName} onClick={(e) => handleCategoryClick(c, e)}>
                                                        {c.categoryName}
                                                    </Dropdown.Item>
                                                ))}
                                            </Dropdown.Menu>
                                        </Dropdown>
                                    </th>


                                    <th className="align-middle text-nowrap">TỒN KHO</th>
                                    <th className="align-middle text-nowrap">ĐƠN VỊ</th>
                                    <th className="align-middle text-nowrap">NGÀY NHẬP</th>
                                    <th className='align-middle text-nowrap'>GIÁ NHẬP</th>
                                    <th className="align-middle text-nowrap">HẠN<br />BẢO HÀNH</th>
                                    <th className="align-middle text-nowrap">BARCODE</th>
                                    <th className="align-middle text-nowrap">LỊCH SỬ<br />HÀNG HÓA</th>


                                </tr>
                            </thead>

                            <tbody >
                                {listGoods && listGoods.length > 0 &&
                                    listGoods.map((g, index) => (
                                        <tr key={`goods${index}`}>
                                            <td className="align-middle text-color-primary">{index + 1}</td>
                                            <td className="align-middle text-color-primary">{g.goodsCode}</td>
                                            <td className="align-middle">{g.goodsName}</td>
                                            <td className="align-middle" onClick={() => handleZoomImage(g.image)}>
                                                <img src={g.image} alt="Image" style={{ width: '50px', height: '50px' }} />
                                            </td>
                                            <td className="align-middle">{g.supplierName}</td>
                                            <td className="align-middle">{g.categoryName}</td>
                                            <td className="align-middle">{g.inStock}</td>
                                            <td className="align-middle">{g.measuredUnit}</td>
                                            <td className="align-middle">{formatDate(g.createdDate ? g.createdDate : "2024-03-18T04:10:59.041Z")}</td>
                                            <td className='align-middle'>{formattedAmount(g.stockPrice)}</td>
                                            <td className="align-middle">{g.warrantyTime + " Tháng "}</td>
                                            <td className="align-middle">{g.barcode}</td>
                                            <td className="align-middle"><i className="fa-solid fa-clock-rotate-left actionButtonCSS" onClick={() => handleShowGoodHistory(g)}></i></td>
                                            {roleId !== 4 ? <td className="align-middle " style={{ padding: '10px' }}>
                                                <i className="fa-duotone fa-pen-to-square actionButtonCSS" onClick={() => showModelEditGood(g)}></i>
                                            </td> : ''}
                                        </tr>
                                    ))

                                }

                            </tbody>
                        </Table>


                    </div>
                    <div className="d-flex justify-content-center  mt-3">
                        <ReactPaginate
                            breakLabel="..."
                            nextLabel="Sau >"
                            onPageChange={handlePageClick}
                            pageRangeDisplayed={5}
                            pageCount={totalPages}
                            forcePage={currentPage}
                            previousLabel="< Trước"
                            pageClassName="page-item"
                            pageLinkClassName="page-link"
                            previousClassName="page-item"
                            previousLinkClassName="page-link"
                            nextClassName="page-item"
                            nextLinkClassName="page-link"
                            breakClassName="page-item"
                            breakLinkClassName="page-link"
                            containerClassName="pagination"
                            activeClassName="active"
                        />
                    </div>
                </div>
            </div>
            <ModalZoomImage isShow={isShowModalZoomImage} handleClose={() => setIsShowModalZoomImage(false)} imageUrl={imageUrl} />
            <ModalGoodHistory isShow={isShowGoodHistory} handleClose={() => setIsShowGoodHistory(false)}
                dataGood={dataGood} />
            <ModalEditGood isShow={isShowModelEditGood}
                handleClose={() => setIsShowModelEditGood(false)}
                dataGoodEdit={dataGoodEdit} updateTable={updateTable} />
            <ModalAddGood isShow={isShowModelAddGood} handleClose={() => setIsShowModelAddGood(false)} updateTable={updateTable} />
        </div >
    );
}

export default MyTable;
