<?php

namespace domain\resources\Group;

use Tonic\Exception;
use Tonic\Response;
use domain\infrastructure\bases\ResourceBase;

/**
 * Class GroupIncomeResource
 * @uri /group/:group_id/expense/actual
 */
class GroupActualExpenseResource extends ResourceBase
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
            ->getGroupExpenseService()
            ->getActualData($group_id);

         $response = new Response(
            Response::OK,
            json_encode(array('group_actual_expense_data' => $group_income_data)),
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
    *
    * Useful for now but I'll need to delete and refactor later to make better
    */
   public function addActualGroupExpenseItem($group_id)
   {
      $response = null;

      try {
         if (!isset($group_id)) {
            throw new Exception("group_id not provided.");
         }
         if (!is_numeric($group_id)) {
            throw new Exception("group_id must be numeric.");
         }

         $json_expense_item = $this->request->getData();

         if (!isset($json_expense_item)) {
            throw new Exception("Actual income item data not provided.");
         }

         $expense_item = json_decode($json_expense_item);

         if (!isset($expense_item)) {
            throw new Exception("Expense item data not provided.");
         }
         if (!isset($expense_item->type)) {
            throw new Exception("Expense item type not provided.");
         }
         if (!isset($expense_item->name)) {
            throw new Exception("Expense item name not provided.");
         }
         if (!isset($expense_item->amount)) {
            throw new Exception("Expense item amount not provided.");
         }
         if (!is_numeric($expense_item->amount)) {
            throw new Exception("Expense item amount must be numeric.");
         }
         if (!isset($expense_item->notes)) {
            throw new Exception("Expense item notes not provided.");
         }

         $item = $this->getServiceManager()
            ->getGroupExpenseService()
            ->addActualItem(
               $group_id,
               $expense_item->type,
               $expense_item->name,
               $expense_item->amount,
               $expense_item->notes
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
            json_encode(array("error" => "Error adding new actual expense item")),
            array('content-type' => 'application/json')
         );
      } catch (\Exception $ex) {
         echo $ex->getMessage();
         $response = new Response(
            Response::BADREQUEST,
            json_encode(array("error" => "Error adding new actual expense item")),
            array('content-type' => 'application/json')
         );
      }

      return $response;
   }
}
