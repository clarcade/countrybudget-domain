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
         $group_income_data = $this->getServiceManager()
            ->getGroupService()
            ->getActualGroupIncomeData($group_id);

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
}
