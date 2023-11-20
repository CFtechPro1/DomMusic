<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Site</title>
	


</head>

<body>
<table cellpadding="7" cellspacing="0" border="0">
	<cfoutput><tr><td bgcolor="#colors.bgcolor_nav_hex#"></cfoutput>



		<cfquery name="admin_display" datasource="#application.datasource#" dbtype="ODBC">
		SELECT MenuItem, MenuID
		FROM menu_#application.menu_t#
		</cfquery>

	

		<cfquery name="home_display" datasource="#application.datasource#" dbtype="ODBC">
		SELECT home_menuitem, home_content
		FROM homepage
		WHERE clientID = #application.clientID#
		</cfquery>

	
	<br><br>
		
  		<cfoutput query="home_display">
			<a href="index.cfm?fa=home&cid=#application.clientID#&sn=#application.menu_t#" class="navlink">#home_menuitem#</a>
		</cfoutput>
			<cfif application.clientID eq 1>
			<cfoutput>
		<div align="center"><a href="index.cfm?fa=paypal&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif"><b><font color="00ff00">FREE</font></b> 7 Day Trial </a></font></div>
			</cfoutput>
			</cfif>
  		<cfoutput query="admin_display">
			<a href="index.cfm?fa=mi&n=#MenuID#&cid=#application.clientID#&sn=#application.menu_t#" class="navlink">#MenuItem#</a>
		</cfoutput>
			<cfif application.clientID eq 1>
			<cfoutput>
		<div align="center">
		<p><a href="index.cfm?fa=paypal&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif"><font color="00ff00"><b>Signup</b></font> for a Website </a></font></p>
		<p><a href="index.cfm?fa=login_clients&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif"><b>Client</b> Login</a></font></p>
		<p><a href="index.cfm?fa=search_engine&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif"><b>Search</b> Engine Marketing</a></font></p>
		<p><a href="index.cfm?fa=resources&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif"><b>Web</b> Resources</a><br> <font color="white">Link to Us!</font></font></p>
<!--- <p><a href="dsp_new_admin_intro.cfm?cid=18&sn=tester1" class="navlink" target="new"><font face="arial,sans-serif"><b>Demo</b> Website</a><br><font color="00ff00">Try it out!</font></font></p> --->
		</div>
			</cfoutput>
			</cfif>


<br><br><br><br>

<cfif IsDefined("url.logout")>

	<cfquery name="logout" datasource="#application.datasource#" dbtype="ODBC">
			UPDATE clients SET loggedin = 0
			WHERE ID = #application.clientID#
	</cfquery>

</cfif>
	
	<cfquery name="login_test" datasource="#application.datasource#" dbtype="ODBC">
			SELECT loggedin,design_link 
			FROM clients 
			WHERE ID = #application.clientID#
	</cfquery>
	
<cfoutput>

<cfif application.clientID neq 18 AND application.clientID neq 1>
	<cfif application.clientID lt 23>
		<cfif login_test.design_link eq 1>
			<cfif login_test.loggedin eq 1>
			<a href="index.cfm?fa=admin_menu&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif">Website Design Area</font></a>
			<table bgcolor="FFFFFF" cellpadding="2"><tr><td><a href="index.cfm?fa=home&logout=1&cid=#application.clientID#&sn=#application.menu_t#"><font face="arial,sans-serif"><b>LOGOUT</b></font></a></td></tr></table>
			<cfelse>
			<a href="index.cfm?fa=login&cid=#application.clientID#&sn=#application.menu_t#" class="navlink"><font face="arial,sans-serif">Website Design Area</font></a>
			</cfif>
		</cfif>
	</cfif>
</cfif>

<br><br>
</cfoutput><br><br>
	</td></tr>
		</table>

</body>
</html>