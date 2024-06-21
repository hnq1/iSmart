import { get } from "lodash";
import axios from "./axios";

const addNewImportOrder = (staffId, userId, supplierId, totalCost,
    note, createdDate, importedDate,
    statusId, importCode, warehouseId,
    deliveryId, image, stokekeeperId) => {
    return axios.post(`api/import-order/add-import-order?staffId=${staffId}`, {
        userId, supplierId, totalCost,
        note, createdDate, importedDate,
        statusId, importCode, warehouseId,
        deliveryId, image, stokekeeperId
    })
}

const updateImportOrder = (importId, userId, supplierId,
    totalCost, note, createdDate,
    importedDate, statusId, importCode,
    storageId, deliveryId, image, stokekeeperId) => {
    return axios.put(`api/import-order/update-import-order`, {
        importId, userId, supplierId,
        totalCost, note, createdDate,
        importedDate, statusId, importCode,
        storageId, deliveryId, image, stokekeeperId
    })
}

const fetchAllImportOrders = () => {
    return axios.get(`api/import-order/get-all-import-orders`);
}

const fetchImportOrderNewest = () => {
    return axios.get(`api/import-order/get-newest-import-order`);
}

const fetchImportOrdersWithfilter = (page, warehouseId, status, sortDate, keyword) => {
    return axios.get(`api/import-order/get-import-orders?page=${page}
    ${warehouseId ? `&warehouseId=${warehouseId}` : ''}
    ${status ? `&status=${status}` : ''}
    ${sortDate ? `&sortDate=${sortDate}` : ''}
    ${keyword ? `&keyword=${keyword}` : ''}`);
}

const addSuccessFullImportOrder = (importId) => {
    return axios.post(`api/import-order/import/${importId}`)
}

const cancelImport = (importId) => {
    return axios.post(`api/import-order/cancel-import?importId=${importId}`)
}

export { addNewImportOrder, updateImportOrder, fetchImportOrderNewest, fetchAllImportOrders, fetchImportOrdersWithfilter, addSuccessFullImportOrder, cancelImport }