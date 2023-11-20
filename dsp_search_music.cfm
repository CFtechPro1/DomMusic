  <!---MAIN Vars--->

<cfparam name="url.cbs" default="0">
<cfparam name="url.sub" default=0>

<cfparam name="form.track_title" default="">
<cfparam name="url.track_title" default="">
<cfparam name="form.composer" default=0>
<cfparam name="form.bpm" default="">
<cfparam name="form.key_words" default="">
<cfparam name="form.duration" default=0>
<cfparam name="form.style" default=0>
<cfparam name="form.volume_title" default=0>
<cfparam name="form.filetype" default=0>
<cfparam name="form.vol" default=0>
<cfparam name="form.vol2" default=0>
<cfparam name="url.vol2" default=0>
<cfparam name="form.vol3" default=0>
<cfparam name="form.vol4" default=0>
<cfparam name="form.vol5" default=0>
<cfparam name="form.instrument" default=0>
<cfparam name="form.tempo" default=0>
<cfparam name="form.catalog_title" default=0>
<cfparam name="url.acoustic" default=0>
<cfparam name="form.cat" default=0>
<cfparam name="url.ct" default=0>
<cfparam name="form.music_cat" default=0>
<cfparam name="form.aired" default=0>
<cfparam name="url.adv" default=0>
<cfparam name="variables.query_name" default="Search">
<cfparam name="search.recordcount" default=0>
<cfparam name="url.tid" default=0>
<cfparam name="url.vol" default=0>
<cfparam name="url.cat" default=0>

<cfif url.ct neq 0>
	<cfset form.cat = url.ct>
</cfif>
<cfif url.vol2 neq 0>
	<cfset form.vol2 = url.vol2>
</cfif>
<cfif url.vol neq 0>
	<cfset form.vol = url.vol>
</cfif>
<cfif url.track_title neq "">
	<cfset form.track_title = url.track_title>
</cfif>

<!---
<style type="text/css">
    #cDuration,#tDuration,#tBPM,#cBPM,#cTempo,#tTempo,#cVol,#tVol{
        display: none;
    		}
</style>--->

<link href="styles/styleSort.css" rel="stylesheet" type="text/css">

<!---<script type="text/javascript" src="js/yahoo-webplayer-beta.js"></script>

<script type="text/javascript" src="js/sm2/script/soundmanager2.js"></script>--->

<!---<link href="js/dist/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/lib/jquery.min.js"></script>
<script type="text/javascript" src="js/dist/jplayer/jquery.jplayer.min.js"></script>--->

<!---<cfoutput>
	#form.vol#, #form.url#
	
</cfoutput>
<cfabort>--->



		<!---Toggle Search Panel Javascript--->
		<script>
		function myFunction() {
		  var x = document.getElementById("SearchPanel");
		  if (x.style.display === "none") {
		    x.style.display = "block";
		    $("#SearchToggle").text("Hide Music Search Panel");
		  } else {
		    x.style.display = "none";
		    $("#SearchToggle").text("Show Music Search Panel");
		  }
		}
		</script>
		
		<!---If the Search Panel is not visable then Show the Show Search Panel button.--->
		<script>
			$( document ).ready(function() {
		
			  var x = document.getElementById("SearchPanel");
			  var y = document.getElementById("SearchToggle");
			  if (x.style.display === "none") {
			    y.style.display = "block";
			  } else {
			    y.style.display = "none";
			  }
		  
			});
		</script>

		<cfif url.cat neq 0>
			<!---If a volume has been chosen from somewhere other than the Search page, Hide search panel and show Toggle button. --->
			<script>
				$( document ).ready(function() {
			
				  var x = document.getElementById("SearchPanel");
				  var y = document.getElementById("SearchToggle");
					x.style.display = "none";
				    y.style.display = "block";

				});
			</script>			
		</cfif>


<script language="javascript">
  $(document).ready(function()
	  {
		  $("#myTable").tablesorter();
	  }
  );
</script>

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


<script type="text/javascript">

    $(document).ready(function(){

        $("#catalog").change(function(){

            $( "#catalog option:selected").each(function(){

                if($(this).attr("value")==6){
                    $("#cFiletype").show();
					$("#tFiletype").show();
                    $("#cDuration").show();
					$("#tDuration").show();
                    $("#cVol").show();
					$("#tVol").show();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();     
                    $("#cVol5").hide();  
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").show();
					$("#tTempo").show();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume2").val(<cfoutput>#form.vol#</cfoutput>);
					$("#fVolume2").val(0);
					$("#fVolume3").val(0);
					$("#fVolume4").val(0);					
			  $("#fVolume5").val(0);		
					$("#fDuration").val(0);
					$("#fTempo").val(<cfoutput>#form.tempo#</cfoutput>);
					$("#fBPM").val("<cfoutput>#form.bpm#</cfoutput>");

				}
                else if($(this).attr("value")==4){
                    $("#cFiletype").show();
					$("#tFiletype").show();
                    $("#cDuration").show();
					$("#tDuration").show();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();             
                    $("#cVol5").hide();              
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume").val(0);
					$("#fVolume2").val(<cfoutput>#form.vol2#</cfoutput>);
					$("#fTempo").val(0);
					$("#fFiletype").val(<cfoutput>#form.filetype#</cfoutput>);
				}

                else if($(this).attr("value")==14){
                    $("#cFiletype").show();
					$("#tFiletype").show();
                    $("#cDuration").show();
					$("#tDuration").show();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide(); 
																				$("#cVol5").hide();                        
					$("#tVol").hide();
					$("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").show();
					$("#tTempo").show();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume").val(0);
					$("#fVolume2").val(<cfoutput>#form.vol2#</cfoutput>);
					$("#fFiletype").val(<cfoutput>#form.filetype#</cfoutput>);
				}

                else if($(this).attr("value")==1){
                    $("#cFiletype").show();
					$("#tFiletype").show();
                    $("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();   
																				$("#cVol5").hide();                      
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fVolume3").val(0);
					$("#fVolume4").val(0);				
					$("#fVolume5").val(0);				
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
                else if($(this).attr("value")==2){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();     
																				$("#cVol5").hide();                    
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fVolume3").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
				
              else if($(this).attr("value")==3){
                    $("#cFiletype").show();
					$("#tFiletype").show();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").show();
                    $("#cVol4").hide();      
																				$("#cVol5").hide();                   
					$("#tVol").show();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").show();
					$("#tTempo").show();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume").val(0);
					$("#fVolume3").val(<cfoutput>#form.vol3#</cfoutput>);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(<cfoutput>#form.tempo#</cfoutput>);
					$("#fBPM").val("<cfoutput>#form.bpm#</cfoutput>");
							
				}

<!---For Hawaiian Traditional --->
              else if($(this).attr("value")==42){
                    $("#cFiletype").show();
					$("#tFiletype").show();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();  
																				$("#cVol5").show();                       
					$("#tVol").show();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").show();
					$("#tTempo").show();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume").val(0);
					$("#fVolume5").val(<cfoutput>#form.vol5#</cfoutput>);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(<cfoutput>#form.tempo#</cfoutput>);
					$("#fBPM").val("<cfoutput>#form.bpm#</cfoutput>");
							
				}

              else if($(this).attr("value")==20){
                    $("#cFiletype").show();
					$("#tFiletype").show();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").show();
                    $("#cVol4").hide();  
																				$("#cVol5").hide();   
					$("#tVol").show();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fVolume3").val(<cfoutput>#form.vol3#</cfoutput>);
					$("#fFiletype").val(<cfoutput>#form.filetype#</cfoutput>);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");		
							
				}
				
                else if($(this).attr("value")==5){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();      
																				$("#cVol5").hide();                   
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
                else if($(this).attr("value")==7){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();       
																				$("#cVol5").hide();                  
					$("#tVol").hide();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
              else if($(this).attr("value")==8){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();     
																				$("#cVol5").hide();                    
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
              else if($(this).attr("value")==9){
                    $("#cFiletype").show();
					$("#tFiletype").show();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").show();      
																				$("#cVol5").hide();                 
					$("#tVol").show();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").show();
					$("#tTempo").show();
					$("#tBPM").show();
					$("#cBPM").show();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fVolume3").val(0);
					$("#fVolume4").val(<cfoutput>#form.vol4#</cfoutput>);			
					$("#fVolume5").val(0);		
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(<cfoutput>#form.tempo#</cfoutput>);
					$("#fBPM").val("<cfoutput>#form.bpm#</cfoutput>");

				}
              else if($(this).attr("value")==11){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();      
																				$("#cVol5").hide();                   
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
              else if($(this).attr("value")==15){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();            
																				$("#cVol5").hide();             
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
              else if($(this).attr("value")==16){
                    $("#cFiletype").hide();
					$("#tFiletype").hide();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();   
																				$("#cVol5").hide();                      
					$("#tVol").hide();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");

				}
				
              else if($(this).attr("value")==17){
                    $("#cFiletype").show();
					$("#tFiletype").show();
					$("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").show();
                    $("#cVol3").hide();
                    $("#cVol4").hide();      
																				$("#cVol5").hide();                   
					$("#tVol").show();
                    $("#cAired").show();
					$("#tAired").show();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(<cfoutput>#form.vol2#</cfoutput>);
					$("#fVolume3").val(0);	
									
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");		
							
				}
				
				else {
                    $("#cDuration").hide();
					$("#tDuration").hide();
                    $("#cVol").hide();
                    $("#cVol2").hide();
                    $("#cVol3").hide();
                    $("#cVol4").hide();      
																				$("#cVol5").hide();                   
					$("#tVol").hide();
                    $("#cAired").hide();
					$("#tAired").hide();
                    $("#cTempo").hide();
					$("#tTempo").hide();
					$("#tBPM").hide();
					$("#cBPM").hide();
					$("#fVolume").val(0);
					$("#fVolume2").val(0);
					$("#fVolume3").val(0);
					$("#fAired").val(0);
					$("#fFiletype").val(0);
					$("#fDuration").val(0);
					$("#fTempo").val(0);
					$("#fBPM").val("");
					$("#fTitle").val("<cfoutput>#form.track_title#</cfoutput>");
                }

            });

        }).change();

    });

</script>

<script language="javascript">
	$(document).ready(function() {
		$("#catalog").change(function(){
			$("#fVolume").val(0);
			$("#fAired").val(0);
			$("#fFiletype").val(0);
			$("#fDuration").val(0);
			$("#fTempo").val(0);
			$("#fBPM").val("");
			$("#fTitle").val("<cfoutput>#form.track_title#</cfoutput>");
		});
	});
</script>


<cfparam name="url.name" default=0>
<cfif url.name eq "guest">
	<cfset client.name = "DOM Music Guest">
</cfif>
<cfif url.cbs eq 1>
	<cfset client.name = "CBS Guest">
</cfif>


<cfif client.name eq 0 AND client.s_name eq 0>
    <cfset client.name = "DOM Music Guest">
</cfif>







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

        <!--- paginate vars --->
        <cfif url.cat neq 0 AND url.cat neq "">
        	<cfset form.cat = url.cat>
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
        <cfparam name="url.page" default="1" />
        <cfset variables.page_number = max(val(url.page), 1) />
        <cfset variables.items_per_page = 100 />

        <cfparam name="url.page2" default="1" />
        <cfset variables.page_number2 = max(val(url.page2), 1) />
        <cfset variables.items_per_page2 = 100 />


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
		WHERE inactive = 0
        ORDER BY catalog_title
	</cfquery>

<cfif url.sub eq 1>

	<cfquery name="search" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description,
				styles, instrumentation, cat, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, volume_title, vol, instrumentation, aired, episode, have_alt, order_num
		FROM dom_tracks
		WHERE 1=1
		<cfif form.cat neq 0>
			AND cat = '#trim(form.cat)#'
			<cfif form.cat eq 44> <!---Reggae Vocals--->
				AND (placed IS NULL)
			<cfelseif form.cat eq 43> <!---Hawaiian Percussion--->
				AND (placed IS NULL)
			<cfelseif form.cat eq 42> <!---Hawaiian Traditional--->
				AND (placed IS NULL)
			<cfelseif form.cat eq 12> <!---Jazz Lounge Piano Combo--->
				AND (placed IS NULL)
			</cfif>
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
				AND bpm BETWEEN 105 AND 115
			<cfelseif form.tempo eq "faster">
				AND bpm BETWEEN 115 AND 150
			</cfif>
		</cfif>
			<cfif form.aired eq "Yes">
				AND aired = 'Yes'
			<cfelseif form.aired eq "Not">
				AND aired IS NULL
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
		<cfif form.filetype neq 0>
			AND filetype = '#form.filetype#'
		</cfif>
		<cfif form.vol neq 0>
			AND vol = '#trim(form.vol)#'
		</cfif>
		<cfif form.vol2 neq 0>
			AND vol = '#trim(form.vol2)#'
		</cfif>
		<cfif form.vol3 neq 0>
			AND vol = '#trim(form.vol3)#'
		</cfif>
		<cfif form.vol4 neq 0>
			AND vol = '#trim(form.vol4)#'
		</cfif>
		<cfif form.vol5 neq 0>
			AND vol = '#trim(form.vol5)#'
		</cfif>
		<cfif form.instrument neq 0>
			AND instrumentation LIKE '%#trim(form.instrument)#%'
		</cfif>
			<!---for alternate versions--->
		<cfif url.tid neq 0>
			AND alt_id = #url.tid#
		<cfelse>
			AND is_alt IS NULL
		</cfif>
			
             ORDER BY order_num, track_title
	</cfquery>

    	<!--- pagination query var --->
	<cfset variables.query_name = "search">

</cfif>








<!---Show search panel when not on the Alternate Versions pages.--->

<cfif url.tid eq 0>
	
	
	
	
	
	
	
	
<cfif url.cbs eq 0>
	<table bgcolor="FFFFFF" border="0" width="100%" border="0" width="700" class="dkblue12">
		<tr>
			<td align="left" bgcolor="FFFFFF" class="dkblue12" nowrap>
<!---				<h1>Find Score & Source Production Music</h1> --->
				<button id="SearchToggle" onclick="myFunction()">Show Music Search Panel</button>
			</td>
		</tr>
	</table>
</cfif>

		<!--- table with all the possible search options. --->
	<cfoutput>
<form method="post" name="tracks" action="index.cfm?fa=search_music&adv=#url.adv#&cbs=#url.cbs#&sub=1">
	</cfoutput>



<!---Beginning of Search Panel--->	



	
	

<table bgcolor="FFFFFF" border="0" width="100%" border="0" width="700">
	<tr>
		<td>
			
			
<div id="SearchPanel">			
			
<table cellpadding="0" cellspacing="0" bgcolor="FFFFFF" class="black12 search-area"  border="0" >
	<tr>
		<td <!---background="ximages/ui_background.jpg"--->>
<cfif url.adv eq 1>
	
	
	
<table <!---background="ximages/ui_background.jpg"--->  cellpadding="5" cellspacing="0" width="687" border="0">
	<tr>
		<td class="searchfield" sytle="vertical-align:middle;">
			Catalog Title:
		</td>
		<td>
			 <select name="cat" id="catalog" size="1" class="select" onchange="return resetParams()">
				<cfif form.cat neq 0>
                      <cfquery name="catChosen" datasource="#application.dsn#">
                      		SELECT COUNT(id) as count
                            FROM dom_tracks
                            WHERE cat = '#trim(form.cat)#'
                            	AND is_alt IS NULL
                      </cfquery>
					<cfoutput>
                        <option value="#form.cat#">
		                      <cfquery name="catCurrent" datasource="#application.dsn#">
		                      		SELECT catalog_title 
		                            FROM dom_catalogs
		                            WHERE id = #trim(form.cat)#
		                      </cfquery>
                        	<cfif url.cbs eq 0>
                       			#catCurrent.catalog_title#
                            <cfelse>
                            	<cfif catCurrent.catalog_title eq "Electronic Rock">
                                	Gothtronica
                                <cfelse>
                                	#catCurrent.catalog_title#
                                </cfif>
                            </cfif> <span class="black10">(#trim(Numberformat(catChosen.count,'9,999'))#)</span>
                        </option>
					</cfoutput>
				</cfif>
				<option value="0">All  </option>
				<cfoutput query="catalog_title">
                      <cfquery name="catCount" datasource="#application.dsn#">
                      		SELECT  COUNT(id) AS count
							FROM      dom_tracks
							WHERE   (cat = #catalog_title.id#)
							AND is_alt IS NULL
                      </cfquery>
                    <option value="#trim(catalog_title.id)#">
                         	<cfif url.cbs eq 0>
                       			#catalog_title.catalog_title#
                            <cfelse>
                            	<cfif catalog_title.catalog_title eq "Electronic Rock">
                                	Gothtronica
                                <cfelse>
                                	#catalog_title.catalog_title#
                                </cfif>
                            </cfif>     <span class="black10">(#trim(Numberformat(catCount.count,'9,999'))#)</span></option>
				</cfoutput>
			</select>
		</td>

		<td class="searchfield" sytle="vertical-align:middle;">
        		<div id="tFiletype">
						Vocal or Instrumental:
                </div>
		</td>
		<td>
        <div id="cFiletype">
			<SELECT NAME="filetype" class="select" id="fFiletype">
				<cfif form.filetype neq 0>
					<cfoutput>
						<option value="#form.filetype#" selected>#form.filetype#</option>
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
           </div>
		</td>
	</tr>
	<tr>
		<td class="searchfield" sytle="vertical-align:middle;">

           <div id="tVol">
            	Volume No.:
           </div>

        </td>
		<td nowrap="nowrap">
        <div id="cVol" style="float:left">
			<select name="vol" size="1" class="select" id="fVolume">
				<cfif form.vol neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
		
			<cfloop index="i" from="2" to="137">
				<cfoutput>
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput>
			</cfloop>

			</select>
         </div>
         
         <div id="cVol2" style="float:left">
			<select name="vol2" size="1" class="select" id="fVolume2">
				<cfif form.vol2 neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
		
			<cfloop index="i" from="1" to="49">
				<cfoutput>
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput>
			</cfloop>

			</select>
         </div>
         
         <div id="cVol3" style="float:left">
			<select name="vol3" size="1" class="select" id="fVolume3">
				<cfif form.vol3 neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
		
			<cfloop index="i" from="1" to="10">
				<cfoutput>
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput>
			</cfloop>

			</select>
         </div>
         
         <div id="cVol4" style="float:left">
			<select name="vol4" size="1" class="select" id="fVolume4">
				<cfif form.vol4 neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
		
			<cfloop index="i" from="1" to="2">
				<cfoutput>
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput>
			</cfloop>

			</select>
         </div>

         <div id="cVol5" style="float:left">
			<select name="vol5" size="1" class="select" id="fVolume5">
				<cfif form.vol5 neq 0>
					<cfoutput>
						<option value="#form.vol#">&nbsp; #form.vol# &nbsp;</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
		
			<cfloop index="i" from="1" to="2">
				<cfoutput>
					<option value="#i#">&nbsp; #i# &nbsp;</option>
				</cfoutput>
			</cfloop>

			</select>
         </div>


         <cfif url.cbs eq 1>
             <div id="tAired" style="float:left;padding-left:15px;padding-top:3px;">
                  <strong>Previously Aired:</strong><br />
             </div>
              <div id="cAired" style="float:left;padding-left:10px;">
              <select name="aired" size="1" class="select" id="fAired">
                  <cfif form.aired neq 0>
                      <cfoutput>
                          <option value="#form.aired#">#Replace(form.aired,"t","")#</option>
                      </cfoutput>
                  </cfif>
                  <option value=0>All</option>
                  <option value="Yes"> Yes </option>
                  <option value="Not"> No </option>
              </select>
              </div>
         </cfif>
		</td>
		<td class="mob-align-left" align="right" valign="middle">
			<div class="white14">Title Search:</div>
		</td>
		<td>
        	<input type="text" size="25" name="track_title" id="fTitle" value="">
		</td>
	</tr>
	<tr>
		<td class="searchfield" sytle="vertical-align:middle;">
			<div id="tTempo">
            	Speed (tempo):
            </div>
		</td>
		<td nowrap="nowrap" class="searchfield">
			<div id="cTempo">
            <div class="tempo">
              <select name="tempo" size="1" class="select" id="fTempo">
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
              </div>
              <div class="bpm">bpm: <input type="text" id="fBPM" size="2" maxlength="3" name="bpm" value="<cfif form.bpm neq ""><cfoutput>#form.bpm#</cfoutput></cfif>"></div>
           </div>



		</td>
		<td class="searchfield" sytle="vertical-align:middle;">
			<div id="tDuration">
            	Duration:
           	</div>
		</td>
		<td>
			<div id="cDuration">
              <SELECT NAME="duration" class="select" id="fDuration">
                  <cfif form.duration neq 0>
                      <cfoutput>
                          <option value="#form.duration#">#form.duration#</option>
                      </cfoutput>
                  </cfif>
                  <option value=0>All</option>
<!---                   <option value="0,0:10"> :10 and under</option>
                  <option value="0,0:30"> :30 and under</option>
                  <option value="0,1:00"> 1:00 and under</option> --->
                  <option value="1:00,1:30"> 1:00 - 1:30</option>
                  <option value="1:30,2:00"> 1:30 - 2:00</option>
                  <option value="2:00,2:30"> 2:00 - 2:30</option>
                  <option value="2:30,3:00"> 2:30 - 3:00</option>
                  <option value="3:00,9:00"> 3:00 and over</option>
              </SELECT>
           	</div>
			<!--- <input type="text" size="30" name="key_words" value="<cfif form.key_words neq ""><cfoutput>#form.key_words#</cfoutput></cfif>"> --->

             <!--- <br />
             <div align="center"> <a href="index.cfm?fa=search_music&adv=1" class="tinylink2">Reset Search</a></div> --->


			</td>
		</tr>
	</table>







</cfif>
		</td>
	</tr>
	<tr>
		<td colspan="2" background="ximages/submit2.jpg" class="btn-td">
		<input type="hidden" name="srch" value=1>
		<input type="Submit" value="   SEARCH PRODUCTION MUSIC   "> | <cfoutput><a href="index.cfm?fa=search_music&adv=#url.adv#&cbs=#url.cbs#" class="tinylink2">Reset Search</a></cfoutput>
		</td>
	</tr>
</table>


</div>

<!---End of Search Panel--->

</form>








</cfif> <!---End tid conditional.--->




		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="black12">
			
			
			
<!---			<tr>
				<td bgcolor="FFFFFF" align="center" class="black12" colspan="9">
					<a name="header"><img class="vdo-reel-img" src="images/header_logo.jpg"></a>
				</td>
			</tr>--->
			
			
			
			
			
            <!--- Pagination section....  --->
	<cfset variables.last_page = ceiling(evaluate(variables.query_name & '.recordCount') / variables.items_per_page) />
	<cfif variables.last_page gt 1>
              <tr>
                <td bgcolor="000" align="center" class="black12" colspan="9">

                        <cfoutput>
						<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">
						<tr><td align="center">
						<table cellspacing="0" cellpadding="0" border="0">
						<tr class="page_navigation">
							<td class="previous_page"><cfif variables.page_number gt 1><a href="index.cfm?fa=search_music&adv=1&sub=1&cbs=#url.cbs#&cat=#form.cat#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&sort=#url.sort#&page=#variables.page_number - 1#" class="bodylink">Previous</a>&nbsp;</cfif></td>
							<td class="page_range" colspan="3">
								<cfset variables.start_page = 1 />
								<cfset variables.page_numbers_to_show = 9 - variables.start_page />
								<cfset variables.end_page = variables.last_page />
								<cfloop index="i" from="#variables.start_page#" to="#variables.end_page#">
									<a href="index.cfm?fa=search_music&adv=1&sub=1&cbs=#url.cbs#&cat=#form.cat#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&sort=#url.sort#&page=#i#&track_title=#form.track_title#" class="bodylink"><cfif i eq variables.page_number><strong>#i#</strong><cfelse>#i#</cfif></a>
								</cfloop>
							</td>
							<td class="next_page"><cfif variables.page_number lt variables.last_page>&nbsp;<a href="index.cfm?fa=search_music&adv=1&sub=1&cbs=#url.cbs#&cat=#form.cat#&vol=#form.vol#&filetype=#form.filetype#&bpm=#form.bpm#&tempo=#form.tempo#&sort=#url.sort#&page=#variables.page_number + 1#&track_title=#form.track_title#" class="bodylink">Next</a></cfif></td>
						</tr>
						</table>
						</td></tr></table>
                        </cfoutput>

                 </td>
             </tr>
   		</cfif>
      <!---End Pagination section....  --->
      </table>



<cfif url.sub eq 1>


	<cfif search.recordcount neq 0>
	<cfif url.tid neq 0>
    	<div class="back-area"><input class="back-btn" type="button" value="Back" onclick="history.back(-1)" /></div>
    </cfif>
    <div class="table-scroll">
  <table width="100%" id="myTable" class="tablesorter">
     <thead>
			<tr>

              <th width="200">
                 <div class="title">Track Title</div>
				</th>
				<th class="xtrNoSort">
					<strong>Preview</strong>
				</th>
				<th class="xtrNoSort">
					<strong>Download</strong>
				</th>
				<th>

                        Bpm

				</th>
				<th>

   					Time

				</th>
           <cfif url.cbs eq 0>
				<th>
					Vol.
				</th>
           <cfelse>
				<th>
					Vol.
				</th>
				<th>
				  Aired

				</th>
				<th>
					Ep.#
				</th>
            </cfif>
			</tr>
   </thead>

    <tbody>
            <cfloop query="search" startrow="#((variables.page_number - 1) * variables.items_per_page) + 1#" endrow="#((variables.page_number - 1) * variables.items_per_page) + variables.items_per_page#">

				<cfoutput>
				<tr>
					<td class="tracktitle" align="left" valign="middle"> #search.track_title#
                    <br />
                    <table cellspacing="0" cellpadding="2">
                    	<tr>
                        	<td>&nbsp;

                            </td>
                            <td class="searchdesc">
                            	
                    			#search.filetype#
									<cfif search.description neq "">
                                    	- #search.description#
                                    </cfif>
                                
								<cfif search.have_alt eq 1>
                                    <br>
                                    &nbsp; <a href="index.cfm?fa=search_music&adv=#url.adv#&cbs=#url.cbs#&sub=1&tid=#search.id#" class="body12link">Alternate Versions</a>
                                </cfif>
                            </td>
                        </tr>
                    </table>
					</td>
					<td class="searchtd" nowrap>


		<cfset variables.filename = search.filepath & search.filename>
		
		<cfset variables.wavfilename = replace(search.filepath,"mp3s","wavs") & replace(search.filename,"mp3","wav")>
		
		
		
<!---<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){

	$("##jquery_jplayer_#search.id#").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				title: "#search.track_title#",
				mp3: "../#variables.filename#"
			});
		},
		play: function() { // To avoid multiple jPlayers playing together.
			$(this).jPlayer("pauseOthers");
		},
		swfPath: "/js",
		supplied: "mp3",
		wmode: "window",
		globalVolume: true,
		useStateClassSkin: true,
		autoBlur: false,
		smoothPlayBar: true,
		keyEnabled: true
	});

});
//]]>
</script>--->


<!---		 <a href="../#variables.filename#" class="body12link" id='#search.id#'>#search.track_title#</a>  --->



<audio controls preload="none" style="width: 275px; height: 35px;"  id="#search.id#" onclick="stopAll(#search.id#)">
   <source src="../#variables.filename#" type="audio/mpeg">
 Your browser does not support the audio element.
</audio> 		

		
<!--- 	<cfmediaplayer source="../#variables.filename#" quality="low" autoplay="false" controlbar="true" width=300 height=35 hidetitle="true">	 --->
	
					</td>
				<td class="searchtd" align="center" valign="middle" nowrap>
						<a class="download-btn" href="forcedownload.cfm?filename=#search.filename#" target="_new">Download</a>
                        <cfif url.cbs eq 0>
                        <br />
                         <a href="index.cfm?fa=license_info&title=#search.track_title#" class="body12link">license info</a>
<!---                           <cfif search.cat eq 3 OR search.cat eq 17 OR search.cat eq 22>
                         	 |<a class="body12link" href="forcedownload.cfm?filename=#search.filename#&wav=1" target="_new">.wav</a>
                           </cfif>--->
                        </cfif>
					</td>
					<td class="searchtd" align="center" valign="middle">
						#search.bpm#
					</td>
					<td class="searchtd" align="center" valign="middle">

						#search.duration#
 						
					</td>
                <cfif url.cbs eq 0>
<!--- 					<td bgcolor="FFFFFF" nowrap>
						#search.filesize# mb
					</td>--->
					<td class="searchtd" nowrap class="white10" align="center">
						#search.volume_title#  
							<br>
						Vol. #search.vol#
					</td>
                <cfelse>
					<td class="searchtd" nowrap align="center" valign="middle">
						#search.vol#
					</td>
					<td class="white14" nowrap align="center" valign="middle">
						#search.aired#
					</td>
					<td class="white14" nowrap align="center" valign="middle">
						#search.episode#
					</td>
                </cfif>
				</tr>
			</cfoutput>

          </cfloop>

          </tbody>
			
	<cfelse>
			<tr>
				<td align="center" class="searchtd" colspan="9">
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
				<td align="center" class="white14" colspan="9">
				<br><br>
					<font color="4c96d7">***</font> <b>Please choose from the search criteria above, then click "RUN SEARCH".</b> <font color="4c96d7">***</font>
				<br><br>
                <cfif url.cbs eq 0>
				A production music license must be obtained from DOM Enterprises International, Inc. for use of any music from the DOM production music catalogs in any media (television, film, online, smartphone, other) productions.
				All music and lyrics protected by federal copyright laws.
				<br><br>
				Find Production Music Library Tracks in many production music styles.<br>
				
				<cfoutput query="catalog_title">
					<a href="index.cfm?fa=search_music&cat=#catalog_title.id#&adv=1&sub=1" class="bodylink">#catalog_title.catalog_title#</a> | 
                </cfoutput>
                <br><br>
                </cfif>
				</td>
			</tr>
</cfif>
		</table>
        </div>

			</td>
		</tr>
	</table>

