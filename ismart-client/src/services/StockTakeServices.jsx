import axios from "./axios"

const fetchInventoryByWarehouseId = (warehouseId) => {
    return axios.get(`api/inventory-check/get-all-inventory-checks?warehouseId=${warehouseId}`)
}

const createInventoryCheck = (warehouseId, checkDate, status, inventoryCheckDetails) => {
    return axios.post(`api/inventory-check/create-return-order`, {
        warehouseId,
        checkDate,
        status,
        inventoryCheckDetails
    });
};

const updateInventoryCheck = (batch) => {
    return axios.post(`api/inventory-check/update-batch-quantities`, batch)
}

const cancelInventoryCheck = (id) => {
    return axios.post(`api/inventory-check/cancel-inventory-check?id=${id}`)
}




export { createInventoryCheck, fetchInventoryByWarehouseId, cancelInventoryCheck, updateInventoryCheck }