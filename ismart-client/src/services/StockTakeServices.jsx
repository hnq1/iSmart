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



export { createInventoryCheck, fetchInventoryByWarehouseId }