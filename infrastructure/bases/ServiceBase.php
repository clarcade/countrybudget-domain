<?php

namespace domain\infrastructure\bases;

use domain\infrastructure\DatabaseConnect;

abstract class ServiceBase {
    protected $database_connect;

    function __construct() {
        $this->database_connect = new DatabaseConnect();
    }
}
