import React, { useRef, useEffect, useState } from 'react';
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

const Warehouse3D = () => {
    const mountRef = useRef(null);
    const [inputDimensions, setInputDimensions] = useState({
        length: '',
        width: '',
    });
    const [dimensions, setDimensions] = useState(null);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setInputDimensions((prev) => ({ ...prev, [name]: value }));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const length = parseFloat(inputDimensions.length);
        const width = parseFloat(inputDimensions.width);
        if (!isNaN(length) && !isNaN(width)) {
            setDimensions({ length, width });
        }
    };

    useEffect(() => {
        if (!dimensions) return;

        const mount = mountRef.current;
        let scene = new THREE.Scene();
        let camera = new THREE.PerspectiveCamera(75, mount.clientWidth / mount.clientHeight, 0.1, 1000);
        let renderer = new THREE.WebGLRenderer({ antialias: true });
        renderer.setSize(mount.clientWidth, mount.clientHeight);
        renderer.setClearColor(0xffffff); // Set background color to white
        mount.appendChild(renderer.domElement);

        const controls = new OrbitControls(camera, renderer.domElement);
        controls.enableDamping = true;
        controls.dampingFactor = 0.1;
        controls.rotateSpeed = 2;
        controls.zoomSpeed = 2;
        controls.panSpeed = 2;
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
            renderer.dispose();
        };
    }, [dimensions]);

    return (
        <div style={styles.container}>
            <form onSubmit={handleSubmit} style={styles.form}>
                <div style={styles.inputGroup}>
                    <label style={styles.label}>
                        Length:
                        <input
                            type="text"
                            name="length"
                            value={inputDimensions.length}
                            onChange={handleChange}
                            style={styles.input}
                        />
                    </label>
                </div>
                <div style={styles.inputGroup}>
                    <label style={styles.label}>
                        Width:
                        <input
                            type="text"
                            name="width"
                            value={inputDimensions.width}
                            onChange={handleChange}
                            style={styles.input}
                        />
                    </label>
                </div>
                <button type="submit" style={styles.button}>Submit</button>
            </form>
            {dimensions && <div ref={mountRef} style={styles.scene} />}
        </div>
    );
};

const styles = {
    container: {
        display: 'flex',
        alignItems: 'flex-start',
    },
    form: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'flex-start',
        marginRight: '20px',
    },
    inputGroup: {
        marginBottom: '20px',
    },
    label: {
        display: 'flex',
        flexDirection: 'column',
        fontWeight: 'bold',
        marginBottom: '5px',
    },
    input: {
        padding: '8px',
        fontSize: '16px',
        borderRadius: '4px',
        border: '1px solid #ccc',
        width: '200px',
        marginTop: '5px',
    },
    button: {
        padding: '10px 20px',
        fontSize: '16px',
        borderRadius: '4px',
        border: 'none',
        backgroundColor: '#007BFF',
        color: '#fff',
        cursor: 'pointer',
    },
    scene: {
        width: '1000px',
        height: '600px',
        border: '1px solid #ccc',
    },
};

export default Warehouse3D;
