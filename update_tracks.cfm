
<cfset filetype = "Instrumental">
<cfset catalog_title = "Hip Hop">
<cfset filepath = "Hip_Hop">

	<!--- Select the files where new shocktronica uploads are placed --->
<cfdirectory directory="C:\Websites\xk67ca87\DOMmusic\mp3s\uploads"
	name="shock" 
	action="list">
	


<!---  <cfoutput query="shock">
	#shock.name# <br>
		<cfset size_kb = shock.size / 1024>
		<cfset size_mb = size_kb / 1024>
	<cfset song_title = replace(shock.name,".mp3","")>	
	<cfset song_title = replace(song_title, "#right(song_title,3)#" ,"")>
	<cfset song_title = replace(song_title,"_"," ","ALL")>
	
	#song_title# <br>
</cfoutput>  --->

<cfset counter = 1>

 <cfloop query="shock">
		
		<!--- Get duration of the mp3 --->
		<cfset mp3File = createObject("java", "coldfusion.util.MP3File").init("C:\Websites\xk67ca87\DOMmusic\mp3s\uploads\#shock.name#")>
		<cfset seconds = mp3File.getDuration()>
		
		<!--- Get size of the mp3 --->
		<cfset size_kb = shock.size / 1024>
		<cfset size_mb = size_kb / 1024>
		
		<!--- Fix up the track title --->
		<cfset song_title = replace(shock.name,".mp3","")>	
		<cfset song_title = replace(song_title, "#right(song_title,3)#" ,"")>
		<cfset song_title = replace(song_title,"_"," ","ALL")>

	<cfquery name="ins" datasource="#application.dsn#">
		INSERT INTO dom_tracks
			(cid, track_title, filename, composer, bpm,
				instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name, filepath, filesize, filetype, duration, vol)
		VALUES
			(1, '#trim(song_title)#', '#shock.name#', 'Dominic T. Kelly', '#replace(right(replace(shock.name,".mp3",""),3),"_","")#',
				 ' ', '#catalog_title#',
				'mp3', 'ASCAP', 'ASCAP', 'Screw The Pooch', 'mp3s/#filepath#/', '#NumberFormat(size_mb,"9.9")#','#filetype#','#int(seconds / 60)#:#NumberFormat(seconds % 60,"09")#','1')     
	</cfquery>

<cfoutput>
#counter#). #trim(song_title)# <br>
</cfoutput>
	<cfset counter = counter + 1>	
</cfloop>

DOOONE...