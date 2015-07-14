<?php

namespace domain\infrastructure;

use mysqli;

require(dirname(__FILE__) . "/configurations/configuration.php");

class DatabaseConnect {
    private $mysqli;

    function __construct()
    {
        $this->mysqli = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);

        if ($this->mysqli->connect_errno) {
            echo "Failed to connect to MySQL: (" . $this->mysqli->connect_errno . ") " . $this->mysqli->connect_error;
        }
    }

    function getMysqli()
    {
        return $this->mysqli;
    }

    function closeConnection()
    {
        $this->mysqli->close();
    }
}
