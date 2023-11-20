<!---<script type="text/javascript" src="http://static.cloudmonster.im/js/mediaPlayer.js"></script>--->

<cfparam name="url.sub" default=0>

<cfparam name="form.track_title" default="">
<cfparam name="form.composer" default=0>
<cfparam name="form.bpm" default="">
<cfparam name="form.key_words" default="">
<cfparam name="form.duration" default=0>
<cfparam name="form.style" default=0>
<cfparam name="form.volume_title" default=0>
<cfparam name="form.filetype" default=0>
<cfparam name="url.updated" default=0>
<cfparam name="form.catalog_title" default=0>
<cfparam name="url.catalog_title" default=0>
<cfparam name="form.vol" default=0>
<cfparam name="url.vol" default=0>
<cfparam name="form.cat" default=0>
<cfparam name="form.music_cat" default=0>
<cfparam name="url.cat" default=0>
<cfparam name="url.music_cat" default=0>
<cfparam name="url.updated" default=0>
<cfparam name="form.instrument" default=0>
<cfparam name="form.catalog" default=0>
<cfparam name="url.catalog" default=0>

<cfif url.vol neq 0>
	<cfset form.vol = url.vol>
</cfif>
<cfif url.catalog_title neq 0>
	<cfset form.catalog_title = url.catalog_title>
</cfif>
<cfif url.catalog neq 0>
	<cfset form.catalog = url.catalog>
</cfif>
<cfif url.cat neq 0>
	<cfset form.cat = url.cat>
</cfif>
<cfif url.music_cat neq 0>
	<cfset form.music_cat = url.music_cat>
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
	<cfquery name="cat" datasource="#application.dsn#">
		SELECT     id, top_cat, sub_cat, top_level, cat_type
		FROM         dom_categories
		WHERE  cat_type = 'scene' AND inactive = 0
			ORDER BY order_num, sub_cat
	</cfquery>
	<cfquery name="music_cat" datasource="#application.dsn#">
		SELECT     id, top_cat, sub_cat, top_level, cat_type
		FROM         dom_categories
		WHERE  cat_type = 'music' AND inactive = 0
			ORDER BY order_num, sub_cat
	</cfquery>
	
	<cfquery name="catalog_title" datasource="#application.dsn#">
		SELECT id, catalog_title
		FROM   dom_catalogs
        ORDER BY catalog_title
	</cfquery>

<cfif url.sub eq 1>
	<cfquery name="search" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description, 
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, cat
		FROM dom_tracks
		WHERE 1=1
		<cfif form.track_title neq "">
			AND track_title LIKE '%#form.track_title#%'
		</cfif>	
	<!--- Find out which SCENE categories have been chosen by the user. --->
		<cfif form.cat neq 0>
		  <cfset catList = form.cat>
		  <cfset lastItem = ListLast(catList)>		
			AND 
				<cfloop list="#catList#" index="i">
					<cfif i neq lastItem>
						(categories LIKE '%,#i#,%' OR categories LIKE '#i#,%' OR categories LIKE '%,#i#') OR
					<cfelse>
						(categories LIKE '%,#i#,%' OR categories LIKE '#i#,%' OR categories LIKE '%,#i#')
					</cfif>
				</cfloop>
		</cfif>	
		<!--- Find out which MUSIC categories have been chosen by the user. --->
		<cfif form.music_cat neq 0>
			<cfset musicCatList = form.music_cat>
			<cfset lastMusicItem = ListLast(musicCatList)>
				AND 
				<cfloop list="#musicCatList#" index="i">
					<cfif i neq lastMusicItem>
						(categories LIKE '%,#i#,%' OR categories LIKE '#i#,%' OR categories LIKE '%,#i#') OR
					<cfelse>
						(categories LIKE '%,#i#,%' OR categories LIKE '#i#,%' OR categories LIKE '%,#i#')
					</cfif>
				</cfloop>	
		</cfif>	

		<cfif form.composer neq 0>
			AND composer LIKE '%#form.composer#%'		
		</cfif>
		<cfif form.bpm neq "">
			AND bpm LIKE '%#form.bpm#%'		
		</cfif>
		<cfif form.duration neq 0>
			AND duration BETWEEN '#ListGetAt(form.duration, 1)#' AND '#ListGetAt(form.duration, 2)#'	
		</cfif>
		<cfif form.key_words neq "">
			AND (description LIKE '%#form.key_words#%' OR styles LIKE '%#form.key_words#%' OR instrumentation LIKE '%#form.key_words#%' OR track_title LIKE '%#form.key_words#%')		
		</cfif>
		<cfif form.style neq 0>
			AND style LIKE '%#form.style#%'		
		</cfif>
		<cfif form.volume_title neq 0>
			AND volume_title LIKE '%#form.volume_title#%'		
		</cfif>
		<cfif form.filetype neq 0>
			AND filetype = '#form.filetype#'		
		</cfif>	
		<cfif form.vol neq 0>
			AND vol = '#form.vol#'		
		</cfif>		
		<cfif form.catalog neq 0>
			AND cat = '#trim(form.catalog)#'		
		</cfif>	
		ORDER BY track_title
	</cfquery>
</cfif>


	<table cellpadding="5" class="dkblue12">
		<tr>
			<td>

		<!--- table with all the possible search options. --->
<form method="post" name="tracks" action="index.cfm?fa=MusicDetails&sub=1">
<table bgcolor="#666666" border="1" width="600">
	<tr>
		<td>
<table bgcolor="FFFFFF" cellpadding="5" cellspacing="2" class="black14" width="100%" border="0">
	<tr>
		<td colspan="4" bgcolor="993333" align="center">
		DOM Music Library Track Search<BR /><a href="ACTIONS/ADD_musicdetails.cfm">CLICK TO ADD NEW TRACK</a>
		</td>
		
	</tr>
	<cfif url.updated eq 1>
	<tr>
		<td colspan="4" bgcolor="FFFFCC" align="center">
		<font color="green">***</font>  YOUR TRACK HAS BEEN SUCCESSFULLY UPDATED.  <font color="green">***</font>
		</td>
		
	</tr>	
	</cfif>
	<!---
	<tr>
		<td align="right" bgcolor="A6CBD2" colspan="2">
			<font size="+2">What kind of SCENE do you need music for?</font>
			<br><br>
			(Press the Ctrl key (PC) or the Apple key (MAC) to select multiple options)
		</td>
		<td colspan="2">
		<select name="cat" size="10" class="select" multiple>
			<option value=0>All</option>
			<!--- Show all the SCENE categories that can be selected. --->
			<!--- Also highlight the categories that have already been selected. --->
			
			
			<cfoutput query="cat" group="top_cat">
					<cfif form.cat eq 0>   
						<option value="#id#">#top_cat# &nbsp;</option>
					<cfelse>
						<cfif ListFind(catList, cat.id) neq 0>
							<option value="#id#" SELECTED>#top_cat# &nbsp;</option>
						<cfelse>
							<option value="#id#">#top_cat# &nbsp;</option>
						</cfif>	
					</cfif>
				<cfoutput>
						<cfif cat.top_level eq 0>
							<cfif form.cat eq 0>
								<option value="#id#">&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
							<cfelse>
								<cfif ListFind(catList, cat.id) neq 0>
									<option value="#id#" SELECTED>&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
								<cfelse>
									<option value="#id#">&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
								</cfif> 
							</cfif>
						</cfif>
				</cfoutput>
			</cfoutput> 
		</select>
		</td>
	</tr>
	<tr>
		<td align="right" bgcolor="A6CBD2" colspan="2">
			<font size="+2">What STYLE OF MUSIC are you looking for?</font>
			<br><br>
			(Press the Ctrl key (PC) or the Apple key (MAC) to select multiple options)
		</td>
		<td colspan="2">
		<select name="music_cat" size="10" class="select" multiple>
			<option value=0>All</option>
			<!--- Show all the MUSIC categories that can be selected. --->
			<!--- Also highlight the categories that have already been selected. --->
			
			
			<cfoutput query="music_cat" group="top_cat">
					<cfif form.music_cat eq 0>   
						<option value="#id#">#top_cat# &nbsp;</option>
					<cfelse>
						<cfif ListFind(musicCatList, music_cat.id) neq 0>
							<option value="#id#" SELECTED>#top_cat# &nbsp;</option>
						<cfelse>
							<option value="#id#">#top_cat# &nbsp;</option>
						</cfif>	
					</cfif>
				<cfoutput>
						<cfif music_cat.top_level eq 0>
							<cfif form.music_cat eq 0>
								<option value="#id#">&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
							<cfelse>
								<cfif ListFind(musicCatList, music_cat.id) neq 0>
									<option value="#id#" SELECTED>&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
								<cfelse>
									<option value="#id#">&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
								</cfif> 
							</cfif>
						</cfif>
				</cfoutput>
			</cfoutput> 
		</select>
		</td>
	</tr>
	--->
	<tr>
		<td bgcolor="ffffcc">
			<a id="displayText#leadQuery.id#" href="javascript:toggle#leadQuery.id#();" class="tinylink">ADVANCED SEARCH</a>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
	</tr>
<tr>

		<td align="right" nowrap>
						<b>Track Type</b>:<br>
			<div class="black10">(Vocal, Instrumental)</div>
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

<!--- 			<SELECT NAME="composer" class="select">
				<cfif form.composer neq 0>
					<cfoutput>
						<option value="#form.composer#">#form.composer#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="Dominic T. Kelly">Dominic T. Kelly</option>
				<option value="Mark Thors">Mark Thors</option>
				<option value="Jeff Gray">Jeff Gray</option>
				<option value="Tony Gray">Tony Gray</option>
				<option value="Matt Phairas">Matt Phairas</option>
				<option value="Matt Phairas">Brennan Carpenter</option>
			</SELECT>	 --->
		</td>		
		<td align="right">
			<b>Catalog Title</b>:
		</td>
		<td>
			 <select name="catalog" size="1" class="select">
				<cfif form.catalog neq 0>
						<cfquery name="catName" datasource="#application.dsn#">
							SELECT id, catalog_title
							FROM   dom_catalogs
							WHERE id = #form.catalog#
						</cfquery>
					<cfoutput>
						<option value="#form.catalog#">#catName.catalog_title#</option>
					</cfoutput>
				</cfif>
				<option value="0">All  </option>
				<cfoutput query="catalog_title">	    
					<option value="#catalog_title.id#">#catalog_title.catalog_title#</option>
				</cfoutput>
			</select> 
		</td>		

	</tr>	
	<tr>
		<td align="right">
			Track Title:
		</td>
		<td>
			<input type="text" size="40" name="track_title" value="<cfif form.track_title neq ""><cfoutput>#form.track_title#</cfoutput></cfif>">
		</td>
		<td align="right">
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
				<option value="Jeff Gray">Jeff Gray</option>
				<option value="Tony Gray">Tony Gray</option>
				<option value="Matt Phairas">Matt Phairas</option>
			</SELECT>	
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
			</SELECT></td>
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
			<cfloop index="i" from="1" to="137">
				<cfoutput>   
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput> 
			</cfloop>	
			
			</select> 
		</td>			
			
<!--- 		<td align="right">
			Key Words:
		</td>
		<td>
			<input type="text" size="30" name="key_words" value="<cfif form.key_words neq ""><cfoutput>#form.key_words#</cfoutput></cfif>">
		</td> --->
	</tr>
	<tr>
		<td align="right">
			Style:
		</td>
		<td>
			<select name="style" size="1" class="select">
				<cfif form.style neq 0>
					<cfoutput>
						<option value="#form.style#">#form.style#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="sty">	    
					<option value="#style#">#style#</option>
				</cfoutput>
			</select>
		</td>

		<td align="right" nowrap>
			Featured Instruments:
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
	</tr>
	<tr>
		<td align="right">
			BPM:
		</td>
		<td>
			<input type="text" size="3" name="bpm" value="<cfif form.bpm neq ""><cfoutput>#form.bpm#</cfoutput></cfif>">
			<div align="right"> <a href="index.cfm?fa=MusicDetails" class="tinylink">Reset Search</a></div>
		</td>
		<td align="right" nowrap>

		</td>
		<td>

			
		</td>
	</tr>
	<tr>
		<td colspan="6" bgcolor="993333" align="center" class="bodyhdr">
		<input type="hidden" name="srch" value=1>
		<input type="Submit" value="  SEARCH  ">
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</form>


<script language="javascript1.2">
function validatebng() { // validation code here
}

function buildengo(ID) {
// put single items into stager form, submit stager form
//document.stager.a_ID.value = ID;
//alert('hello');
//alert(document.stager.a_ID.value);
//alert(document.stager.a_track_title + '' + .value);
//alert(document.sourcer.track_title + ID + .value);
//document.stager.a_track_title.value = eval('document.sourcer.track_title' + ID + '.value');
//document.stager.a_filename.value = eval('document.sourcer.desc' + ID + '.value');
//document.stager.a_bpm.value = eval('document.sourcer.bpm' + ID + '.value');
//document.stager.a_duration.value = eval('document.sourcer.dura' + ID + '.value');
//document.stager.a_filesize.value = eval('document.sourcer.file' + ID + '.value');
//document.stager.a_format.value = eval('document.sourcer.format' + ID + '.value');
//document.stager.a_composer.value = eval('document.sourcer.comp' + ID + '.value');
//document.stager.a_secur.value = eval('document.sourcer.secur' + ID + '[document.sourcer.secur' + ID + '.selectedIndex].value');
// javascript validation functions here
//validatebng();

 document.stager.submit();  
}
</script>





			
		<table width="600" border="0" cellspacing="1" cellpadding="5" class="dkblue12" bgcolor="993333">
			<tr> 
				<td bgcolor="000000" align="center" class="black12" colspan="9">
					<img src="images/header_logo.jpg">				</td>
			</tr>
		<cfif url.updated eq 1>
			<tr> 
				<td align="center" colspan="5">
				***	Your track has been updated ***				
				</td>
			</tr>
		</cfif>
			
<cfif url.sub eq 1>
	<cfif search.recordcount neq 0>
			<tr>
				<td bgcolor="669999" nowrap>
					TRACK TITLE				</td>	
				<td bgcolor="669999">
					PREVIEW/DOWNLOAD				</td>
				<td width="50" bgcolor="#669999">
					EDIT	</td>	
<!--- 				<td bgcolor="669999">
					TIME				</td>	<BR />
				<td bgcolor="669999" nowrap>
					FILE SIZE				</td>
				<td bgcolor="669999">
					FORMAT				</td>	
				<td bgcolor="669999">
					TYPE
				</td>		 
				<td bgcolor="669999">
					COMPOSER				</td>--->		
			</tr>
			
			<cfoutput query="search">	
				<tr>
					<td bgcolor="F4F7D5" nowrap><strong>
					
					  </input>
					  </strong> <strong>
					   #search.track_title#</strong>				  
					 </td>
					 <td bgcolor="CCCCCC">

		
<a href="../#search.filepath##search.filename#" target="_blank">#search.filename#</a>
						
					</td>
<!--- 						<td bgcolor="FFFFFF">
						<input type="text" name="bpm1" value="#search.bpm#" >					</td>	
					<td bgcolor="FFFFFF">
						<input type="text" name="duration1" value="#search.duration#" >					</td>	
					<td bgcolor="FFFFFF" nowrap>
						<input type="text" name="filesize1" value="#search.filesize#" > mb					</td>
					<td bgcolor="FFFFFF">
						<input type="text" name="format1" value="#search.format#" >					</td>	
				<td bgcolor="FFFFFF">
						#search.filetype#
					</td>	 	
					<td bgcolor="FFFFFF" nowrap>
						<input type="text" name="composer1" value="#search.composer#" > 
					</td>--->
				  <td align="right" bgcolor="CCCCCC">
				  	<a href="ACTIONS/edit_musicdetails.cfm?&id=#ID#&vol=#form.vol#&catalog=#form.catalog#&cat=#form.cat#&music_cat=#form.music_cat#" class="bodylink">Edit</a>			  
				  </td>		
				</tr>
			</cfoutput>	
			</form>	
	<cfelse>
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="red">***</font> <b>No tracks were found for that search, please try again.</b> <font color="red">***</font>
				<br><br>				</td>
			</tr>	
	</cfif>
<cfelse>
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="green">***</font> <b>Please choose from the search criteria above, then click "Run Search".</b> <font color="green">***</font>
				<br><br>				</td>
			</tr>		
</cfif>			
		</table>
		
			</td>
		</tr>
	</table>
    <br /><br />