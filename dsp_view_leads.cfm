
<cfparam name="url.deleted" default=0>
<cfparam name="url.excel" default=0>
<cfparam name="leadQuery.recordcount" default=0>

<!--- <cfscript>
	objViewLeads = createObject("component","components.LeadManagerCFC");
	leadQuery = objViewLeads.viewLeads(client.sid);
</cfscript> --->

		<cfquery name="leadQuery" datasource="#application.dsn#">
			SELECT id, first_name, last_name, client_email, phone, password, company, position, date_added, follow_up_date, follow_up_method, follow_up_remind, comments, send_access
			FROM dom_clients
			WHERE sid = #client.sid#
			ORDER BY date_added, id
		</cfquery>

<cfif url.excel eq 1>
	<cfheader name="Content-Disposition" value="ViewLeads.xls">
	<cfcontent type="application/vnd.ms-excel"> 
</cfif>
<cfif url.excel eq 0>
<form action="index.cfm?fa=view_leads&excel=1" method="post">
	<input type="submit" value="Export to Excel">
</form>		
</cfif>
<table width="800" cellspacing="1" cellpadding="5" class="white14" bgcolor="525252" border=0>
		<cfif url.deleted eq "true">
			<tr>
				<td colspan="9" bgcolor="C0C0C0" class="black14" align="center">
					*** The sales lead has been deleted. ***
				</td>
			</tr>
		</cfif>
	<TR>
	<cfif url.excel eq 0>
		<td class="white12" bgcolor="1A1A1A" >
			
		</td>
	</cfif>
		<td class="white12" bgcolor="1A1A1A" >
			First Name
		</td>
		<td class="white12" bgcolor="1A1A1A" >
			Last Name
		</td>
		<td class="white12" bgcolor="1A1A1A" >
			Email
		</td>
		<td class="white12" bgcolor="1A1A1A" >
			Phone
		</td>		
		<td class="white12" bgcolor="1A1A1A" >
			Company
		</td>
		<td class="white12" bgcolor="1A1A1A" >
			Position
		</td>		
		<td class="white12" bgcolor="1A1A1A" >
			Password
		</td>
		<td class="white12" bgcolor="1A1A1A" >
			Follow Up Date
		</td>
	</TR>
	<cfoutput query="leadQuery">

	
<cfif leadQuery.recordcount eq 0 OR leadQuery.recordcount eq "">
		<tr>
			<td></td>
			<td colspan="7" align="center">
				Your leads will show up here.
			</td>
		</tr>	
<cfelse>

	<script language="javascript"> 
		function toggle#leadQuery.id#() {
		var ele#leadQuery.id# = document.getElementById("toggleText#leadQuery.id#");
		var text#leadQuery.id# = document.getElementById("displayText#leadQuery.id#");
		if(ele#leadQuery.id#.style.display == "block") {
    		ele#leadQuery.id#.style.display = "none";
		text#leadQuery.id#.innerHTML = "comments";
  		}
		else {
		ele#leadQuery.id#.style.display = "block";
		text#leadQuery.id#.innerHTML = "hide";
			}
		} 
	</script>
	
	
		<TR BGCOLOR="###IIF(leadQuery.currentrow MOD 2, DE('E2E2E2'), DE('C0C0C0'))#" class="black14">
		<cfif url.excel eq 0>
			<td class="white14" bgcolor="1A1A1A" nowrap align="center"">
				<a href="index.cfm?fa=edit_lead&lid=#leadQuery.id#" class="bodylink">edit</a> | <a href="components/act_LeadManager.cfm?lid=#leadQuery.id#&fa=#fa#&delete=1" class="bodylink" onclick="return confirm('Are you sure you want to delete this record?');">del</a><br>
				<a id="displayText#leadQuery.id#" href="javascript:toggle#leadQuery.id#();" class="tinylink">comments</a>
			</td>	
		</cfif>	
			<td>
				#leadQuery.first_name#
			</td>
			<td>
				#leadQuery.last_name#
			</td>
			<td>
				#leadQuery.client_email#
			</td>
			<td nowrap>
				#leadQuery.phone#
			</td>
			<td>
				#leadQuery.company#
			</td>
			<td>
				#leadQuery.position#
			</td>
			<td>
				#leadQuery.password#
			</td>
			<td>
				#leadQuery.follow_up_date#
			</td>
		</tr>	
		<tr>
			<cfif url.excel eq 0><td></td></cfif>
			<td colspan="7" <cfif url.excel eq 1>bgcolor="ffffcc"</cfif>>
				<div id="toggleText#leadQuery.id#" style="display: none"><cfif leadQuery.comments neq "">#leadQuery.comments#<cfelse>no comments</cfif></div>
			</td>
		</tr>	
</cfif> 	
	</cfoutput>
</table> 	

