import axios from "./axios"

const uploadImage = (file) => {
    const formData = new FormData();
    formData.append('image', file);

    return axios.post('https://localhost:7033/api/Image/UploadImage', formData, {
        headers: {
            'Content-Type': 'multipart/form-data',
        },
    });
}

export default uploadImage;