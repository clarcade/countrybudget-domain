<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class UserService extends ServiceBase
{
   public function getUserById($user_id)
   {
      $user = null;

      try {
         if (!isset($user_id)) {
            throw new \Exception("user_id not provided.");
         }

         $sql = <<<EOF
SELECT u.first_name
,      u.last_name
,      u.id
FROM   `user` u
WHERE  u.id = $user_id;
EOF;

         if ($result = $this->database_connect->getMysqli()->query($sql)) {
            $row = mysqli_fetch_row($result);
            $user = array(
               'name' => $row[0] . " " . $row[1],
               'id' => $row[2]
            );
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error getting user");
      }

      return $user;
   }

   public function createUser($group_id, $user_name, $email, $password)
   {
      $user_id = null;

      try {
         if (!isset($group_id)) {
            throw new \Exception("group_id not provided");
         }
         if (!is_numeric($group_id)) {
            throw new \Exception("group_id must be numeric");
         }
         if (!isset($user_name)) {
            throw new \Exception("user_name not provided");
         }
         if (!isset($email)) {
            throw new \Exception("email not provided");
         }
         if (!isset($password)) {
            throw new \Exception("password not provided");
         }

         $mysqli = $this->database_connect->getMysqli();
         $sanitized_user_name = $mysqli->escape_string($user_name);
         $sanitized_email = $mysqli->escape_string($email);
         $sanitized_password = $mysqli->escape_string($password);

         $sql = <<<EOF
INSERT INTO `user`
( `user_name`
, `email`
, `password`
, `role_id`
, `active`
, `group_id`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( '$sanitized_user_name'
, '$sanitized_email'
, '$sanitized_password'
, ( SELECT `id`
    FROM   `role`
    WHERE  `name` = 'GROUP ADMIN' )
, 1
, $group_id
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($mysql_connection->query($sql)) {
            $user_id = $mysql_connection->insert_id;
         } else {
            throw new \Exception("Mysql failed to execute query to insert new user.");
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error creating new user");
      }

      return $user_id;
   }

   public function checkIfUserEmailExists($email)
   {
      $valid = false;

      try {
         if (!isset($email)) {
            throw new \Exception("email not provided");
         }

         $mysqli = $this->database_connect->getMysqli();
         $sanitized_email = $mysqli->escape_string($email);

         $sql = <<<EOF
SELECT u.email
FROM `user` u
WHERE u.email = '$sanitized_email';
EOF;

         if ($result = $this->database_connect->getMysqli()->query($sql)) {
            if ($result->num_rows === 1) {
               $valid = true;
            }
         } else {
            throw new \Exception("Mysql failed to execute SELECT query.");
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error checking if user exists");
      }

      return $valid;
   }
}
