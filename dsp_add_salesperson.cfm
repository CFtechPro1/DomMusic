


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


<cfinclude template="functions/getCurrentURL.cfm">

	<cfparam name="form.login" default=0>
	<cfparam name="form.username" default=0>
	<cfparam name="form.password" default=0>
	<cfparam name="url.added" default=0>

	
<!--- 	<cfif client.sid neq 0>
		<cflocation url="index.cfm?fa=sales_center&loggedin=1">
	</cfif> --->
	

	
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
	<cfif url.added neq 0>
		<cfif url.added eq "true">
		  <tr>
			<td colspan="2" align="center" bgcolor="D5ACAA" class="black14">
				Your new Salesperson has been added.
			</td>
		 </tr>	
		 </cfif>	
	</cfif>
		 <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14" bgcolor="CC3333">	
				<br>
				<li>Add new Salesperson below.</li> 
				<br><br>
				<!--- <li>If you do not have a username and password, click on the <a href="index.cfm?fa=get_access" class="bodylink">Get Access</a> link.</li>	
				<br><br> --->
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				First Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="s_first_name" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Last Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="s_last_name" value="" maxlength="150">
			</td>
		 </tr>			
		 <tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Email Address:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="s_email" value="" maxlength="150">
			</td>
		 </tr>	  
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Password: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="10" name="s_password" value="" maxlength="20">
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Phone:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="s_phone" value="" maxlength="150">
			</td>
		 </tr>	 
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Additional Phone:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="s_phone2" value="" maxlength="150">
			</td>
		 </tr> 	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Position: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="s_position" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="40%">
				Sales Manager: 
			</td>
			<td bgcolor="808080">
				<select name="s_manager" size="1">
					<option value=0>No</option>
					<option value=1>Yes</option>
				</select>
			</td>
		 </tr>		 
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<input type="hidden" name="add_salesperson" value=1>
				<cfoutput>
					<input type="hidden" name="fa" value="#fa#">
				</cfoutput>
				<input type="Submit" value=" Add Salesperson  ">
			</td>
		 </tr>			 
	 </form>
	  
	</table>
  <br><br>
