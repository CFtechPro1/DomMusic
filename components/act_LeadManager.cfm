<cfparam name="form.return_url" default=0>
<cfparam name="form.fa" default=0>
<cfparam name="form.add_lead" default=0>
<cfparam name="form.resend_lead" default=0>
<cfparam name="form.edit_lead" default=0>
<cfparam name="form.login" default=0>
<cfparam name="form.follow_up_remind" default=0>
<cfparam name="form.send_access" default=0>
<cfparam name="url.delete" default=0>
<cfparam name="form.lid" default=0>
<cfparam name="form.add_salesperson" default=0>



	<!--- Call Component/function to ADD A LEAD --->
<cfif form.add_lead eq 1>
	<cfscript>
		objAddLead = createObject("component","LeadManagerCFC");
		isAdded = objAddLead.addLead(form.first_name, form.last_name, form.client_email, form.phone, form.website, form.phone2, form.fax, form.company, form.position, form.follow_up_date, form.follow_up_method, form.follow_up_remind, form.send_access, form.email_copy, form.personal_password, form.comments);
	</cfscript>
	
	<cfoutput>
		<cfif isAdded eq "add complete and access sent">
			<cflocation url="../index.cfm?fa=#form.fa#&add_status=add_and_access">
		<cfelseif isAdded eq "add complete">
			<cflocation url="../index.cfm?fa=#form.fa#&add_status=add">
		</cfif>
	</cfoutput>
	
</cfif>

<!--- Call Component/function to LOGIN TO THE SALES CENTER --->
<cfif form.login eq 1>
	<cfscript>
		objSales = createObject("component","leadManagerCFC");
		isValid = objSales.salesLogin(form.email,form.password);
	</cfscript>
	
	<cfoutput>
		<cfif isValid eq "nogo">
			<cflocation url="../index.cfm?fa=sales_login&nogo=1">
		<cfelseif isValid eq "valid">
			<cflocation url="../index.cfm?fa=sales_center&loggedin=1">
		</cfif>
	</cfoutput>	
</cfif>

<!--- Call Component/function to DELETE A LEAD --->
<cfif url.delete eq 1 AND url.lid neq 0>
	<cfscript>
		objDelete = createObject("component","leadManagerCFC");
		isDelete = objDelete.deleteLead(url.lid);
	</cfscript>
	
	<cfoutput>
		<cfif isDelete eq TRUE>
			<cflocation url="../index.cfm?fa=#url.fa#&deleted=true">
		<cfelseif isDelete eq FALSE>
			<cflocation url="../index.cfm?fa=#url.fa#&deleted=false">
		</cfif>
	</cfoutput>	
</cfif>


<!--- Call Component/function to EDIT A LEAD --->
<cfif form.edit_lead neq 0>
	<cfscript>
		objEdit = createObject("component","leadManagerCFC");
		isEdit = objEdit.updateLead(form.lid, form.first_name, form.last_name, form.client_email, form.phone, form.phone2, form.password, form.company, form.position, form.follow_up_date, form.follow_up_method, form.follow_up_remind, form.comments);
	</cfscript>
	
	<cfoutput>
		<cfif isEdit eq TRUE>
			<cflocation url="../index.cfm?fa=#form.fa#&lid=#form.lid#&edited=true">
		<cfelseif isEdit eq FALSE>
			<cflocation url="../index.cfm?fa=#form.fa#&lid=#form.lid#&edited=false">
		</cfif>
	</cfoutput>	
</cfif>

<!--- Call Component/function to ADD A SALESPERSON --->
<cfif form.add_salesperson neq 0>
	<cfscript>
		objAddSalesPerson = createObject("component","leadManagerCFC");
		isPersonAdded = objAddSalesPerson.addSalesPerson(form.s_first_name, form.s_last_name, form.s_email, form.s_password, form.s_phone, form.s_phone2, form.s_position, form.s_manager);
	</cfscript>
	
	<cfoutput>
		<cfif isPersonAdded eq TRUE>
			<cflocation url="../index.cfm?fa=#form.fa#&added=true">
		<cfelseif isPersonAdded eq FALSE>
			<cflocation url="../index.cfm?fa=#form.fa#&added=false">
		</cfif>
	</cfoutput>	
</cfif>

<!--- Call Component/function to RESEND AN EMAIL TO A LEAD --->
<cfif form.resend_lead neq 0>
	<cfscript>
		objResend = createObject("component","leadManagerCFC");
		isResend = objResend.resendLead(form.lid, form.first_name, form.last_name, form.client_email, form.phone, form.phone2, form.password, form.company, form.website, form.position, form.follow_up_date, form.follow_up_method, form.follow_up_remind, form.email_copy, form.comments);
	</cfscript>
	
	<cfoutput>
		<cfif isResend eq TRUE>
			<cflocation url="../index.cfm?fa=#form.fa#&resent=true">
		<cfelseif isResend eq FALSE>
			<cflocation url="../index.cfm?fa=#form.fa#&resent=false">
		</cfif>
	</cfoutput>	
</cfif>