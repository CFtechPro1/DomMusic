<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script type="text/javascript" src="http://static.cloudmonster.im/js/mediaPlayer.js"></script>
</head>

<cfparam name="url.vol" default=0>
<cfparam name="url.catalog_title" default=0>
<cfparam name="url.catalog" default=0>
<cfparam name="url.cat" default=0>
<cfparam name="url.music_cat" default=0>

<body bgcolor="993333">
<cfquery name="search" datasource="#application.dsn#">
		SELECT id, cid, track_title, filename, composer, bpm, duration, description, categories,
				styles, instrumentation, volume_title, format, com_PRO, pub_PRO, publisher_name,
				filepath, filesize, filetype, vol, order_num
		FROM dom_tracks
		WHERE id= '#url.id#'
			
</cfquery>

<cfset catList = search.categories>

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

	<cfoutput>
<form name="sourcer" action="act_musicdetail.cfm?vol=#url.vol#&catalog=#url.catalog#&cat=#url.cat#&music_cat=#url.music_cat#" method="POST" enctype="multipart/form-data">
	</cfoutput>	
				<tr>
				    <td>
					<cfoutput query="search">	
					<p>
				      <INPUT type="hidden" name="id" value="#search.id#">
				    </p>
				      <p align="center">MUSIC EDITOR <br /> <a href="act_musicdetail.cfm?&add=2">CLICK TO DELETE TRACK</a></p></cfoutput>

				      <center><table width="750" border="1" bgcolor="669999">
	<tr>
		<td align="right" bgcolor="A6CBD2" colspan="2">
			<font size="+2">What kind of SCENE is this music for?</font>
			<br><br>
			(Press the Ctrl key (PC) or the Apple key (MAC) to select multiple options)
		</td>
		<td colspan="2">
			<select name="cat" size="12" class="select" multiple>
				<option value=0>All</option>
			<!--- Show all the categories that can be selected. --->
			<!--- Also highlight the categories that have already been selected. --->
			<cfoutput query="cat" group="top_cat">
					<cfif search.categories eq "">   
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
							<cfif search.categories eq "">
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
			<font size="+2">What STYLE OF MUSIC is this?</font>
			<br><br>
			(Press the Ctrl key (PC) or the Apple key (MAC) to select multiple options)
		</td>
		<td colspan="2">
			<select name="music_cat" size="12" class="select" multiple>
				<option value=0>All</option>
			<!--- Show all the categories that can be selected. --->
			<!--- Also highlight the categories that have already been selected. --->
			<cfoutput query="music_cat" group="top_cat">
					<cfif search.categories eq "">   
						<option value="#id#">#top_cat# &nbsp;</option>
					<cfelse>
						<cfif ListFind(catList, music_cat.id) neq 0>
							<option value="#id#" SELECTED>#top_cat# &nbsp;</option>
						<cfelse>
							<option value="#id#">#top_cat# &nbsp;</option>
						</cfif>	
					</cfif>
				<cfoutput>
						<cfif music_cat.top_level eq 0>
							<cfif search.categories eq "">
								<option value="#id#">&nbsp; - &nbsp; #sub_cat# &nbsp;</option>
							<cfelse>
								<cfif ListFind(catList, music_cat.id) neq 0>
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
	<cfoutput query="search">	
                         <tr>
                          <td width="250"><strong>TRACK TITLE: </strong></td>
                          <td><strong>
                            <input  name="track_title1" value="#search.track_title#" readonly="yes" size="60">
                          </strong></td>
                        </tr>
                        <tr>
                          <td><strong>FILENAME:</strong></td>
                          <td><!--- <a href="../../#search.filepath##search.filename#">#search.filename#</a> --->
                          
                          		<cfset variables.filename = search.filepath & search.filename>
                                <audio id="#search.id#" preload="none" controls play="document.getElementByTagName('audio').stop()">
                                    <source src="../#variables.filename#">
                                </audio>
                          
                          </td>
                        </tr>
                        <tr>
                          <td><strong>BPM:</strong></td>
                          <td><input type="text" name="bpm1" value="#search.bpm#" width="90" readonly="yes"></td>
                        </tr>

                        <tr>
                          <td><strong>DURATION:</strong></td>
                          <td><input type="text" name="duration1" value="#search.duration#" width="110" readonly="yes"></td>
                        </tr>
                        <tr>
                          <td><strong>FILESIZE;</strong></td>
                          <td><input type="text" name="filesize1" value="#search.filesize#" width="100" readonly="yes"> 
                          MB </td>
                        </tr>
                        <tr>
                          <td><strong>FORMAT:</strong></td>
                          <td><input type="text" name="format1" value="#search.format#" width="100" readonly="yes"></td>
                        </tr>
                        <tr>
                          <td><strong>COMPOSER:</strong></td>
                          <td><input type="text" name="composer1" value="#search.composer#" width="115" readonly="yes"></td>
                        </tr>                       
                        <tr>
                          <td><strong>ORDER NUMBER:</strong></td>
                          <td><input type="text" name="order_num1" value="#search.order_num#" width="2"></td>
                        </tr>
						 <tr>
                          <td><strong>INSTRUMENTATION:</strong></td>
                          <td><textarea  style="WIDTH: 450px; HEIGHT: 50px" name="instrumentation1"  value="#search.instrumentation#"  rows=7 cols=53>#search.instrumentation#</textarea></td>
                        </tr>
						 <tr>
                          <td><strong>DESCRIPTION:</strong></td>
                          <td><textarea  style="WIDTH: 450px; HEIGHT: 50px" name="DESCRIPTION1"  value="#search.DESCRIPTION#"  rows=7 cols=53>#search.DESCRIPTION#</textarea></td>
                        </tr>
                      </table>		
				      </center>		 
					  <input type="hidden" name="vol" value="#search.vol#">
					       
				      <p><center> <input type="submit" name="send" value=" save change " /> </center>
</p></td>
					
				</tr>
				
			</cfoutput>	
</form>	
</body>
</html>
