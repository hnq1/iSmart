import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

let toastId = null; // Biến toastId để lưu trữ id của toast

const setupWebSocket = () => {
    const roleId = parseInt(localStorage.getItem('roleId'), 10); // Lấy roleId từ localStorage
    if (roleId === 2) { // Chỉ thiết lập WebSocket nếu roleId là 2
        const socket = new WebSocket('wss://localhost:7033/ws'); // Thay đổi URL và port tương ứng với server của bạn

        socket.onopen = () => {
            console.log('WebSocket connected');
        };

        socket.onmessage = (event) => {
            const message = event.data;
            console.log('Received message from server:', message);

            // Đóng toast hiện tại nếu đã tồn tại
            if (toastId !== null) {
                toast.dismiss(toastId);
            }

            // Hiển thị toast mới
            toastId = toast.success(message, {
                autoClose: false,
                onClick: () => toast.dismiss(toastId)
            });
        };

        return () => {
            socket.close();
        };
    }
};

export default setupWebSocket;
