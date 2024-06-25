import React, { useEffect } from 'react';

const WebSocketComponent = () => {
    useEffect(() => {
        const socket = new WebSocket('wss://localhost:7033/ws'); // Thay đổi URL và port tương ứng với server của bạn
        
        socket.onopen = () => {
            console.log('WebSocket connected');
        };

        socket.onmessage = (event) => {
            const message = event.data;
            console.log('Received message from server:', message);

            // Xử lý thông điệp nhận được từ server ở đây, có thể là hiển thị lên giao diện
            // Ví dụ:
            // alert(message);
        };

        return () => {
            socket.close();
        };
    }, []);

    return (
        <div>
            {/* Giao diện của bạn */}
        </div>
    );
};

export default WebSocketComponent;