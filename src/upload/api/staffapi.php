<?php
/*********************************************************************
    staffapi.php

    File to handle staff api calls

    vim: expandtab sw=4 ts=4 sts=4:
    $Id: $
**********************************************************************/
error_reporting(E_ALL);
ini_set('display_errors', 1);
require('staffapi.inc.php');
require_once(INCLUDE_DIR.'class.ticket.php');
$query = '';
$ticket = null;
switch(strtolower($_REQUEST['a'])){
    case 'load':
        $ticket = new Ticket(Ticket::getIdByExtId($_REQUEST['tid']));
        break;
    case 'update':
        
        break;
}

?>

<? print($ticket->getCsv()) ?>
