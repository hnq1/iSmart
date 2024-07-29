import axios from "./axios"

const loginApi = (userName, password) => {

    return axios.post("api/auth/login", { userName, password });
    // return axios.post("api/Authentication/Login", { userName, password });
}
const logoutApi = (userId) => {
    return axios.post(`api/auth/logout?id=${userId}`, {});
    // return axios.post(`api/Authentication/Logout?id=${userId}`, {});
};
const forgotPassword = (username) => {
    return axios.post(`api/auth/reset-password-by-email?username=${username}`, username);
};
const changePassword = (userId, password, oldPassword) => {
    return axios.put("/api/auth/change-password", { userId, password, oldPassword });
};


export { loginApi, logoutApi, forgotPassword, changePassword }