import { useEffect, useState } from 'react'
import React from 'react'
import ReactToPrint from 'react-to-print'
import { useRef } from 'react'
import { formatDate } from '~/validate'
import { ReactBarcode } from 'react-jsbarcode';

const BarCode = (barCodeDetail) => {
    const [supplierName, setSupplierName] = useState("");
    const [importedDate, setImportedDate] = useState("");
    const [storekeeperName, setStorekeeperName] = useState("");

    const [barcodeValue, setBarCodeValue] = useState(null);

    useEffect(() => {
        setSupplierName(barCodeDetail.barCodeDetail.supplierName);
        setImportedDate(barCodeDetail.barCodeDetail.importedDate);
        setStorekeeperName(barCodeDetail.barCodeDetail.storekeeperName);

    }, [barCodeDetail])

    useEffect(() => {
        setBarCodeValue(`${supplierName} - ${importedDate}`);
    }, [supplierName, importedDate]);


    const test = "ABC Inc.";
    const importDate = "2024-04-19";
    const componentRef = useRef();

    // Tạo giá trị mã vạch bao gồm thông tin nhà sản xuất và ngày nhập hàng

    // const barcodeValue = `${test} - ${importDate}`;


    // Cấu hình mã vạch bằng cách truyền options vào props của Barcode component
    const barcodeOptions = {
        format: "CODE128", // Loại mã vạch
        width: 1, // Độ rộng của các dòng trong mã vạch
        height: 50, // Chiều cao của mã vạch
        displayValue: false // Hiển thị giá trị trên mã vạch
    };

    return (
        <div className="App">
            {/* Truyền giá trị và cấu hình vào component Barcode */}
            <div ref={componentRef}>
                <ReactBarcode value={barcodeValue} options={barcodeOptions} />
                <br />
            </div>
            <ReactToPrint
                trigger={() => <button variant="primary">In</button>}
                content={() => componentRef.current}
            />
        </div>
    );
}

export default BarCode