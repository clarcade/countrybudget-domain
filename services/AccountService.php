<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class AccountService extends ServiceBase
{
   public function createAccount($user_name, $group_name, $email, $password)
   {
      $created = false;

      try {
         if (!isset($user_name)) {
            throw new \Exception("user_name not provided");
         }
         if (!isset($group_name)) {
            throw new \Exception("group_name not provided");
         }
         if (!isset($email)) {
            throw new \Exception("email not provided");
         }
         if (!isset($password)) {
            throw new \Exception("password not provided");
         }

         // 1) Create nation (DO Later when I implement nations)

         // 2) Create group (and add to nation)
         $group_service = new GroupService();
         $group_id = $group_service->createGroup($group_name);

         if (!isset($group_id)) {
            throw new \Exception("Error creating new group");
         }

         // 3) Create user and add to group
         $user_service = new UserService();
         $user_id = $user_service->createUser(
            $group_id,
            $user_name,
            $email,
            $password
         );

         if (!isset($user_id)) {
            throw new \Exception("Error creating new user");
         }

         $created = true;
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw $ex;
      }

      return $created;
   }
}
