<cfparam name="url.wav" default=0>

	<cfquery name="t" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description, 
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, vol, instrumentation
		FROM dom_tracks
		WHERE filename = '#trim(url.filename)#'
	</cfquery>

<cfif url.wav eq 0>

	<cfheader name="Content-Disposition" value="attachment; filename=#url.filename#"> 
	
	<cfcontent type="audio/mpeg" file="#application.filepath##replace(t.filepath,'/','\')##url.filename#">

<cfelse>

	<cfheader name="Content-Disposition" value="attachment; filename=#replace(t.filename,'.mp3','.wav')#"> 
	
	<cfcontent type="audio/mpeg" file="#application.filepath##replace(replace(t.filepath,'/','\'),'mp3s','wavs')##replace(t.filename,'.mp3','.wav')#">

</cfif>