<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfif IsDefined("url.denied")>
<b>You cannot delete the main site content! Damn you.</b>
<cfmail to="dkelly@ezsite.bz" Subject="Attempted deletion of main content!" from="info@ezsite.bz">
Someone just tried to delete the main content for EZsite.bz.
</cfmail>
<br><br></cfif>

<cfif IsDefined("url.deleted")>
<cfoutput><font color="red"><b>You just deleted the content for Client #url.cid_deleted#.</b></font></cfoutput>
<br><br></cfif>

<br><br>
<cfoutput>
<form action="index.cfm?fa=admin_main&cid=#application.clientID#&sn=#application.menu_t#" method="post">
	ID of Client to be deleted <input name="cid_deleted" size="4" type="text"> <br>
<input type="submit" value="  Submit  ">
</form>
</cfoutput>
<cfif IsDefined("form.cid_deleted")>
	<cfquery name="cid_d" datasource="#application.datasource#" dbtype="ODBC">
			SELECT id,fname,lname,sitename
			FROM clients
			WHERE ID = #form.cid_deleted#
	</cfquery>
<font color="red">Are you SURE you want to delete all records for <br>
<cfoutput query="cid_d"><b>#cid_d.fname# #cid_d.lname# id:#cid_d.id# </b></font>
	<br><br>
	If so, please submit again below.<br><br>
	<form action="act_delete_clients.cfm?cid=#application.clientID#&sn=#application.menu_t#" method="post">
		ID of Client to be deleted <input name="cid_deleted" size="4" type="text" value="#form.cid_deleted#"> <br>
	<input type="hidden" name="sitename" value="#cid_d.sitename#">
	<input type="submit" value="  Submit  Again  ">
	</form>
	</cfoutput>
</cfif>

		<cfquery name="client_sites" datasource="#application.datasource#" dbtype="ODBC">
			SELECT ID,fname,lname,sitename,site_desc FROM clients WHERE ID != 1
		</cfquery>


	<table width="450" cellspacing="0" cellpadding="3" border="0" class="bodytext">
		<tr>
    		<td colspan="2" bgcolor=ffffcc><b>Client Websites</b></td>
			</tr>
	<cfoutput query="client_sites">	
	<tr>
    <td>#id# #fname# #lname#</td>
	<td bgcolor=cccccc><a href="#sitename#/index.cfm">#sitename#</a></td></tr>
	<tr><td colspan="2">#site_desc#</td></tr>
	<tr><td colspan="2"><hr></td>
		</tr></cfoutput>
	</table>
</body>
</html>
