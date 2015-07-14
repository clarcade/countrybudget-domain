<?php

namespace domain\resources\User;

use Tonic\Exception;
use Tonic\Response;
use domain\infrastructure\bases\ResourceBase;

/**
 * Class UserResource
 * @uri /user/:user_id
 */
class UserResource extends ResourceBase
{
   /**
    * @method GET
    * @param $user_id
    * @return Response
    */
   public function getUserName($user_id)
   {
      echo "Probably shouldn't be here.";
//
//      $response = null;
//
//      try {
//         $user = $this->getServiceManager()->getUserService()->getUserById($user_id);
//
//         $response = new Response(
//            Response::OK,
//            json_encode(array('user' => $user)),
//            array('content-type' => 'application/json')
//         );
//      } catch (Exception $ex) {
//         echo $ex->getMessage();
//      }
//
//      return $response;
   }
}
