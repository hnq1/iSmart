import axios from "./axios"

const loginApi = (username, password) => {

    return axios.post("api/auth/login", { username, password });
}
const logoutApi = (userId) => {
    return axios.post(`api/auth/logout?id=${userId}`, {});
};
const forgotPassword = (email) => {
    const encodedEmail = encodeURIComponent(email);
    return axios.post(`api/auth/reset-password-by-email?email=${encodedEmail}`, {});
};
const changePassword = (userId, password, oldPassword) => {

    return axios.put("/api/auth/change-password", { userId, password, oldPassword });
};
export { loginApi, logoutApi, forgotPassword, changePassword }