
<!---
<cfset yourFileName="#url.filename#">
<cfcontent type="audio/mp3">
<cfheader name="Content-Disposition" value="mp3;filename=#yourFileName#">
<cfheader name="Content-Description" value="#url.track_title#">
<cflocation url="../#search.filepath##search.filename#">


<cfheader name="Content-disposition" value="attachment;filename=test.jpg">
<cfcontent type="mp3" file="D:\htdocs\filecabinet\test.jpg">--->


<cfheader name="Content-Disposition" value="inline; filename=#url.filename#">
<cfcontent type="audio/mpeg" file="../#url.filepath##url.filename#">
<cflocation url="../#search.filepath##search.filename#">
