<?php

namespace domain\resources\User;

use Tonic\Exception;
use Tonic\Response;
use domain\infrastructure\bases\ResourceBase;

/**
 * Class UserRegisterResource
 * @uri /register
 */
class UserRegisterResource extends ResourceBase
{
   /**
    * @method POST
    * @return Response
    */
   public function registerUser()
   {
      $response = null;

      try {
         $json_user_data = $this->request->getData();

         if (!isset($json_user_data)) {
            throw new Exception("User data not provided");
         }

         $user_data = json_decode($json_user_data);

         if (!isset($user_data)) {
            throw new Exception("User data not provided");
         }
         if (!isset($user_data->user_name)) {
            throw new Exception("Username not provided");
         }
         if (!isset($user_data->group_name)) {
            throw new Exception("Group name not provided");
         }
         if (!isset($user_data->email)) {
            throw new Exception("Email not provided");
         }
         if (!isset($user_data->password)) {
            throw new Exception("Password not provided");
         }

         $valid = $this->getServiceManager()
            ->getAccountService()
            ->createAccount(
               $user_data->user_name,
               $user_data->group_name,
               $user_data->email,
               $user_data->password
            );

         if (!isset($valid) || !$valid) {
            throw new Exception("Error creating account.");
         }

         $response = new Response(
            Response::OK,
            null,
            null
         );
      } catch (Exception $ex) {
         echo $ex->getMessage();
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => "Error registering new account")),
            array('content-type' => 'application/json')
         );
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => "Error registering new account")),
            array('content-type' => 'application/json')
         );
      }

      return $response;
   }
}
