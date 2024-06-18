import React, { useRef, useEffect, useState } from 'react';
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

const Warehouse3D = () => {
    const mountRef = useRef(null);
    const [dimensions, setDimensions] = useState({
        length: 200,
        width: 200,
    });

    const handleChange = (e) => {
        const { name, value } = e.target;
        setDimensions((prev) => ({ ...prev, [name]: parseFloat(value) }));
    };

    useEffect(() => {
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
        const height = 50; // Fixed height
        const shelfLength = 20; // Smaller shelf length
        const shelfWidth = 10; // Smaller shelf width
        const shelfHeight = 10; // Smaller shelf height
        const aisleWidth = 10; // Increased aisle width

        const { numShelvesLength, numShelvesWidth } = calculateShelves(length, width, shelfLength, shelfWidth, aisleWidth);

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
                for (let k = 0; k < 2; k++) { // Stack two shelves
                    const shelf = new THREE.Mesh(shelfGeometry, shelfMaterial);
                    shelf.position.set(
                        -length / 2 + shelfLength / 2 + aisleWidth + i * (shelfLength + aisleWidth),
                        shelfHeight / 2 + k * (shelfHeight + 1), // Stack shelves vertically
                        -width / 2 + shelfWidth / 2 + aisleWidth + j * (shelfWidth + aisleWidth)
                    );
                    scene.add(shelf);

                    // Add edges to shelf
                    const shelfEdges = new THREE.LineSegments(edgesGeometry, shelfEdgeMaterial);
                    shelfEdges.position.copy(shelf.position);
                    scene.add(shelfEdges);
                }
            }
        }

        // Create grid based on dimensions
        const gridHelper = new THREE.GridHelper(Math.max(length, width), Math.max(length, width) / 10);
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
        };
    }, [dimensions]);

    return (
        <div>
            <div>
                <label>
                    Length:
                    <input type="number" name="length" value={dimensions.length} onChange={handleChange} />
                </label>
                <label>
                    Width:
                    <input type="number" name="width" value={dimensions.width} onChange={handleChange} />
                </label>
            </div>
            <div ref={mountRef} style={{ width: '1000px', height: '600px' }} />
        </div>
    );
};

export default Warehouse3D;
