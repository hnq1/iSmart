import axios from "./axios";

const addNewExportOrder = (exportCode, userId, totalPrice, note, statusId, createdDate, exportedDate, storageId, projectId, cancelDate, deliveryId, image, storekeeperId) => {
    return axios.post(`api/ExportOrder/add-export-order`, { exportCode, userId, totalPrice, note, statusId, createdDate, exportedDate, storageId, projectId, cancelDate, deliveryId, image, storekeeperId })
}

const fetchExportOrderNewest = () => {
    return axios.get(`api/ExportOrder/get-newest-export-order`);
}

const fetchAllExportOrders = () => {
    return axios.get(`api/ExportOrder/get-all-export-orders`);
}

const fetchExportOrdersWithFilter = (page, user, storage, project, storekeeper, status, sortDate, keyword) => {
    return axios.get(`api/ExportOrder/get-export-orders?page=${page}${user ? `&user=${user}` : ''}${storage ? `&storage=${storage}` : ''}${project ? `&project=${project}` : ''}${storekeeper ? `&storekeeper=${storekeeper}` : ''}${status ? `&status=${status}` : ''}${sortDate ? `&sortDate=${sortDate}` : ''}${keyword ? `&keyword=${keyword}` : ''}`)
}

const addSuccessFullExportOrder = (exportId) => {
    return axios.post(`api/ExportOrder/Export?exportId=${exportId}`)
}


const updateExportOrder = (exportId, userId, projectId, totalPrice, note, createdDate, exportedDate, statusId, exportCode, storageId, deliveryId, image, stokekeeperId) => {
    return axios.put(`api/ExportOrder/update-export-order`, { exportId, userId, projectId, totalPrice, note, createdDate, exportedDate, statusId, exportCode, storageId, deliveryId, image, stokekeeperId })
}

const cancelExportOrder = (exportId) => {
    return axios.post(`api/ExportOrder/cancel-export?exportId=${exportId}`)
}

export { cancelExportOrder, addNewExportOrder, fetchAllExportOrders, fetchExportOrdersWithFilter, fetchExportOrderNewest, addSuccessFullExportOrder, updateExportOrder }