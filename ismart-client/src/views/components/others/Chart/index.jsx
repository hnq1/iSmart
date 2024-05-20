import React, { useEffect, useState } from 'react';
import { Line, Bar } from 'react-chartjs-2';
import { Chart, LinearScale, CategoryScale, PointElement, LineElement, Title, Tooltip, BarElement } from 'chart.js';

Chart.register(LinearScale, CategoryScale, PointElement, LineElement, Title, Tooltip, BarElement);

const ChartComponent = ({ selectedGoodCode, dateOrder, quantityOrder, title }) => {
    const data = {
        labels: dateOrder,
        datasets: [
            {
                label: 'Số liệu',
                data: quantityOrder,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
            },
        ],
    };

    const config = {
        type: 'line',
        data: data,
        options: {
            scales: {
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

