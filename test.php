<?php
// Sample PHP file with vulnerabilities

// SQL Injection Vulnerability
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $conn = new mysqli("localhost", "username", "password", "database");
    $query = "SELECT * FROM users WHERE id = $id"; // Vulnerable query
    $result = $conn->query($query);
    while ($row = $result->fetch_assoc()) {
        echo "User: " . $row['username'] . "<br>";
    }
}

// Cross-Site Scripting (XSS) Vulnerability
if (isset($_POST['name'])) {
    $name = $_POST['name'];
    echo "Hello, " . $name; // Outputting user input without sanitization
}

// Insecure File Upload Vulnerability
if (isset($_FILES['file'])) {
    $upload_dir = "uploads/";
    $upload_file = $upload_dir . basename($_FILES['file']['name']);
    if (move_uploaded_file($_FILES['file']['tmp_name'], $upload_file)) {
        echo "File uploaded successfully: " . $upload_file;
    } else {
        echo "File upload failed!";
    }
}
?>
