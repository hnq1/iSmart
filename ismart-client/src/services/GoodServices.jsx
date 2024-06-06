import axios from "./axios"

const  fetchGoodsWithFilter = (page, storageId, categoryId, supplierId, sortPrice, keyword) => {
    return axios.get(`api/goods/get-goods?page=${page}${storageId ? `&storageId=${storageId}` : ''}${categoryId ? `&categoryId=${categoryId}` : ''}
    ${supplierId ? `&supplierId=${supplierId}` : ''}${sortPrice ? `&sortPrice=${sortPrice}` : ''}
    ${keyword ? `&keyword=${keyword}` : ''}`);
}

const fetchGoodById = (id) => {
    return axios.get(`api/goods/get-good-by-id?id=${id}`)
}

const fetchAllGoods = () => {
    return axios.get(`api/goods/get-all-goods`);
}

const fetchGoodsWithStorageAndSupplier = (storageId, supplierId) => {
    return axios.get(`api/goods/get-goods-with-storage-supplier?storageId=${storageId}&supplierId=${supplierId}`)
}

const addGood = (goodsName, goodsCode, categoryId, description, supplierId, measuredUnit, image, statusId, warrantyTime, barcode, storageId) => {
    return axios.post(`api/goods/add-goods`, { goodsName, goodsCode, categoryId, description, supplierId, measuredUnit, image, statusId, warrantyTime, barcode, storageId });
}

const updateGood = (goodsId, goodsName, goodsCode, categoryId, description, supplierId, measuredUnit, image, statusId, warrantyTime, barcode, storageId) => {
    return axios.put(`api/goods/update-goods`, { goodsId, goodsName, goodsCode, categoryId, description, supplierId, measuredUnit, image, statusId, warrantyTime, barcode, storageId })
}


const fetchHistoryGood = (id) => {
    return axios.get(`api/Dashboard/get-data-by-goods-id?id=${id}`);
}

export { updateGood, addGood, fetchGoodsWithFilter, fetchAllGoods, fetchGoodsWithStorageAndSupplier, fetchGoodById, fetchHistoryGood }
