<cfcomponent hint="component for managing sales leads" access="Public">

	<!--- Function for sales person login --->
	<cffunction name="salesLogin" returnType="string" output="yes">
	
		<cfargument name="email" required="yes">
		<cfargument name="password" required="yes">
			
	<!--- Check the sales force table for the sales person. --->
	<cfquery name="s_login" datasource="#application.dsn#">
		SELECT id, s_email, s_password, s_first_name, s_last_name, s_manager
		FROM dom_sales_force
			WHERE s_email = '#trim(arguments.email)#'
				AND s_password = '#trim(arguments.password)#'
	</cfquery>
	
	<cfif s_login.recordcount eq 0>
	
		<cfreturn "nogo"/>

	<cfelse>
		
		<!--- If the salesperson is valid, set sales client vars. --->
		<cfset client.sid = s_login.id>
		<cfset client.s_email = s_login.s_email>
		<cfset client.s_manager = s_login.s_manager>
		<cfset client.s_name = s_login.s_first_name & ' ' & s_login.s_last_name>
				
		<cfreturn "valid"/>

	</cfif>
	</cffunction>
	<!--- END of Function for salesperson login --->
	
	

	<!--- Function for adding a lead to the database --->
	<cffunction name="addLead" returnType="string" output="yes">
	
		
		<cfargument name="first_name" required="yes">
		<cfargument name="last_name" required="yes">
		<cfargument name="client_email" required="yes">
		<cfargument name="phone" required="yes">
		<cfargument name="website" required="no" default="">
		<cfargument name="phone2" required="no" default="">
		<cfargument name="fax" required="no" default="">
		<cfargument name="company" required="yes">
		<cfargument name="position" required="no" default="">
		<cfargument name="follow_up_date" required="no" default="">
		<cfargument name="follow_up_method" required="no" default="">
		<cfargument name="follow_up_remind" required="no" default="">
		<cfargument name="send_access" required="no" default=0>
		<cfargument name="email_copy" required="no" default="">
		<cfargument name="personal_password" required="yes" default="">
		<cfargument name="comments" required="no" default="">

		
		
		<cfquery name="sales" datasource="#application.dsn#">
			SELECT s_first_name, s_last_name, s_email, s_phone, s_position
			FROM dom_sales_force
			WHERE id = #client.sid#
		</cfquery>
		
		<cfif arguments.personal_password eq "">
			<cfset password = (RandRange(1,9) & "DOM" & RandRange(1,9) & RandRange(1,9))>
		<cfelse>
			<cfset password = arguments.personal_password>
		</cfif>
		
		<cfset date_added = DateFormat(Now(),"mm/dd/yyyy")>
		
		<cfquery name="client" datasource="#application.dsn#">
			INSERT INTO dom_clients
			(sid, s_first_name, s_last_name, first_name, last_name, client_email, phone, website, phone2, fax, password, company, position, date_added, follow_up_date, follow_up_method, follow_up_remind, email_copy, comments, send_access)
			VALUES
			(#client.sid#,'#sales.s_first_name#', '#sales.s_last_name#','#arguments.first_name#','#arguments.last_name#','#arguments.client_email#','#arguments.phone#','#arguments.website#','#arguments.phone2#','#arguments.fax#', 
				'#password#','#arguments.company#','#arguments.position#','#date_added#','#DateFormat(arguments.follow_up_date,"mm/dd/yyyy")#','#arguments.follow_up_method#'
				,#arguments.follow_up_remind#,'#arguments.email_copy#','#arguments.comments#','#arguments.send_access#')
		</cfquery>
		
		<cfif arguments.send_access eq 1>
			    
			 <cfmail from="#sales.s_email#" to="#arguments.client_email#" subject="DOM Music Library Access" bcc="#client.s_email#">
<cfif arguments.email_copy neq "">

#arguments.email_copy#
</cfif>
	
Regarding DOM Music Library Access:
		
A password has been generated for you for www.DOMmusic.com
						
	USERNAME: #trim(arguments.client_email)#
	PASSWORD: #trim(password)#
		 
To login go to:
		
http://www.DomMusic.com   and click on "Client Login" on the left menu.
			
Best Regards,
		
		
#sales.s_first_name# #sales.s_last_name# | 
#sales.s_position# |
www.DOMmusic.com
#sales.s_phone#
#sales.s_email#


The music on the DOM Music Library website is to be used for consideration in media productions only.
Sales or Redistribution of the music is prohibited by federal law.	
			</cfmail>
		</cfif>
		
		<cfif arguments.send_access eq 1>
			<cfreturn "add complete and access sent"/>
		<cfelse>
			<cfreturn "add complete"/>
		</cfif>
			
	</cffunction>
	<!--- END of Function for adding a lead to the database --->
	
	
	<!--- Function for viewing a salesperson's leads. --->
	<cffunction name="viewLeads" returnType="query" output="yes">
		
		<cfargument name="sid" required="yes">
		
		<cfset var leads = "">
		
		<cfquery name="leads" datasource="#application.dsn#">
			SELECT id, first_name, last_name, client_email, phone, password, company, position, date_added, follow_up_date, follow_up_method, follow_up_remind, comments, send_access
			FROM dom_clients
			WHERE sid = #arguments.sid#
			ORDER BY date_added, id
		</cfquery>
		
		<cfreturn leads/>
		
	</cffunction>
	<!--- END of Function for viewing a salesperson's leads. --->
	
	<!--- Function for deleting a salesperson's lead. --->
	<cffunction name="deleteLead" returnType="boolean" output="yes">
	
		<cfargument name="lid" required="yes">
		
		<cfquery name="del" datasource="#application.dsn#">
			DELETE FROM dom_clients
			WHERE id = #arguments.lid#
		</cfquery>
	
		<cfreturn TRUE/>
		
	</cffunction>
	<!--- END of Function for deleting a salesperson's lead. --->
	
		<!--- Function for EDITING a salesperson's lead. --->
	<cffunction name="updateLead" returnType="boolean" output="yes">
	
		<cfargument name="lid" required="yes">
		<cfargument name="first_name" required="yes">
		<cfargument name="last_name" required="yes">
		<cfargument name="client_email" required="yes">
		<cfargument name="phone" required="yes">
		<cfargument name="phone2" required="no" default="">
		<cfargument name="password" required="yes">
		<cfargument name="company" required="yes">
		<cfargument name="position" required="no" default="">
		<cfargument name="follow_up_date" required="no" default="">
		<cfargument name="follow_up_method" required="no" default="">
		<cfargument name="follow_up_remind" required="no" default="">
		<cfargument name="comments" required="no" default="">
			
		<cfquery name="sales" datasource="#application.dsn#">
			SELECT s_first_name, s_last_name, s_email, s_phone, s_position
			FROM dom_sales_force
			WHERE id = #client.sid#
		</cfquery>		
		
		<cfquery name="update" datasource="#application.dsn#">
			UPDATE dom_clients
				SET 
				first_name = '#arguments.first_name#', 
				last_name = '#arguments.last_name#', 
				client_email = '#arguments.client_email#', 
				phone = '#arguments.phone#', 
				phone2 = '#arguments.phone2#',
				password = '#arguments.password#', 
				company = '#arguments.company#', 
				position = '#arguments.position#', 
				follow_up_date = '#arguments.follow_up_date#', 
				follow_up_method = '#arguments.follow_up_method#', 	
				follow_up_remind = '#arguments.follow_up_remind#', 
				comments = '#arguments.comments#'
			WHERE id = #arguments.lid#
		</cfquery>
	
		<cfreturn TRUE/>
		
	</cffunction>
	<!--- END of Function for EDITING a salesperson's lead. --->
	
	<!--- Function for ADD a SALESPERSON. --->
	<cffunction name="addSalesPerson" returnType="boolean" output="yes">
	
		<cfargument name="s_first_name" required="yes">
		<cfargument name="s_last_name" required="yes">
		<cfargument name="s_email" required="yes">
		<cfargument name="s_password" required="yes">
		<cfargument name="s_phone" required="yes">
		<cfargument name="s_phone2" required="no" default="">
		<cfargument name="s_position" required="no" default="">
		<cfargument name="s_manager" required="yes">
	
		<cfquery name="client" datasource="#application.dsn#">
			INSERT INTO dom_sales_force
			(s_first_name, s_last_name, s_email, s_password, s_phone, s_phone2, s_position, s_manager)
			VALUES
			('#arguments.s_first_name#', '#arguments.s_last_name#','#arguments.s_email#','#arguments.s_password#','#arguments.s_phone#','#arguments.s_phone2#',
				'#arguments.s_position#','#arguments.s_manager#')
		</cfquery>
	
		<cfreturn TRUE/>
	
	</cffunction>
	<!--- END of Function for ADD a SALESPERSON. --->
	

		<!--- Function for RE-SENDING a salesperson's lead. --->
	<cffunction name="resendLead" returnType="boolean" output="yes">
	
		<cfargument name="lid" required="yes">
		<cfargument name="first_name" required="yes">
		<cfargument name="last_name" required="yes">
		<cfargument name="client_email" required="yes">
		<cfargument name="phone" required="yes">
		<cfargument name="phone2" required="no" default="">
		<cfargument name="password" required="yes">
		<cfargument name="company" required="yes">
		<cfargument name="website" required="yes">
		<cfargument name="position" required="no" default="">
		<cfargument name="follow_up_date" required="no" default="">
		<cfargument name="follow_up_method" required="no" default="">
		<cfargument name="follow_up_remind" required="no" default="">
		<cfargument name="email_copy" required="no" default="">
		<cfargument name="comments" required="no" default="">
			
		<cfquery name="sales" datasource="#application.dsn#">
			SELECT s_first_name, s_last_name, s_email, s_phone, s_position
			FROM dom_sales_force
			WHERE id = #client.sid#
		</cfquery>	
			
		<cfquery name="update" datasource="#application.dsn#">
			UPDATE dom_clients
				SET 
				first_name = '#arguments.first_name#', 
				last_name = '#arguments.last_name#', 
				client_email = '#arguments.client_email#', 
				phone = '#arguments.phone#', 
				phone2 = '#arguments.phone2#',
				password = '#arguments.password#', 
				company = '#arguments.company#', 
				website = '#arguments.website#',
				position = '#arguments.position#', 
				follow_up_date = '#arguments.follow_up_date#', 
				follow_up_method = '#arguments.follow_up_method#', 	
				follow_up_remind = '#arguments.follow_up_remind#', 
				comments = '#arguments.comments#',
				email_copy = '#arguments.email_copy#'
			WHERE id = #arguments.lid#
		</cfquery>
	
	 <cfmail from="#sales.s_email#" to="#arguments.client_email#" subject="DOM Music Library Access" bcc="#client.s_email#">
<cfif arguments.email_copy neq "">

#arguments.email_copy#
</cfif>
	
Regarding DOM Music Library Access:
		
A password has been generated for you for www.DOMmusic.com
						
	USERNAME: #trim(arguments.client_email)#
	PASSWORD: #trim(password)#
		 
To login go to:
		
http://www.DomMusic.com   and click on "Client Login" on the left menu.
			
Best Regards,
		
		
#sales.s_first_name# #sales.s_last_name# | 
#sales.s_position# |
www.DOMmusic.com
#sales.s_phone#
#sales.s_email#


The music on the DOM Music Library website is to be used for consideration in media productions only.
Sales or Redistribution of the music is prohibited by federal law.	
			</cfmail>
	
		<cfreturn TRUE/>
		
	</cffunction>
	<!--- END of Function for RE-SENDING a salesperson's lead. --->	

</cfcomponent>
