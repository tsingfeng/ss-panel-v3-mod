<?php


namespace App\Utils;
use App\Services\Config;

class Check
{
    public static function isEmailLegal($email) {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return true;
        } else {
            return false;
        }
    }

    public static function isEmailLegalRegex($email) {
        $regex = Config::get('email_verify_regex');
        if (!$regex)
            return true;
        if (preg_match($regex, $email)) {
            return false;
        } else {
            return true;
        }
    }
}
