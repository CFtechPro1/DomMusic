<cfparam name="form.phone" default="">
<cfparam name="url.title" default="">
<cfparam name="form.botcatcher" default="">

<cfif form.botcatcher neq "">
	<cflocation url="index.cfm?fa=license_info&bot=1">
</cfif>



	<cfmail from="#form.given_email#" to="dtkelly72@yahoo.com" subject="Licensing Info Request" server="mail.dommusic.com" username="Dom@dommusic.com" password="Woody101">
	
	Licensing Info email:
	
    Track Title: #url.title#
    
	From: #form.name# 
    
	Email: #form.given_email#
    
    Phone: #form.phone#
	
    Message:
	#form.description#
	
	</cfmail>



<cfoutput>
	<cflocation url="index.cfm?fa=license_info&sent=1">
</cfoutput>