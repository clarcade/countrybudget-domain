<?php

namespace domain\managers;

use domain\services\AccountService;
use domain\services\GroupExpenseService;
use domain\services\GroupService;
use domain\services\GroupIncomeService;
use domain\services\MortgageService;
use domain\services\UserService;
use domain\services\AuthenticationService;

class ServiceManager
{
   private $mortgage_service;
   private $user_service;
   private $authentication_service;
   private $account_service;
   private $group_service;
   private $group_income_service;
   private $group_expense_service;

   public function getMortgageService()
   {
      if (!isset($this->mortgage_service)) {
         $this->mortgage_service = new MortgageService();
      }

      return $this->mortgage_service;
   }

   public function getUserService()
   {
      if (!isset($this->user_service)) {
         $this->user_service = new UserService();
      }

      return $this->user_service;
   }

   public function getAuthenticationService()
   {
      if (!isset($this->authentication_service)) {
         $this->authentication_service = new AuthenticationService();
      }

      return $this->authentication_service;
   }

   public function getAccountService()
   {
      if (!isset($this->account_service)) {
         $this->account_service = new AccountService();
      }

      return $this->account_service;
   }

   public function getGroupService()
   {
      if (!isset($this->group_service)) {
         $this->group_service = new GroupService();
      }

      return $this->group_service;
   }

   public function getGroupIncomeService()
   {
      if (!isset($this->group_income_service)) {
         $this->group_income_service = new GroupIncomeService();
      }

      return $this->group_income_service;
   }

   public function getGroupExpenseService()
   {
      if (!isset($this->group_expense_service)) {
         $this->group_expense_service = new GroupExpenseService();
      }

      return $this->group_expense_service;
   }
}
