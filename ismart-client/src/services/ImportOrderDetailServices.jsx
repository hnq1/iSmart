import axios from "./axios"


const getAllImportOrderDetails = () => {
    return axios.get(`api/import-order-detail/get-all-import-order-details`)
}

const createNewImportOrderDetail = (importId, costPrice, batchCode, manufactureDate, expiryDate, goodsId, quantity) => {
    return axios.post(`api/import-order-detail/add-order-detail`, { importId, costPrice, batchCode, manufactureDate, expiryDate, goodsId, quantity })
}

const updateImportOrderDetail = (importId, costPrice, detailId, goodsId, quantity, manufactureDate, expiryDate, batchCode) => {
    return axios.put(`api/ImportOrderDetail/update-import-order-detail`, { importId, costPrice, detailId, goodsId, quantity, manufactureDate, expiryDate, batchCode })
}

const deleteImportOrderDetail = (id) => {
    return axios.delete(`api/ImportOrderDetail/delete-import-order-detail?detailId=${id}`)
}
const getImportOrderDetailByImportId = (oid) => {
    return axios.get(`api/import-order-detail/get-import-order-details?oid=${oid}`)
}
const getBatchInventoryForExportgoods = (goodsId, quantity, method) => {
    return axios.get(`api/import-order-detail/get-batch-inventory-for-export-goods?goodsId=${goodsId}&quantity=${quantity}&method=${method}`)
}

export { getAllImportOrderDetails, createNewImportOrderDetail, updateImportOrderDetail, deleteImportOrderDetail, getImportOrderDetailByImportId, getBatchInventoryForExportgoods }