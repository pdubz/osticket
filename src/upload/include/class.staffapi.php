<?php
/*********************************************************************
    class.api.php

    Api related functions...

    Peter Rotich <peter@osticket.com>
    Copyright (c)  2006-2010 osTicket
    http://www.osticket.com

    Released under the GNU General Public License WITHOUT ANY WARRANTY.
    See LICENSE.TXT for details.

    vim: expandtab sw=4 ts=4 sts=4:
    $Id: $
**********************************************************************/
class StaffApi {
    function add($user,&$errors) {
        $id=0;
        if(!$errors) {
            $sql='INSERT INTO '.STAFF_API_TABLE.' SET status = 1'.
                 ',staff_id='.db_input(StaffApi::getUserId($user)).
                 ',api_key='.db_input(md5(uniqid(rand(), true)));

            if(db_query($sql))
                $id=db_insert_id();

        }

        return $id;
    }

    function getKey($user) {
        $key=null;
        $resp=db_query('SELECT api_key FROM '.STAFF_API_TABLE.' WHERE staff_id='.db_input($user));
        if($resp && db_num_rows($resp)) {
            list($key)=db_fetch_row($resp);
        }
        return $key;
    }
    
    function getUserId($user) {
        $id=null;
        $resp=db_query('SELECT staff_id FROM '.STAFF_TABLE.' WHERE username = '.db_input($user));
        if ($resp && db_num_rows($resp)) {
            list($id)=db_fetch_row($resp);
        }
        return $id;
    }

    function validate($key) {
        $resp=db_query('SELECT id FROM '.STAFF_API_TABLE.' WHERE api_key='.db_input($key));
        return ($resp && db_num_rows($resp))?true:false;
    }
}
?>
