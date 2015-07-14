<?php

namespace domain\infrastructure\bases;

use Tonic\Application;
use Tonic\Request;
use Tonic\Resource;
use domain\managers\ServiceManager;

class ResourceBase extends Resource {
    private $service_manager;

    function __construct(Application $app, Request $request)
    {
        parent::__construct($app, $request);

        $this->service_manager = new ServiceManager();
    }

    function getServiceManager()
    {
        return $this->service_manager;
    }
}
