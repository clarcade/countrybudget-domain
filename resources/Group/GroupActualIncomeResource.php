<?php

namespace domain\resources\Group;

use Tonic\Exception;
use Tonic\Response;
use domain\infrastructure\bases\ResourceBase;

/**
 * Class GroupIncomeResource
 * @uri /group/:group_id/income/actual
 */
class GroupActualIncomeResource extends ResourceBase
{
   /**
    * @method GET
    * @param $group_id
    * @return Response
    */
   public function getActualGroupIncomeData($group_id)
   {
      $response = null;

      try {
         if (!isset($group_id)) {
            throw new Exception("group_id not provided.");
         }

         $group_income_data = $this->getServiceManager()
            ->getGroupIncomeService()
            ->getActualData($group_id);

         $response = new Response(
            Response::OK,
            json_encode(array('group_actual_income_data' => $group_income_data)),
            array('content-type' => 'application/json')
         );
      } catch (Exception $ex) {
         echo $ex->getMessage();
      }

      return $response;
   }

   /**
    * @method POST
    * @return Response
    */
   public function addActualGroupIncomeItem($group_id)
   {
      $response = null;

      try {
         if (!isset($group_id)) {
            throw new Exception("group_id not provided.");
         }
         if (!is_numeric($group_id)) {
            throw new Exception("group_id must be numeric.");
         }

         $json_income_item = $this->request->getData();

         if (!isset($json_income_item)) {
            throw new Exception("Actual income item data not provided.");
         }

         $income_item = json_decode($json_income_item);

         if (!isset($income_item)) {
            throw new Exception("Income item data not provided.");
         }
         if (!isset($income_item->type)) {
            throw new Exception("Income item type not provided.");
         }
         if (!isset($income_item->name)) {
            throw new Exception("Income item name not provided.");
         }
         if (!isset($income_item->amount)) {
            throw new Exception("Income item amount not provided.");
         }
         if (!is_numeric($income_item->amount)) {
            throw new Exception("Income item amount must be numeric.");
         }
         if (!isset($income_item->notes)) {
            throw new Exception("Income item notes not provided.");
         }

         $item = $this->getServiceManager()
            ->getGroupIncomeService()
            ->addActualItem(
               $group_id,
               $income_item->type,
               $income_item->name,
               $income_item->amount,
               $income_item->notes
            );

         $response = new Response(
            Response::OK,
            json_encode(array("item" => $item)),
            array('content-type' => 'application/json')
         );
      } catch (Exception $ex) {
         echo $ex->getMessage();
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => "Error adding new actual income item")),
            array('content-type' => 'application/json')
         );
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => "Error adding new actual income item")),
            array('content-type' => 'application/json')
         );
      }

      return $response;
   }
}
