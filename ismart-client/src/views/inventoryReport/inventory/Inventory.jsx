import React, { useEffect, useState } from 'react';
import { Table, Col, Dropdown, DropdownButton, Row } from 'react-bootstrap';
import { fetchAllStorages } from '~/services/StorageServices';
import { fetchInventoryAll } from '~/services/InventoryReport';
import { getUserIdWarehouse } from "~/services/UserWarehouseServices";

const InventoryAll = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10);
    const userId = parseInt(localStorage.getItem('userId'), 10);


    const [totalWarehouse, setTotalWarehouse] = useState([]);
    const [selectedWarehouse, setSelectedWarehouse] = useState(null);
    const [selectedWarehouseId, setSelectedWarehouseId] = useState(null);

    const [startDate, setStartDate] = useState('');
    const [endDate, setEndDate] = useState('');
    const [inventoryData, setInventoryData] = useState([]);

    useEffect(() => {
        getAllStorages();
    }, []);

    useEffect(() => {
        const checkRoleAndFetchData = async () => {
            if (roleId === 2) {
                const warehouse = await getWarehouseById(userId);
                const data = await fetchInventoryAll(startDate, endDate, warehouse.warehouseId);
                setInventoryData(data);
            }
            if (startDate, endDate, selectedWarehouseId) {
                const data = await fetchInventoryAll(startDate, endDate, selectedWarehouseId);
                setInventoryData(data);
            }
        }; 
        checkRoleAndFetchData();
    }, [startDate, endDate, selectedWarehouseId]);

    const getWarehouseById = async (userId) => {
        let res = await getUserIdWarehouse(userId);
        return res[0];
    }
    const hanldStartDate = (e) => {
        setStartDate(e.target.value);
    }

    const hanldEndDate = (e) => {
        setEndDate(e.target.value);
    }
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
    }


    return (
        <>
            <div className="container" style={{ maxWidth: "1600px" }}>
                <div className="row justify-content-center">
                    <div className="col-sm-12">
                        <h5 style={{ color: '#a5a2ad' }}>Tồn kho tổng</h5>
                        <div className="row no-gutters my-3 d-flex justify-content-between">
                            <Row className="align-items-center">
                                {roleId === 1 ?
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
                                    </Col>
                                    : ''
                                }
                                < Col md={2} className="px-md-1">
                                    <div className="input-group mb-3">
                                        <h6>Ngày bắt đầu</h6>
                                        <input type="date" className="datepickerCSS" id="datepickerStart" value={startDate} onChange={hanldStartDate} />
                                    </div>
                                </Col>

                                <Col md={2} className="px-md-1">
                                    <div className="input-group mb-3">
                                        <h6>Ngày kết thúc</h6>
                                        <input type="date" className="datepickerCSS" id="datepickerEnd" value={endDate} onChange={hanldEndDate} />
                                    </div>
                                </Col>

                            </Row>
                        </div>


                        <div className="table-responsive" style={{ overflowY: 'auto', overflowX: 'auto' }}>
                            <Table className="table text-center table-border table-hover  border-primary table-sm">
                                <thead>
                                    <tr>
                                        <th className="align-middle  text-nowrap position-sticky" style={{ left: 0 }}>STT</th>
                                        <th className="align-middle  text-nowrap">Tên sản phẩm</th>
                                        <th className="align-middle  text-nowrap">Đơn vị tính</th>
                                        <th className="align-middle  text-nowrap">Nhập</th>
                                        <th className="align-middle  text-nowrap">Xuất</th>
                                        <th className="align-middle  text-nowrap">Tồn kho cuối kì</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    {inventoryData && inventoryData.length > 0
                                        && inventoryData.map((i, index) => (
                                            <tr key={`inventory${index}`}>
                                                <td className="align-middle position-sticky" style={{ left: 0 }}>{index + 1}</td>
                                                <td className="align-middle">{i.productName}</td>
                                                <td className="align-middle">{i.measureUnit}</td>
                                                <td className="align-middle">{i.imports}</td>
                                                <td className="align-middle">{i.exports}</td>
                                                <td className="align-middle">{i.balance}</td>


                                            </tr>
                                        ))}
                                </tbody>
                            </Table>
                        </div>
                    </div>
                </div>
            </div >
        </>
    );
};

export default InventoryAll;