



<cfcomponent hint="Component for client login functions">

	<!--- Function to login in a client. --->
	<cffunction name="clientLogin" returnType="string" output="yes">
	
		<cfargument name="email" required="yes">
		<cfargument name="password" required="yes">
		
		
		
		<cfquery name="login" datasource="#application.dsn#">
			SELECT client_email, password, first_name, last_name, sid, s_first_name, s_last_name
			FROM dom_clients
			WHERE client_email = '#trim(arguments.email)#'
				AND password = '#trim(arguments.password)#'
		</cfquery>
	
	
		<cfif login.recordcount eq 0>
	
			<cflocation url="../index.cfm?fa=login&denied=1">
		
		<cfelse>
			<!--- Set client vars --->
			<cfset client.email = login.client_email>
			<cfset client.name = login.first_name & " " & login.last_name>
			<!--- Set salesPerson vars to 0 --->
			<cfset client.sid = 0>
			<cfset client.s_email = 0>
			<cfset client.s_manager = 0>
			<cfset client.s_name = 0>
				
			<cflocation url="../index.cfm?fa=search_tracks">
		
		</cfif>
	
	</cffunction>

	
	<!--- Function to display password and email password to client. --->
	<cffunction name="displayPassword" returnType="numeric" output="yes">
	
		<cfargument name="email" required="yes">
		
		
		<cfquery name="get_pass" datasource="#application.dsn#">
			SELECT id, client_email, password, first_name, last_name, sid, s_first_name, s_last_name
			FROM dom_clients
			WHERE client_email = '#trim(arguments.email)#'
		</cfquery>		
	
	<cfif get_pass.recordcount neq 0>
	
     <cfmail from="dtkelly72@yahoo.com" to="#get_pass.client_email#" subject="DOM Password Request">
	
		Client Password request email:
		
		Email: #get_pass.client_email#
		Password: #get_pass.password#
		
		Login at:
		http://www.ezsite.bz/DOMmusic/index.cfm?fa=login
		
		Thank you!
		
		
		DOM Music Library
		www.DomMusic.com
		1877-4-1-SHOCK
		
	</cfmail>
	
		<cfreturn get_pass.id/>
		
	<cfelse>
	
		<cflocation url="../index.cfm?fa=get_pass&denied=1">
		
	</cfif>
	
	</cffunction>
	
	
	<!--- Function to CHANGE password. --->
	
	<cffunction name="changePassword" output="yes" returnType="string">
	
		<cfargument name="email" required="yes">
		<cfargument name="old_password" required="yes">
		<cfargument name="new_password" required="yes">
		<cfargument name="new_password2" required="yes">
		
		<cfif arguments.new_password neq arguments.new_password2>
			<cflocation url="index.cfm?fa=get_pass&change=1&np=1">
		</cfif>
	
		<cfquery name="get_pass" datasource="#application.dsn#">
			SELECT id, client_email, password, first_name, last_name, sid, s_first_name, s_last_name
			FROM dom_clients
			WHERE client_email = '#trim(arguments.email)#'
		</cfquery>		
		
		<cfquery name="update_pass" datasource="#application.dsn#">
			UPDATE dom_clients
			SET password = '#trim(arguments.new_password)#'
			WHERE id = #get_pass.id#
		</cfquery>		
		
		<cfreturn "changed">
	
	</cffunction>
	
</cfcomponent>