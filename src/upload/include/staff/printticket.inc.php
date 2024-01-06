<?php
//Note that ticket is initiated in tickets.php.
if(!defined('OSTSCPINC') || !@$thisuser->isStaff() || !is_object($ticket) ) die('Invalid path');
if(!$ticket->getId() or (!$thisuser->canAccessDept($ticket->getDeptId()) and $thisuser->getId()!=$ticket->getStaffId())) die('Access Denied');

$info=($_POST && $errors)?Format::input($_POST):array(); //Re-use the post info on error...savekeyboards.org

//Auto-lock the ticket if locking is enabled..if locked already simply renew it.
if($cfg->getLockTime() && !$ticket->acquireLock())
    $warn.='Unable to obtain a lock on the ticket';

//We are ready baby...lets roll. Akon rocks! 
$dept  = $ticket->getDept();  //Dept
$staff = $ticket->getStaff(); //Assiged staff.
$lock  = $ticket->getLock();  //Ticket lock obj
$id=$ticket->getId(); //Ticket ID.
    
?>

<html>
	<body>
		<table width="850">
			<tr>
				<td align="left">
					<div class="logo">
						<img src="../../upload/images/tridentheader.png" />
					</div>
				</td>
				<td align="right">
					<h1>Work Order</h1>
					<h2>Order Number: <? echo($ticket->getExtId()); ?></h2>
				</td>
			</tr>
		</table>
		<table border="1" width="850">
			<tr>
				<td>
					Created:
				</td>
				<td width="80%">
					<? echo($ticket->getCreateDate())?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Priority:
				</td>
				<td width="80%">
					<? echo($ticket->getPriority())?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Travel:
				</td>
				<td width="80%">
					<? echo($ticket->getTravel())?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Due:
				</td>
				<td width="80%">
					<? echo($ticket->getDueDate() ? $ticket->getDueDate():'No due date set, complete when convenient')?>
					&nbsp;
				</td>
			</tr>
		</table>
		<h3>
			Customer Information
		</h3>
		<table border="1" width="850">
			<tr>
				<td>
					Name:
				</td>
				<td width="80%">
					<? echo($ticket->getSiteName()); ?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Address:
				</td>
				<td width="80%">
					<? echo($ticket->getSiteAddress()); ?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					City, State, ZIP:
				</td>
				<td width="80%">
					<? echo($ticket->getCSZ()); ?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Contact Name:
				</td>
				<td width="80%">
					<? echo($ticket->getContactName()); ?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Contact Number:
				</td>
				<td width="80%">
					<? echo($ticket->getContactPhone()); ?>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					Contact Email:
				</td>
				<td width="80%">
					<? echo($ticket->getContactEmail()); ?>
					&nbsp;
				</td>
			</tr>
		</table>
		<h3>
			Scope of Work
		</h3>
		<table border="1" width="850" height="120">
			<tr>
				<td valign="top">
					<? echo(nl2br($ticket->getSOW())); ?>
				</td>
			</tr>
		</table>
		<h3>
		Notes
		</h3>
		<table border="1" width="850">
			<tr>
				<td width="12%">
					Date
				</td>
				<td width="13%">
					Arrival
				</td>
				<td width="13%">
					Departure
				</td>
				<td width="12%">
					Total Time
				</td>
				<td width="50%">
					Technician
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
		<table border="1" width="850" height="200">
			<tr>
				<td/>
			</tr>
		</table>
		<br/>
		<table width="850">
			<tr>
				<td width="20%">
					Customer Signature*:
				</td>
				<td width="60%" style="border-bottom-style:solid; border-bottom-width:1px;">
				</td>
				<td width="5%">
					&nbsp;Date: 
				</td>
				<td width="20%" style="border-bottom-style:solid; border-bottom-width:1px;">
				</td>
			</tr>
		</table>
		<br/>
		<table width="850">
			<tr>
				<td>
					<div class="pdi">
						*All accounts, 20 days past due from invoice date, will be subject to a $10.00 late fee and 2% monthly (24% APR) charge. You accept responsibility to pay all collection fees, attorneys' fees, and legal fees if this account goes to collection. The collection process will be initiated at 30 days past due.
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
