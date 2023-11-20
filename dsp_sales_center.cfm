	
	
	<cfparam name="url.loggedin" default=0>
	

	
<cfif client.sid neq 0>
	<table width="100%" border="0" cellspacing="1" cellpadding="3" class="white14">
		<tr>
			<td class="white14">
				<table width="600" border="0" cellspacing="1" cellpadding="3" class="white14">
				<tr> 
					<td bgcolor="000000" align="center" class="header14" colspan="5">
						<img src="images/header_sm_salescenter.jpg">
					</td>
				</tr>
					<tr>
						<td colspan="2" align="center">
							<font color="silver">Welcome:</font> <cfoutput>#client.s_name#</cfoutput>
						</td>
					</tr>
					<cfif url.loggedin eq 1>
						<tr>
							<td colspan="2" align="center" bgcolor="Silver" class="black14">
								You have been successfully logged in.
							</td>
						</tr>				
					</cfif>
					<tr>
						<td>&nbsp;
							
						</td>
					</tr>
					<tr>
						<td valign="center" align="right">
							<img src="images/star.jpg">
						</td>
						<td width="500">
							<a href="index.cfm?fa=add_lead" class="leftmenu">Add a Sales Lead</a>
						</td>
					</tr>
					<tr>
						<td valign="center" align="right">
							<img src="images/star.jpg">
						</td>
						<td width="500">
							<a href="index.cfm?fa=view_leads" class="leftmenu">View / Edit My Sales Leads</a>
						</td>
					</tr>
					<tr>
						<td valign="center" align="right">
							<img src="images/star.jpg">
						</td>
						<td width="500">
							<a href="index.cfm?fa=resend_lead" class="leftmenu">Re-Send a Sales Lead</a>
						</td>
					</tr>
					<tr>
						<td valign="center" align="right">
							<img src="images/star.jpg">
						</td>
						<td width="500">
							<a href="index.cfm?fa=blog_create" class="leftmenu">Create a BLOG Post</a>
						</td>
					</tr>
				<cfif client.s_manager eq 1>
					<tr>
						<td valign="center" align="right">
							<img src="images/star.jpg">
						</td>
						<td width="500">
							<a href="index.cfm?fa=add_salesperson" class="leftmenu">Add New Salesperson</a>
						</td>
					</tr>
				</cfif>
				</table>
			</td>
		</tr>
	</table>
<cfelse>
	<cflocation url="index.cfm?fa=sales_login">
</cfif>	
