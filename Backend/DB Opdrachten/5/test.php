<?php

include_once("dbdata.php");
function ConnectToDatabase($databaseServer, $user, $pass, $schema)
{
    $conn = new mysqli($databaseServer, $user, $pass, $schema);
    if($conn->connect_error)
    {
        echo "error try again\r\n";
    }

    echo "connected to database\r\n";
    return $conn;
}

$conn = ConnectToDatabase($databaseServer, $user, $pass, $schema);
?>