


<cfparam name="url.sent" default=0>
<cfparam name="form.follow_up_remind" default=0>
<cfparam name="form.send_access" default=0>
<cfparam name="url.resent" default=0>
<cfparam name="url.lid" default=0>
<cfparam name="form.choose" default=0>


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

	
		<cfquery name="leads" datasource="#application.dsn#">
			SELECT id, first_name, last_name, website, client_email, phone, phone2, password, company, position, follow_up_date, follow_up_method, follow_up_remind, email_copy, comments, send_access
			FROM dom_clients
			WHERE id = #form.choose#
		</cfquery>

		<cfquery name="select_leads" datasource="#application.dsn#">
			SELECT id, first_name, last_name, website, client_email, phone, phone2, password, company, position, follow_up_date, follow_up_method, follow_up_remind, email_copy, comments, send_access
			FROM dom_clients
			WHERE sid = #client.sid#
			ORDER BY date_added, id
		</cfquery>	
	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_addlead.jpg">
				</td>
			</tr>
		 </table>
		 
		
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="525252">

			
				<cfif url.resent eq "true">
				<tr>
					<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
						<font color="CC3338">Result:</font>
					</td>
					<td  bgcolor="D5ACAA" class="black14">
						Your Sales Lead has been successfully RE-SENT.
					</td>
				</tr>
				</cfif>
		<form action="index.cfm?fa=resend_lead" method="post">
			<tr>
				<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
					<font color="CC3338">Choose a Lead:</font>
				</td>
				<td bgcolor="D7A7A6">
					<select name="choose" size="1">
						<option value=1>Select...</option>
						<cfoutput query="select_leads">
							<option value="#select_leads.id#">#select_leads.first_name# #select_leads.last_name# - #select_leads.company#</option>
						</cfoutput>
					</select>
				</td>
			</tr>		 
			<tr>
				<td colspan="2" bgcolor="666666" height="20" align="center">
					<input type="Submit" value=" Submit ">
				</td>
		 	</tr>	
		</form>	
		
<cfif form.choose neq 0>			
			
<cfoutput query="leads">		
			
	<form action="components/act_LeadManager.cfm" method="post" onsubmit="return Valid(this)">  
		  <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14">
				<b>INSTRUCTIONS</b>
				<br>
				<li>Edit your sales lead information and click "Resend Sales Lead" below.</li>
				<br>
				<li>Your lead will be automatically re-emailed a username, password, and your message for easy access.</li>
				<br>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Lead First Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="first_name" value="#leads.first_name#" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Lead Last Name: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="last_name" value="#leads.last_name#" maxlength="150">
			</td>
		 </tr>			
		 <tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Email Address:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="30" name="client_email" value="#leads.client_email#" maxlength="150">
			</td>
		 </tr>	  
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Phone:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="phone" value="#leads.phone#" maxlength="150">
			</td>
		 </tr>	 
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Website:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="website" value="#leads.website#" maxlength="150">
			</td>
		 </tr>
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Additional Phone:	
			</td>
			<td bgcolor="808080">
				<input type="text" size="10" name="phone2" value="#leads.phone2#" maxlength="50"> &nbsp; FAX:<input type="text" size="10" name="fax" value="" maxlength="50"> 
			</td>
		 </tr> 
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Company: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="50" name="company" value="#leads.company#" maxlength="150">
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Position: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="50" name="position" value="#leads.position#" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Follow Up Date: 
			</td>
			<td bgcolor="808080">
				<input type="text" size="15" name="follow_up_date" value="#leads.follow_up_date#" maxlength="15" id="follow_up_date">
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
					<option value="#leads.follow_up_method#">#leads.follow_up_method#</option>
					<option value="Email">Email</option>
					<option value="Phone">Phone</option>
					<option value="Meeting">Meeting</option>
				</select>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Remind me to follow up: 
			</td>
			<td bgcolor="808080">
				<input type="checkbox" value=1 name="follow_up_remind">
			</td>
		 </tr>	
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
				<textarea name="email_copy" cols="40" rows="10">#leads.email_copy#</textarea>
			</td>
		 </tr>
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Personalized Password for this lead: 
			</td>	
			<td bgcolor="808080">
				<input type="text" size="20" name="password" value="#leads.password#" maxlength="50">
			</td>
		 </tr>
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Optional Comments: 
			</td>	
			<td bgcolor="808080">
				<textarea name="comments" cols="40" rows="3">#leads.comments#</textarea>
			</td>
		 </tr>	 
			<tr>
			   <td colspan="2">
				<cfinclude template="cfformprotect/cffp.cfm"> 
			   </td>
			</tr>
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
			
					<input type="hidden" name="resend_lead" value="1">
					<input type="hidden" name="fa" value="#fa#">
					<input type="hidden" name="lid" value="#leads.id#">
				
				<input type="Submit" value=" Resend Sales Lead ">
			</td>
		 </tr>	 
		 
	 </form>
	
</cfoutput>	  

</cfif>		
	</table>
  <br><br>
