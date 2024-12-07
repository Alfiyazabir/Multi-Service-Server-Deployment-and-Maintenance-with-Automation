<?php
// Database connection details
$servername = "localhost";
$username = "formuser";
$password = "securepassword";
$dbname = "formdb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$name = $_POST['name'];
$email = $_POST['email'];

// Insert data into database
$sql = "INSERT INTO submissions (name, email) VALUES ('$name', '$email')";

if ($conn->query($sql) === TRUE) {
    echo "Data submitted successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>
