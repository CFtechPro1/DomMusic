


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


<!--- <cfinclude template="functions/getCurrentURL.cfm"> --->

	<cfparam name="form.login" default=0>
	<cfparam name="form.username" default=0>
	<cfparam name="form.password" default=0>
	<cfparam name="url.login_status" default=0>
	<cfparam name="url.nogo" default=0><br>
	<cfparam name="url.loggedin" default=0>

	
	<cfif url.loggedin eq 1>
		<cflocation url="index.cfm?fa=sales_center&loggedin=1">
	</cfif>
	

	

	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_saleslogin.jpg">
				</td>
			</tr>
		 </table>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14">
		
	<form action="components/act_LeadManager.cfm" method="post" onsubmit="return Valid(this)">  	

		
		<tr>
			<td colspan="2">&nbsp;
				
			</td>
		</tr>
		<cfif url.nogo eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="D5ACAA" class="black14">
				Your login attempt failed. Please try again or click on the "Contact Us" link on the left menu.
			</td>
		 </tr>	
		 </cfif>	
		 <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14" bgcolor="CC3333">	
				<br>
				<li>Login below to access the Sales Center.</li> 
				<br><br>
				<!--- <li>If you do not have a username and password, click on the <a href="index.cfm?fa=get_access" class="bodylink">Get Access</a> link.</li>	
				<br><br> --->
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Email Address: 
			</td>
			<td width="60%">
				<input type="text" size="30" name="email" value="" maxlength="150">
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
<!--- 				<cfoutput>
					<input type="hidden" name="return_url" value="#getCurrentURL()#">
				</cfoutput> --->
				<input type="Submit" value=" Login  ">
			</td>
		 </tr>			 
	 </form>
	  
	</table>
  <br><br>
