<?php
require 'vendor/autoload.php';

// Create and configure Slim app
$app = new \Slim\App;

// Define app routes
$app->get('/hello/{name}', function ($request, $response, $args) {
    return $response->write("Hello " . $args['name']);
});

$app->post('/register', function ($request, $response, $args) {
   return $response->write("Whoohoo"); 
});

// Run app
$app->run();
