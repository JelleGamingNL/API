<?php

    require 'includes/db.php';
    require 'includes/header.php';

    if($_SERVER['REQUEST_METHOD'] == "POST") {

        $user = $conn->prepare("SELECT * FROM user WHERE email = ? LIMIT 1");
        $user->execute([$jsonBody->email]);

        $user = $user->fetch(PDO::FETCH_ASSOC);

        if(!$user) {

            $userinsert = $conn->prepare("INSERT INTO user (email, password, name, boot_id) values(?, ?, ?, ?)");
            $userinsert->execute([$jsonBody->email, password_hash($jsonBody->password, PASSWORD_BCRYPT), $jsonBody->name, $jsonBody->boot_id]);
            echo json_encode(['register_complete']);
        }
       else{ 
           echo json_encode(['user_already_exists']);
        }

}