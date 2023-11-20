<cfif form.botcatcher neq "">
	<cflocation url="index.cfm?fa=contact&bot=1">
</cfif>


	<cfmail from="#form.given_email#" to="domkellymusic@gmail.com" subject="#form.subject#">
	
	Support email:
	
	From: #form.name# 
	Given Email: #form.given_email#
	
	#form.description#
	
	</cfmail>



<cfoutput>
	<cflocation url="index.cfm?fa=contact&sent=1">
</cfoutput>