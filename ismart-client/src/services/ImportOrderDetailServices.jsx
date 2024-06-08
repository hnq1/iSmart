import axios from "./axios"


const getAllImportOrderDetails = () => {
    return axios.get(`api/import-order-detail/get-all-import-order-details`)
}

const createNewImportOrderDetail = (importId, costPrice, batchCode, manufactureDate, expiryDate, goodsId, quantity) => {
    return axios.post(`api/import-order-detail/add-order-detail`, { importId, costPrice, batchCode, manufactureDate, expiryDate, goodsId, quantity })
}

const updateImportOrderDetail = (importId, costPrice, detailId, goodsId, quantity) => {
    return axios.put(`api/ImportOrderDetail/update-import-order-detail`, { importId, costPrice, detailId, goodsId, quantity })
}

const getImportOrderDetailByImportId = (importId) => {
    return axios.get(`api/ImportOrderDetail/get-import-order-details?oid=${importId}`)
}

export {getAllImportOrderDetails, createNewImportOrderDetail, updateImportOrderDetail, getImportOrderDetailByImportId }