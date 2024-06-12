import axios from "./axios"

const fetchGoodsWithFilter = (page, storageId, categoryId, supplierId, sortPrice, keyword) => {
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

const fetchGoodsWithStorageAndSupplier = (warehouseId, supplierId) => {
    return axios.get(`api/goods/get-goods-with-warehouse-supplier?warehouseId=${warehouseId}&supplierId=${supplierId}`)
}

const addGood = (userId,
    goodsName, goodsCode, categoryId,
    description, supplierId, measuredUnit,
    image, statusId, stockPrice,
    createdDate, warrantyTime, barcode,
    maxStock, minStock, warehouseId) => {
    return axios.post(`api/goods/add-goods?userId=${userId}`, {
        goodsName, goodsCode, categoryId,
        description, supplierId, measuredUnit,
        image, statusId, stockPrice,
        createdDate, warrantyTime, barcode,
        maxStock, minStock, warehouseId
    });
}

const updateGood = (goodsId, goodsName, goodsCode,
    categoryId, description, supplierId,
    measuredUnit, inStock, image,
    statusId, stockPrice, warrantyTime, barcode,
    storageId, maxStock, minStock) => {
    return axios.put(`api/goods/update-goods`, {
        goodsId, goodsName, goodsCode,
        categoryId, description, supplierId,
        measuredUnit, inStock, image,
        statusId, stockPrice, warrantyTime, barcode,
        storageId, maxStock, minStock
    });
}


const fetchHistoryGood = (id) => {
    return axios.get(`api/Dashboard/get-data-by-goods-id?id=${id}`);
}

const fetchAllGoodsInWarehouse = (id) => {
    return axios.get(`api/goods/get-goods-in-warehouse?warehouseId=${id}`)
}
export { updateGood, addGood, fetchGoodsWithFilter, fetchAllGoods, fetchGoodsWithStorageAndSupplier, fetchGoodById, fetchHistoryGood, fetchAllGoodsInWarehouse }
