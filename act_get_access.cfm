<cfset Cffp = CreateObject("component","cfformprotect.cffpVerify").init() />
<!--- now we can test the form submission --->
<cfif Cffp.testSubmission(form)>

<cfset password = (RandRange(1,9) & "DOM" & RandRange(1,9) & RandRange(1,9))>

<cfquery name="client" datasource="#application.dsn#">
	INSERT INTO dom_clients
		(first_name, last_name, client_email, password, company, position, comments)
		VALUES
		('#form.first_name#','#form.last_name#','#form.client_email#','#password#','#form.company#','#form.position#','#form.comments#')
</cfquery>

     <cfmail from="#form.client_email#" to="dtkelly72@yahoo.com" subject="DOM Access Request">
	
		Client Access request email:
		
		Name: #form.first_name#  #form.last_name# 
		Email: #form.client_email#
		
		Company: #form.company#
		Position: #form.position#
		
		Comments: #form.comments#
	
	</cfmail>

     <cfmail from="DOM Music Library" to="#form.client_email#" subject="DOM Music Library Access">
	
Regarding Client Access request:
		
Greetings  #form.first_name# #form.last_name#,
		
A password has been generated for you for www.DOMmusic.com
						
	USERNAME: #trim(form.client_email)#
	PASSWORD: #trim(password)#
		 
You may now login at:
		
http://www.ezsite.bz/DOMmusic/index.cfm?fa=login
		
The music on the DOM Music Library website is to be used for consideration in media productions only.
Redistribution of the music tracks is prohibited by law.
		
Best Regards,
		
		
Dominic Kelly
Principal Composer
www.DOMmusic.com
		
	</cfmail>

	<cfoutput>
		<cflocation url="index.cfm?fa=get_access&sent=1">
	</cfoutput>  
<!--- The submission has passed the form test.  Place processing here --->

<cfelse>

	<cfoutput>
		<cflocation url="index.cfm?fa=get_access&failed=1">
	</cfoutput>  

       <!--- The test failed.  Take appropriate failure action here. --->
</cfif> 


