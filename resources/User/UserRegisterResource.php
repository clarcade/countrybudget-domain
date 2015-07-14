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
         $json_post_data = $this->request->getData();

         if (!isset($json_post_data)) {
            throw new Exception("User data not provided");
         }

         $post_data = json_decode($json_post_data);

         if (!isset($post_data)) {
            throw new Exception("User data not provided");
         }
         if (!isset($post_data->user_name)) {
            throw new Exception("Username not provided");
         }
         if (!isset($post_data->group_name)) {
            throw new Exception("Group name not provided");
         }
         if (!isset($post_data->email)) {
            throw new Exception("Email not provided");
         }
         if (!isset($post_data->password)) {
            throw new Exception("Password not provided");
         }

         $valid = $this->getServiceManager()
            ->getAccountService()
            ->createAccount(
               $post_data->user_name,
               $post_data->group_name,
               $post_data->email,
               $post_data->password
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
