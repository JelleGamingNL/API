<?php

try {
    $conn = new PDO("mysql:dbname=jacht;host=127.0.0.1", "root", "");
} catch(PDOException $e) {
    echo $e->getMessage();
}