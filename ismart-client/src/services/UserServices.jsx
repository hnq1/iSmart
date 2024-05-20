import axios from "./axios"


const fetchUserByUserId = (id) => {
    return axios.get(`api/User/get-user-by-id?id=${id}`);
}

const fetchUserWithFilter = (pageNum, role, statusId, storageId, keyword) => {
    return axios.get(`api/User/get-users?pageNum=${pageNum}${role ? `&role=${role}` : ``}${statusId ? `&statusId=${statusId}` : ``}${storageId ? `&storageId=${storageId}` : ``}${keyword ? `&keyword=${keyword}` : ``}`)
}

const updateUser = (userId, email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName) => {
    return axios.put(`api/User/update-user`, { userId, email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName })
}

const addUser = (email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName) => {
    return axios.post(`api/User/add-user`, { email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName })
}
const updateUserStatus = (id) => {
    return axios.put(`api/User/update-user-status?id=${id}`)
}

export { updateUserStatus, fetchUserByUserId, updateUser, fetchUserWithFilter, addUser }