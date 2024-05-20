import axios from "./axios"

const loginApi = (username, password) => {

    return axios.post("api/Authentication/Login", { username, password });
}
const logoutApi = (userId) => {
    return axios.post(`api/Authentication/Logout?id=${userId}`, {});
};
const forgotPassword = (email) => {
    const encodedEmail = encodeURIComponent(email);
    return axios.post(`api/Authentication/ResetPasswordByEmail?email=${encodedEmail}`, {});
};
const changePassword = (userId, password, oldPassword) => {

    return axios.put("/api/Authentication/ChangePassword", { userId, password, oldPassword });
};
export { loginApi, logoutApi, forgotPassword, changePassword }