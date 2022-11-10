<?php

header('Content-type: application/json');

$jsonBody = json_decode(file_get_contents('php://input'));