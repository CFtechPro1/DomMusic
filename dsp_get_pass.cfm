<script Language="JavaScript"><!--
function Valid(theForm)
{

  if (theForm.email.value == "")
  {
    alert("Please enter a value for the \" Email\" field.");
    theForm.email.focus();
    return (false);
  }

  return (true);
}
//--></script>

	
	<cfparam name="url.denied" default=0>
	<cfparam name="url.change" default=0>
	<cfparam name="url.np" default=0>

	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_login.jpg">
				</td>
			</tr>
		 </table>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14">
		
	<form action="components/act_ClientLogin.cfm" method="post" onsubmit="return Valid(this)">  
	
	
	<cfif url.denied eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				Your email address is not in our database. Please try again or click on the "Contact Us" link on the left menu.
					<br><br>
				To gain new client access to the Music Search area, click on the <a href="index.cfm?fa=get_access" class="bodylink">Get Access</a> link.	
			</td>
		 </tr>	
	</cfif>		
	<cfif url.np eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				Your New Passwords do not match, please try again.
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
				<li>Enter your email address below to display your password.</li> 
				<br><br>
				<li>An email will also be sent to you containing your password.</li>	
				<br><br>
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
	<cfif url.change eq 1>
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Old Password: 
			</td>
			<td width="60%">
				<input type="text" size="30" name="old_password" value="" maxlength="20">
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				New Password: 
			</td>
			<td width="60%">
				<input type="text" size="30" name="new_password" value="" maxlength="20">
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Repeat New Password: 
			</td>
			<td width="60%">
				<input type="text" size="30" name="new_password2" value="" maxlength="20">
			</td>
		 </tr>	
	</cfif>	 
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
			<cfif url.change eq 1>
				<input type="hidden" name="change_pass" value=1>
				<input type="Submit" value=" Change Password  ">
			<cfelse>
				<input type="hidden" name="get_pass" value=1>
				<input type="Submit" value=" Get Password  ">
			</cfif>
				
			</td>
		 </tr>			 
	 </form>
	  
	</table>
  <br><br>
