<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link href="styles/pab_style1.css" type="text/css" rel="stylesheet">
</head>

<cfparam name="form.srch" default=0>
<cfparam name="form.emp_name" default="">
<cfparam name="form.idx_name" default="">
<cfparam name="form.region" default=0>
<cfparam name="form.cost_center" default=0>
<cfparam name="form.idx" default=0>
<cfparam name="form.cat" default=0>
<cfparam name="form.level_1" default=0>
<cfparam name="form.level_2" default=0>
<cfparam name="form.level_3" default=0>
<cfparam name="form.quarter" default=0>
<cfparam name="form.org" default=0>
<cfparam name="form.fy" default="08">
<cfparam name="form.qtr" default=0>
<cfparam name="form.regfmt" default=0>
<cfparam name="url.xl" default=0>

<cfif IsDefined("url.srch")>
	<cfset form.srch = 1>
</cfif>
<cfif IsDefined("url.qtr")>
	<cfset form.qtr = url.qtr>
</cfif>



<!--- Get all the lists for the dropdown menus --->
		<cfquery name="reg" datasource="#DsnName#">
			SELECT DISTINCT sub_bur AS emp_region 
			FROM PAYROLL_CURRENTFY
			ORDER BY sub_bur
		</cfquery>
		
		<cfquery name="cc" datasource="#DsnName#">
			SELECT DISTINCT org AS emp_cost_center 
			FROM PAYROLL_CURRENTFY
			ORDER BY org
		</cfquery>
		<cfquery name="idx" datasource="#DsnName#">
			SELECT DISTINCT pab_idx 
			FROM pab_index
			ORDER by pab_idx
		</cfquery>
		<cfquery name="level_1" datasource="#DsnName#">
			SELECT DISTINCT level_1
			FROM pab_index
			ORDER by level_1
		</cfquery>
		<cfquery name="level_2" datasource="#DsnName#">
			SELECT DISTINCT level_2
			FROM pab_index
			ORDER by level_2
		</cfquery>
		<cfquery name="level_3" datasource="#DsnName#">
			SELECT DISTINCT level_3
			FROM pab_index
			ORDER by level_3
		</cfquery>
		<cfquery name="org" datasource="#DsnName#">
			SELECT DISTINCT p_org
			FROM pab_percents
			ORDER by p_org
		</cfquery>		
		

<body>
<form method="post" name="pab_index_data" action="pab_index_search.cfm">
<table bgcolor="666666" border="1" width="100%">
	<tr>
		<td>
<table bgcolor="FFFFFF" cellpadding="5" cellspacing="2" class="bodytext" width="100%" border="0">
	<tr>
		<td colspan="6" bgcolor="99CCCC" align="center" class="bodyhdr">
		AFPPS Data Search 
		</td>
	</tr>
	<tr>
		<td align="right">
			Employee Name:
		</td>
		<td>
			<input type="text" size="30" name="emp_name" value="<cfif form.emp_name neq ""><cfoutput>#form.emp_name#</cfoutput></cfif>">
		</td>
		<td align="right">
			Region:
		</td>
		<td>
			<select name="region" size="1" class="select">
				<cfif form.region neq 0>
					<cfoutput>
						<option value="#form.region#">#form.region#</option>
					</cfoutput>
				</cfif>
				
				<cfif IsDefined("client.pab_region") AND form.region eq 0>
					<cfoutput>
						<option value="#pab_region#">#pab_region#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="reg">				    
					<option value="#emp_region#">#emp_region#</option>
				</cfoutput>
			</select>
		</td>
		<td align="right">
			Cost Center:
		</td>
		<td>
			<select name="cost_center" size="1" class="select">
				<cfif form.cost_center neq 0>
					<cfoutput>
						<option value="#form.cost_center#">#form.cost_center#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="cc">				    
					<option value="#emp_cost_center#">#emp_cost_center#</option>
				</cfoutput>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right">
			PAB/ZBB Index: <br>
			<font color="maroon" size=1>(Hold Ctrl button for many)</font>
		</td>
		<td>
			<SELECT NAME="idx" size="6" class="select" multiple>
<!--- 				<cfif form.idx neq 0>
					<cfoutput>
						<option value="#form.idx#">#form.idx#</option>
					</cfoutput>
				</cfif> --->
				<option value=0>All</option>
				<cfoutput query="idx">	    
					<option value="#pab_idx#">#pab_idx#</option>
				</cfoutput>
			</select>
			&nbsp; or enter partial PAB Index: <input type="text" size="12" name="idx_name" value="<cfif form.idx_name neq ""><cfoutput>#form.idx_name#</cfoutput></cfif>">	
		</td>
		<td colspan="4">
			Category Code:
			<SELECT NAME="cat" class="select">
				<cfif form.cat neq 0>
					<cfoutput>
						<option value="#form.cat#">#form.cat#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<option value="E">E - Executive</option>
				<option value="L">L - Logistics</option>
				<option value="R">R - ROC/RETCO</option>
				<option value="F">F - Financial & Accounting</option>
				<option value="I">I - IRM</option>
			</SELECT>					
		</td>
	</tr>
	<tr>
		<td align="right">
			Program Category:
		</td>
		<td>
			<select name="level_1" size="1" class="select">
				<cfif form.level_1 neq 0>
					<cfoutput>
						<option value="#form.level_1#">#form.level_1#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="level_1">	    
					<option value="#level_1#">#level_1#</option>
				</cfoutput>
			</select>
		</td>
		<td align="center" colspan="3" rowspan="2">
			<table border="1" cellpadding="1" cellspacing="0" class="bodytext">
				<tr>
					<td bgcolor="99CCCC" align="center">
					<font color="navy">SPECIAL</font>
					</td>
				</tr>
				<tr>
					<td align="center">
						<font size="1">	
						<a href="pab_zbb_lob_new.cfm" style="text-decoration: none" target="main">ARC FLIGHT PLAN PRICING<br> by Category</a><br> 
						</font>
					</td>
				</tr>
				<tr>
					<td>
					<font size="1">	
						<a href="pab_index_search_regf.cfm" style="text-decoration: none" target="main">Detailed Region Format</a><br>
						<a href="pab_index_search_levels.cfm" style="text-decoration: none" target="main">Index Category Format</a>
					</font>	
					</td>
				</tr>
<!--- 				<tr>
					<td>
					<font size="1">	
						<a href="pab_index_search_L2.cfm" style="text-decoration: none" target="main">level 2 - display</a>
					</font>	
					</td>
				</tr> --->
			</table>
		</td>
		<td>&nbsp;			
			
		</td>
	</tr>
	<tr>
		<td align="right">
			Program Initiative:
		</td>
		<td>
			<select name="level_2" size="1" class="select" >
				<cfif form.level_2 neq 0>
					<cfoutput>
						<option  value="#form.level_2#">#left(form.level_2, 50)#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="level_2">	    
					<option value="#level_2#">#left(level_2, 50)#</option>
				</cfoutput>
			</select>
		</td>
<!--- 		<td align="right">&nbsp;
			
		</td>
		<td>&nbsp;
			
		</td> --->
		<td align="right">&nbsp;
			
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
	<tr>
		<td align="right">
			<!--- Level 3 Title: --->
		</td>
		<td>
			<!--- <select name="level_3" size="1" class="select">
				<cfif form.level_3 neq 0>
					<cfoutput>
						<option value="#form.level_3#">#form.level_3#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="level_3">	    
					<option value="#level_3#">#level_3#</option>
				</cfoutput>
			</select> --->
		</td>
		<td align="right" colspan="2">
			Fiscal Year:
		</td>
		<td colspan="2">

			<select name="fy" size="1" class="select">				
				<cfif form.fy neq "#fy#">
					<cfoutput>
						<option value="#form.fy#">#form.fy#</option>
					</cfoutput>
				</cfif>
				<option value="08"> 2008 </option>
				<option value="07"> 2007 </option>
				<option value="06"> 2006 </option>
				<option value="05"> 2005 </option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right">
			Org:
		</td>
		<td>
			<select name="org" size="1" class="select">
				<cfif form.org neq 0>
					<cfoutput>
						<option value="#form.org#">#form.org#</option>
					</cfoutput>
				</cfif>
				<option value=0>All</option>
				<cfoutput query="org">	    
					<option value="#p_org#">#p_org#</option>
				</cfoutput>
			</select>		
		</td>
		<td align="right" colspan="2" valign="top">
			Quarter:
		</td>
		<td colspan="2" nowrap="nowrap">
			<select name="qtr" size="1" class="select">
				<cfif form.qtr neq 0>
					<cfoutput>
						<option value="#form.qtr#">Q#form.qtr#</option>
					</cfoutput>
				</cfif> 
				<option value=0> FY to date</option>
				<option value=1> Q1 </option>
				<option value=2> Q2 </option>
				<option value='3'> Q3 </option>
				<option value=4> Q4 </option>

			</select><br>
			NOTE:<Br>
			<font size=1 color="maroon">
			(All of PP 1 will show in Q2)
				<br>
			(All of PP 14 will show in Q4)	
			</font>
		</td>
	</tr>	
	<tr>
		<td align="right">&nbsp;
					
		</td>
		<td>&nbsp;
				
		</td>	
	</tr>
	<tr>
		<td colspan="6" bgcolor="99CCCC" align="center" class="bodyhdr">
		<input type="hidden" name="srch" value=1>
		<input type="Submit" value="Run Search">
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
</form>


<!--- When the submit button is pressed, query the index data --->
<cfif form.srch eq 1>
	
	<cfif url.xl eq 0>	

		<cf_query name="pab_index" datasource="afpps">
			SELECT p.p_name, i.pab_idx, p.p_emp_id, p.p_org, p.p_ssn,
			i.level_1, i.level_2, i.level_3, 
			<cfif form.qtr eq 0>
				p.p_pay_1, p.p_qtr_1, p.p_percent_1, p.p_pay_2, p.p_qtr_2, p.p_percent_2, p.p_pay_3, p.p_qtr_3, p.p_percent_3,  p.p_pay_4, p.p_qtr_4, p.p_percent_4, p.p_fte_1, p.p_fte_2, p.p_fte_3, p.p_fte_4,				
			<cfelseif form.qtr eq 1>
				p.p_pay_1, p.p_qtr_1, p.p_percent_1, p.p_fte_1,
			<cfelseif form.qtr eq 2>
				p.p_pay_2, p.p_qtr_2, p.p_percent_2, p.p_fte_2,
			<cfelseif form.qtr eq 3>
				p.p_pay_3, p.p_qtr_3, p.p_percent_3, p.p_fte_3,
			<cfelseif form.qtr eq 4>
				p.p_pay_4, p.p_qtr_4, p.p_percent_4, p.p_fte_4,
			</cfif> 
			e.emp_region, e.emp_cost_center
				<cfif form.fy eq "08">
			 		FROM pab_index i INNER JOIN pab_percents p
				<cfelseif form.fy eq "07">
			 		FROM pab_index i INNER JOIN pab_percents_2007 p
				<cfelseif form.fy eq "06">
					FROM pab_index_2006 i INNER JOIN pab_percents_2006 p
				<cfelseif form.fy eq "05">
					FROM pab_index_FY05 i INNER JOIN pab_percents_FY05 p
				</cfif>
			 ON i.pab_idx = p.p_idx 
			LEFT OUTER JOIN employees e ON p.p_emp_id = e.emp_id
			WHERE 1 = 1
			<cfif form.emp_name neq "">AND p.p_name LIKE '%#form.emp_name#%'</cfif>
			<cfif form.idx_name neq "">AND i.pab_idx LIKE '%#form.idx_name#%'</cfif>
			<cfif form.region neq 0>AND emp_region = '#form.region#'</cfif>
			<cfif form.cost_center neq 0>AND emp_cost_center = '#form.cost_center#'</cfif>		
			<cfif form.idx neq 0>
				<cfset idx_list = replace(form.idx,",","','","ALL")>	
					AND i.pab_idx IN ('#idx_list#')
			<!--- <cfloop list="#form.idx#" index="i"><cfoutput>'#i#',</cfoutput></cfloop> --->	
			</cfif>
			<cfif form.cat neq 0>AND e.emp_category = '#form.cat#'</cfif>
			<cfif form.level_1 neq 0>AND i.level_1 = '#form.level_1#'</cfif>
			<cfif form.level_2 neq 0>AND i.level_2 = '#form.level_2#'</cfif>
			<cfif form.level_3 neq 0>AND i.level_3 = '#form.level_3#'</cfif>
			<cfif form.fy neq 0>AND p.p_fy = '#form.fy#'</cfif>
			
			AND  p.p_ssn IN (SELECT DISTINCT(ssn) FROM PAYROLL_CURRENTFY
			<cfif form.qtr eq 1>
			WHERE	pp IN (22,23,24,25,26,27)
			<cfelseif form.qtr eq 2>
			WHERE	pp IN (01,02,03,04,05,06,07)
			<cfelseif form.qtr eq 3> 
			WHERE	pp IN (08,09,10,11,12,13)
			<cfelseif form.qtr eq 4>
			WHERE	pp IN (14,15,16,17,18,19,20,21) 
			</cfif>
		
				)
			
				ORDER BY i.pab_idx, p.p_name 
		</cf_query>

		<cfset client.c_pab_index = queries.pab_index>
		
	<cfelse>
	
		<cf_query name="pab_index">
				<cfoutput>#client.c_pab_index#</cfoutput>
		</cf_query>
		<cfset f_name = "#dateformat(now(), 'mm-dd-yy')#">
		
	</cfif>
	
	
		
	<table width="90%" cellpadding="0" cellspacing="0" class="bodytext">
		<tr>
			<td>
				<font size="2" color="666666"><cfif form.fy eq "08"><b>FY 2008</b><cfelseif form.fy eq "07"><b>FY 2007</b><cfelseif form.fy eq "06"><b>FY 2006</b><cfelseif form.fy eq "05"><b>FY 2005</b></cfif></font>
			</td>
			<td align="right">			
			
			<cfoutput>
				<cfset f_name = "#dateformat(now(), 'mm-dd-yy')#">			
				<form action="#rootpath#/pab_index_search.cfm?qtr=#form.qtr#&xl=1&srch=1" method="post" enctype="application/x-www-form-urlencoded" target="new">
					<input type="submit" value="export to Excel">
				</form>
			</cfoutput>
			</td>	
		</tr>
	</table>

<cfif url.xl eq 1>
	<cfheader name="Content-Disposition" value="inline;PAB_Index_#f_name#.xls">
	<cfcontent type="application/vnd.ms-excel"> 
</cfif>

<!---<cfoutput query="pab_index">#p_percent_3#</cfoutput> --->

<!--- <cfoutput>#idx_list#</cfoutput>
<cfabort> --->	
	<table bgcolor="FFFFFF" cellpadding="2" cellspacing="2" class="bodytext" width="90%" border="1">
			<tr class="bodyblue" bgcolor="eeeeee">				
				<td>
					Employee Name
				</td>
				<td>
					Region
				</td>
				<td>
					Org.
				</td>

				<td>
					PAB/ZBB Index 	
				</td>
				<td>
					<table cellpadding="2" cellspacing="0" class="bodytext" width="100%">
						<tr>
							<td colspan="2" bgcolor="CCCCCC" border="1" width="100%" align="center">
							<cfif form.qtr eq 0>To Date FY Totals<cfelse>Totals for Q<cfoutput>#form.qtr#</cfoutput></cfif>
							</td>
						</tr>
						<tr>
							<td width="30%" align="center">
							FTE
							</td>
							<td width="70%" align="right">
							Dollars&nbsp;
							</td>
						</tr>
					</table>				
				</td>	
			</tr>
		
<!--- 		<cfset grand_total_ftes = 0>
		<cfset grand_total_pcb = 0> --->
		
		<cfset pay_grand_total = 0>
		<cfset fte_grand_total = 0>
		
				
		<cfset index_ct = 0>
		
			
		<cfoutput query="pab_index"  group="pab_idx">



			<tr> 
				<td colspan="5">
					<!--- #index_ct# ---> <font size="3"><b>#pab_index.pab_idx#</b></font> &nbsp;<font size="2">#pab_index.level_2#</font>
				</td>
			</tr>
	
		
			<cfset index_ct = index_ct + 1>
			
			

					<cfset fte = 0>
					<cfset pay = 0>
					<cfset fte_total = 0>
					<cfset pay_total = 0>
					
					<!--- If the percents are NULL set them to zero. --->
					<cfif IsDefined("pab_index.p_percent_1") AND pab_index.p_percent_1 eq "">
						<cfset p_percent_1 = 0>
					</cfif>
					<cfif IsDefined("pab_index.p_percent_2") AND pab_index.p_percent_2 eq "">
						<cfset p_percent_2 = 0>
					</cfif>
					<cfif IsDefined("pab_index.p_percent_3") AND pab_index.p_percent_3 eq "">
						<cfset p_percent_3 = 0>
					</cfif> 
					<cfif IsDefined("pab_index.p_percent_4") AND pab_index.p_percent_4 eq "">
						<cfset p_percent_4 = 0>
					</cfif>
					
					<!--- If the FTEs are NULL set them to zero. --->		
					
			<cfoutput>
			<tr>
				<td>
					<a href="#rootpath#/pab_emp_menu.cfm?emp_id=#pab_index.p_emp_id#&dir=N&name=#pab_index.p_name#" style="text-decoration: none" target="main">#p_name#</a>					
				</td>			
				<td>
					#pab_index.emp_region#
				</td>
				<td>
					#pab_index.p_org#
				</td>
				<td>					
					#pab_index.pab_idx#   				
				</td>
				<td>
				
							<cfif IsDefined("pab_index.p_fte_1") AND pab_index.p_fte_1 eq "">
								<cfset pab_index.p_fte_1 = 0>
							</cfif>
							<cfif IsDefined("pab_index.p_fte_2") AND pab_index.p_fte_2 eq "">
								<cfset pab_index.p_fte_2 = 0>
							</cfif>
							<cfif IsDefined("pab_index.p_fte_3") AND pab_index.p_fte_3 eq "">
								<cfset pab_index.p_fte_3 = 0>
							</cfif>
							<cfif IsDefined("pab_index.p_fte_4") AND pab_index.p_fte_4 eq "">
								<cfset pab_index.p_fte_4 = 0>
							</cfif>
					<table width="100%" border="1" cellpadding="2" cellspacing="0" class="bodytext">
						<tr>
							<td width="30%" align="center"> 
					
						<!--- Set FTE depending on the quarter. --->		
								<cfif form.qtr eq 0>
									<cfset fte = pab_index.p_fte_1 + pab_index.p_fte_2 + pab_index.p_fte_3 + pab_index.p_fte_4>				
								<cfelseif form.qtr eq 1>
									<cfset fte = pab_index.p_fte_1>
								<cfelseif form.qtr eq 2>
									<cfset fte = pab_index.p_fte_2>
								<cfelseif form.qtr eq 3>
									<cfset fte = pab_index.p_fte_3>
								<cfelseif form.qtr eq 4>
									<cfset fte = pab_index.p_fte_4>
								</cfif> 
									
									#NumberFormat(fte, "_.__")#
										
							</td>
							<td width="70%" align="right">
						<!--- Display finacials depending on the qtr. --->
								<cfif form.qtr eq 0>
									<cfset pay = evaluate(pab_index.p_pay_1 + pab_index.p_pay_2 + pab_index.p_pay_3 + pab_index.p_pay_4)>				
								<cfelseif form.qtr eq 1>
									<cfset pay = pab_index.p_pay_1>
								<cfelseif form.qtr eq 2>
									<cfset pay = pab_index.p_pay_2>
								<cfelseif form.qtr eq 3>
									<cfset pay = pab_index.p_pay_3>
								<cfelseif form.qtr eq 4>
									<cfset pay = pab_index.p_pay_4>
								</cfif> 
								
								
									#DollarFormat(pay)# &nbsp; 
									
									
								
							</td>
						</tr>
					</table>
					
				</td>
	
			</tr>
				<cfset fte_total = fte_total + fte>
				<cfset pay_total = pay_total + pay>
				
			</cfoutput>			
			<tr>
				<td>&nbsp;
										
				</td>
				<td>&nbsp;
										
				</td>
				<td>&nbsp;
										
				</td>
				<td align="right">
				Totals for &nbsp; <font color="maroon">#pab_index.pab_idx#</font>
				</td>
				<td>
					
				<table width="100%" border="1" cellpadding="2" cellspacing="0" class="bodytext" bgcolor="eeeeee">
						<tr>
							<td width="30%" align="center"> 
							
								<cfset fte_grand_total = fte_grand_total + fte_total>
															
								<b>#numberformat(fte_total,'___.__')#</b>
								
									
							</td>
							<td width="70%" align="right">
							
								<cfset pay_grand_total = pay_grand_total + pay_total>
								
								<b>#dollarformat(pay_total)#&nbsp; </b>
								

								
							</td>
						</tr>
					</table>
<!----------------------------------------------------------------------------------------------------------------------------------					
				<FONT COLOR="NAVY"><b>#numberformat(gftes,'___.__')#</b></font>&nbsp;&nbsp; <FONT COLOR="NAVY"><b>#dollarformat(gtot_111)#</b></font>
				-------------------------------------------------------------------------------------------------------------------->
				</td>
			</tr>

			
		</cfoutput>
		<cfoutput>
			<tr>
				<td>&nbsp;
										
				</td>
				<td>&nbsp;
										
				</td>
				<td>&nbsp;
										
				</td>
				<td align="right">
				<b>Grand Totals:</b>
				</td>
				<td>
				

				<table width="100%" border="1" cellpadding="2" cellspacing="0" class="bodytext" bgcolor="eeeeee">
						<tr>
							<td width="30%" align="center" bgcolor="F2E8CC"> 
															
								<b>#numberformat(fte_grand_total,'___.__')#</b>	
							</td>
							<td width="70%" align="right" bgcolor="F2E8CC">
								<b>#dollarformat(pay_grand_total)#&nbsp; </b>
							</td>
						</tr>
					</table>
<!----------------------------------------------------------------------------------------------------------------------------------					
				<FONT COLOR="NAVY"><b>#numberformat(gftes,'___.__')#</b></font>&nbsp;&nbsp; <FONT COLOR="NAVY"><b>#dollarformat(gtot_111)#</b></font>
				-------------------------------------------------------------------------------------------------------------------->
				</td>
			</tr>
	</cfoutput>		
	</table>

	<table class="bodytext">
		<tr>
			<td>
				<cfoutput>#pab_index.recordcount# Records</cfoutput>
			</td>
		</tr>
	</table>	

</cfif>

</body>
</html>
