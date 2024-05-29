import React, { useEffect, useState } from 'react';
import { Table, Modal, Button, Row, Col, Form, DropdownButton, Dropdown } from "react-bootstrap"


import SwitchButton from '../components/others/SwitchButton';
import SwitchButtonUser from '../components/others/SwitchButton/SwitchButtonUser';
import ModalChangeStatusUser from '../components/others/Modal/ModalChangeStatusUser';
import { updateUserStatus } from '~/services/UserServices';
import ReactPaginate from 'react-paginate';

import ModalAddAccount from './AddAccount';
import ModalEditAccount from './EditAccount';
import { fetchUserWithFilter } from '~/services/UserServices';
import { fetchAllStorages } from "~/services/StorageServices";
import { set } from 'lodash';



const ListAccount = () => {

    const roleId = parseInt(localStorage.getItem('roleId'), 10);


    const [isShowModelAdd, setIsShowModelAdd] = useState(false);
    const [isShowModelEdit, setIsShowModelEdit] = useState(false);
    const [totalUser, setTotalUser] = useState([]);
    const [totalPage, setTotalPage] = useState(5);

    const [currentPage, setcurrentPage] = useState(0);

    const [keywordSearch, setKeywordSearch] = useState("");
    const [optionRole, setOptionRole] = useState();
    const [optionStatus, setOptionStatus] = useState();


    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [isShowModalChangeStatus, setIsShowModalChangeStatus] = useState(false);
    const [dataUpdateStatus, setdataUpdateStatus] = useState([]);

    useEffect(() => {
        getUsers(1);
        getAllStorages();
    }, [])

    useEffect(() => {
        getUsers(1);
    }, [optionRole, optionStatus, selectedStorageId])
    const getUsers = async (page) => {
        setcurrentPage(page - 1);
        let res = await fetchUserWithFilter(page, optionRole, optionStatus, selectedStorageId, keywordSearch);
        setTotalUser(res.data);
        setTotalPage(res.totalPages);
        console.log(res);

    }
    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
    }

    const handlePageClick = (event) => {
        setcurrentPage(+event.selected);
        getUsers(+event.selected + 1);
    }

    const handleSelectRole = (event) => {
        setOptionRole(event.target.value);
    }

    const handleSelectStatus = (event) => {
        setOptionStatus(event.target.value);
    }

    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }

    const handleSearch = () => {
        getUsers(1);
    }

    const ModelEditAccount = () => {
        setIsShowModelEdit(true);
    }

    const updateTable = () => {
        getUsers(currentPage + 1);
    }

    const handleChangeStatus = async (user) => {
        setdataUpdateStatus(user);
        setIsShowModalChangeStatus(true);
    }
    const confirmChangeStatus = async (confirm) => {
        if (confirm) {
            await updateUserStatus(dataUpdateStatus.userId);
            getUsers(currentPage + 1);
        }
    }
    return (<>
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-sm-12">
                    <h5 style={{ color: '#a5a2ad' }}>Quản lý các tài khoản</h5>
                    <div className="row no-gutters my-3 d-flex justify-content-between">
                        <div className="col-2">
                            <Form.Select className='FormSelectCSS' onChange={handleSelectRole}>
                                <option value="">Vai trò</option>
                                <option value="2">Project Manager</option>
                                <option value="3">Thủ kho</option>
                                <option value="4">Kế toán</option>
                            </Form.Select>
                        </div>
                        <div className='col-2'>
                            <Form.Select className='FormSelectCSS' onChange={handleSelectStatus}>
                                <option value="">Tình trạng</option>
                                <option value="1">Đang làm việc</option>
                                <option value="2">Ngừng làm việc</option>
                            </Form.Select>

                        </div>
                        <div className='col-4'>
                            <Col md={2}>
                                <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả Kho"} variant="success" style={{ zIndex: 999 }}>
                                    {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                        <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                    ))}
                                </DropdownButton>
                            </Col>
                        </div>
                        {/* add account */}
                        <div className='col-2'>
                            <Col md={2}>
                                <Button
                                    className="btn btn-success border-left-3 rounded ButtonCSS"
                                    type="button"
                                    onClick={() => setIsShowModelAdd(true)}
                                    style={{ width: '150px' }}
                                >
                                    &nbsp;Tạo tài khoản
                                </Button>
                            </Col>
                        </div>
                        <div className="col-2">
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
                        </div>
                        {roleId === 1 ? '' :
                            <div className="col-auto ButtonCSSDropdown">
                                <button
                                    className="btn btn-success border-left-0 rounded"
                                    type="button"
                                    onClick={() => setIsShowModelAdd(true)}
                                ><i className="fa-solid fa-plus"></i>
                                    &nbsp;
                                    Tạo tài khoản

                                </button>
                            </div>
                        }


                    </div>
                    <div className=" table-responsive">
                        <Table className="table text-center table-border table-hover  border-primary table-sm">
                            <thead>
                                <tr>
                                    <th className="align-middle   text-nowrap">STT</th>
                                    <th className="align-middle  text-nowrap">Mã nhân viên</th>
                                    <th className="align-middle  text-nowrap">Vai trò</th>
                                    <th className="align-middle  text-nowrap">Tên đầy đủ</th>
                                    <th className="align-middle  text-nowrap">Email</th>
                                    <th className="align-middle  text-nowrap">Số điện thoại</th>
                                    <th className="align-middle  text-nowrap">Địa chỉ</th>
                                    <th className="align-middle  text-nowrap">Hình ảnh</th>
                                    <th className="align-middle  text-nowrap">Tình trạng</th>
                                    <th className="align-middle  text-nowrap"></th>

                                </tr>
                            </thead>
                            <tbody>
                                {totalUser && totalUser.length > 0
                                    && totalUser.map((i, index) => (
                                        <tr key={`userAccount${index}`}>
                                            <td className="align-middle text-color-primary">{index + 1}</td>
                                            <td className="align-middle">{i.userCode}</td>
                                            <td className="align-middle">{i.roleName}</td>
                                            <td className="align-middle">{i.fullName}</td>
                                            <td className="align-middle">{i.email}</td>
                                            <td className="align-middle">{i.phone}</td>
                                            <td className="align-middle">{i.address}</td>
                                            <td className="align-middle"><img src={i.image} alt="alt" style={{ width: '50px', height: '50px' }} /></td>

                                            <td className="align-middle">
                                                <SwitchButtonUser status={i.status} handleChangeStatus={() => handleChangeStatus(i)} />
                                            </td>

                                            {roleId === 1 ? 
                                            <td className="align-middle " style={{ padding: '10px' }}>

                                                <i className="fa-duotone fa-pen-to-square actionButtonCSS"></i>
                                            </td> 
                                            : ''}
                                        </tr>
                                    ))}

                            </tbody>
                        </Table>
                    </div>
                </div>
            </div>
        </div >

        <div className="d-flex justify-content-center  mt-3">
            <ReactPaginate
                breakLabel="..."
                nextLabel="Sau >"
                onPageChange={handlePageClick}
                pageRangeDisplayed={5}
                pageCount={totalPage}
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
        <ModalAddAccount isShow={isShowModelAdd} handleClose={() => setIsShowModelAdd(false)} updateTable={updateTable} />
        <ModalChangeStatusUser title="nhân viên" statusText1={<span style={{ color: '#24cbc7' }}>Đang làm việc</span>} statusText2={<span style={{ color: '#ff0000' }}>Ngừng làm việc</span>} isShow={isShowModalChangeStatus}
            handleClose={() => setIsShowModalChangeStatus(false)}
            confirmChangeStatus={confirmChangeStatus} name={<span style={{ color: 'black' }}>{dataUpdateStatus.supplierName}</span>} status={dataUpdateStatus.status}

        />
    </>)
}

export default ListAccount