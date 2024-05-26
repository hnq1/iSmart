import React, { useEffect, useState } from 'react';
import { Table, Dropdown, DropdownButton, Col, Row } from 'react-bootstrap';

import ReactPaginate from 'react-paginate';
import { format } from 'date-fns';

import ModelAddImportOrder from './AddImportOrder';
import ConfirmImportOrder from './ConfirmImportOrder';
import { fetchImportOrdersWithfilter } from '~/services/ImportOrderServices';
import { formatDate, formattedAmount } from '~/validate';
import ModalDetailOrder from './DetailOrder';
import ModalZoomImage from "../components/others/Image/ModalZoomImage";
import { fetchAllStorages } from '~/services/StorageServices';
import ModelEditImportOrder from './EditImportOrder'
import ModalShowBarCode from './ShowBarCode';
import ModalCancel from './ModalCancel';

import { toast } from 'react-toastify';

import { cancelImport } from '~/services/ImportOrderServices';

import { fetchUserByUserId } from '~/services/UserServices';

function ImportOrderList() {

    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);


    const [totalImportOrder, setTotalImportOrder] = useState([]);
    const [totalPages, setTotalPages] = useState(5);
    const [currentPage, setcurrentPage] = useState(0);

    const [isShowImportModelAdd, setIsShowImportModelAdd] = useState(false);
    const [isShowModelConfirm, setIsShowModelConfirm] = useState(false);
    const [dataImportOrder, setDataImportOrder] = useState({});

    const [isShowModalZoomImage, setIsShowModalZoomImage] = useState(false);
    const [imageUrl, setImageUrl] = useState("");

    const [isShowDetailOrder, setIsShowDetailOrder] = useState(false);

    const [isShowEditOrder, setIsShowEditOrder] = useState(false);

    const [detailOrder, setDetailOrder] = useState([]);
    const [detailOrderEdit, setDetailOrderEdit] = useState([]);

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);


    const [sortedByStatusId, setSortedByStatusId] = useState();
    const [sortedByStatusName, setSortedByStatusName] = useState("");
    const [sortStatusOptions, setSortStatusOptions] = useState([]);

    const [sortedByDateId, setSortedByDateId] = useState();
    const [sortedByDateName, setSortedByDateName] = useState("");
    const [sortDateOptions, setSortDateOptions] = useState([]);

    const [isShowBarCode, setIsShowBarCode] = useState(false);
    const [barCodeDetail, setBarCodeDetail] = useState([]);

    const [isShowModalCancelImport, setIsShowModalCancelImport] = useState(false);
    const [dataCancelImport, setDataCancelImport] = useState([]);

    const [keywordSearch, setKeywordSearch] = useState("");

    const [currentDate, setCurrentDate] = useState();



    useEffect(() => {
        getImportOrders(1);
        getAllStorages();
        if (roleId !== 2 || roleId !== 4) {
            getStorageIdByUser();
        }
        setSortStatusOptions([{ idSort: null, nameSort: "Tình trạng" },
        { idSort: 3, nameSort: "Đang tiến hành" },
        { idSort: 4, nameSort: "Đã hoàn thành" },
        { idSort: 5, nameSort: "Đã hủy" }]);

        setSortDateOptions([{ idSort: null, nameSort: "Tất cả ngày" },
        { idSort: 1, nameSort: "Gần nhất" },
        ]);
        setCurrentDate(format(new Date(), 'dd/MM/yyyy'));
    }, [])

    useEffect(() => {
        getImportOrders(1);
    }, [selectedStorageId, sortedByStatusId, sortedByDateId])

    const getStorageIdByUser = async () => {
        let res = await fetchUserByUserId(userId);
        setSelectedStorageId(res.storageId);
        setSelectedStorage(res.storageName);
    }
    const getImportOrders = async (page) => {
        setcurrentPage(page - 1);
        let res = await fetchImportOrdersWithfilter(page, selectedStorageId, sortedByStatusId, sortedByDateId, keywordSearch);
        console.log(selectedStorageId);
        setTotalImportOrder(res.data);
        setTotalPages(res.totalPages);
        console.log(res);
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

    const handleSortStatusClick = (sort) => {
        setSortedByStatusId(sort.idSort);
        setSortedByStatusName(sort.nameSort);
        getImportOrders(1);

    }

    const handleSortDateClick = (sort) => {
        setSortedByDateId(sort.idSort);
        setSortedByDateName(sort.nameSort);
        getImportOrders(1);
    }

    const handlePageClick = (event) => {
        setcurrentPage(+event.selected);
        getImportOrders(+event.selected + 1);
    }

    const handleSearch = () => {
        getImportOrders(1);
    }

    const updateTable = () => {
        getImportOrders(currentPage + 1);
    }

    const ShowModelConfirm = (i) => {
        if (currentDate !== formatDate(i.importedDate)) {
            toast.warning("Chưa đến ngày nhập hàng trong hợp đồng bàn giao");
        } else {
            console.log(i);
            setIsShowModelConfirm(true);
            setDataImportOrder(i);
        }

    }

    const handleZoomImage = (image) => {
        setIsShowModalZoomImage(true);
        setImageUrl(image);
    }

    const ShowDetailOrder = (order) => {
        setIsShowDetailOrder(true);
        setDetailOrder(order);
    }

    const EditDetailOrder = (order) => {
        setIsShowEditOrder(true);
        setDetailOrderEdit(order);
    }

    const ShowBarCode = (order) => {
        setIsShowBarCode(true);
        setBarCodeDetail(order);
    }
    const ShowModalCancelImport = (data) => {
        if (data.statusType == "Completed" || data.statusType == "Cancel") {
            toast.warning("Không thể hủy đơn hàng đã nhập hoặc đã hủy");
        } else {
            setIsShowModalCancelImport(true);
            setDataCancelImport(data);
        }

    }

    const ConfirmCancelImport = async (confirm) => {
        if (confirm) {
            await cancelImport(dataCancelImport.importId);
            toast.success("Hủy bỏ đơn hàng thành công");
            getImportOrders(currentPage + 1);
        }
    }


    return (
        <>
            <div className="container" style={{ maxWidth: "1600px" }}>
                <div className="row justify-content-center">
                    <div className="col-sm-12">
                        <h5 style={{ color: '#a5a2ad' }}>Quản lý lô hàng nhập</h5>
                        <div className="row no-gutters my-3 d-flex justify-content-between">
                            <Row>
                                {roleId == 2 || roleId == 4 ? <Col md={2}>
                                    <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                        <Dropdown.Item eventKey="" onClick={() => handleStorageClickTotal()}>Tất cả kho</Dropdown.Item>
                                        {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                            <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                        ))}
                                    </DropdownButton>
                                </Col> : <Col md={2}>
                                    <input type="text" className="form-control inputCSS"
                                        aria-describedby="emailHelp" value={selectedStorage} disabled /></Col>}

                                <Col md={2}>
                                    <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={sortedByStatusName ? sortedByStatusName : "Tình trạng"} variant="success" style={{ zIndex: 999 }}>
                                        {sortStatusOptions.map((s, index) => (
                                            <Dropdown.Item key={`sort ${index}`} eventKey={s.nameSort} onClick={(e) => handleSortStatusClick(s, e)}>{s.nameSort}</Dropdown.Item>
                                        ))}
                                    </DropdownButton>
                                </Col>
                                <Col md={5}>
                                    <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={sortedByDateName ? sortedByDateName : "Sắp xếp theo ngày"} variant="success" style={{ zIndex: 999 }}>
                                        {sortDateOptions.map((s, index) => (
                                            <Dropdown.Item key={`sortDate ${index}`} eventKey={s.nameSort} onClick={(e) => handleSortDateClick(s, e)}>{s.nameSort}</Dropdown.Item>
                                        ))}
                                    </DropdownButton>
                                </Col>

                                <Col md={3}>
                                    <div className="input-group">
                                        <input
                                            className="form-control border-secondary inputCSS"
                                            type="search"
                                            placeholder='Tìm kiếm...'
                                            id="example-search-input4"
                                            readOnly={false}
                                            onChange={(event) => setKeywordSearch(event.target.value)}

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
                                </Col>
                                {roleId === 2 || roleId === 1 ?

                                    <Col md={2}>
                                        <div className="col-auto ButtonCSSDropdown">
                                            <button
                                                className="btn btn-success border-left-0 rounded"
                                                type="button"
                                                onClick={() => setIsShowImportModelAdd(true)}
                                            ><i className="fa-solid fa-plus"></i>
                                                &nbsp;
                                                Thêm lô hàng nhập

                                            </button>
                                        </div>  </Col> : ''

                                }
                            </Row>



                        </div>
                        <div className=" table-responsive" style={{ overflowY: 'auto', overflowX: 'auto' }}>
                            <Table className="table text-center table-border table-hover  border-primary table-sm">
                                <thead>
                                    <tr>
                                        <th className="align-middle  text-nowrap position-sticky" style={{ left: 0 }}>STT</th>
                                        <th className="align-middle  text-nowrap">Mã<br />đơn hàng</th>
                                        <th className="align-middle  text-nowrap">Người <br />tạo đơn hàng</th>
                                        <th className="align-middle  text-nowrap">Nhà <br />cung cấp</th>
                                        <th className="align-middle  text-nowrap">Tổng <br />đơn hàng</th>
                                        <th className="align-middle  text-nowrap">Ngày <br />tạo đơn</th>
                                        <th className="align-middle  text-nowrap">Ngày <br />nhập hàng</th>
                                        <th className="align-middle  text-nowrap">Kho <br />nhập hàng</th>
                                        <th className="align-middle  text-nowrap">Bên <br />giao hàng</th>
                                        <th className="align-middle  text-nowrap">Hình ảnh</th>
                                        <th className="align-middle  text-nowrap">Tình trạng</th>

                                        <th className="align-middle  text-nowrap">Người <br />xác nhận</th>
                                        <th className="align-middle  text-nowrap">Xem <br />chi tiết</th>
                                        {roleId === 2 ? <th className="align-middle  text-nowrap">Chỉnh sửa<br />đơn hàng</th> : ''}
                                        {roleId === 2 ? <th className="align-middle  text-nowrap">Hủy <br />đơn hàng</th> : ''}

                                        {roleId === 3 ? <th className="align-middle  text-nowrap">Tạo BarCode</th> : ''}
                                        {roleId === 3 ?
                                            <th className="align-middle  text-nowrap position-sticky" style={{ right: 0 }}>Hành động</th>
                                            : ''}


                                    </tr>
                                </thead>
                                <tbody>

                                    {totalImportOrder && totalImportOrder.length > 0
                                        && totalImportOrder.map((i, index) => (
                                            <tr key={`importOrder${index}`}>
                                                <td className="align-middle position-sticky" style={{ left: 0 }}>{index + 1}</td>
                                                <td className="align-middle">{i.importCode}</td>
                                                <td className="align-middle">{i.userName}</td>
                                                <td className="align-middle">{i.supplierName}</td>
                                                <td className="align-middle">{formattedAmount(i.totalCost)}</td>
                                                <td className="align-middle">{formatDate(i.createdDate)}</td>
                                                <td className="align-middle">{formatDate(i.importedDate)}</td>
                                                <td className="align-middle">{i.storageName}</td>
                                                <td className="align-middle">{i.deliveryName}</td>
                                                <td className="align-middle" onClick={() => handleZoomImage(i.image)}>
                                                    <img src={i.image} alt="Image" style={{ width: '50px', height: '50px' }} />
                                                </td>
                                                <td className="align-middle" style={{ color: i.statusType === "Cancel" ? "#ea5455" : "#24cbc7" }}>
                                                    {i.statusType === "On Progress" ? "Đang tiến hành" : i.statusType === "Completed" ? "Đã hoàn thành" : "Đã hủy"}
                                                </td>
                                                <td className="align-middle">{i.storekeeperName}</td>
                                                <td className="align-middle " style={{ padding: '10px' }}>

                                                    <i className="fa-duotone fa-circle-info actionButtonCSS" onClick={() => ShowDetailOrder(i)}></i>
                                                </td>
                                                {roleId === 2 ? <td className="align-middle " style={{ padding: '10px' }}>

                                                    <i className="fa-duotone fa-pen-to-square actionButtonCSS" onClick={() => EditDetailOrder(i)}></i>
                                                </td> : ''}

                                                {roleId === 2 ? <td className="align-middle"> <i className="fa-solid fa-ban actionButtonCSS" onClick={() => ShowModalCancelImport(i)}></i></td> : ''}
                                                {roleId === 3 ? <td className="align-middle"> {i.statusType === "Completed" ? <i className="fa-solid fa-barcode actionButtonCSS" onClick={() => ShowBarCode(i)}></i> : ''}</td> : ''}

                                                {roleId === 3 ? <td className='position-sticky ButtonCSSDropdown' style={{ right: 0, minWidth: '150px' }}> <button
                                                    className="btn btn-success border-left-0 rounded "
                                                    type="button"
                                                    onClick={() => ShowModelConfirm(i)}
                                                    disabled={i.statusType === "Completed" || i.statusType === "Cancel" || roleId !== 3}
                                                >{i.statusType === "Completed" ? "Đã nhập hàng" : i.statusType === "On Progress" ? "Tiến hành nhập hàng" : "Đã hủy"}
                                                </button></td> : ''}



                                            </tr>
                                        ))}

                                </tbody>
                            </Table>
                        </div>
                    </div>
                </div>
            </div>

            <div className="d-flex justify-content-center  mt-3">
                <ReactPaginate
                    breakLabel="..."
                    nextLabel="Sau >"
                    pageRangeDisplayed={5}
                    forcePage={currentPage}
                    onPageChange={handlePageClick}
                    pageCount={totalPages}
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
            <ModalCancel isShow={isShowModalCancelImport} handleClose={() => setIsShowModalCancelImport(false)}
                title="Hủy đơn hàng nhập" ConfirmCancel={ConfirmCancelImport} />
            <ModalShowBarCode isShow={isShowBarCode} handleClose={() => setIsShowBarCode(false)} barCodeDetail={barCodeDetail} />
            <ModelEditImportOrder isShow={isShowEditOrder} handleClose={() => setIsShowEditOrder(false)}
                detailOrderEdit={detailOrderEdit} updateTable={updateTable} />
            <ModalDetailOrder isShow={isShowDetailOrder} handleClose={() => setIsShowDetailOrder(false)} detailOrder={detailOrder} />
            <ModelAddImportOrder isShow={isShowImportModelAdd} handleClose={() => setIsShowImportModelAdd(false)} updateTable={updateTable} />
            <ConfirmImportOrder isShow={isShowModelConfirm} handleClose={() => setIsShowModelConfirm(false)} dataImportOrder={dataImportOrder} updateTable={updateTable} />
            <ModalZoomImage isShow={isShowModalZoomImage} handleClose={() => setIsShowModalZoomImage(false)} imageUrl={imageUrl} />
        </>

    );
}

export default ImportOrderList;