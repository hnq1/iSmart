import axios from "./axios";

const addNewImportOrder = (userId, supplierId, totalCost, note, createdDate, importedDate, statusId, importCode, storageId, deliveryId, image, stokekeeperId) => {
    return axios.post(`api/ImportOrder/add-import-order`, { userId, supplierId, totalCost, note, createdDate, importedDate, statusId, importCode, storageId, deliveryId, image, stokekeeperId })
}

const updateImportOrder = (importId, userId, supplierId, totalCost, note, createdDate, importedDate, statusId, importCode, storageId, deliveryId, image, stokekeeperId) => {
    return axios.put(`api/ImportOrder/update-import-order`, { importId, userId, supplierId, totalCost, note, createdDate, importedDate, statusId, importCode, storageId, deliveryId, image, stokekeeperId })
}

const fetchImportOrderNewest = () => {
    return axios.get(`api/ImportOrder/get-newest-import-order`);
}

const fetchImportOrdersWithfilter = (page, storage, status, sortDate, keyword) => {
    return axios.get(`api/ImportOrder/get-import-orders?page=${page}
    ${storage ? `&storage=${storage}` : ''}${status ? `&status=${status}` : ''}${sortDate ? `&sortDate=${sortDate}` : ''}${keyword ? `&keyword=${keyword}` : ''}`);
}

const addSuccessFullImportOrder = (importId) => {
    return axios.post(`api/ImportOrder/Import?importid=${importId}`)
}

const cancelImport = (importId) => {
    return axios.post(`api/ImportOrder/cancel-import?importId=${importId}`)
}

export { addNewImportOrder, updateImportOrder, fetchImportOrderNewest, fetchImportOrdersWithfilter, addSuccessFullImportOrder, cancelImport }