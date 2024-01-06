<?php
if(!defined('OSTADMININC') || !$thisuser->isadmin()) die('Access Denied');

$select='SELECT * ';
$from='FROM '.STAFF_API_TABLE.' sat JOIN '.STAFF_TABLE.' st ON sat.staff_id = st.staff_id';
$where='';
$sortOptions=array('date'=>'created','username'=>'username');
$orderWays=array('DESC'=>'DESC','ASC'=>'ASC');
//Sorting options...
if($_REQUEST['sort']) {
    $order_column =$sortOptions[$_REQUEST['sort']];
}

if($_REQUEST['order']) {
    $order=$orderWays[$_REQUEST['order']];
}
$order_column=$order_column?$order_column:'username';
$order=$order?$order:'ASC';
$order_by=" ORDER BY $order_column $order ";

$total=db_count('SELECT count(*) '.$from.' '.$where);
$pagelimit=1000;//No limit.
$page=($_GET['p'] && is_numeric($_GET['p']))?$_GET['p']:1;
$pageNav=new Pagenate($total,$page,$pagelimit);
$pageNav->setURL('admin.php',$qstr.'&sort='.urlencode($_REQUEST['sort']).'&order='.urlencode($_REQUEST['order']));
$query="$select $from $where $order_by";
//echo $query;
$result = db_query($query);
$showing=db_num_rows($result)?$pageNav->showing():'';
$negorder=$order=='DESC'?'ASC':'DESC'; //Negate the sorting..
$deletable=0;
?>
<div class="msg">Staff API Keys</div>
<hr>
<div><b><?=$showing?></b></div>
 <table width="100%" border="0" cellspacing=1 cellpadding=2>
   <form action="admin.php?t=staffapi" method="POST" name="staffapi" onSubmit="return checkbox_checker(document.forms['api'],1,0);">
   <input type=hidden name='t' value='staffapi'>
   <input type=hidden name='do' value='mass_process'>
   <tr><td>
    <table border="0" cellspacing=0 cellpadding=2 class="dtable" align="center" width="100%">
        <tr>
	        <th width="7px">&nbsp;</th>
	        <th>Key</th>
            <th width="10" nowrap>Active</th>
            <th width="100" nowrap>&nbsp;&nbsp;Username</th>
	        <th width="150" nowrap>&nbsp;&nbsp;
                <a href="admin.php?t=staffapi&sort=date&order=<?=$negorder?><?=$qstr?>" title="Sort By Create Date <?=$negorder?>">Created</a></th>
        </tr>
        <?
        $class = 'row1';
        $total=0;
        $active=$inactive=0;
        $sids=($errors && is_array($_POST['ids']))?$_POST['ids']:null;
        if($result && db_num_rows($result)):
            $dtpl=$cfg->getDefaultTemplateId();
            while ($row = db_fetch_array($result)) {
                $sel=false;
                $disabled='';
                if($row['status'])
                    $active++;
                else
                    $inactive++;
                    
                if($sids && in_array($row['id'],$sids)){
                    $class="$class highlight";
                    $sel=true;
                }
                ?>
            <tr class="<?=$class?>" id="<?=$row['id']?>">
                <td width=7px>
                  <input type="checkbox" name="ids[]" value="<?=$row['id']?>" <?=$sel?'checked':''?>
                        onClick="highLight(this.value,this.checked);">
                <td>&nbsp;<?=$row['api_key']?></td>
                <td><?=$row['status']?'<b>Yes</b>':'No'?></td>
                <td>&nbsp;<?=$row['username']?></td>
                <td>&nbsp;<?=Format::db_datetime($row['created'])?></td>
            </tr>
            <?
            $class = ($class =='row2') ?'row1':'row2';
            } //end of while.
        else: //nothin' found!! ?> 
            <tr class="<?=$class?>"><td colspan=5><b>Query returned 0 results</b>&nbsp;&nbsp;<a href="admin.php?t=templates">Index list</a></td></tr>
        <?
        endif; ?>
     
     </table>
    </td></tr>
    <?
    if(db_num_rows($result)>0): //Show options..
     ?>
    <tr>
        <td align="center">
            <?php
            if($inactive) {?>
                <input class="button" type="submit" name="enable" value="Enable"
                     onClick='return confirm("Are you sure you want to ENABLE selected keys?");'>
            <?php
            }
            if($active){?>
            &nbsp;&nbsp;
                <input class="button" type="submit" name="disable" value="Disable"
                     onClick='return confirm("Are you sure you want to DISABLE selected keys?");'>
            <?}?>
            &nbsp;&nbsp;
            <input class="button" type="submit" name="delete" value="Delete" 
                     onClick='return confirm("Are you sure you want to DELETE selected keys?");'>
        </td>
    </tr>
    <?
    endif;
    ?>
    </form>
 </table>
 <br/>
 <div class="msg">Add New Staff API User</div>
 <hr>
 <div>
   Add a new staff API user.&nbsp;&nbsp;<font class="error"><?=$errors['username']?></font>
   <form action="admin.php?t=staffapi" method="POST" >
    <input type=hidden name='t' value='staffapi'>
    <input type=hidden name='do' value='add'>
    <table>
    <?
      $sql='SELECT username FROM '.STAFF_TABLE.' ORDER BY username DESC';
      if(($users=db_query($sql)) && db_num_rows($users)){ ?>
      <tr>
        <td align="left">New User:</td>
        <td>
            <select name="username">
              <?
                while($row=db_fetch_array($users)){ ?>
                    <option value="<?=$row['username']?>"><?=$row['username']?></option>
              <?}?>
            </select>
        </td>
       </tr>
    <? }?>
    </table>
    <font class="error">*&nbsp;</font>&nbsp;&nbsp;
     &nbsp;&nbsp; <input class="button" type="submit" name="add" value="Add">
    </form>
 </div>
 </div>
