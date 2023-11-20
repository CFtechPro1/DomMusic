

 <cfajaximport tags="cfform"> 

	
	<cfparam name="url.sent" default=0>
    <cfparam name="url.title" default=0>
    <cfparam name="url.id" default=0>
    <cfparam name="url.bot" default=0>

<body bgcolor="#000000" topmargin="0" leftmargin="0">	
		<table width="400" height="300" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="#999999">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_licensing.jpg">
				</td>
			</tr>
 <cfoutput>           
	<cfform action="act_license_info.cfm?title=#url.title#" method="post" onSubmit="return Valid(this)">  
    		
	<cfif url.sent eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				<font color="red">***</font> Your License Information request has been sent. You will be contacted promptly. <font color="red">***</font>
			</td>
		 </tr>	
	</cfif>	
    
	<cfif url.bot eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				<font color="red">***</font> You are a bad robot! <font color="red">***</font>
			</td>
		 </tr>	
	</cfif>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				* Name: 
			</td>
			<td>
				<cfinput type="text" size="30" name="name" value="" maxlength="150" required="yes">  
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				Subject: 
			</td>
			<td>
				Licensing Information for:<br>
                 "#url.title#"
                
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				* Your Email: 
			</td>
			<td>
				<cfinput type="text" size="20" name="given_email" value="" maxlength="150" required="yes" validate="email">
			</td>
		 </tr>	  
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				Phone: 
			</td>
			<td>
				<cfinput type="text" size="20" name="phone" value="" maxlength="150" required="no" validate="telephone">
			</td>
		 </tr>	
	
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				* Message: 
			</td>	
			<td>
				<textarea name="description" cols="32" rows="4"></textarea>
			</td>
		 </tr>	 
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<cfinput type="Submit" name="submit" value="   Send   ">  
			</td>
		 </tr>	 
         <br /><br />
		 <p class="fstyle"><input name="botcatcher" type="text" value=""/>  </p> 
	 </cfform>
</cfoutput>
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="120">
				Dominic Kelly
			</td>
			<td class="white12" >
				 Cell: (310)266-5922
			</td>
		 </tr>	
	</table>
  
<style type="text/css">
   .fstyle
   {
       display: none;
    }
</style> 
</body>