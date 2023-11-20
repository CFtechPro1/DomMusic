<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>EZsite.bz - Web Design Area - Beginning Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

	<link rel="stylesheet" href="styles/style1_ez.css" type="text/css">
	
<script language="JavaScript">

	Image1 = new Image();
	Image1.src = "images/section1_on.jpg";
	
	Image2 = new Image();
	Image2.src = "images/section2_on.jpg";
	
	Image3 = new Image();
	Image3.src = "images/section3_on.jpg";
	
	Image4 = new Image();
	Image4.src = "images/section4_on.jpg";
	

</script>

</head>

<cfparam name="url.cid" default=18>
<cfparam name="url.sn" default="tester1">
<cfparam name="url.logout" default=0>



<cfif url.logout eq 1>

	<cfquery name="logout" datasource="#application.datasource#" dbtype="ODBC">
			UPDATE clients SET loggedin = 0
			WHERE ID = #url.cid#
	</cfquery>
	
		<cfoutput>	
			<cflocation url='/index.cfm?fa=login_new&cid=#url.cid#&sn=#url.sn#'>
		</cfoutput>
		
</cfif>
	
	<cfquery name="login_test" datasource="#application.datasource#" dbtype="ODBC">
			SELECT loggedin,design_link 
			FROM clients 
			WHERE ID = #url.cid#
	</cfquery>

<body>
	<table cellpadding="0" cellspacing="0" class="bodytext" width="560" border="0">
		<tr>
			<td>
				<img src="images/new_admin_wda.jpg">
			</td>
			<td>
				&nbsp;&nbsp;
			</td>
			<td bgcolor="ffffff" bordercolordark="006699" bordercolorlight="0099CC" width="70%">
				<table cellpadding="5">
					<tr>
						<td>
							<font face="Arial, sans-serif">
							<b>Your new website</b>, <font color="maroon"><b><cfoutput><a href="http://www.ezsite.bz/#url.sn#" target="_blank">#url.sn#</a></cfoutput></b></font><br>
							 is divided into <b>4 sections</b>.
							<br><br>
							<b>Click on the section below</b> <br>
							that you would like <b>to design</b>.
							</font>
						</td>
					</tr>
				</table>
			</td>
			<td valign="top">
			<br>
		<cfif url.cid neq 18>
			<cfif url.logout eq 0>
				<table border="1" bgcolor="ffffff" cellpadding="5" bordercolordark="006699" bordercolorlight="0099CC">
					<tr>
						<td>
						<cfoutput><font face="Arial, sans-serif"><b><a href="dsp_new_admin_intro.cfm?cid=#url.cid#&sn=#url.sn#&logout=1">LOGOUT</a></b></cfoutput>
						</td>
					</tr>
				</table>
			</cfif>
		</cfif>
			</td>
		</tr>
	</table>
<cfoutput>	
	<table cellpadding="0" cellspacing="0"  width="560" border="0">
	<cfif url.cid eq 18>
		<tr>
			<td colspan="2">
				<table border="1" bgcolor="ffffff" cellpadding="5" bordercolordark="006699" bordercolorlight="0099CC">
					<tr>
						<td>
						<font face="Arial, sans-serif">This is only a <b>Demo website</b> so feel free to redesign it, and see how the Web Design Area will work for YOUR new website.  | <a href="http://www.ezsite.bz/index.cfm?fa=paypal&cid=1&sn=main"><b>Sign Up Today!</b></a> |
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</cfif>
		<tr>
			<td width="130" valign="bottom">
				<a href="dsp_admin_sec1.cfm?cid=#url.cid#&sn=#url.sn#" onMouseOver="Image1.src='images/section1_on.jpg';" onMouseOut="Image1.src='images/section1_off.jpg';"><img src="images/section1_off.jpg" border="0" name="Image1"></a><br>
				<a href="dsp_admin_sec3.cfm?cid=#url.cid#&sn=#url.sn#" onMouseOver="Image3.src='images/section3_on.jpg';" onMouseOut="Image3.src='images/section3_off.jpg';"><img src="images/section3_off.jpg" border="0" name="Image3"></a>
				</td><td width="430">	
				<a href="dsp_admin_sec2.cfm?cid=#url.cid#&sn=#url.sn#" onMouseOver="Image2.src='images/section2_on.jpg';" onMouseOut="Image2.src='images/section2_off.jpg';"><img src="images/section2_off.jpg" border="0" name="Image2"></a><br>	
				<a href="dsp_admin_sec4.cfm?cid=#url.cid#&sn=#url.sn#" onMouseOver="Image4.src='images/section4_on.jpg';" onMouseOut="Image4.src='images/section4_off.jpg';"><img src="images/section4_off.jpg" border="0" name="Image4"></a>
			</td>		
		</tr>
	</table>
</cfoutput>

<br>

</body>
</html>
