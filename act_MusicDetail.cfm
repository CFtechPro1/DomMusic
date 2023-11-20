




<cfparam  name="form.add" default="0">
<cfparam  name="url.add" default="0">
<cfparam  name="url.vol" default="0">
<cfparam  name="url.catalog_title" default="0">
<cfparam  name="url.catalog" default="0">
<cfparam  name="form.cat" default="0">
<cfparam  name="form.music_cat" default="0">



<!---  <cfoutput>
	#form.music_cat#
</cfoutput>

<cfabort>  ---> 

<!--- make change --->
<cfoutput>
<cfif #form.add# eq "1">
    <Cfquery name="editor" datasource="#application.dsn#">
 insert into dom_tracks 
		      (track_title, bpm, duration, filesize, format, composer, description)
		values('#form.track_title1#','#form.bpm1#', '#form.duration1#','#form.filesize1#', '#form.format1#','#form.composer1#','#form.DESCRIPTION1#')
		</cfquery>
		
<cfelseif #url.add# eq '2'>

put delete here

<cfelse>


	<Cfquery name="editor" datasource="#application.dsn#">
	update dom_tracks set 
<!--- 	track_title = '#form.track_title1#', 
	bpm = '#form.bpm1#',
	duration = '#form.duration1#',
	filesize = '#form.filesize1#', 
	format = '#form.format1#', 
	composer = '#form.composer1#', --->
	instrumentation = '#form.instrumentation1#',
	description= '#form.DESCRIPTION1#',
	categories = '#form.cat#<cfif form.music_cat neq 0>,#form.music_cat#</cfif>'
	where ID = '#form.id#'
	</cfquery>


</cfif>
</cfoutput>
<!---  put a pop up javascript to let know it updated --->
<cfoutput>
	<Cflocation url="../index.cfm?fa=musicdetails&updated=1&vol=#url.vol#&catalog=#url.catalog#&cat=#url.cat#&music_cat=#url.music_cat#&sub=1" addtoken="No">
</cfoutput>
