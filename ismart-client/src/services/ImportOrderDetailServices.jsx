import axios from "./axios"

const createNewImportOrderDetail = (importId, costPrice, goodsId, quantity) => {
    return axios.post(`api/ImportOrderDetail/add-order-detail`, { importId, costPrice, goodsId, quantity })
}

const updateImportOrderDetail = (importId, costPrice, detailId, goodsId, quantity) => {
    return axios.put(`api/ImportOrderDetail/update-import-order-detail`, { importId, costPrice, detailId, goodsId, quantity })
}

const getImportOrderDetailByImportId = (importId) => {
    return axios.get(`api/ImportOrderDetail/get-import-order-details?oid=${importId}`)
}

export { createNewImportOrderDetail, updateImportOrderDetail, getImportOrderDetailByImportId }