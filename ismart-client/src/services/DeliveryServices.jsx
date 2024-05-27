import axios from "./axios"

const fetchAllDelivery = () => {
    return axios.get(`api/delivery/get-all-delivery`);
}
const fetchDeliveriesWithKeyword = (page, keyword) => {
    return axios.get(`api/delivery/get-delivery-with-filter?page=${page}${keyword ? `&keyword=${keyword}` : ``}`)
}

const createNewDelivery = (deliveryName) => {
    return axios.post(`api/delivery/add-delivery`, { deliveryName })
}

const updateDelivery = (deliveyId, deliveryName) => {
    return axios.put(`api/delivery/update-delivery`, { deliveyId, deliveryName })
}

export { fetchAllDelivery, fetchDeliveriesWithKeyword, createNewDelivery, updateDelivery }