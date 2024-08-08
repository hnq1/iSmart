import React from 'react';
import { Bar } from 'react-chartjs-2';
import { Chart, LinearScale, CategoryScale, BarElement, Title, Tooltip } from 'chart.js';

Chart.register(LinearScale, CategoryScale, BarElement, Title, Tooltip);

const ChartComponent = ({ selectedGoodCode, dateOrder, quantityOrder, title }) => {
    // Ensure dateOrder and quantityOrder have the same length
    const completeData = dateOrder.map((date, index) => ({
        date,
        quantity: quantityOrder[index] || 0 // Default to 0 if quantity is missing
    }));

    const data = {
        labels: completeData.map(item => item.date),
        datasets: [
            {
                label: 'Số liệu',
                data: completeData.map(item => item.quantity),
                backgroundColor: 'rgba(0, 123, 255, 0.7)', // Màu xanh da trời cho từng cột
                borderColor: 'rgba(0, 123, 255, 1)',
                borderWidth: 1,
            },
        ],
    };

    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                x: {
                    ticks: {
                        autoSkip: false, // Hiển thị tất cả các nhãn
                        maxRotation: 0,
                        minRotation: 0,
                        padding: 10,  // Khoảng cách giữa các nhãn và trục x
                        callback: function(value) {
                            const label = this.getLabelForValue(value);
                            return label.length > 10 ? `${label.substring(0, 10)}...` : label;
                        }
                    },
                    categoryPercentage: 0.9, // Giảm khoảng cách giữa các cột
                    barPercentage: 1.0, // Tăng khoảng cách giữa các cột
                },
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                tooltip: {
                    enabled: true,
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (context) {
                            const value = context.parsed.y || '';
                            return value.toString();
                        }
                    }
                }
            }
        },
    };

    return (
        <div style={{ width: '500px', height: '500px' }}>
            <Bar data={data} options={config.options} />
            <label>Số lượng {title} của sản phẩm {selectedGoodCode}</label>
        </div>
    );
};

export default ChartComponent;
