
	<cfquery name="t" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description, 
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, vol, instrumentation
		FROM dom_tracks
		WHERE filename = '#trim(url.filename)#'
	</cfquery>


<cfheader name="Content-Disposition" value="attachment; filename=#url.filename#"> 

<cfcontent type="audio/mpeg" file="http://www.dommusic.com/mp3_files/#url.filename#">

