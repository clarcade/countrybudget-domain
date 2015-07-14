<?php

namespace domain\services;

use domain\infrastructure\bases\ServiceBase;

class MortgageService extends ServiceBase
{
    private $monthly_payment;
    private $monthly_interest_rate;
    private $number_monthly_payments;
    private $principal;
    private $years_to_pay_for_loan;
    private $down_payment;

    /**
     * c = (r * P) / (1 - (1 + r)^(-N))
     * c - monthly payment
     * r - monthly interest rate in decimal, yearly percentage rate / 12 / 100
     * N - # of monthly payments called the loan's term
     * P - the amount borrowed, known as the loan's principal
     */
    public function calc()
    {
        $this->principal = 200000;
        $this->down_payment = 20000;
        $this->years_to_pay_for_loan = 30;
        $this->number_monthly_payments = $this->years_to_pay_for_loan * 12;
        $this->monthly_interest_rate = 6.5;
        $r = $this->monthly_interest_rate / 12 / 100;

        $this->monthly_payment = (($r * ($this->principal - $this->down_payment)) /
            (1 - pow((1 + $r), -$this->number_monthly_payments)));

        echo $this->monthly_payment;
//        echo "\n";
//        echo (((6.5 / 12 / 100) * 200000) / (1 - (pow((1 + (6.5 / 100 / 12)), (-30 * 12)))));
    }
}
