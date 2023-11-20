

<cfif NOT IsDefined("form.sitename")>

<cfoutput><form action="index.cfm?fa=login_clients" method="post">
	<center>
<br><br>
	<table border="1" bgcolor="ffffff" cellpadding="5" bordercolordark="006699" bordercolorlight="0099CC">
		<tr>
			<td align="center" colspan="2" bgcolor="C6EBF7">
				<font face="Arial, sans-serif" size="2"><b>WEBSITE DESIGN AREA LOGIN</b></font>
			</td>
		</tr>
 		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Name of Site:</font>
			</td>
			<td align="center" bgcolor="ffffcc">
				<input type="text" size="25" maxlength="50" name="sitename">
			</td>
		</tr>
		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Admin Username:</font>
			</td>
			<td>
				<input type="text" size="10" maxlength="10" name="username">
			</td>
		</tr>
		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Admin Password:</font>
			</td>
			<td>
				<input type="password" size="10" maxlength="10" name="password">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value=" Submit ">
			</td>
		</tr>
	</table>
	</form>
</cfoutput></center>


<cfelse>

	 
	<cfquery name="login" datasource="#application.datasource#" dbtype="ODBC">
			SELECT ID, sitename, username, password, loggedin 
			FROM Clients 
			WHERE sitename = '#form.sitename#'
	</cfquery>
	

  <cfif trim(login.username) eq trim(form.username) AND trim(login.password) eq trim(form.password)>
	
	 
	<cfquery name="logged" datasource="#application.datasource#" dbtype="ODBC">
			UPDATE clients SET loggedin = 1
			WHERE ID = #login.id#
	</cfquery>
	
	
	<cflocation url="dsp_new_admin_intro.cfm?cid=#login.id#&sn=#login.sitename#">
	
	
  <cfelse>
  
  
		<table width="100%" border="0" cellpadding="3" bgcolor="FFFFCC">
			<tr>
				<td>
					<cfoutput>
						<font face="Arial, sans-serif" size="2">
					You were not granted administration access for the site: <font color="red">#login.sitename#</font>.
					 <br><br>
					 Please try again or email support at: <a href="mailto:support@ezsite.bz">support@ezsite.bz</a>
						</font>
					</cfoutput>
				</td>
			</tr>
		</table>

<cfoutput><form action="index.cfm?fa=login_clients" method="post">
	<center>
<br><br>
	<table border="1" bgcolor="ffffff" cellpadding="5" bordercolordark="006699" bordercolorlight="0099CC">
		<tr>
			<td align="center" colspan="2" bgcolor="C6EBF7">
				<font face="Arial, sans-serif" size="2"><b>WEBSITE DESIGN AREA LOGIN</b></font>
			</td>
		</tr>
 		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Name of Site:</font>
			</td>
			<td align="center" bgcolor="ffffcc">
				<input type="text" size="25" maxlength="50" name="sitename">
			</td>
		</tr>
		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Admin Username:</font>
			</td>
			<td>
				<input type="text" size="10" maxlength="10" name="username">
			</td>
		</tr>
		<tr>
			<td align="right">
				<font face="Arial, sans-serif" size="2">Admin Password:</font>
			</td>
			<td>
				<input type="password" size="10" maxlength="10" name="password">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value=" Submit ">
			</td>
		</tr>
	</table>
	</form>
</cfoutput></center>
		
  </cfif>
	

</cfif>		


