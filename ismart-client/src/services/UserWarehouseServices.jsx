import axios from "./axios"


const getUserIdWarehouse = (userId) => {
    try {
        return axios.get(`/api/users/${userId}/warehouses`);
    } catch (error) {
        console.error('Error fetching warehouses:', error.response ? error.response.data : error.message);
        throw error;
    }
}

const updateUserWarehouseToUser = (userId, warehouseId) => {
    return axios.put(`/api/users/${userId}/warehouses/${warehouseId}`);
}

const deleteUserWarehouseToUser = (userId, warehouseId) => {
    return axios.delete(`/api/users/${userId}/warehouses/${warehouseId}`);
}

export { getUserIdWarehouse, updateUserWarehouseToUser, deleteUserWarehouseToUser };