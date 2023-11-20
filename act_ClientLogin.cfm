
<cfparam name="form.email" default=0>
<cfparam name="form.password" default=0>
<cfparam name="form.login" default=0>
<cfparam name="form.get_pass" default=0>
<cfparam name="form.change_pass" default=0>


<cfif form.login eq 1>

	<cfobject component="ClientLoginCFC" name="loginObject">

	<cfinvoke component="#loginObject#" method="clientLogin">
		<cfinvokeargument name="email" value="#form.email#">
		<cfinvokeargument name="password" value="#form.password#">
	</cfinvoke>

</cfif>

<cfif form.get_pass eq 1>

	<cfobject component="ClientLoginCFC" name="passObject">
	
	<cfinvoke component="#passObject#" method="displayPassword" returnVariable="cid">
		<cfinvokeargument name="email" value="#form.email#">	
	</cfinvoke>
	
		<cfoutput>
			<cflocation url="../index.cfm?fa=login&cid=#cid#">
		</cfoutput>
	
</cfif>

<cfif form.change_pass eq 1>

	<cfobject component="ClientLoginCFC" name="changeObject">
	
	<cfinvoke component="#changeObject#" method="changePassword" returnVariable="changeStatus">
		<cfinvokeargument name="email" value="#form.email#">
		<cfinvokeargument name="old_password" value="#form.old_password#">
		<cfinvokeargument name="new_password" value="#form.new_password#">
		<cfinvokeargument name="new_password2" value="#form.new_password2#">
	</cfinvoke>

		<cfoutput>
			<cflocation url="../index.cfm?fa=login&status=#changeStatus#">
		</cfoutput>
	
</cfif>
