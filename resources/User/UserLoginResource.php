<?php

namespace domain\resources\User;

use Tonic\Exception;
use Tonic\Response;
use domain\infrastructure\bases\ResourceBase;

/**
 * Class UserLoginResource
 * @uri /login
 */
class UserLoginResource extends ResourceBase
{
   /**
    * @method POST
    * @return Response
    */
   public function loginUser()
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
         if (!isset($post_data->email)) {
            throw new Exception("Email not provided");
         }
         if (!isset($post_data->password)) {
            throw new Exception("Password not provided");
         }

         $valid_email = $this->getServiceManager()
            ->getUserService()
            ->checkIfUserEmailExists($post_data->email);

         if (!$valid_email) {
            throw new Exception("Email does not exist");
         }

         $user_data = $this->getServiceManager()
            ->getAuthenticationService()
            ->authenticateUser($post_data->email, $post_data->password);

         if (!isset($user_data)) {
            throw new Exception("Invalid email/password");
         }

         $response = new Response(
            Response::OK,
            json_encode(array('user' => $user_data)),
            array('content-type' => 'application/json')
         );
      } catch (Exception $ex) {
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => $ex->getMessage())),
            array('content-type' => 'application/json')
         );
      } catch (\Exception $ex) {
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => $ex->getMessage())),
            array('content-type' => 'application/json')
         );
      }

      return $response;
   }
}
