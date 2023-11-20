

<cfparam name="form.follow_up_remind" default=0>
<cfparam name="form.send_access" default=0>
<cfparam name="url.edited" default=0>
<cfparam name="url.lid" default=0>


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
			SELECT id, first_name, last_name, client_email, phone, phone2, password, company, position, follow_up_date, follow_up_method, follow_up_remind, email_copy, comments, send_access
			FROM dom_clients
			WHERE id = #url.lid#
		</cfquery>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_editlead.jpg">
				</td>
			</tr>
		 </table>
		 
		
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="525252">
			<cfif url.edited neq 0>
				<cfif url.edited eq "true">
				<tr>
					<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
						<font color="CC3338">Result:</font>
					</td>
					<td  bgcolor="CCCCCC" class="black14">
						Your Sales Lead has been successfully EDITED.
					</td>
				</tr>
				<cfelse>
				<tr>
					<td class="white12" align="right" bgcolor="1A1A1A" valign="top">
						<font color="CC3338">Result:</font>
					</td>
					<td  bgcolor="CCCCCC" class="black14">
						THERE WAS AN ERROR, PLEASE TRY AGAIN.
					</td>
				</tr>			
				</cfif>
			</cfif>
	<form action="components/act_LeadManager.cfm" method="post" onsubmit="return Valid(this)">  
		  <tr>
			<td colspan="2" align="left" bgcolor="CCCCCC" class="black14">
				<b>INSTRUCTIONS</b>
				<br>
				<li>EIDT your sales lead information and click "Submit Changes" below.</li>
				<br>
			</td>
		 </tr>	
	<cfoutput query="leads">
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
				Password:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="password" value="#leads.password#" maxlength="150">
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
				Additional Phone:	 
			</td>
			<td bgcolor="808080">
				<input type="text" size="20" name="phone2" value="#leads.phone2#" maxlength="150">
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
				<input type="text" size="50" name="follow_up_date" value="#leads.follow_up_date#" maxlength="150">
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
				<input type="checkbox" value=1 name="follow_up_remind" <cfif leads.follow_up_remind eq 1>checked</cfif>>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A"  nowrap>
				Was an access email sent to this lead: 
			</td>
			<td bgcolor="808080">
				<cfif leads.send_access eq 1>yes<cfelse>no</cfif>
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
			<td class="white12" align="right" bgcolor="1A1A1A" >
				Personal Email you sent to the lead: 
			</td>	
			<td bgcolor="808080">
				#leads.email_copy#
			</td>
		 </tr>
	</cfoutput>	 
			<tr>
			   <td colspan="2">
				<cfinclude template="cfformprotect/cffp.cfm"> 
			   </td>
			</tr>
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<input type="hidden" name="edit_lead" value="1">
				<cfoutput>
					<input type="hidden" name="fa" value="#fa#">
					<input type="hidden" name="lid" value="#url.lid#">
				</cfoutput>
				<input type="Submit" value=" Submit Changes ">
			</td>
		 </tr>	 
		 
	 </form>
	  
	</table>
  <br><br>
