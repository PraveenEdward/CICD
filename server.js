require('dotenv').config({ path: './database.env' }); // Load environment variables

const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();
app.use(express.json());
app.use(express.static('public')); // Serve frontend files

// Verify environment variables are loaded
console.log("Connecting to MySQL at:", process.env.DB_HOST);

// MySQL Database Connection
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT || 3306
});

db.connect(err => {
    if (err) {
        console.error('Database connection failed:', err);
        process.exit(1); // Stop the app if the database fails to connect
    }
    console.log('Connected to EC2 NODE DATABASE');

    // Create Table (Only if connected successfully)
    db.query(`CREATE TABLE IF NOT EXISTS names (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL
    )`, (err) => {
        if (err) console.error('Table creation failed:', err);
        else console.log('Table check successful.');
    });
});

// Homepage Route
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// CRUD API Endpoints
app.get('/names', (req, res) => {
    db.query('SELECT * FROM names', (err, results) => {
        if (err) return res.status(500).send('Database error');
        res.json(results);
    });
});

app.post('/names', (req, res) => {
    const { name } = req.body;
    if (!name) return res.status(400).send('Name is required');
    
    db.query('INSERT INTO names (name) VALUES (?)', [name], (err, result) => {
        if (err) return res.status(500).send('Database error');
        res.json({ id: result.insertId, name });
    });
});

app.put('/names/:id', (req, res) => {
    const { id } = req.params;
    const { name } = req.body;
    if (!name) return res.status(400).send('Name is required');
    
    db.query('UPDATE names SET name = ? WHERE id = ?', [name, id], (err, result) => {
        if (err) return res.status(500).send('Database error');
        if (result.affectedRows === 0) return res.status(404).send('Name not found');
        res.json({ message: 'Name updated successfully' });
    });
});

app.delete('/names/:id', (req, res) => {
    const { id } = req.params;
    
    db.query('DELETE FROM names WHERE id = ?', [id], (err, result) => {
        if (err) return res.status(500).send('Database error');
        if (result.affectedRows === 0) return res.status(404).send('Name not found');
        res.json({ message: 'Name deleted successfully' });
    });
});

// Start Server
const PORT = process.env.APP_PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
