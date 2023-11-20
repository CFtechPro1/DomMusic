


<cfparam name="url.sent" default=0>
<cfparam name="form.add_lead" default=0>
<cfparam name="form.follow_up_remind" default=0>
<cfparam name="form.send_access" default=0>
<cfparam name="url.add_status" default=0>


<link href="styles/calendar.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="js/calendar.js"></script>

<script Language="JavaScript"><!--
function Valid(theForm)
{

  if (theForm.first_name.value == "")
  {
    alert("Please enter a value for the \" First Name\" field.");
    theForm.first_name.focus();
    return (false);
  }

  if (theForm.client_email.value == "")
  {
    alert("Please enter a value for the \" Email\" field.");
    theForm.client_email.focus();
    return (false);
  }


  return (true);
}
//--></script>



	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_addlead.jpg">
				</td>
			</tr>
		 </table>
		 
		
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="525252">
			<cfif url.add_status neq 0>
				<cfif url.add_status eq "add">
				<tr>
					<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
						<font color="CC3338">Result:</font>
					</td>
					<td  bgcolor="D5ACAA" class="black14">
						Your Sales Lead has been successfully added.
					</td>
				</tr>
				<cfelseif url.add_status eq "add_and_access">
				<tr>
					<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
						<font color="CC3338">Result:</font>
					</td>
					<td  bgcolor="D5ACAA" class="black14">
						Your Sales Lead has just been added.  Website access instructions have have been emailed to your new lead.
					</td>
				</tr>
				</cfif>
				
			</cfif>
	<form action="components/act_LeadManager.cfm" method="post" onsubmit="return Valid(this)">  
		  <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14">
				<b>INSTRUCTIONS</b>
				<br>
				<li>Add your sales lead information and click "Add Sales Lead" below.</li>
				<br>
				<li>Your lead will be automatically emailed a username and password for easy access.</li>
				<br>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Lead First Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="first_name" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Lead Last Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="last_name" value="" maxlength="150">
			</td>
		 </tr>			
		 <tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Email Address:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="client_email" value="" maxlength="150">
			</td>
		 </tr>	  
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Phone:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="phone" value="" maxlength="150">
			</td>
		 </tr>	 
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Website:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="website" value="" maxlength="150">
			</td>
		 </tr>
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Additional Phone:	
			</td>
			<td bgcolor="808080">
				<input type="text" size="10" name="phone2" value="" maxlength="50"> &nbsp; FAX:<input type="text" size="10" name="fax" value="" maxlength="50"> 
			</td>
		 </tr> 
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Company: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="50" name="company" value="" maxlength="150">
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Position: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="50" name="position" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Follow Up Date: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="15" name="follow_up_date" value="" maxlength="15" id="follow_up_date">
 					<script type="text/javascript">
 						calendar.set("follow_up_date");
					</script>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Follow Up Method: 
			</td>
			<td bgcolor="808080">
				<select name="follow_up_method" size="1">
					<option value=0>Select...</option>
					<option value="Email">Email</option>
					<option value="Phone">Phone</option>
					<option value="Meeting">Meeting</option>
				</select>
			</td>
		 </tr>	
<!--- 		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Remind me to follow up: 
			</td>
			<td bgcolor="808080">
				<input type="checkbox" value=1 name="follow_up_remind">
			</td>
		 </tr>	 --->
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A"  nowrap>
				Send Access Email to this Lead: 
			</td>
			<td bgcolor="808080">
				<input type="checkbox" value=1 name="send_access" checked>
			</td>
		 </tr>	
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Personal Email text to send to the lead: 
			</td>	
			<td bgcolor="808080">
				<textarea name="email_copy" cols="40" rows="10"></textarea>
			</td>
		 </tr>
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Personalized Password for this lead: 
			</td>	
			<td bgcolor="808080">
				<input type="text" size="20" name="personal_password" value="" maxlength="50">
			</td>
		 </tr>
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Optional Comments: 
			</td>	
			<td bgcolor="808080">
				<textarea name="comments" cols="40" rows="3"></textarea>
			</td>
		 </tr>	 
			<tr>
			   <td colspan="2">
				<cfinclude template="cfformprotect/cffp.cfm"> 
			   </td>
			</tr>
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<input type="hidden" name="add_lead" value="1">
				<cfoutput>
					<input type="hidden" name="fa" value="#fa#">
				</cfoutput>
				<input type="Submit" value=" Add Sales Lead ">
			</td>
		 </tr>	 
		 
	 </form>
	  
	</table>
  <br><br>
