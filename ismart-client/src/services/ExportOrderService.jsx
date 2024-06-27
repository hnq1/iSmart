import axios from "./axios";

const addNewExportOrder = (staffId, exportCode, totalPrice,
    note, exportedDate, warehouseId,
    cancelDate, deliveryId, image, customerId,) => {
    return axios.post(`api/export-order/add-export-order?staffId=${staffId}`, {
        exportCode, totalPrice,
        note, exportedDate, warehouseId,
        cancelDate, deliveryId, image, customerId,
    })
}

const fetchExportOrderNewest = () => {
    return axios.get(`api/ExportOrder/get-newest-export-order`);
}

const fetchAllExportOrders = () => {
    return axios.get(`api/ExportOrder/get-all-export-orders`);
}

const fetchExportOrdersWithFilter = (pageSize, page, warehouseId,
    userId, managerId, status,
    sortDate, keyword) => {
    return axios.get(`api/export-order/get-export-orders?pageSize=${pageSize}
        ${page ? `&page=${page}` : ''}
        ${warehouseId ? `&warehouseId=${warehouseId}` : ''}
        ${userId ? `&userId=${userId}` : ''}
        ${managerId ? `&managerId=${managerId}` : ''}
        ${status ? `&status=${status}` : ''}
        ${sortDate ? `&sortDate=${sortDate}` : ''}
        ${keyword ? `&keyword=${keyword}` : ''}`);
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