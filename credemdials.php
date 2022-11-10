<?php

require 'includes/db.php';
require 'includes/header.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

    // Select user from database based on email provided from json body
    $user = $conn->prepare("SELECT * FROM user WHERE email = ? LIMIT 1");
    $user->execute([$jsonBody->email]);

    $user = $user->fetch(PDO::FETCH_ASSOC);

    // Check if the user exists
    if($user) {

        // Verify password
        if(password_verify($jsonBody->password, $user['password'])) {

            // generate access token
            $accessToken = bin2hex(openssl_random_pseudo_bytes(32));

            // Update user with accesstoken
            $updateUserAT = $conn->prepare("UPDATE user SET accesstoken = ? WHERE id = ?");
            $updateUserAT->execute([$accessToken, $user['id']]);

            // Return json result with success message
            echo json_encode(['message' => 'OK', 'accesstoken' => $accessToken]);

            // Stop code from executing
            return;

        }

    }

    echo json_encode(['password_incorrect']);

}