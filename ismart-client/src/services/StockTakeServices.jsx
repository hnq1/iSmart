import axios from "./axios"

const fetchStockTakeWithFilter = (page, storageId, statusId, keyword) => {
    return axios.get(`api/stock-take/get-list-stock-take-note-with-filter?page=${page}${storageId ? `&storageId=${storageId}` : ''}${statusId ? `&statusId=${statusId}` : ''}${keyword ? `&keyword=${keyword}` : ''}`);
}

const addStockTake = (created, canceled, updated, statusId, updatedId, storageId, note, createdId, stocktakeCode) => {
    return axios.post(`api/stock-take/add-stocktake-note`, { created, canceled, updated, statusId, updatedId, storageId, note, createdId, stocktakeCode })
}

// sửa/ xác nhận kiểm kê
const editStockTake = (stockId, updatedEmail, userId, note) => {
    return axios.put(`api/stock-take/edit-stock-take-note`, { stockId, updatedEmail, userId, note })
}

const updateGoodHistoryAfterChekckout = (goodsId, currentStock, actualStock, userEmail, stockTakeCode, userId) => {
    return axios.put(`api/stock-take/update-good-history-change`, { goodsId, currentStock, actualStock, userEmail, stockTakeCode, userId })
}

const fetchNewestStockTake = () => {
    return axios.get(`api/stock-take/get-newest-stocktake`);
}

const cancelStockTake = (stocktakeid) => {
    return axios.put(`api/stock-take/cancle-stocktake-note?stocktakeid=${stocktakeid}`)
}
export { cancelStockTake, fetchStockTakeWithFilter, addStockTake, fetchNewestStockTake, editStockTake, updateGoodHistoryAfterChekckout }