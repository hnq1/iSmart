import React, { useRef, useEffect, useState } from 'react';
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

const Warehouse3D = () => {
    const mountRef = useRef(null);
    const [inputs, setInputs] = useState({ length: 20, width: 20 });
    const [dimensions, setDimensions] = useState(null);
    const [shelfCount, setShelfCount] = useState(0); // Add state for shelf count

    const handleChange = (e) => {
        const { name, value } = e.target;
        setInputs((prev) => ({ ...prev, [name]: parseFloat(value) }));
    };

    const handleSubmit = () => {
        setDimensions(inputs);
    };

    useEffect(() => {
        if (!dimensions) return;

        const mount = mountRef.current;
        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(75, mount.clientWidth / mount.clientHeight, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer({ antialias: true });
        renderer.setSize(mount.clientWidth, mount.clientHeight);
        renderer.setClearColor(0xffffff); // Set background color to white
        mount.appendChild(renderer.domElement);

        const controls = new OrbitControls(camera, renderer.domElement);
        controls.enableDamping = true;
        controls.dampingFactor = 0.25;
        controls.screenSpacePanning = false;
        controls.maxPolarAngle = Math.PI / 2;

        const calculateShelves = (length, width, shelfLength, shelfWidth, aisleWidth) => {
            const numShelvesLength = Math.floor((length - aisleWidth) / (shelfLength + aisleWidth));
            const numShelvesWidth = Math.floor((width - aisleWidth) / (shelfWidth + aisleWidth));
            return { numShelvesLength, numShelvesWidth };
        };

        const { length, width } = dimensions;
        const height = 10; // Fixed height in meters
        const shelfLength = 2; // Shelf length in meters
        const shelfWidth = 1; // Shelf width in meters
        const shelfHeight = 2; // Shelf height in meters
        const aisleWidth = 1.5; // Aisle width in meters

        const { numShelvesLength, numShelvesWidth } = calculateShelves(length, width, shelfLength, shelfWidth, aisleWidth);

        // Update shelf count
        setShelfCount(numShelvesLength * numShelvesWidth); // Only count shelves on the ground level

        // Create shelf materials
        const shelfMaterial = new THREE.MeshBasicMaterial({
            color: 0x00ff00, // Set color
            transparent: true,
            opacity: 0.5, // Set opacity for transparency
        });
        const shelfEdgeMaterial = new THREE.LineBasicMaterial({ color: 0x000000 }); // Black edge

        // Create shelves
        const shelfGeometry = new THREE.BoxGeometry(shelfLength, shelfHeight, shelfWidth);
        const edgesGeometry = new THREE.EdgesGeometry(shelfGeometry);

        for (let i = 0; i < numShelvesLength; i++) {
            for (let j = 0; j < numShelvesWidth; j++) {
                const shelf = new THREE.Mesh(shelfGeometry, shelfMaterial);
                shelf.position.set(
                    -length / 2 + shelfLength / 2 + aisleWidth + i * (shelfLength + aisleWidth),
                    shelfHeight / 2, // Place shelf at ground level
                    -width / 2 + shelfWidth / 2 + aisleWidth + j * (shelfWidth + aisleWidth)
                );
                scene.add(shelf);

                // Add edges to shelf
                const shelfEdges = new THREE.LineSegments(edgesGeometry, shelfEdgeMaterial);
                shelfEdges.position.copy(shelf.position);
                scene.add(shelfEdges);
            }
        }

        // Create grid based on dimensions with 1 meter divisions
        const gridHelper = new THREE.GridHelper(Math.max(length, width), Math.max(length, width));
        scene.add(gridHelper);

        camera.position.set(length / 2, height / 2, Math.max(length, width));

        const animate = () => {
            requestAnimationFrame(animate);
            controls.update();
            renderer.render(scene, camera);
        };

        animate();

        return () => {
            mount.removeChild(renderer.domElement);
            renderer.dispose();
        };
    }, [dimensions]);

    return (
        <div>
            <div>
                <label>
                    Length (meters):
                    <input type="number" name="length" value={inputs.length} onChange={handleChange} />
                </label>
                <label>
                    Width (meters):
                    <input type="number" name="width" value={inputs.width} onChange={handleChange} />
                </label>
                <button onClick={handleSubmit}>Submit</button>
            </div>
            <div ref={mountRef} style={{ width: '1000px', height: '600px' }} />
            {dimensions && (
                <div>
                    <p>Số kệ mà bạn có thể thêm vào kho với diện tích bạn có : {shelfCount}</p> {/* Display shelf count */}
                </div>
            )}
        </div>
    );
};

export default Warehouse3D;