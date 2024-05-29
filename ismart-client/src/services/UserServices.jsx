import axios from "./axios"


const fetchUserByUserId = (id) => {
    return axios.get(`api/user/get-user-by-id?id=${id}`)
        .then(response => {
            console.log(response);
            return response.data;
        })
        .catch(error => {
            console.error(error);
        });
}

const fetchUserWithFilter = (pageNum, role, statusId, storageId, keyword) => {
    return axios.get(`api/user/get-users?pageNum=${pageNum}
    ${role ? `&role=${role}` : ``}
    ${statusId ? `&statusId=${statusId}` : ``}
    ${storageId ? `&storageId=${storageId}` : ``}
    ${keyword ? `&keyword=${keyword}` : ``}`)
}

const updateUser = (userId, email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName) => {
    return axios.put(`api/user/update-user`, { userId, email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName })
}

const addUser = (email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName) => {
    return axios.post(`api/user/add-user`, { email, password, phone, roleId, statusId, userName, storageId, userCode, address, image, fullName })
}
const updateUserStatus = (id) => {
    return axios.put(`api/user/update-user-status?id=${id}`)
}

export { updateUserStatus, fetchUserByUserId, updateUser, fetchUserWithFilter, addUser }