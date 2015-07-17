<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class GroupIncomeService extends ServiceBase
{
   public function getActualData($group_id)
   {
      if (!isset($group_id)) {
         throw new \Exception("group_id not provided");
      }
      if (!is_numeric($group_id)) {
         throw new \Exception("group_id must be a number");
      }

      $group_income_data = null;

      try {
         $group_income_data = [];

         $sql = <<<EOF
SELECT gi.name AS name
,      gi.type AS type
,      gi.amount AS amount
,      gi.notes AS notes
,      DATE_FORMAT(gi.last_update_date, '%d-%b-%Y') AS date
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
         throw new \Exception("Error getting group income actual data");
      }

      return $group_income_data;
   }

   public function getActualItemByItemId($item_id)
   {
      if (!isset($item_id)) {
         throw new \Exception("item_id not provided");
      }
      if (!is_numeric($item_id)) {
         throw new \Exception("item_id must be a number");
      }

      $item = null;

      try {
         $sql = <<<EOF
SELECT gi.name AS name
,      gi.type AS type
,      gi.amount AS amount
,      gi.notes AS notes
,      DATE_FORMAT(gi.last_update_date, '%d-%b-%Y') AS date
FROM   `group_basic_income` gi
WHERE  gi.id = $item_id;
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($result = $mysql_connection->query($sql)) {
            if ($result->num_rows === 1) {
               $row = $result->fetch_assoc();
               $item = [
                  'name' => $row["name"],
                  'type' => $row["type"],
                  'amount' => $row["amount"],
                  'notes' => $row["notes"],
                  'date' => $row["date"]
               ];
            }
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error getting group income item");
      }

      return $item;
   }

   public function addActualItem($group_id, $type, $name, $amount, $notes)
   {
      $item = null;

      try {
         if (!isset($group_id)) {
            throw new \Exception("group_id not provided.");
         }
         if (!is_numeric($group_id)) {
            throw new \Exception("group_id must be numeric.");
         }
         if (!isset($type)) {
            throw new \Exception("type not provided.");
         }
         if (!isset($name)) {
            throw new \Exception("name not provided.");
         }
         if (!isset($amount)) {
            throw new \Exception("amount not provided.");
         }
         if (!is_numeric($amount)) {
            throw new \Exception("amount must be numeric.");
         }
         if (!isset($notes)) {
            throw new \Exception("notes not provided.");
         }

         $mysqli = $this->database_connect->getMysqli();

         $sanitized_type =$mysqli->escape_string($type);
         $sanitized_name = $mysqli->escape_string($name);
         $sanitized_notes = $mysqli->escape_string($notes);

         $sql = <<<EOF
INSERT INTO `group_basic_income`
( `name`
, `type`
, `amount`
, `group_id`
, `notes`
, `what_if`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( '$sanitized_name'
, '$sanitized_type'
, '$amount'
, '$group_id'
, '$sanitized_notes'
, 0
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
EOF;

         $mysql_connection = $this->database_connect->getMysqli();

         if ($mysql_connection->query($sql)) {
            $item_id = $mysql_connection->insert_id;

            $item = $this->getActualItemByItemId($item_id);
         } else {
            throw new \Exception("Error adding new income item");
         }
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         throw new \Exception("Error adding new income item");
      }

      return $item;
   }
}
