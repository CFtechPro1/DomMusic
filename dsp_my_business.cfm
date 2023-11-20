<head>
<link href="styles/style1.css" rel="stylesheet" type="text/css">
<script
    language="JavaScript"
    src="js/sliderStatic.js">
</script>
<link
    href="styles/default.css"
    rel="stylesheet"
    type="text/css">
</head>


<cfparam name="url.element" default=0>
<cfparam name="url.rated" default=0>
<cfparam name="url.sent" default=0>
<cfparam name="mailList" default=0>
<cfparam name="url.nosub" default=0>



<cfquery name="myRating" datasource="#application.dsn#">
	SELECT id, brand_rating, sub_brand_rating, generic_descriptor_rating, benefit_rating, attributes_rating, 
				tag_line_rating, rtb_rating, key_graphic_rating, impact_rating, graphic_presentation_rating
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<!--- Set variables for displaying the pixels --->
<cfset variables.brand_rating_px = myRating.brand_rating * 2.25>
<cfset variables.sub_brand_rating_px = myRating.sub_brand_rating * 2.25>
<cfset variables.generic_descriptor_rating_px = myRating.generic_descriptor_rating * 2.25>
<cfset variables.benefit_rating_px = myRating.benefit_rating * 2.25>
<cfset variables.attributes_rating_px = myRating.attributes_rating * 2.25>
<cfset variables.tag_line_rating_px = myRating.tag_line_rating * 2.25>
<cfset variables.rtb_rating_px = myRating.rtb_rating * 2.25>
<cfset variables.key_graphic_rating_px = myRating.key_graphic_rating * 2.25>
<cfset variables.impact_rating_px = myRating.impact_rating * 2.25>
<cfset variables.graphic_presentation_rating_px = myRating.graphic_presentation_rating * 2.25>


<cfquery name="mail" datasource="#application.dsn#">
	SELECT id, rid, business_element
	FROM t_mail
	WHERE rid = #client.cid#
	AND new_r = 1 
</cfquery>

<cfquery name="elements" datasource="#application.dsn#">
	SELECT b.id, b.cid, b.brand, b.sub_brand, b.generic_descriptor, b.benefit, b.attributes, b.tag_line, b.rtb, 
				b.key_graphic, b.impact, b.graphic_presentation, b.brand_rating, b.sub_brand_rating, b.generic_descriptor_rating, 
				b.benefit_rating, b.attributes_rating, b.tag_line_rating, b.rtb_rating, 
				b.key_graphic_rating, b.impact_rating, b.graphic_presentation_rating, b.no_brand, b.no_sub_brand
	FROM t_business b INNER JOIN
		t_clients c ON c.id = b.cid
	WHERE b.cid = #client.cid#
		AND c.email = '#client.email#'
</cfquery>

	<!--- Queries for seeing if CONNECTICS work has been done, and show the green light --->
		<cfquery name="rating" datasource="#application.dsn#">
			SELECT id, cid, brand, sub_brand, generic_descriptor, benefit, attributes, tag_line, rtb, 
						key_graphic, impact, graphic_presentation
			FROM t_business
			WHERE cid = #client.cid#
		</cfquery>	

	<!--- Queries for seeing if bake off work has been done, and show the green light --->
	
<cfinclude template="functions/Bakeoff_Feedback.cfm">
<cfinclude template="functions/Consumer_Feedback.cfm">

	<!--- Tallies how many people have responded for Rate, Rank and Choose exercises, so we can make the light green or red. --->


		
<cfquery name="rating" datasource="#application.dsn#">
	SELECT id, cid, brand, sub_brand, generic_descriptor, benefit, attributes, tag_line, rtb, 
				key_graphic, impact, graphic_presentation
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_rating" datasource="#application.dsn#">
	SELECT id, cid, brand_rating, sub_brand_rating, generic_descriptor_rating, benefit_rating, attributes_rating, tag_line_rating, rtb_rating, 
				key_graphic_rating, impact_rating, graphic_presentation_rating
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfquery name="o_r" datasource="#application.dsn#">
	SELECT SUM(brand_rating + sub_brand_rating + generic_descriptor_rating + benefit_rating + attributes_rating + tag_line_rating + rtb_rating + 
				key_graphic_rating + impact_rating + graphic_presentation_rating) AS oSum
	FROM t_business
	WHERE cid = #client.cid#
</cfquery>

<cfif mail.recordcount neq 0>
	<cfset mailList = ValueList(mail.business_element)>
</cfif>

	<cfset oList = "">

 <cfoutput query="o_rating">
	<cfif o_rating.brand_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.brand_rating)>
	</cfif>
	<cfif o_rating.sub_brand_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.sub_brand_rating)>
	</cfif>
	<cfif o_rating.generic_descriptor_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.generic_descriptor_rating)>
	</cfif>
	<cfif o_rating.benefit_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.benefit_rating)>
	</cfif>	
	<cfif o_rating.attributes_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.attributes_rating)>
	</cfif>	
	<cfif o_rating.tag_line_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.tag_line_rating)>
	</cfif>	
	<cfif o_rating.rtb_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.rtb_rating)>
	</cfif>	
	<cfif o_rating.key_graphic_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.key_graphic_rating)>
	</cfif>	
	<cfif o_rating.impact_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.impact_rating)>
	</cfif>	
	<cfif o_rating.graphic_presentation_rating neq 0>
		<cfset oList = ListAppend(oList,o_rating.graphic_presentation_rating)>
	</cfif>
</cfoutput> 


<cfset variables.divi = ListLen(oList)>
<cfif variables.divi neq 0>
	<cfset variables.o_rating_final = o_r.oSum / variables.divi>
	<cfset variables.o_rating_final_px = variables.o_rating_final * 2.25>
<cfelse>
	<cfset variables.o_rating_final = 0>
	<cfset variables.o_rating_final_px = 0>
</cfif>

<body>

<!--- Holder table begins --->
<table>
	<tr>
		<td>
		
<br>

<table border="0" class="white14" bgcolor="000000">


	<tr>
		<td height="20" nowrap colspan="2">
		<cfif client.cid neq 0>
			<cfoutput>
			Welcome: <br>
			<strong>#client.name#</strong>
			</cfoutput>		
		</cfif>
		</td>
		<td colspan="2">
			 <img src="images/my_business.jpg">
		</td>
		<td colspan="5" align="center">
			 <li><a href="index.cfm?fa=view_sp" class="bodylink"><b>VIEW SELLING PROPOSITION</b></a></li>
		</td>
	</tr>	
	<tr>
		<td height="20" nowrap colspan="2" bgcolor="336699" align="center">
			BUSINESS ELEMENTS
		</td>
		<td bgcolor="336699" align="center" nowrap>
			EXERCISES
		</td>
		<td bgcolor="336699" align="center" nowrap>
			 &nbsp; &nbsp; RESULTS &nbsp; &nbsp;
		</td>
		<td colspan="5" align="center" bgcolor="336699" nowrap>
			CONNECTICS RATINGS
		</td>
	</tr>	
	<tr>
		<td colspan="9">
		<hr>		
		</td>
	</tr>

<cfif url.element neq 0>
	<tr>
		<td  height="20" colspan="8">
			<font color="yellow">*** Your <cfoutput>#ucase(url.element)# has been submitted.</cfoutput> ***</font>
		</td>
	</tr>
</cfif>
<cfif url.sent neq 0>
	<tr>
		<td  height="20" colspan="8">
			<font color="yellow">*** Your <cfoutput>#ucase(url.be)# feedback requests have been sent.</cfoutput> ***</font>
		</td>
	</tr>
</cfif>
<cfif url.rated neq 0>
	<tr>
		<td  height="20" colspan="8">
			<font color="yellow">*** Thank you for taking part in the Connectics process.<br>
										Your ratings have been submitted. ***</font>
		</td>
	</tr>
</cfif>
<cfif url.nosub neq 0>
	<tr>
		<td  height="20" colspan="8">
			<font color="yellow">*** SUB_BRAND has been removed from your selling proposition. ***</font>
		</td>
	</tr>
</cfif>

<cfloop list="#ElementList#" index="i">

	<cfoutput>
	
		<!---Output Elements--->
			<tr>
				<td valign="bottom">
					<cfif mail.recordcount neq 0>
						<cfif mailList CONTAINS "#i#">
							<a href="index.cfm?fa=mail" class="bodylink"><img src="images/new_mail.jpg" border="0"></a>
						</cfif>
					</cfif>
				</td>
				<td width="200" class="header16" nowrap="nowrap" valign="middle">
					<a href="index.cfm?fa=elements&be=#i#&bg=1" class="bodylink">
						<cfif i eq "rtb">
							ENDORSEMENT
						<cfelse>
							#replace(ucase(i),"_"," ")#
						</cfif>
					</a>
				</td>
				<td nowrap rowspan="2" colspan="2">
					
					<table class="white14" cellpadding="5" cellspacing="1" bgcolor="336699">
					  <cfif i neq "impact" AND i neq "graphic_presentation">
					  		<!--- If the be is not IMPACT or Graphic Presentation show all the bakeoff exercise links --->
						<tr>
							<td nowrap valign="top" bgcolor="000000">
								<a href="index.cfm?fa=bakeoff_#i#&be=#i#&bg=1" class="bodylink">Bake Off Exercise</a>
							</td>
							<td nowrap bgcolor="000000">
							
							<a href="index.cfm?fa=bake_off&be=#i#" class="bodylink">Bake Off Results</a> 
								<br>
							
							<cfif i eq "brand" OR i eq "sub_brand">	
									<cfif i eq "brand">	
										<cfif b_four.recordcount gte 5>
											<img src="images/green_light.jpg">
										<cfelse>
											<img src="images/red_light.jpg">
										</cfif>	
									<cfelseif i eq "sub_brand">	
										<cfif sb_four.recordcount gte 5>
											<img src="images/green_light.jpg">
										<cfelse>
											<img src="images/red_light.jpg">
										</cfif>	
									</cfif>
										<a href="index.cfm?fa=bake_off&be=#i#&four=1" class="bodylink">Phase 2</a>
										<br>							
								<cfif evaluate('rate_' & i & '.recordcount') gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&rate_results=1" class="bodylink">Phase 3</a>
								<br>
								<cfif evaluate('rank_' & i & '.recordcount') gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&rank_results=1" class="bodylink">Phase 4</a>	
								
							<cfelseif i eq "generic_descriptor">	
							
								<cfif chosen_generic_descriptor.recordcount gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&chosen_results=1" class="bodylink">Phase 2</a>
								
							<cfelseif i eq "attributes">	
							
								<cfif chosen_attributes.recordcount gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&chosen_results=1" class="bodylink">Phase 2</a>
								<br>
								<cfif rank_attributes.recordcount gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&rank_results=1" class="bodylink">Phase 3</a>	
																							
							<cfelseif i eq "tag_line" OR i eq "rtb" OR i eq "key_graphic">	
								
								<cfif evaluate('rate_' & i & '.recordcount') gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&rate_results=1" class="bodylink">Phase 2</a>	
								
							<cfelseif i eq "benefit">	
									
								<cfif benefit_count.recordcount gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif>	
								<a href="index.cfm?fa=bake_off&be=#i#&benefit_results=1" class="bodylink">Phase 1</a>									
																		 			
							</cfif>
						</td>
					</tr>
				</cfif>
						<tr>
							<td nowrap valign="top" bgcolor="000000">
								<cfif i eq "impact" OR i eq "graphic_presentation">
									<a href="index.cfm?fa=#i#&be=#i#&bg=1" class="bodylink">Connectics Exercise</a>
								<cfelse>
									<a href="index.cfm?fa=#i#&be=#i#" class="bodylink">Connectics Exercise</a>
								</cfif>
							</td>
							<td nowrap bgcolor="000000">
							<cfif i neq "impact">
								<cfif evaluate('consumer_' & i & '.recordcount') gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif> 
							<cfelse>
								<cfif impact_count.recordcount gte 5>
									<img src="images/green_light.jpg">
								<cfelse>
									<img src="images/red_light.jpg">
								</cfif> 							
							</cfif>	
							
							<cfif i eq "impact">
								<a href="index.cfm?fa=#i#_results&bg=1" class="bodylink">Connectics Results</a> 
							<cfelse>
								<a href="index.cfm?fa=archives&be=#i#" class="bodylink">Connectics Results</a> 
							</cfif>
					
							
								<!--- <cfif i eq "graphic_presentation">	
							
									<cfif rate_graphic_presentation.recordcount gte 5>
										<img src="images/green_light.jpg">
									<cfelse>
										<img src="images/red_light.jpg">
									</cfif>	
									<a href="index.cfm?fa=bake_off&be=#i#&rate_results=1" class="bodylink">Phase 1</a>		
									<br>	
									<cfif eye_count.recordcount gte 5>
										<img src="images/green_light.jpg">
									<cfelse>
										<img src="images/red_light.jpg">
									</cfif>	
									<a href="index.cfm?fa=bake_off&be=#i#&eye_results=1" class="bodylink">Phase 2</a>	
									
								</cfif> --->
							</td>
						</tr>
					</table>
					
				</td>
				<td width="250" colspan="4">
				
				<table width="250" height="30" class="white14" border="0" background="images/spectrum.jpg">
					<tr>
						<td>
						<div class="carpe_horizontal_slider_track">
						<div class="carpe_slider_slit">&nbsp;</div>
						<div class="carpe_slider" 
							id="your_slider_id"
							orientation="horizontal"
							distance="233"
							display="your_display1"
							style="left: <cfoutput>#evaluate('variables.' & i & '_rating_px')#</cfoutput>px;">&nbsp;</div>
						</div>
						</td>
					</tr>
				</table>
				
				</td>
			<td>
				<div class="carpe_slider_display_holder">
			<input class="carpe_slider_display"
				id="your_display1"
				name="your_var_name"
				type="text" 
				from="0" 
				to="100" 
				valuecount="101" 
				value="<cfoutput>#evaluate('myRating.' & i & '_rating')#</cfoutput>" 
				typelock="off" /></div>	
			</td>
			</tr>
			<tr class="white10">
				<td>
					
				</td>
				<td>
					
				</td>
				<td valign="top">
					Unremarkable 
				</td>		
				<td valign="top">
					Average
				</td>
				<td align="center" valign="top">
					Strongly <br>
					Preferred 
				</td>
				<td valign="top">
					Remarkable
				</td>
				<td>&nbsp;
					
				</td>
			</tr>
			<tr>
				<td colspan="9">
					<hr>
				</td>
			</tr>	
			
	</cfoutput>
	
</cfloop>	

	
</table>		


		</td>
		
<!--- Second column in big table begins	 --->	
	<td valign="top" class="white14">
	

	
	
	</td>		
	</tr>
</table>
</body>