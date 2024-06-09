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
    return axios.get(`api/ImportOrderDetail/get-import-order-details?oid=${oid}`)
}

export { getAllImportOrderDetails, createNewImportOrderDetail, updateImportOrderDetail, deleteImportOrderDetail, getImportOrderDetailByImportId }