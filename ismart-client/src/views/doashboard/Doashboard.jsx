import React, { useEffect, useState } from 'react';
import { Table, DropdownButton, DropdownMenu, Col, Row, Container, Badge, Card } from 'react-bootstrap';
import Dropdown from 'react-bootstrap/Dropdown';
import { fetchDataStatisticalExortOrder, fetchDataStatisticalImportOrder } from '~/services/Doashboard';
import { fetchAllStorages } from '~/services/StorageServices';
import { CustomToggle, CustomMenu } from "../components/others/Dropdown";
import { fetchGoodsWithStorageAndSupplier } from "~/services/GoodServices";
import { fetchGoodById } from "~/services/GoodServices";
import { fetchAllSuppliers } from "~/services/SupplierServices";
import { formatDateImport, formattedAmount, formatDate } from '~/validate';
import ChartComponent from '../components/others/Chart';
import { fetchHistoryGood } from '~/services/GoodServices';



const Doashboard = () => {

    const [totalStorages, setTotalStorages] = useState([]);
    const [selectedStorage, setSelectedStorage] = useState(null);
    const [selectedStorageId, setSelectedStorageId] = useState(null);

    const [selectedDateStart, setSelectedDateStart] = useState(formatDateImport(new Date()));
    const [selectedDateEnd, setSelectedDateEnd] = useState(formatDateImport(new Date()));

    const [totalImportOrderByDate, setTotalImportOrderByDate] = useState(0);
    const [totalCostImportOrderByDate, setTotalCostImportOrderByDate] = useState('');

    const [totalExportOrderByDate, setTotalExportOrderByDate] = useState(0);
    const [totalCostExportOrderByDate, setTotalCostExportOrderByDate] = useState('');

    const [totalGoods, setTotalGoods] = useState([]);
    const [selectedGoodCode, setSelectedGoodCode] = useState(null);
    const [selectedGoodId, setSelectedGoodId] = useState(null);

    // thông tin của hàng đang được hiển thị trên chart
    const [dataGood, setDataGood] = useState([]);

    const [totalSuppliers, setTotalSuppliers] = useState([]);
    const [selectedSupplier, setSelectedSupplier] = useState(null);
    const [selectedSupplierId, setSelectedSupplierId] = useState(null);

    const [totalStoragesGood, setTotalStoragesGood] = useState([]);
    const [selectedStorageGood, setSelectedStorageGood] = useState(null);
    const [selectedStorageIdGood, setSelectedStorageIdGood] = useState(null);

    // dữ liệu truyền vào chart 
    const [dateImportOrder, setDateImportOrder] = useState([]);
    const [quantityImportOrder, setQuantityImportOrder] = useState([]);


    // dữ liệu truyền vào chart 
    const [dateExportOrder, setDateExportOrder] = useState([]);
    const [quantityExportOrder, setQuantityExportOrder] = useState([]);



    const [totalYear, setTotalYear] = useState(["2024", "2023", "2022"])
    const [selectedYear, setSelectedYear] = useState(null);


    useEffect(() => {
        getAllStorages();
        getAllSuppliers();
        getDataStatisticalImport();
        getDataStatisticalExport();
    }, [])

    useEffect(() => {
        getAllGoods();
        setSelectedGoodId(null);
        setSelectedGoodCode(null);
        setDateImportOrder([]);
        setDateExportOrder([]);
        setQuantityImportOrder([]);
        setQuantityExportOrder([]);

    }, [selectedStorageIdGood, selectedSupplierId])

    useEffect(() => {
        getDataStatisticalExport();
        getDataStatisticalImport();
    }, [selectedDateStart, selectedDateEnd, selectedStorageId])

    useEffect(() => {
        getHistoryGood();
        getGoodById();

    }, [selectedGoodId, selectedYear])



    const getGoodById = async () => {
        if (selectedGoodId) {
            let res = await fetchGoodById(selectedGoodId);
            setDataGood(res);
        }
    }


    function fillMissingMonths(data) {
        const monthsWithQuantities = data.map(item => item.month);
        const allMonths = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        const missingMonths = allMonths.filter(month => !monthsWithQuantities.includes(month));

        const filledData = data.slice(); // Tạo một bản sao của mảng dữ liệu ban đầu
        missingMonths.forEach(month => {
            filledData.push({ year: selectedYear, month, quantity: 0 });
        });

        // Sắp xếp lại mảng theo tháng
        filledData.sort((a, b) => a.month - b.month);

        return filledData;
    }




    const getHistoryGood = async () => {
        if (selectedGoodId) {

            let res = await fetchHistoryGood(selectedGoodId);
            let ImportRes = res.filter(r => r.actionId === 1); // Nhập hàng
            let ExportRes = res.filter(r => r.actionId === 2); // Xuất hàng

            console.log(res);

            // chia thành 2 mảng riêng chứa số lượng và tháng
            let quantitiesImport = [];
            let datesImport = [];
            for (let index = 0; index < ImportRes.length; index++) {
                let element = ImportRes[index].quantityDifferential;
                element = Math.abs(element);
                let dateElement = ImportRes[index].date;
                quantitiesImport.push(element);
                datesImport.push(formatDateImport(dateElement));

            }

            // chia thành 2 mảng riêng chứa số lượng và tháng
            let quantitiesExport = [];
            let datesExport = [];
            for (let index = 0; index < ExportRes.length; index++) {
                let element = ExportRes[index].quantityDifferential;
                element = Math.abs(element);
                quantitiesExport.push(element);
                let dateElement = ExportRes[index].date;
                datesExport.push(formatDateImport(dateElement));
            }

            // khai báo mảng chứa các phần tử tháng và số lượng trong tháng
            let datequantityImport = [];
            let datequantityExport = [];

            for (let index = 0; index < quantitiesImport.length; index++) {
                datequantityImport.push({ date: datesImport[index], quantity: quantitiesImport[index] });
            }

            for (let index = 0; index < quantitiesExport.length; index++) {
                datequantityExport.push({ date: datesExport[index], quantity: quantitiesExport[index] });
            }

            const monthlyStats = {};
            const monthlyStatsExport = {};


            datequantityImport.forEach(item => {
                // Phân tích ngày từ mục hiện tại
                const date = new Date(item.date);
                console.log(date);
                const year = date.getFullYear();
                const month = date.getMonth() + 1; // Tháng bắt đầu từ 0

                // Tạo một khóa duy nhất cho tháng và năm
                const key = `${year}-${month}`;

                // Nếu khóa này chưa tồn tại trong bảng thống kê, khởi tạo nó với giá trị số lượng là 0
                if (!monthlyStats[key]) {
                    monthlyStats[key] = 0;
                }

                // Tăng số lượng cho tháng hiện tại
                monthlyStats[key] += item.quantity;
            });

            datequantityExport.forEach(item => {
                // Phân tích ngày từ mục hiện tại
                const date = new Date(item.date);
                console.log(date);
                const year = date.getFullYear();
                const month = date.getMonth() + 1; // Tháng bắt đầu từ 0

                // Tạo một khóa duy nhất cho tháng và năm
                const key = `${year}-${month}`;

                // Nếu khóa này chưa tồn tại trong bảng thống kê, khởi tạo nó với giá trị số lượng là 0
                if (!monthlyStatsExport[key]) {
                    monthlyStatsExport[key] = 0;
                }

                // Tăng số lượng cho tháng hiện tại
                monthlyStatsExport[key] += item.quantity;
            });

            let monthlyStatsSort = Object.keys(monthlyStats).map(key => {
                const [year, month] = key.split('-').map(Number);
                return { year, month, quantity: monthlyStats[key] };
            });

            let monthlyStatsExportSort = Object.keys(monthlyStatsExport).map(key => {
                const [year, month] = key.split('-').map(Number);
                return { year, month, quantity: monthlyStatsExport[key] };
            });

            // Sắp xếp mảng các đối tượng theo tháng
            monthlyStatsSort.sort((a, b) => {
                if (a.year !== b.year) {
                    return a.year - b.year; // Sắp xếp theo năm
                } else {
                    return a.month - b.month; // Nếu năm giống nhau, sắp xếp theo tháng
                }
            });

            monthlyStatsExportSort.sort((a, b) => {
                if (a.year !== b.year) {
                    return a.year - b.year; // Sắp xếp theo năm
                } else {
                    return a.month - b.month; // Nếu năm giống nhau, sắp xếp theo tháng
                }
            });

            console.log(monthlyStatsSort);

            monthlyStatsSort = fillMissingMonths(monthlyStatsSort);
            monthlyStatsExportSort = fillMissingMonths(monthlyStatsExportSort);

            console.log(monthlyStatsSort);



            // reset lại quantityImportOrder và dateImportOrder
            let quantityDataImport = [];
            let dateDataImport = [];

            for (const item of monthlyStatsSort) {
                if (item.year == selectedYear) {
                    quantityDataImport.push(item.quantity);
                    dateDataImport.push("T" + item.month);
                }

            }

            let quantityDataExport = [];
            let dateDataExport = [];

            for (const item of monthlyStatsExportSort) {
                if (item.year == selectedYear) {
                    quantityDataExport.push(item.quantity);
                    dateDataExport.push("T" + item.month);
                }

            }


            setQuantityImportOrder(quantityDataImport);
            setDateImportOrder(dateDataImport);


            setQuantityExportOrder(quantityDataExport);
            setDateExportOrder(dateDataExport);
        }


    }

    // lấy số lượng và giá trị nhập hàng
    const getDataStatisticalImport = async () => {
        let res = await fetchDataStatisticalImportOrder(selectedDateStart, selectedDateEnd, selectedStorageId);
        setTotalImportOrderByDate(res.totalOrder);
        setTotalCostImportOrderByDate(res.totalCost);
    }

    // lấy số lượng và giá trị xuất hàng
    const getDataStatisticalExport = async () => {
        let res = await fetchDataStatisticalExortOrder(selectedDateStart, selectedDateEnd, selectedStorageId);
        setTotalExportOrderByDate(res.totalOrder);
        setTotalCostExportOrderByDate(res.totalCost);
    }

    // lấy thông tin sản phẩm
    const getAllGoods = async () => {
        if (selectedStorageIdGood && selectedSupplierId) {
            let res = await fetchGoodsWithStorageAndSupplier(selectedStorageIdGood, selectedSupplierId);
            console.log(res);
            setTotalGoods(res);
        }

    }

    const handleGoodClick = (good, event) => {
        setSelectedGoodCode(good.goodsCode);
        setSelectedGoodId(good.goodsId);
    }

    // lấy thông tin kho
    const getAllStorages = async () => {
        let res = await fetchAllStorages();
        setTotalStorages(res);
        setTotalStoragesGood(res);
    }

    const handleStorageClickTotal = () => {
        setSelectedStorage("Tất cả kho");
        setSelectedStorageId("");
    }

    const handleStorageClick = (storage) => {
        setSelectedStorage(storage.storageName);
        setSelectedStorageId(storage.storageId);
    }

    // lấy ngày tháng để filter order
    const handleDateStartChange = (event) => {
        setSelectedDateStart(formatDateImport(event.target.value));
    };

    const handleDateEndChange = (event) => {
        setSelectedDateEnd(formatDateImport(event.target.value));
    };


    // lấy thông tin nhà sản xuất
    const getAllSuppliers = async () => {
        let res = await fetchAllSuppliers();
        setTotalSuppliers(res);
    }

    const handleSupplierClick = (supplier, event) => {
        setSelectedSupplier(supplier.supplierName);
        setSelectedSupplierId(supplier.supplierId)
    }

    const handleStorageGoodClick = (storage) => {
        setSelectedStorageGood(storage.storageName);
        setSelectedStorageIdGood(storage.storageId);
    }

    const handleYearSelect = (year) => {
        setSelectedYear(year);
    };

    return (<>
        <div className="container" >
            <div className="">
                <div className="">
                    <h5 style={{ color: '#a5a2ad' }}>Thống kê</h5>
                    <div className="row d-flex align-items-center">
                        <Col md={2}>
                            <label className='text-muted'>Chọn kho:</label>
                            <DropdownButton className="DropdownButtonCSS ButtonCSSDropdown" title={selectedStorage !== null ? selectedStorage : "Tất cả"} variant="success" >

                                <Dropdown.Item eventKey="" onClick={() => handleStorageClickTotal()}>Tất cả</Dropdown.Item>
                                {totalStorages && totalStorages.length > 0 && totalStorages.map((c, index) => (
                                    <Dropdown.Item key={`storage ${index}`} eventKey={c.storageName} onClick={(e) => handleStorageClick(c, e)}>{c.storageName}</Dropdown.Item>
                                ))}
                            </DropdownButton>
                        </Col>

                        <Col md={2}>
                            <label className='text-muted'>Từ ngày: &nbsp;</label>
                            <div>

                                <input type="date" className="datepickerCSS" id="datepicker" value={selectedDateStart} onChange={handleDateStartChange} />
                            </div>
                        </Col>

                        <Col md={2}>
                            <div>
                                <label className='text-muted'>Đến ngày: &nbsp;</label>
                                <input type="date" className="datepickerCSS" id="datepicker" value={selectedDateEnd} onChange={handleDateEndChange} />
                            </div>
                        </Col>

                    </div>
                </div>
                <hr></hr>
            </div>

            <Row className='SolieuCSS'>
                <Col md={3}>
                    <Card className=" text-white mb-4" style={{ backgroundImage: 'linear-gradient(to left, #6fb3fe, #4398ff)' }}>
                        <Card.Body>
                            <Card.Title>Lô hàng nhập</Card.Title>
                            <div className="d-flex align-items-center">
                                <i className="fa-duotone fa-file-import fa-xl"></i> &nbsp;
                                <Card.Text className="ml-2 h3">{totalImportOrderByDate}</Card.Text>
                            </div>
                        </Card.Body>
                    </Card>
                </Col>
                <Col md={3}>
                    <Card className=" text-white mb-4" style={{ backgroundImage: 'linear-gradient(to left, #52e2c8, #36dab8)' }}>
                        <Card.Body>
                            <Card.Title>Tổng giá trị nhập hàng</Card.Title>
                            <div className="d-flex align-items-center">
                                <i className="fa-duotone fa-chart-simple fa-xl "></i> &nbsp;
                                <Card.Text className="ml-2 h3"> {formattedAmount(totalCostImportOrderByDate)}</Card.Text>
                            </div>
                        </Card.Body>
                    </Card>
                </Col>

                <Col md={3}>
                    <Card className="text-white mb-4" style={{ backgroundImage: 'linear-gradient(to left, #fbcf6e, #ffb751)' }}>
                        <Card.Body>
                            <Card.Title>Lô hàng xuất</Card.Title>
                            <div className="d-flex align-items-center">
                                <i className="fa-duotone fa-file-export fa-xl"></i> &nbsp;
                                <Card.Text className="ml-2 h3">  {totalExportOrderByDate}</Card.Text>
                            </div>
                        </Card.Body>
                    </Card>
                </Col>
                <Col md={3}>
                    <Card className=" text-white mb-4" style={{ backgroundImage: 'linear-gradient(to left, #fe8398, #ff5774)' }}>
                        <Card.Body>
                            <Card.Title>Tổng giá trị xuất hàng</Card.Title>
                            <div className="d-flex align-items-center">
                                <i className="fa-duotone fa-chart-simple fa-xl "></i> &nbsp;
                                <Card.Text className="ml-2 h3">    {formattedAmount(totalCostExportOrderByDate)}</Card.Text>
                            </div>
                        </Card.Body>
                    </Card>
                </Col>

            </Row>
            <hr></hr>
            <Row>
                <Col md={2}>

                    <div>



                        <Dropdown style={{ position: 'relative', fontWeight: 'bold' }}>
                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                <span style={{ color: 'white' }}>{selectedStorageGood !== null ? selectedStorageGood : "Kho"}</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }} className='ButtonCSSDropdown'>
                                {totalStoragesGood && totalStoragesGood.length > 0 && totalStoragesGood.map((g, index) => (
                                    <Dropdown.Item key={`storageGood ${index}`} eventKey={g.storageName} onClick={(e) => handleStorageGoodClick(g, e)}>
                                        {g.storageName}
                                    </Dropdown.Item>
                                ))}
                            </Dropdown.Menu>
                        </Dropdown>


                    </div>
                </Col>
                <Col md={2}>

                    <div>
                        <Dropdown style={{ position: 'relative', fontWeight: 'bold' }}>
                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components">
                                <span style={{ color: 'white' }}>{selectedSupplier !== null ? selectedSupplier : "Nhà cung cấp"}</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }} className='ButtonCSSDropdown'>
                                {totalSuppliers && totalSuppliers.length > 0 && totalSuppliers.map((g, index) => (
                                    <Dropdown.Item key={`supplier ${index}`} eventKey={g.supplierName} onClick={(e) => handleSupplierClick(g, e)}>
                                        {g.supplierName}
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

                    <div>
                        <Dropdown style={{ position: 'relative', fontWeight: 'bold' }} >
                            <Dropdown.Toggle as={CustomToggle} id="dropdown-custom-components" className='DropdownButtonCSS'>
                                <span style={{ color: 'white' }}>{selectedGoodCode !== null ? selectedGoodCode : "Mã Sản phẩm"}</span>
                            </Dropdown.Toggle>

                            <Dropdown.Menu as={CustomMenu} style={{ position: 'absolute', zIndex: '9999' }} className='ButtonCSSDropdown'>
                                {totalGoods && totalGoods.length > 0 && totalGoods.map((g, index) => (
                                    <Dropdown.Item key={`good ${index}`} eventKey={g.goodsCode} onClick={(e) => handleGoodClick(g, e)} >
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
                    <div>
                        <Dropdown className='ButtonCSSDropdown'>
                            <Dropdown.Toggle variant="primary" id="dropdown-basic">
                                {selectedYear ? selectedYear : 'Chọn năm'}
                            </Dropdown.Toggle>

                            <Dropdown.Menu >
                                {totalYear.map(year => (
                                    <Dropdown.Item key={year} onClick={() => handleYearSelect(year)}>
                                        {year}
                                    </Dropdown.Item>
                                ))}
                            </Dropdown.Menu>
                        </Dropdown></div>
                </Col>
            </Row>
            <hr></hr>
            <Row>
                <label>Tổng số lượng của sản phẩm {selectedGoodCode} trong kho: {selectedGoodCode ? dataGood.inStock : ''}</label>
                <label>Giá trị tồn kho của {selectedGoodCode} trong kho: {selectedGoodCode ? formattedAmount(dataGood.inStock * dataGood.stockPrice) : ''}</label>
            </Row>




            <Row>
                <Col md={6}>

                    <ChartComponent selectedGoodCode={selectedGoodCode} dateOrder={dateImportOrder} quantityOrder={quantityImportOrder} title="Nhập kho" />
                </Col>

                <Col md={6}>
                    <ChartComponent selectedGoodCode={selectedGoodCode} dateOrder={dateExportOrder} quantityOrder={quantityExportOrder} title="Xuất kho" />
                </Col>

            </Row>
        </div >
    </>)
}

export default Doashboard