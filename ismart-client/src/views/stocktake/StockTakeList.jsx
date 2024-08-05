import React, { useEffect, useState } from 'react';
import { Table, Form, Col, DropdownButton, Dropdown } from 'react-bootstrap';
import { removeWhiteSpace } from '~/validate';
import ReactPaginate from 'react-paginate';
import { toast } from 'react-toastify';
import { fetchUserByUserId } from '~/services/UserServices';
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchInventoryByWarehouseId } from '~/services/StockTakeServices';
import StockTakeDetail from './StockTakeDetail';

const StockTakeList = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);
    const warehouseId = parseInt(localStorage.getItem('warehouseId'), 10);


    const [listStockTake, setListStockTake] = useState([]);
    const [totalPages, setTotalPages] = useState(5);
    const [currentPage, setcurrentPage] = useState(0);

    const [totalWarehouse, setTotalWarehouse] = useState([]);

    const [selectedWarehouseId, setSelectedWarehouseId] = useState(1);
    const [selectedWarehouse, setSelectedWarehouse] = useState();

    const [isShowModalDetail, setIsShowModalDetail] = useState(false);
    const [detailData, setDetailData] = useState({});


    useEffect(() => {
        getStorageIdByUser(userId);
        getAllStorages();
        getAllStockTake(warehouseId);
    }, [])

    const getStorageIdByUser = async () => {
        let res = await fetchUserByUserId(userId);
        setSelectedWarehouseId(warehouseId);
        setSelectedWarehouse(res.warehouseName);
    }

    const getAllStockTake = async (warehouseId) => {
        let res = await fetchInventoryByWarehouseId(warehouseId);
        setListStockTake(res);
        console.log(res);
    }

    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalWarehouse(res);
    }

    const handleStorageClick = async (warehouse) => {
        setSelectedWarehouse(warehouse.warehouseName);
        setSelectedWarehouseId(warehouse.warehouseId);
    }

    const handleShowModalDetail = (detail) => {
        console.log(detail);
        setIsShowModalDetail(true);
        setDetailData(detail);
    }

    return (<>
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-sm-12">
                    <h5 style={{ color: '#a5a2ad' }}>Quản lý kiểm kê</h5>
                    <div className="row no-gutters my-3 d-flex justify-content-between">
                        <Col md={2}>
                            {(roleId == 1) ?
                                <div className="col-2">
                                    <DropdownButton
                                        className="DropdownButtonCSS ButtonCSSDropdown"
                                        title={selectedWarehouse ? selectedWarehouse : "Hải Phòng"}
                                        variant="success"
                                        style={{ zIndex: 999 }}
                                    >
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
                                </div>
                                :
                                <Col md={2}>
                                    <input type="text" className="form-control inputCSS"
                                        aria-describedby="emailHelp"
                                        value={selectedWarehouse} disabled />
                                </Col>
                            }
                        </Col>
                        <div className='col'>


                        </div>
                        <div className="col">
                            <div className="input-group">
                                <input
                                    className="form-control border-secondary inputCSS"
                                    type="search"
                                    placeholder='Tìm kiếm...'
                                    id="example-search-input4"
                                    readOnly={false}
                                // onChange={(event) => setKeywordSearch(event.target.value)}
                                />
                                <div className="input-group-append">
                                    <button
                                        className="btn btn-outline-secondary border-left-0 rounded-0 rounded-right"
                                        type="button"
                                    // onClick={handleSearch}
                                    >
                                        <i className="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        {
                            (roleId == 1) ?
                                <div className="col-auto ButtonCSSDropdown">
                                    <button
                                        className="btn btn-success border-left-0 rounded"
                                        type="button"
                                    // onClick={() => setIsShowModelAddNew(true)}
                                    ><i className="fa-solid fa-plus"></i>
                                        &nbsp;
                                        Thêm đơn kiểm kê
                                    </button>
                                </div>
                                : ''
                        }

                    </div>
                    <div className=" table-responsive">
                        <Table className="table text-center table-border table-hover  border-primary table-sm">
                            <thead>
                                <tr>
                                    <th className="align-middle   text-nowrap" style={{ width: '100px' }}>STT</th>
                                    <th className="align-middle  text-nowrap" style={{ textAlign: 'left', paddingLeft: '10px' }}>Ngày kiểm hàng</th>
                                    <th className="align-middle  text-nowrap" style={{ width: '250px' }}>Tình trạng</th>
                                    <th className="align-middle  text-nowrap" style={{ width: '250px' }}>Chi tiết</th>



                                </tr>
                            </thead>
                            <tbody>

                                {listStockTake && listStockTake.length > 0 &&
                                    listStockTake.map((s, index) => (
                                        <tr key={`supplier${index}`}>
                                            <td className="align-middle text-color-primary">{index + 1}</td>
                                            <td className="align-middle" style={{ textAlign: 'left', paddingLeft: '10px' }}>{s.checkDate}</td>
                                            <td className="align-middle" style={{ textAlign: 'left', paddingLeft: '10px' }}>{s.status}</td>

                                            <td className="align-middle" style={{ textAlign: 'center', paddingLeft: '10px' }}>
                                                <i className="fa-solid fa-circle-info actionButtonCSS" title="Chi tiết" onClick={() => handleShowModalDetail(s)}></i>
                                            </td>

                                        </tr>
                                    ))
                                }
                            </tbody>
                        </Table>
                    </div>
                </div>
            </div>
        </div>

        {/* <div className="d-flex justify-content-center  mt-3">
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
        </div> */}

        <StockTakeDetail isShow={isShowModalDetail} handleClose={() => setIsShowModalDetail(false)}
            detailData={detailData}/>
    </>)
}

export default StockTakeList