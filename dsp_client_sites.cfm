		<cfquery name="client_sites" datasource="#application.datasource#" dbtype="ODBC">
			SELECT ID,fname,lname,sitename,site_desc FROM clients WHERE ID != 1
		</cfquery>


	<table width="450" cellspacing="0" cellpadding="3" border="0" class="bodytext">
		<tr>
    		<td colspan="2" bgcolor=ffffcc><b>Client Websites</b></td>
			</tr>
	<cfoutput query="client_sites">	
	<tr>
    <td>#fname# #lname#</td>
	<td bgcolor=cccccc><a href="#sitename#/index.cfm">#sitename#</a></td></tr>
	<tr><td colspan="2">#site_desc#</td></tr>
	<tr><td colspan="2"><hr></td>
		</tr></cfoutput>
	</table>


