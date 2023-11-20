


<script type="text/javascript" src="http://mediaplayer.yahoo.com/js"></script>

<cfparam name="url.name" default=0>
<cfif url.name eq "guest">
	<cfset client.name = "DOM Music Guest">
</cfif>

<cfif client.name eq 0 AND client.s_name eq 0>
	<cflocation url="index.cfm?fa=login">
</cfif>

<!--- <cflocation url="index.cfm?fa=search_music">
 --->
<cfparam name="url.sub" default=0>

<cfparam name="form.track_title" default="">
<cfparam name="form.composer" default=0>
<cfparam name="form.bpm" default="">
<cfparam name="form.key_words" default="">
<cfparam name="form.duration" default=0>
<cfparam name="form.style" default=0>
<cfparam name="form.volume_title" default=0>
<cfparam name="form.filetype" default=0>
<cfparam name="form.vol" default=0>
<cfparam name="form.instrument" default=0>
<cfparam name="form.tempo" default=0>
<cfparam name="form.catalog_title" default=0>
<cfparam name="url.acoustic" default=0>




<cfif url.acoustic eq 1>
	<cfset url.sub = 1>
	<cfset form.catalog_title = "Acoustic Vocal Songs">
</cfif>



	<cfquery name="sty" datasource="#application.dsn#">
		SELECT style
		FROM dom_styles	
	</cfquery>
	<cfquery name="vol" datasource="#application.dsn#">
		SELECT volume_title, volume_desc
		FROM dom_volumes	
	</cfquery>
	<cfquery name="instr" datasource="#application.dsn#">
		SELECT instrument
		FROM dom_instr	
		ORDER BY instrument
	</cfquery>

<cfif url.sub eq 1>
	<cfquery name="search" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description, 
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, vol, instrumentation
		FROM dom_tracks
		WHERE 1=1
		<cfif form.track_title neq "">
			AND track_title LIKE '%#form.track_title#%'
		</cfif>
		<cfif form.composer neq 0>
			AND composer LIKE '%#form.composer#%'		
		</cfif>
		<cfif form.bpm neq "">
			AND bpm LIKE '%#form.bpm#%'		
		</cfif>
		<cfif form.tempo neq 0>
			<cfif form.tempo eq "slower">
				AND bpm BETWEEN 80 AND 104
			<cfelseif form.tempo eq "mid-tempo">
				AND bpm BETWEEN 105 AND 109
			<cfelseif form.tempo eq "faster">
				AND bpm BETWEEN 110 AND 150
			</cfif>		
		</cfif>
		<cfif form.duration neq 0>
			AND duration BETWEEN '#ListGetAt(form.duration, 1)#' AND '#ListGetAt(form.duration, 2)#'	
		</cfif>
		<cfif form.key_words neq "">
			AND (description LIKE '%#form.key_words#%' OR styles LIKE '%#form.key_words#%' OR instrumentation LIKE '%#form.key_words#%' OR track_title LIKE '%#form.key_words#%')		
		</cfif>
		<cfif form.style neq 0>
			AND styles LIKE '%#form.style#%'		
		</cfif>
		<cfif form.volume_title neq 0>
			AND volume_title LIKE '%#form.volume_title#%'		
		</cfif>
		<cfif form.filetype neq 0>
			AND filetype = '#form.filetype#'		
		</cfif>		
		<cfif form.vol neq 0>
			AND vol = '#trim(form.vol)#'		
		</cfif>		
		<cfif form.instrument neq 0>
			AND instrumentation LIKE '%#trim(form.instrument)#%'		
		</cfif>		
		<cfif form.catalog_title neq 0>
			AND volume_title = '#trim(form.catalog_title)#'		
		</cfif>	
	</cfquery>
</cfif>


	<table cellpadding="5" class="dkblue12">
		<tr>
			<td>

		<!--- table with all the possible search options. --->
<form method="post" name="tracks" action="index.cfm?fa=search_tracks&sub=1">
<table bgcolor="666666" border="1" width="100%">
	<tr>
		<td>
<table bgcolor="FFFFFF" cellpadding="5" cellspacing="2" class="black12" width="100%" border="0">
	<tr>
		<td colspan="6" bgcolor="993333" align="center">
		DOM Music Library Track Search    <div align="right"><cfoutput><font color="FFFFFF">Welcome: <cfif client.sid neq 0>#client.s_name#<cfelse>#client.name#</cfif></cfoutput></font></div>
		</td>
	</tr>
	<tr>

		<td align="right">
			<b>Featured Instruments</b>:
		</td>
		<td>
			<select name="instrument" size="1" class="select">
				<cfif form.instrument neq 0>
					<cfoutput>
						<option value="#form.instrument#">#form.instrument#</option>
					</cfoutput>
				</cfif>
				<option value=0>ALL</option>
				<cfoutput query="instr">	    
					<option value="#instrument#">#instrument#</option>
				</cfoutput>
			</select>  
		</td>		
		<td align="right">
			<b>Catalog Title</b>:
		</td>
		<td>
			 <select name="catalog_title" size="1" class="select">
				<cfif form.catalog_title neq 0>
					<cfoutput>
						<option value="#form.catalog_title#">#form.catalog_title#</option>
					</cfoutput>
				</cfif>
				<option value="0"> All  </option>
				<option value="Shocktronica">Shocktronica</option>
				<option value="Acoustic Vocal Songs">Acoustic Vocal Songs</option>
				<option value="Electric Groove">Electric Groove</option>
				<option value="Piano Blues & Country">Piano Blues & Country</option>
			</select> 
		</td>		

	</tr>
	<tr>
		<td align="right">
			Duration:</font>
		</td>
		<td>
			<SELECT NAME="duration" class="select">
				<cfif form.duration neq 0>
					<cfoutput>
						<option value="#form.duration#">#form.duration#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="0,0:10"> :10 and under</option>
				<option value="0,0:30"> :30 and under</option>
				<option value="0,1:00"> 1:00 and under</option>
				<option value="1:00,1:30"> 1:00 - 1:30</option>
				<option value="1:30,2:00"> 1:30 - 2:00</option>
				<option value="2:00,2:30"> 2:00 - 2:30</option>
				<option value="2:30,3:00"> 2:30 - 3:00</option>
				<option value="3:00,9:00"> 3:00 and over</option>
			</SELECT>	
		</td>
		<td align="right">
			Volume:
			<!--- Key Words: --->
		</td>
		<td>
			
			<!--- <input type="text" size="30" name="key_words" value="<cfif form.key_words neq ""><cfoutput>#form.key_words#</cfoutput></cfif>"> --->
			
			<select name="vol" size="1" class="select">
				<cfif form.vol neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
			<cfloop index="i" from="1" to="65">
				<cfoutput>   
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput> 
			</cfloop>	
			
			</select> 
		</td>
	</tr>
	<tr>
		<td align="right">
			Speed (tempo): 
		</td>
		<td>
			<select name="tempo" size="1" class="select">
				<cfif form.tempo neq 0>
					<cfoutput>
						<option value="#form.tempo#">#form.tempo#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>    
				<option value="slower">Slower</option>
				<option value="mid-tempo">Mid-Tempo</option>
				<option value="faster">Faster</option>
			</select> 
		</td>
		<td align="right">
			Track Title:
		</td>
		<td>
			<input type="text" size="30" name="track_title" value="<cfif form.track_title neq ""><cfoutput>#form.track_title#</cfoutput></cfif>">
		</td>
	<tr>
		<td align="right" nowrap>
			Beats Per Minute:<br>
			(example: 105)
		</td>
		<td>
			<input type="text" size="3" name="bpm" value="<cfif form.bpm neq ""><cfoutput>#form.bpm#</cfoutput></cfif>">
		</td>
		<td align="right" nowrap>
			Track Type:<br>
			<div class="black10">(Ins., vocal, etc.)</div>
		</td>
		<td>
			<SELECT NAME="filetype" class="select">
				<cfif form.filetype neq 0>
					<cfoutput>
						<option value="#form.filetype#">#form.filetype#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="Instrumental"> Instrumental</option>
				<option value="Vocal"> Vocal</option>
			<!--- 	<option value="Sting"> Sting</option>
				<option value="Transitional"> Transitional</option>
				<option value="Sound Effect"> Sound Effect</option> --->
			</SELECT>	
			
			
		</td>
	</tr>
	<tr>
		<td align="right" nowrap>
			Composer:
		</td>
		<td>
		<SELECT NAME="composer" class="select">
				<cfif form.composer neq 0>
					<cfoutput>
						<option value="#form.composer#">#form.composer#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="Dominic T. Kelly">Dominic T. Kelly</option>
				<option value="Mark Thors">Mark Thors</option>
			</SELECT>	
		</td>
		<td align="right" nowrap>

		</td>
		<td>
			<div align="right"> <a href="index.cfm?fa=search_tracks" class="tinylink">Reset Search</a></div>	
		</td>
	</tr>
	<tr>
		<td colspan="6" bgcolor="993333" align="center" class="bodyhdr">
		<input type="hidden" name="srch" value=1>
		<input type="Submit" value="  Run Search  ">
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</form>





			
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="black12" bgcolor="993333">
			<tr> 
				<td bgcolor="000000" align="center" class="black12" colspan="9">
					<img src="images/header_logo.jpg">
				</td>
			</tr>
			
<cfif url.sub eq 1>
	<cfif search.recordcount neq 0>
			<tr>
				<td bgcolor="333333" nowrap class="white14">
					TRACK TITLE
				</td>	
				<td bgcolor="333333" class="white14">
					PREVIEW
				</td>
				<td bgcolor="333333" class="white14">
					DOWNLOAD
				</td>
				<td bgcolor="333333" class="white14">
					BPM
				</td>	
				<td bgcolor="333333" class="white14">
					TIME
				</td>	
				<td bgcolor="333333" nowrap class="white14">
					FILE SIZE
				</td>
<!--- 			<td bgcolor="333333" class="white14">
					FORMAT
				</td>	
				<td bgcolor="669999">
					TYPE
				</td>		 --->
				<td bgcolor="333333" class="white14">
					VOL
				</td>		
			</tr>
			<cfoutput query="search">	
				<tr>
					<td bgcolor="F4F7D5" nowrap>
						<strong>#search.track_title#</strong>
					</td>	
					<td bgcolor="CCCCCC" nowrap>

		
<!--- <a href="../#search.filepath##search.filename#">#search.filename#</a> --->

<audio id="#search.filename#" src="../#search.filepath##search.filename#">
	<source src="../#search.filepath##search.filename#" type="audio/ogg" />
    <source src="../#search.filepath##search.filename#" type="audio/mp3" />
</audio>
						
					</td>
				<td bgcolor="FFFFFF" align="right">
						<a href="forcedownload.cfm?filename=#search.filename#">download</a>
					</td>
					<td bgcolor="FFFFFF">
						#search.bpm#
					</td>	
					<td bgcolor="FFFFFF">
						#search.duration#
					</td>	
					<td bgcolor="FFFFFF" nowrap>
						#search.filesize# mb
					</td>
<!---				<td bgcolor="FFFFFF">
						#search.format#
					</td>	
 					<td bgcolor="FFFFFF">
						#search.filetype#
					</td>	 --->	
					<td bgcolor="FFFFFF" nowrap>
						#search.vol#
					</td>			
				</tr>
			</cfoutput>	
			<tr> 
				<td bgcolor="000000" align="center" class="black12" colspan="9">&nbsp;
					
				</td>
			</tr>
	<cfelse>
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="red">***</font> <b>No tracks were found for that search, please try again.</b> <font color="red">***</font>
				<br><br>
				</td>
			</tr>	
	</cfif>
<cfelse>
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="green">***</font> <b>Please choose from the search criteria above, then click "Run Search".</b> <font color="green">***</font>
				<br><br>
				</td>
			</tr>		
</cfif>			
		</table>
		
			</td>
		</tr>
	</table>