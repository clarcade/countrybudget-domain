<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class GroupService extends ServiceBase
{
   public function getActualGroupIncomeData($group_id)
   {
      if (!isset($group_id)) {
         throw new \Exception("group_id not provided");
      }

      $group_income_data = null;

      try {
         $group_income_data = [];

         $sql = <<<EOF
SELECT gi.name AS name
,      gi.type AS type
,      gi.amount AS amount
,      gi.notes AS notes
,      gi.last_update_date AS date
FROM   `group_basic_income` gi
WHERE  gi.group_id = $group_id
AND    gi.what_if = 0;
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($result = $mysql_connection->query($sql)) {
            if ($result->num_rows > 0) {
               while ($row = $result->fetch_assoc()) {
                  $group_income_data[] = [
                     'name' => $row["name"],
                     'type' => $row["type"],
                     'amount' => $row["amount"],
                     'notes' => $row["notes"],
                     'date' => $row["date"]
                  ];
               }
            }
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
      } finally {
         $this->database_connect->closeConnection();
      }

      return $group_income_data;
   }

   public function createGroup($group_name)
   {
      $group_id = null;

      try {
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
, 1, UTC_DATE(), 1, UTC_DATE());
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($mysql_connection->query($sql)) {
            $group_id = $mysql_connection->insert_id;
         } else {
            throw new \Exception("Error creating new group");
         }
      } finally {
         $this->database_connect->closeConnection();
      }

      return $group_id;
   }
}
