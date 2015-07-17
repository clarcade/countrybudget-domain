<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class GroupService extends ServiceBase
{
   public function createGroup($group_name)
   {
      $group_id = null;

      try {
         if (!isset($group_name)) {
            throw new \Exception("group_name not provided.");
         }

         $mysqli = $this->database_connect->getMysqli();
         $sanitized_group_name = $mysqli->escape_string($group_name);

         $sql = <<<EOF
INSERT INTO `group`
( `name`
, `active`
, `actual_label`
, `whatif_label`
, `income_label`
, `expenses_label`
, `revenue_label`
, `assets_label`
, `gdp_label`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( '$sanitized_group_name'
, 1
, 'Actual'
, 'What If'
, 'Income'
, 'Expenses'
, 'Revenue'
, 'Assets'
, 'GDP'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($mysql_connection->query($sql)) {
            $group_id = $mysql_connection->insert_id;
         } else {
            throw new \Exception("Error creating new group");
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error creating new group");
      }

      return $group_id;
   }
}
