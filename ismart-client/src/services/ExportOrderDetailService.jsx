import axios from "./axios"

const createNewExportOrderDetail = (exportId, price, goodsId, quantity) => {
    return axios.post(`api/ExportOrderDetail/add-order-detail`, { exportId, price, goodsId, quantity })
}

const getExportOrderDetailByExportId = (exportId) => {
    return axios.get(`api/ExportOrderDetail/get-export-order-details?oid=${exportId}`)
}

const updateExportOrderDetail = (exportId, price, detailId, goodsId, quantity) => {
    return axios.put(`api/ExportOrderDetail/update-export-order-detail`, { exportId, price, detailId, goodsId, quantity })
}

export { createNewExportOrderDetail, getExportOrderDetailByExportId, updateExportOrderDetail }