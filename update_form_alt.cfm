
<cfparam name="form.cat" default="0">
<cfparam name="form.vol" default="0">
<cfparam name="form.folder" default="0">
<cfparam name="form.type" default="Instrumental">
<cfparam name="url.method" default=0>



<cfif url.method eq 0>
	
	<cfquery name="catalog_title" datasource="#application.dsn#">
		SELECT id, catalog_title
		FROM   dom_catalogs
        ORDER BY catalog_title
	</cfquery>
    
 <cfdirectory 
    directory = "#application.filepath#mp3s"
    action = "list"
    name = "mp3_folders">
    
	<cfquery name="folders" dbtype="query">
		SELECT * FROM mp3_folders
	</cfquery>
	


<!---<cfdump var="#folders#">--->

<table cellpadding="5" border="1">
	<form name="catalog" action="update_form_alt.cfm?method=1" method="post">
      <tr>
          <td>
              Catalog to Update:
          </td>
          <td>
                  <select size="1" name="cat">
                  		<option value=0>Select Catalog </option>
                      <cfoutput query="catalog_title">
                          <option value="#catalog_title.id#">#catalog_title.catalog_title#</option>
                      </cfoutput>
                  </select>
          </td>
      </tr>
      <tr>
          <td>
              Directory Folder:
          </td>
          <td>
                  <select size="1" name="folder">
                  		<option value=0>Select Folder </option>
                      <cfoutput query="folders">
                          <option value="#folders.name#">#folders.name#</option>
                      </cfoutput>
                  </select>
          </td>
      </tr>
      <tr>
          <td>
              Track Type:
          </td>
          <td>
                  <select size="1" name="type">
                  		<option value=0>Select Type </option>
                          <option value="Instrumental">Instrumental</option>
                          <option value="Vocal">Vocal</option>
                  </select>
          </td>
      </tr>
      <tr>
          <td>
              Volume Number:
          </td>
          <td>
                  <input type="text" name="vol" size="2" />
          </td>
      </tr>
      <tr>
      	<td colspan="2" align="center">
        	<input type="submit" value="Update Catalog" />
        </td>
      </tr>
    </form>
</table>

</cfif>


<cfif url.method eq 1>
	
		 <cfdirectory 
    		directory = "#application.filepath#mp3s/#form.folder#"
    		action = "list"
    		name = "mp3_folders_alt">
    	
    		<cfquery name="alt_folders" dbtype="query">
				SELECT * FROM mp3_folders_alt
			</cfquery>

<form name="catalog" action="update_form_alt.cfm?method=2" method="post">

        <!--- Select the files where new shocktronica uploads are placed --->
    <cfdirectory directory="D:\home\dommusic.com\wwwroot\mp3s\uploads"
        name="shock" 
        action="list">
        
     
  	<!---Create an audio instance of each file to be upload.--->
  	<table cellpadding="5" border="1">	
     <cfloop query="shock">
     	 <cfoutput>  
     	<cfset song_title = replace(shock.name,".mp3","")>	
  	   <tr>
          <td colspan="2">   	
			<audio id="myAudio_#song_title#" controls>
			  <source src="mp3s/uploads/#shock.name#" type="audio/mpeg">
			</audio>    
			<br>
		
			<!---Get the duration of each mp3 and populate a text input.--->
		<script>
			function myFunction_#song_title#() {
			    var x = document.getElementById("myAudio_#song_title#").duration;
			    document.getElementById("myText_#song_title#").value = x;
			}
		</script>
          </td>
      </tr> 
	   <tr>
          <td>
              #shock.name# Duration:
          </td>
          <td>
                  <input type="text" name="myText_#song_title#" id="myText_#song_title#" size="5" />
                  <a href="##" onclick="myFunction_#song_title#()">Get Duration</a>
          </td>
      </tr> 
      </cfoutput>
   </cfloop>
 
     <tr>
          <td>
              Original Track:
          </td>
          <td>
          	
<!---	    <cfquery name="cat_songs" datasource="#application.dsn#">
			SELECT id, track_title
			FROM   dom_tracks
			WHERE cat = #form.cat#
				AND (alt_id IS NULL) 
	        ORDER BY track_title 
		</cfquery>--->
                  <select size="1" name="original_track">
                  		<option value=0>Select Song Folder</option>
                      <cfoutput query="alt_folders">
                          <option value="#alt_folders.name#">#alt_folders.name#</option>
                      </cfoutput>
                  </select>
          </td>
      </tr> 		

   
   	<cfoutput>
      <tr>
      	<td colspan="2" align="center">
      				<input name="type" type="hidden" value="#form.type#">
				    <input name="cat" type="hidden" value="#form.cat#">
				    <input name="folder" type="hidden" value="#form.folder#">
				    <input name="vol" type="hidden" value="#form.vol#">
        	<input type="submit" value="Update Catalog" />
        </td>
      </tr>	
      
    </cfoutput>	
    
	</table>
	
   
    
</form>

</cfif>



<cfif url.method eq 2>


	
	
	<cfset filetype = "#form.type#">
    <cfset catalog = "#form.cat#">
    <cfset filepath = "#form.folder#">
    <cfset volume = "#form.vol#">
	<cfset original_track = "#form.original_track#">
    
        <!--- Select the files where new shocktronica uploads are placed --->
    <cfdirectory directory="D:\home\dommusic.com\wwwroot\mp3s\uploads"
        name="shock" 
        action="list">
        
	<cfquery name="cat" datasource="#application.dsn#">
		SELECT id, catalog_title
		FROM   dom_catalogs
        WHERE id = #form.cat#
	</cfquery>
    
    <cfset counter = 1>
<!---             <cfoutput>
            	Test
            </cfoutput>
         <cfabort>    --->  
         
     <cfloop query="shock">
            
            <!--- Get duration of the mp3 
            <cfset mp3File = createObject("java", "coldfusion.util.MP3File").init("D:\home\dommusic.com\wwwroot\mp3s\uploads\#shock.name#")>
            <cfset seconds = mp3File.getDuration()>--->
       
			<cfset track_name = replace(shock.name,".mp3","")>
			<cfset seconds = evaluate("form.myText_" & track_name)>
            

            
            <!--- Get size of the mp3 --->
            <cfset size_kb = shock.size / 1024>
            <cfset size_mb = size_kb / 1024>
            
            <!--- Fix up the track title --->
            <cfset song_title = replace(shock.name,".mp3","")>	
            <cfset song_title = replace(song_title, "#right(song_title,3)#" ,"")>
            <cfset song_title = replace(song_title,"_"," ","ALL")>
            
            <cfquery name="ot" datasource="#application.dsn#">
            	SELECT track_title
            	FROM dom_tracks
            	WHERE id = #original_track#
            </cfquery>
            <cfset alt_folder = replace(ot.track_title," ", "_", "all")>
<!---                <cfif not DirectoryExists(evaluate(application.filepath & 'mp3s\' & filepath & alt_folder))> 
					<cfdirectory action="create" directory="#evaluate(application.filepath & 'mp3s\' & filepath & alt_folder)#">
		        </cfif>--->
    
        <cfquery name="ins" datasource="#application.dsn#">
            INSERT INTO dom_tracks
                (cid, track_title, filename, composer, bpm,
                    instrumentation, cat, format, com_PRO, pub_PRO, publisher_name, filepath, filesize, filetype, duration, vol, volume_title, is_alt, alt_id)
            VALUES
                (1, '#trim(song_title)#', '#shock.name#', 'Dominic T. Kelly', '#replace(right(replace(shock.name,".mp3",""),3),"_","")#',
                     ' ', '#catalog#',
                    'mp3', 'ASCAP', 'ASCAP', 'Screw The Pooch', 'mp3s/#filepath#/alt_mp3s/#alt_folder#/', '#NumberFormat(size_mb,"9.9")#','#filetype#','#int(seconds / 60)#:#NumberFormat(seconds % 60,"09")#','#volume#', '#cat.catalog_title#', 1, '#original_track#')     
        </cfquery> 
        
       
    
    <cfoutput>
    #counter#). #trim(song_title)# <br>
    </cfoutput>
        <cfset counter = counter + 1>	
    </cfloop>
      
 		<cfquery name="update" datasource="#application.dsn#">
			UPDATE dom_tracks
			SET have_alt = 1
			WHERE id = #original_track#
		</cfquery>    
		
    DOOONE...

</cfif>