<?php
$envSettings = []; // Maakt een function
    if (file_exists(dirname(__FILE__).'/.env')) { // Kijkt of er een .env file is
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); // Run file???
    }

    $schema = $envSettings["DB_SCHEMA_NAME"];
    $user = $envSettings["DB_USER"];
    $pass = $envSettings["DB_PASSWORD"];
    $host = $envSettings["DB_HOST"];
?>