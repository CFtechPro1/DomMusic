
<link href="styles/styleSort.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
document.addEventListener('play', function(e){
    var audios = document.getElementsByTagName('audio');
    for(var i = 0, len = audios.length; i < len;i++){
        if(audios[i] != e.target){
            audios[i].pause();
        }
    }
}, true);

</script>

<script language="javascript">
  $(document).ready(function()
	  {
		  $("#myTable").tablesorter();
	  }
  );
</script>

<cfparam name="url.name" default=0>

<cfset client.name = "CBS Guest">


		<!--- Sorting vars --->
        <cfparam name="url.sort" default=0>
        <cfparam name="url.asc_1" default=0>
        <cfparam name="url.sw" default=-1>
        <cfparam name="url.cat" default=0>
        <cfparam name="url.vol" default=0>
        <cfparam name="url.filetype" default=0>
        <cfparam name="url.bpm" default=0>
        <cfparam name="url.tempo" default=0>
		<cfparam name="url.aired" default=0>
        <cfparam name="url.dur" default=0>
        <cfparam name="variables.durTemp2" default=0>

<cfset url.adv = 1>

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
<cfparam name="form.catalog_title" default="">
<cfparam name="url.acoustic" default=0>
<cfparam name="form.cat" default=0>
<cfparam name="form.music_cat" default=0>
<cfparam name="form.aired" default=0>
<cfparam name="url.adv" default=0>
<cfparam name="variables.query_name" default="Search">
<cfparam name="search.recordcount" default=0>



        <!--- paginate vars --->
        <cfif url.cat neq 0 AND url.cat neq "">
        	<cfset form.catalog_title = url.cat>
        </cfif>
        <cfif url.vol neq 0 AND url.vol neq "">
        	<cfset form.vol = url.vol>
        </cfif>
        <cfif url.filetype neq 0 AND url.filetype neq "">
        	<cfset form.filetype = url.filetype>
        </cfif>
        <cfif url.tempo neq 0 AND url.tempo neq "">
        	<cfset form.tempo = url.tempo>
        </cfif>
        <cfif url.bpm neq 0 AND url.bpm neq "">
        	<cfset form.bpm = url.bpm>
        </cfif>
        <cfif url.aired neq 0 AND url.aired neq "">
        	<cfset form.aired = url.aired>
        </cfif>
        <cfif url.dur neq 0 AND url.dur neq "">
            <cfset duration1 = replace(url.dur,"_",",")>
            <cfset form.duration = replace(duration1,"-",":")>
        </cfif>
        <cfparam name="url.page" default="1" />
        <cfset variables.page_number = max(val(url.page), 1) />
        <cfset variables.items_per_page = 50 />

        <cfparam name="url.page2" default="1" />
        <cfset variables.page_number2 = max(val(url.page2), 1) />
        <cfset variables.items_per_page2 = 50 />


	<cfquery name="vol" datasource="#application.dsn#">
		SELECT volume_title, volume_desc
		FROM dom_volumes
	</cfquery>

	<cfquery name="catalog_title" datasource="#application.dsn#">
		SELECT DISTINCT volume_title
		FROM   dom_tracks
        ORDER BY volume_title
	</cfquery>

 <cfif url.sub eq 1>

	<cfquery name="search" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description,
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, vol, instrumentation, aired, episode
		FROM dom_tracks
		WHERE 1=1
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
		<cfif form.aired neq 0>
			<cfif form.aired eq "Yes">
				AND aired = 'Yes'
			<cfelseif form.aired eq "No">
				AND aired IS NULL
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
<!---             <cfif url.sort eq 0>		 --->
                ORDER BY track_title
<!---             <cfelseif url.sort eq 1>
            	ORDER BY track_title <cfif url.asc_1 eq 0>ASC <cfset url.sw = 1><cfelse>DESC <cfset url.sw = 0></cfif>
            <cfelseif url.sort eq 2>
            	ORDER BY bpm <cfif url.asc_1 eq 0>ASC <cfset url.sw = 1><cfelse>DESC <cfset url.sw = 0></cfif>,track_title
            <cfelseif url.sort eq 3>
            	ORDER BY aired <cfif url.asc_1 eq 0>DESC <cfset url.sw = 1><cfelse>ASC <cfset url.sw = 0></cfif>,track_title
            <cfelseif url.sort eq 4>
            	ORDER BY duration <cfif url.asc_1 eq 0>DESC <cfset url.sw = 1><cfelse>ASC <cfset url.sw = 0></cfif>,track_title
            </cfif> --->
	</cfquery>

    	<!--- pagination query var --->
	<cfset variables.query_name = "search">

</cfif>





		<!--- table with all the possible search options. --->
	<cfoutput>
<form method="post" name="tracks" action="index.cfm?fa=ncis_private&sub=1&adv=1">
	</cfoutput>
<table bgcolor="000000" border="0" width="100%" border="0" width="700">
	<tr>
		<td>
<table cellpadding="0" cellspacing="0" bgcolor="000000" class="black12"  border="0" width="687">
	<tr>
		<td colspan="2" background="images/top_corners.jpg" width="687" height="14" align="center">

		</td>
	</tr>
	<tr>
		<td align="center" background="images/welcome.jpg" width="687" height="23">
		<cfoutput><font color="FFFFFF">Welcome: <cfif client.sid neq 0>#client.s_name#<cfelse>#client.name#</cfif></cfoutput></font>
		</td>
	</tr>


	<tr>
	<cfoutput>
		<td colspan="2" align="right" background="images/advanced.jpg" width="687" height="29">
		<a href="index.cfm?fa=ncis_private" class="tinylink2">Reset Search</a>&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</td>
	</cfoutput>

	</tr>
	<tr>
		<td background="images/ui_background.jpg">
<cfif url.adv eq 1>
<table background="images/ui_background.jpg" cellpadding="5" cellspacing="2" class="black12" width="687" border="0">
	<tr>

		<td align="right">
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
			</SELECT>
		</td>
		<td align="right">
			<b>Catalog Title</b>:
		</td>
		<td>
			 <select name="catalog_title" size="1" class="select">
				<cfif form.catalog_title neq "">
					<cfoutput>
					  <cfif form.catalog_title eq "Electronic Rock">
                          <option value="#form.catalog_title#">Gothtronica</option>
                      <cfelse>
                      	<cfif form.catalog_title eq 0>
                      	  	<option value="0">All  </option>
                        <cfelse>
                        	<option value="#form.catalog_title#">#form.catalog_title#</option>
                        </cfif>
                      </cfif>
					</cfoutput>
				</cfif>
                <cfif form.catalog_title eq "">
                	  <cfquery name="cat" datasource="#application.dsn#">
                      		SELECT COUNT(id) as count
                            FROM dom_tracks
                            WHERE volume_title = 'Electronic Rock'
                      </cfquery>
                	<option value="Electronic Rock">Gothtronica <cfoutput><span class="black10">(#trim(Numberformat(cat.count,'9,999'))#)</span></cfoutput></option>
                </cfif>
				<option value="0">All  </option>
				<cfoutput query="catalog_title">
                   <cfif volume_title neq "">
                      <cfquery name="cat" datasource="#application.dsn#">
                      		SELECT COUNT(id) as count
                            FROM dom_tracks
                            WHERE volume_title = '#trim(volume_title)#'
                      </cfquery>
                    <option value="#trim(volume_title)#">
                    	<cfif catalog_title.volume_title eq "Electronic Rock">
                        	Gothtronica <span class="black10">(#trim(Numberformat(cat.count,'9,999'))#)</span>
                        <cfelse>
                        	#volume_title# <span class="black10">(#trim(Numberformat(cat.count,'9,999'))#)</span>
                        </cfif>
                    </option>
				   </cfif>
				</cfoutput>
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
		</td>
		<td>

             <select name="vol" size="1" class="select">
				<cfif form.vol neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
			<cfloop index="i" from="1" to="111">
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
			(example: 120)
		</td>
		<td>
			<input type="text" size="3" name="bpm" value="<cfif form.bpm neq ""><cfoutput>#form.bpm#</cfoutput></cfif>">
		</td>
		<td align="right" nowrap>
			Previously Aired:
		</td>
		<td nowrap="nowrap">
			<select name="aired" size="1" class="select">
				<cfif form.aired neq 0>
					<cfoutput>
						<option value="#form.aired#">#Replace(form.aired,"t","")#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="Yes"> Yes </option>
				<option value="No"> No </option>
			</select>
		</td>

	</tr>
</table>
</cfif>
		</td>
	</tr>
	<tr>
		<td colspan="2" background="images/submit2.jpg" align="center" width="687" height="48">
		<input type="hidden" name="srch" value=1>
		<input type="Submit" value="   RUN SEARCH   ">
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

             <!--- Pagination section....  --->
                     <cfif form.duration neq 0>
                    	<cfset variables.durTemp1 = replace(form.duration,",","_")>
                        <cfset variables.durTemp2 = replace(durTemp1,":","-")>
                    </cfif>
	<cfset variables.last_page = ceiling(evaluate(variables.query_name & '.recordCount') / variables.items_per_page) />
	<cfif variables.last_page gt 1>
              <tr>
                <td bgcolor="D6D5D5" align="center" class="black12" colspan="9">

                        <cfoutput>
						<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">
						<tr><td align="center">
						<table cellspacing="0" cellpadding="0" border="0">
						<tr class="page_navigation">
							<td class="previous_page"><cfif variables.page_number gt 1><a href="index.cfm?fa=ncis_private&adv=1&sub=1&cat=#form.catalog_title#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&aired=#form.aired#&dur=#variables.durTemp2#&sort=#url.sort#&page=#variables.page_number - 1#" class="bodylink">Previous</a>&nbsp;</cfif></td>
							<td class="page_range" colspan="3">
								<cfset variables.start_page = 1 />
								<cfset variables.page_numbers_to_show = 9 - variables.start_page />
								<cfset variables.end_page = variables.last_page />
								<cfloop index="i" from="#variables.start_page#" to="#variables.end_page#">
									<a href="index.cfm?fa=ncis_private&adv=1&sub=1&cat=#form.catalog_title#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&aired=#form.aired#&dur=#variables.durTemp2#&sort=#url.sort#&page=#i#" class="bodylink"><cfif i eq variables.page_number><strong>#i#</strong><cfelse>#i#</cfif></a>
								</cfloop>
							</td>
							<td class="next_page"><cfif variables.page_number lt variables.last_page>&nbsp;<a href="index.cfm?fa=ncis_private&adv=1&sub=1&cat=#form.catalog_title#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&aired=#form.aired#&dur=#variables.durTemp2#&sort=#url.sort#&page=#variables.page_number + 1#" class="bodylink">Next</a></cfif></td>
						</tr>
						</table>
						</td></tr></table>
                        </cfoutput>

                 </td>
             </tr>
   		</cfif>
      <!---End Pagination section....  --->


<cfif url.sub eq 1>
	 <cfif search.recordcount neq 0>
 <table width="100%" id="myTable" class="tablesorter">
     <thead>
			<tr>

              <th>
                 track title

				</th>
				<td class="trNoSort">
					<strong>preview</strong>
				</th>
				<td class="trNoSort">
					<strong>download</strong>
				</th>
				<th>

                        bpm

				</th>
				<th>

   					time

				</td>
<!--- 				<td bgcolor="333333" nowrap class="white14">
					Size
				</td> --->
				<th>
					vol.
				</th>
				<th>
				  aired

				</td>
				<th>
					Ep.#
				</th>
			</tr>
   </thead>

    <tbody>
            <cfloop query="search" startrow="#((variables.page_number - 1) * variables.items_per_page) + 1#" endrow="#((variables.page_number - 1) * variables.items_per_page) + variables.items_per_page#">

				<cfoutput>
				<tr>
					<td bgcolor="F4F7D5" class="black14" nowrap align="left" valign="middle"> #search.track_title#
                    <br />
                    &nbsp;&nbsp;<span style="font-size:9px">#search.filetype#</span>
                   <!---  <table cellpadding="2" cellspacing="0"><tr><td class="black12" valign="top" width="20">
						#search.CurrentRow#) </td><td class="black14" valign="top" nowrap="nowrap"> #search.track_title#</td> </tr>
                       <tr><td></td><td valign="top"><span style="font-size:9px">#search.filetype#</span></td>
                       </tr></table> --->
					</td>
					<td bgcolor="CCCCCC" nowrap>


		<cfset variables.filename = search.filepath & search.filename>
		<audio id="#search.id#" preload="none" controls play="document.getElementByTagName('audio').stop()">
			<source src="../#variables.filename#">
		</audio>

					</td>
				<td bgcolor="FFFFFF" align="center" valign="middle">
						<a href="forcedownload.cfm?filename=#search.filename#" target="_new">download</a>
					</td>
					<td bgcolor="FFFFFF" align="center" valign="middle">
						#search.bpm#
					</td>
					<td bgcolor="FFFFFF" align="center" valign="middle">
						#search.duration#
					</td>
<!--- 					<td bgcolor="FFFFFF" nowrap>
						#search.filesize# mb
					</td> --->
					<td bgcolor="FFFFFF" nowrap align="center" valign="middle">
						#search.vol#
					</td>
					<td bgcolor="FFFFFF" nowrap align="center" valign="middle">
						#search.aired#
					</td>
					<td bgcolor="FFFFFF" nowrap align="center" valign="middle">
						#search.episode#
					</td>
				</tr>
			</cfoutput>

          </cfloop>

          </tbody>
			<tr>
				<td bgcolor="000000" align="center" class="black12" colspan="9">&nbsp;

				</td>
			</tr>
	<cfelse>
			<tr>
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="red">***</font> <b>No tracks were found for that search, please try again.</b><font color="red">***</font>
					<br><br>
					<font color="red">***</font> Click on <b>"Reset Search"</b> to begin a new search. <font color="red">***</font>
				<br><br>
				</td>
			</tr>
	</cfif>
<cfelse>
			<tr>
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="9">
				<br><br>
					<font color="green">***</font> <b>Please choose from the search criteria above, then click "RUN SEARCH".</b> <font color="green">***</font>
				<br><br>
				</td>
			</tr>
</cfif>
		</table>

			</td>
		</tr>
	</table>