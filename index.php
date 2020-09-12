<?php
//ini_set('display_startup_errors', 1);
//ini_set('display_errors', 1);
//error_reporting(-1);
/**
 * File: index.php
 * Description:
 * -------------
 *
 * This is an entry file for this Dataface Application.  To use your application
 * simply point your web browser to this file.
 */
require_once '/var/www/fqdn/ex/xataface/public-api.php';
df_init(__FILE__, '/ex/xataface')->display();
