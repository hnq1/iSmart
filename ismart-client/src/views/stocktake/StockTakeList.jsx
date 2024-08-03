import React, { useEffect, useState } from 'react';

import { Table, DropdownButton, DropdownMenu, Col } from 'react-bootstrap';
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchStockTakeWithFilter } from '~/services/StockTakeServices';
import Dropdown from 'react-bootstrap/Dropdown';
import ReactPaginate from 'react-paginate';
import ModalAddStockTake from './AddStockTake';
import ModalCheckoutStockTake from './CheckoutStockTake';
import ModalStockTakeDetail from './StockTakeDetail';
import ModalCancel from '../importOrders/ModalCancel';
import { formatDate } from '~/validate';

import { cancelStockTake } from '~/services/StockTakeServices';
import { fetchUserByUserId } from '~/services/UserServices';

import { usePDF } from 'react-to-pdf';
import { toast } from 'react-toastify';


const StockTakeList = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [totalStockTake, setTotalStockTake] = useState([]);

    const [totalPages, setTotalPages] = useState(5);
    const [currentPage, setcurrentPage] = useState(0);

    const [isShowAddStockTake, setIsShowAddStockTake] = useState(false);
    const [isShowModalCheckout, setIsShowModalCheckout] = useState(false);
    const [isShowModalDetail, setIsShowModalDetail] = useState(false);

    const [dataModalCheckout, setDataModalCheckout] = useState([]);
    const [dataModalDetail, setDataModalDetail] = useState([]);

    const [isPDF, setIsPDF] = useState(false);
    const { toPDF, targetRef } = usePDF({ filename: 'page23412.pdf' });

    const [isShowModalCancel, setIsShowModalCancel] = useState(false);
    const [dataCancelStock, setDataCancelStock] = useState([]);

    const [sortedByStatusId, setSortedByStatusId] = useState();
    const [sortedByStatusName, setSortedByStatusName] = useState("");
    const [sortStatusOptions, setSortStatusOptions] = useState([]);

    const [keywordSearch, setKeywordSearch] = useState("");


    useEffect(() => {
        getStockTake(1, selectedStorageId);
        getAllStorages();

        setSortStatusOptions([{ idSort: null, nameSort: "Tình trạng" },
        { idSort: 3, nameSort: "Đang tiến hành" },
        { idSort: 4, nameSort: "Đã hoàn thành" },
        { idSort: 5, nameSort: "Đã hủy" }]);

        if (roleId !== 2 || roleId !== 4) {
            getStorageIdByUser();
        }

    }, [])

    useEffect(() => {
        getStockTake(1);
    }, [selectedStorageId, sortedByStatusId])

    const getStockTake = async (page) => {
        setcurrentPage(page - 1);
        let res = await fetchStockTakeWithFilter(page, selectedStorageId, sortedByStatusId, keywordSearch);
        setTotalStockTake(res.data);
        setTotalPages(res.totalPages);
    }

    const getStorageIdByUser = async () => {
        let res = await fetchUserByUserId(userId);
        setSelectedStorageId(res.storageId);
        setSelectedStorage(res.storageName);
    }

    const handleSortStatusClick = (sort) => {
        setSortedByStatusId(sort.idSort);
        setSortedByStatusName(sort.nameSort);

    }

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
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
        getStockTake(+event.selected + 1, selectedStorageId);
    }

    const updateTable = () => {
        getStockTake(currentPage + 1);
    }

    const handleSearch = () => {
        getStockTake(1);
    }

    const ShowModalCheckoutStockTake = (s) => {
        setIsShowModalCheckout(true);
        setDataModalCheckout(s);
        console.log(s);
    }

    const ShowDetailStockTake = (data) => {
        setIsShowModalDetail(true);
        setDataModalDetail(data);
    }

    const handleChangeIsPDF = () => {
        setIsPDF(false);
    }

    const ShowModalCancelStockTake = (data) => {
        if (data.statusName == "On Progress") {
            setIsShowModalCancel(true);
            setDataCancelStock(data);
        } else {
            toast.warning("Không thể hủy đơn hàng đã kiểm hoặc đã hủy");
        }

    }

    const ConfirmCancelStock = async (confirm) => {
        if (confirm) {
            await cancelStockTake(dataCancelStock.stocktakeId);
            getStockTake(currentPage + 1);
        }
    }


    return (<>

        <div className="container" style={{ maxWidth: "1600px" }}>
            <div className="row justify-content-center">
                <div className="col-sm-12">
                    <h5 style={{ color: '#a5a2ad' }}>Quản lý kiểm hàng</h5>
                    <div className="row no-gutters my-3 ">
                        {roleId == 2 || roleId == 4 ? <div className="col-2">
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                <Dropdown.Item eventKey="" onClick={() => handleStorageClickTotal()}>Tất cả kho</Dropdown.Item>
                                {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                    <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </div> : <Col md={2}>
                            <input type="text" className="form-control inputCSS"
                                aria-describedby="emailHelp" value={selectedStorage} disabled /></Col>}

                        <Col md={2}>
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={sortedByStatusName ? sortedByStatusName : "Tình trạng"} variant="success" style={{ zIndex: 999 }}>
                                {sortStatusOptions.map((s, index) => (
                                    <Dropdown.Item key={`sort ${index}`} eventKey={s.nameSort} onClick={(e) => handleSortStatusClick(s, e)}>{s.nameSort}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>
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
                        {roleId === 4 ? <div className="col-auto">
                            <a className='ButtonCSSDropdown'>
                                <button
                                    className="btn btn-success border-left-0 rounded ButtonCSS"
                                    type="button"
                                    onClick={() => setIsShowAddStockTake(true)}
                                ><i className="fa-solid fa-plus"></i>
                                    &nbsp;Thêm đơn kiểm hàng
                                </button>
                            </a>
                        </div> : ''}

                    </div>

                    <div className=" table-responsive" style={{ overflowY: 'auto', overflowX: 'auto', zIndex: 3 }}>
                        <Table className="table text-center table-border table-hover  border-primary table-sm " >

                            <thead className='sticky-top' style={{ zIndex: 5 }}>
                                <tr>
                                    <th className="align-middle text-nowrap">STT</th>
                                    <th className="align-middle text-nowrap">Mã kiểm hàng</th>
                                    <th className="align-middle text-nowrap">Người tạo</th>
                                    <th className="align-middle text-nowrap">Ngày tạo</th>
                                    <th className="align-middle text-nowrap">Kho kiểm tra</th>
                                    <th className="align-middle text-nowrap">Tình trạng</th>
                                    <th className="align-middle text-nowrap">Người tiến hành</th>
                                    <th className="align-middle text-nowrap">Ngày tiến hành</th>
                                    <th className="align-middle text-nowrap">Chi tiết</th>
                                    {roleId === 4 ? <th className="align-middle text-nowrap">Hủy đơn kiểm</th> : ''}
                                    <th className="align-middle text-nowrap">In pdf</th>
                                    {roleId !== 4 ? <th className="align-middle text-nowrap position-sticky" style={{ right: 0 }}>Hành động</th> : ''}


                                </tr>
                            </thead>

                            <tbody >
                                {totalStockTake && totalStockTake.length > 0
                                    && totalStockTake.map((s, index) => (
                                        <tr key={`stocktake${index}`}>
                                            <td className="align-middle text-color-primary">{index + 1}</td>
                                            <td className="align-middle text-color-primary">{s.stockTakeCode}</td>
                                            <td className="align-middle ">{s.createdName}</td>
                                            <td className="align-middle ">{formatDate(s.createdDate)}</td>
                                            <td className="align-middle ">{s.storageName}</td>
                                            <td className="align-middle "><span style={{ color: s.statusName === "On Progress" ? "#2275b7" : s.statusName === "Completed" ? "#2275b7" : s.statusName === "Cancel" ? "#ea5455" : "black" }}>
                                                {s.statusName === "On Progress" ? "Đang tiến hành" : s.statusName === "Completed" ? "Đã hoàn thành" : s.statusName === "Cancel" ? "Hủy" : ""}
                                            </span></td>
                                            <td className="align-middle ">{s.updatedName}</td>
                                            <td className="align-middle ">{s.updatedDate ? formatDate(s.updatedDate) : ''}</td>
                                            <td className="align-middle ">
                                                <i className="fa-duotone fa-circle-info actionButtonCSS" onClick={() => ShowDetailStockTake(s)}></i>
                                            </td>
                                            {roleId === 4 ? <td className="align-middle"> <i className="fa-solid fa-ban actionButtonCSS" onClick={() => ShowModalCancelStockTake(s)}></i></td> : ''}
                                            {s.statusName == "Completed" ? <td className="align-middle">

                                                <i className="fa-duotone fa-file-pdf" onClick={() => setIsPDF(true)}></i>
                                            </td> : <td></td>}
                                            {roleId === 4 ? '' : <td className='position-sticky ButtonCSSDropdown' style={{ right: 0 }}> <button
                                                className="btn btn-success border-left-0 rounded  "
                                                type="button"
                                                onClick={() => ShowModalCheckoutStockTake(s)}
                                                disabled={s.statusName === "Completed" || s.statusName === "Cancel" || roleId !== 3}
                                            >{s.statusName === "Completed" ? "Đã kiểm hàng xong" : s.statusName === "On Progress" ? "Tiến hành kiểm hàng" : "Đã hủy"}
                                            </button></td>}



                                        </tr>
                                    ))}

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
        </div >
        

        <ModalCancel isShow={isShowModalCancel} handleClose={() => setIsShowModalCancel(false)}
            title="Hủy đơn kiểm hàng" ConfirmCancel={ConfirmCancelStock} />

        <ModalStockTakeDetail isShow={isShowModalDetail} handleClose={() => setIsShowModalDetail(false)} dataModalCheckout={dataModalDetail} />
        <ModalAddStockTake isShow={isShowAddStockTake}
            updateTable={updateTable}
            handleClose={() => setIsShowAddStockTake(false)} />

        <ModalCheckoutStockTake isShow={isShowModalCheckout}
            dataModalCheckout={dataModalCheckout}
            updateTable={updateTable}
            handleClose={() => setIsShowModalCheckout(false)} />


    </>)
}

export default StockTakeList