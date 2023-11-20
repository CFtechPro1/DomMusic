	
    
    <cfmail from="#form.email_address#" to="dtkelly72@yahoo.com,dom@dommusic.com" subject="DOM Music Club member">
	
	DOM Music Club email:
	
	From: #form.name# 
	Given Email: #form.email_address#
	
	#form.description#
	
	</cfmail>


<cfquery name="dom_club" datasource="#application.dsn#">
	INSERT INTO dom_music_club
		(email_address, name, description, date_joined)
		VALUES
		('#form.email_address#','#form.name#','#form.description#', CURRENT_TIMESTAMP)
</cfquery>

<cfoutput>
	<cflocation url="index.cfm?fa=dom_music_club&sent=1">
</cfoutput>