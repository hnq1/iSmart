import React, { useEffect, useState } from 'react';
import { Table, Dropdown, DropdownButton, Col, Row } from 'react-bootstrap';
import ReactPaginate from 'react-paginate';
import { format } from 'date-fns';
import { fetchAllStorages } from '~/services/StorageServices';
import ModelAddReturnOrder from "./AddReturnOrder";
import { update } from 'lodash';


function ReturnOrderList() {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);

    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    const [pageSize, setPageSize] = useState(15);
    const [totalPages, setTotalPages] = useState(5);
    const [currentPage, setcurrentPage] = useState(0);

    const [sortedByStatusId, setSortedByStatusId] = useState();
    const [sortedByStatusName, setSortedByStatusName] = useState("");
    const [sortStatusOptions, setSortStatusOptions] = useState([]);

    const [sortedByDateId, setSortedByDateId] = useState();
    const [sortedByDateName, setSortedByDateName] = useState("");
    const [sortDateOptions, setSortDateOptions] = useState([]);

    const [keywordSearch, setKeywordSearch] = useState("");
    const [currentDate, setCurrentDate] = useState();

    const [isShowReturnOrderModelAdd, setIsShowReturnOrderModelAdd] = useState(false);
    useEffect(() => {
        getAllStorages();


        setSortStatusOptions([{ idSort: null, nameSort: "Tình trạng" },
        { idSort: 3, nameSort: "Đang tiến hành" },
        { idSort: 4, nameSort: "Đã hoàn thành" },
        { idSort: 5, nameSort: "Đã hủy" }]);

        setSortDateOptions([{ idSort: null, nameSort: "Tất cả ngày" },
        { idSort: 1, nameSort: "Gần nhất" },
        ]);
        setCurrentDate(format(new Date(), 'dd/MM/yyyy'));
    }, []);

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }

    const handleStorageClickTotal = () => {
        setSelectedWarehouse("Tất cả kho");
        setSelectedWarehouseId(null);
    }

    const handleStorageClick = async (warehouse) => {

        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
        // getImportOrders(1, pageSize);
    }

    const handlePageSizeChange = (event) => {
        setPageSize(Number(event.target.value));
    }

    const handleSortStatusClick = (sort) => {
        setSortedByStatusId(sort.idSort);
        setSortedByStatusName(sort.nameSort);
        // getImportOrders(1, pageSize);

    }

    const handleSortDateClick = (sort) => {
        setSortedByDateId(sort.idSort);
        setSortedByDateName(sort.nameSort);
        // getImportOrders(1, pageSize, selectedWarehouseId, sortedByStatusId, sort.idSort); // Gọi lại hàm lấy dữ liệu với tham số mới
    }
    const handleSearch = () => {
        // getImportOrders(1, pageSize);
    }

    const handlePageClick = (event) => {
        setcurrentPage(+event.selected);
        // getImportOrders(+event.selected + 1, pageSize);
    }
    const updateTable = () => {
        // getImportOrders(currentPage + 1, pageSize);
    }
    return (
        <>
            <div className="container" style={{ maxWidth: "1600px" }}>
                <div className="row justify-content-center">
                    <div className="col-sm-12">
                        <h5 style={{ color: '#a5a2ad' }}>Quản lý lô hàng nhập giữa các kho</h5>
                        <div className="row no-gutters my-3 d-flex justify-content-between">
                            <Row>
                                {roleId == 1 ?
                                    <Col md={2}>
                                        <DropdownButton
                                            className="DropdownButtonCSS ButtonCSSDropdown"
                                            title={selectedWarehouse ? selectedWarehouse : "Tất cả Kho"}
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
                                    </Col> :
                                    <Col md={2}>
                                        <input type="text" className="form-control inputCSS"
                                            aria-describedby="emailHelp" value={selectedWarehouse} disabled />
                                    </Col>
                                }

                                <Col md={1}>
                                    <div className="input-group mb-3">
                                        <input
                                            type="number"
                                            className="form-control"
                                            placeholder="Nhập pageSize"
                                            value={pageSize}
                                            onChange={handlePageSizeChange}
                                        />
                                    </div>
                                </Col>
                                {/* lọc tình trạng và sắp xếp theo ngày */}
                                <Col md={2}>
                                    <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={sortedByStatusName ? sortedByStatusName : "Tình trạng"} variant="success" style={{ zIndex: 999 }}>
                                        {sortStatusOptions.map((s, index) => (
                                            <Dropdown.Item key={`sort ${index}`} eventKey={s.nameSort} onClick={(e) => handleSortStatusClick(s, e)}>{s.nameSort}</Dropdown.Item>
                                        ))}
                                    </DropdownButton>
                                </Col>
                                <Col md={2}>
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
                                {(roleId === 3 || roleId === 1) ?

                                    <Col md={2}>
                                        <div className="col-auto ButtonCSSDropdown">
                                            <button
                                                className="btn btn-success border-left-0 rounded"
                                                type="button"
                                                onClick={() => setIsShowReturnOrderModelAdd(true)}
                                            ><i className="fa-solid fa-plus"></i>
                                                &nbsp;
                                                Thêm lô trả hàng

                                            </button>
                                        </div>

                                    </Col>
                                    : ''
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
                                        {/* <th className="align-middle  text-nowrap">Tổng <br />đơn hàng</th> */}
                                        <th className="align-middle  text-nowrap">Ngày <br />tạo đơn</th>
                                        <th className="align-middle  text-nowrap">Ngày <br />nhập hàng</th>
                                        <th className="align-middle  text-nowrap">Kho <br />nhập hàng</th>
                                        <th className="align-middle  text-nowrap">Kho <br />xuất hàng</th>
                                        <th className="align-middle  text-nowrap">Bên <br />giao hàng</th>
                                        <th className="align-middle  text-nowrap">Hình ảnh</th>
                                        <th className="align-middle  text-nowrap">Tình trạng</th>

                                        <th className="align-middle  text-nowrap">Người <br />xác nhận</th>
                                        <th className="align-middle  text-nowrap">Xem <br />chi tiết</th>
                                        {roleId === 2 ? <th className="align-middle  text-nowrap">Chỉnh sửa<br />đơn hàng</th> : ''}
                                        {roleId === 2 ? <th className="align-middle  text-nowrap">Hủy <br />đơn hàng</th> : ''}

                                        {roleId === 3 ? <th className="align-middle  text-nowrap">Tạo BarCode</th> : ''}
                                        {roleId === 2 ?
                                            <th className="align-middle  text-nowrap position-sticky" style={{ right: 0 }}>Hành động</th>
                                            : ''}


                                    </tr>
                                </thead>

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



            < ModelAddReturnOrder isShow={isShowReturnOrderModelAdd}
                handleClose={() => setIsShowReturnOrderModelAdd(false)}
                // updateTable={updateTable}
            />
        </>
    )




}


export default ReturnOrderList;