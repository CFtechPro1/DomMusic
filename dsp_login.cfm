<script Language="JavaScript"><!--
function Valid(theForm)
{

  if (theForm.email.value == "")
  {
    alert("Please enter a value for the \" Email\" field.");
    theForm.email.focus();
    return (false);
  }

  if (theForm.password.value == "")
  {
    alert("Please enter a value for the \" Password\" field.");
    theForm.password.focus();
    return (false);
  }

  return (true);
}
//--></script>

	
	<cfparam name="url.denied" default=0>
	<cfparam name="url.cid" default=0>
	<cfparam name="url.status" default=0>
	
	<cfif url.cid neq 0>
		<cfquery name="get_pass" datasource="#application.dsn#">
			SELECT id, client_email, password
			FROM dom_clients
			WHERE id = #url.cid#
		</cfquery>	
	</cfif>
	
	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="5">
					<img src="images/DomMusic_production_music_library_header.jpg" title="Dom Music Production Music Library Header" alt="Dom Music Production Music Library Header" class="vdo-reel-img">
				</td>
			</tr>
		 </table>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14">
		
	<form action="components/act_ClientLogin.cfm" method="post" onsubmit="return Valid(this)">  
	
	
	<cfif url.denied eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				Your login attempt failed. Please try again or click on the "Contact Us" link on the left menu.
					<br><br>
				To gain new client access to the Music Search area,  <a href="index.cfm?fa=contact" class="bodylink">Contact Us</a> and we will send you a username and password.	
			</td>
		 </tr>	
	</cfif>		
	<cfif url.cid neq 0>
		  <tr>
			<td colspan="2" align="center" bgcolor="FF8484" class="black14">
			<br>
				Your password is: <font size="+1"><cfoutput>#get_pass.password#</cfoutput></font>
				<br><br>
				Please login below.
					<br>
			</td>
		 </tr>	
	</cfif>		
	<cfif url.status neq 0>
		  <tr>
			<td colspan="2" align="center" bgcolor="FF8484" class="black14">
			<br>
				Your password has been changed.
				<br><br>
				Please login below.
					<br>
			</td>
		 </tr>	
	</cfif>		
		<tr>
			<td colspan="2">&nbsp;
				
			</td>
		</tr>
	
		 <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14" bgcolor="CC3333">	
				<br>
				<li>Login below to access the Music Search area</li> 
				<br><br>
				If you forgot your password:
				<li><a href="index.cfm?fa=get_pass" class="bodylink">Get my password</a></li> 
				<br>
				<li><a href="index.cfm?fa=get_pass&change=1" class="bodylink">Change My Password</a></li> 
				<br>		
				<li>If you do not have a username and password, <a href="index.cfm?fa=contact" class="bodylink">Contact Us</a> and we will send you a username and password.	</li>	
				<br><br>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Email Address/Username: 
			</td>
			<td width="60%">
				<input type="text" size="30" name="email" value="<cfif url.cid neq 0><cfoutput>#get_pass.client_email#</cfoutput></cfif>" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Password: 
			</td>
			<td width="60%">
				<input type="password" size="10" name="password" value="" maxlength="20">
			</td>
		 </tr>		 
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<input type="hidden" name="login" value=1>
				<input type="Submit" value=" Login  ">
			</td>
		 </tr>			 
	 </form>
	  
	</table>
  <br><br>
