<cfdirectory directory="C:\Websites\xk67ca87\dark_electronica\Shocktronica_mp3s\"
	name="shock" 
	action="list">
	
<cfoutput query="shock">
<cfset mp3File = createObject("java", "coldfusion.util.MP3File").init("C:\Websites\xk67ca87\dark_electronica\Shocktronica_mp3s\#shock.name#")>

		<cfset seconds = mp3File.getDuration()>

	<cfquery name="update" datasource="#application.dsn#">
		UPDATE dom_tracks
			SET duration = '#int(seconds / 60)#:#NumberFormat(seconds % 60,"09")#'
			WHERE filename = '#shock.name#'   
	</cfquery>		

		
#shock.name#  mp3File.getDuration() :  #int(seconds / 60)#:#NumberFormat(seconds % 60,"09")#<br>

</cfoutput>