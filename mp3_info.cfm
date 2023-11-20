<cfdirectory directory="C:\Websites\xk67ca87\DOMmusic\test\"
	name="shock" 
	action="list">

<cfoutput query="shock">
<cfset mp3File = createObject("java", "coldfusion.util.MP3File").init("C:\Websites\xk67ca87\DOMmusic\test\#shock.name#")>
<cfoutput>mp3File.getBitRate() : #mp3File.getBitRate()# kbps</cfoutput><br>
<cfoutput>mp3File.getFrequency() : #mp3File.getFrequency()# Hz</cfoutput><br>
<cfoutput>mp3File.getVersion() : #mp3File.getVersion()#</cfoutput><br>
		<cfset seconds = mp3File.getDuration()>
		<cfset time = TimeFormat(seconds,"mm:ss")>
<cfoutput>mp3File.getDuration() :  #NumberFormat(seconds / 60,"9")#:#NumberFormat(seconds % 60,"09")#</cfoutput><br>
<cfoutput>mp3File.isCopyRighted() : #mp3File.isCopyRighted()#</cfoutput><br>
<cfoutput>mp3File.getChannelMode() : #mp3File.getChannelMode()#</cfoutput><br>
</cfoutput>

