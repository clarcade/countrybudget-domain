<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class AuthenticationService extends ServiceBase
{
   public function authenticateUser($email, $password)
   {
      $user = null;

      try {
         $mysqli = $this->database_connect->getMysqli();
         $sanitized_email = $mysqli->escape_string($email);
         $sanitized_password = $mysqli->escape_string($password);

         $sql = <<<EOF
SELECT u.id AS user_id
,      g.id AS group_id
FROM   `user` u
INNER JOIN `group` g ON u.group_id = g.id
WHERE  u.email = '$sanitized_email'
AND    u.password = '$sanitized_password';
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($result = $mysql_connection->query($sql)) {
            if ($result->num_rows === 1) {
               $row = $result->fetch_assoc();

               $user = array(
                  'user_id' => $row['user_id'],
                  'group_id' => $row['group_id']
               );
            }
         }
      } catch (\Exception $ex) {
         throw new \Exception($ex->getMessage());
      } finally {
         $this->database_connect->closeConnection();
      }

      return $user;
   }
}
