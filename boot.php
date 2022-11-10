<?php

    require 'includes/db.php';
    require 'includes/header.php';

    if($_SERVER['REQUEST_METHOD'] == "POST") {

        $boot = $conn->prepare("SELECT * FROM boot WHERE naam = ? LIMIT 1");
        $boot->execute([$jsonBody->naam]);

        $boot = $boot->fetch(PDO::FETCH_ASSOC);

       if(!$boot) {

            $bootinsert = $conn->prepare("INSERT INTO boot (naam) values(?)");
            $bootinsert->execute([$jsonBody->naam]);
        }
       else{ 
           echo json_encode(['boat_already_exists_on_site']);
        }

    }