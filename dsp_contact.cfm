<script Language="JavaScript"><!--
function Valid(theForm)
{

  if (theForm.name.value == "")
  {
    alert("Please enter a value for the \" Name\" field.");
    theForm.name.focus();
    return (false);
  }

  if (theForm.given_email.value == "")
  {
    alert("Please enter a value for the \" Email\" field.");
    theForm.given_email.focus();
    return (false);
  }

  if (theForm.description.value == "")
  {
    alert("Please enter a value for the \"Message\" field.");
    theForm.description.focus();
    return (false);
  }
  

  return (true);
}
//--></script>


<style type="text/css">
   .fstyle
   {
       display: none;
    }
</style> 
	
	<cfparam name="url.sent" default=0>
	<cfparam name="url.bot" default=0>
	
	
	
				<table width="100%" border="0" cellspacing="1" cellpadding="5" class="dkblue12">
						<tr>
							<td colspan="2" align="middle" class="dkblue12">								
								<h1>Contact Composer & Songwriter Dominic T. Kelly</h1>
								<h2>Dom Music Production Music Library</h2>
							</td>
						</tr>	
				</table>				
						
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14 contact-form">
 	<form action="act_contact.cfm" method="post" onsubmit="return Valid(this)">  
	<cfif url.sent eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				<font color="red">***</font> Your email has been sent. You will be contacted promptly. <font color="red">***</font>
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
			<td class="white12" align="right"  width="150">
				Name: 
			</td>
			<td>
				<input type="text" size="50" name="name" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" width="150">
				Subject: 
			</td>
			<td>
				<input type="text" size="50" name="subject" value="" maxlength="150">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" width="150">
				Email to contact you: 
			</td>
			<td>
				<input type="text" size="30" name="given_email" value="" maxlength="150">
			</td>
		 </tr>	  
	
		  <tr>											
			<td class="white12" align="right" width="150">
				Message: 
			</td>	
			<td>
				<textarea name="description" cols="50" rows="6"></textarea>
			</td>
		 </tr>	 
		 <tr>
         	<td></td>
			<td>
				<input type="Submit" value=" Contact Dominic">
			</td>
		 </tr>	 
         <br /><br />
		 <p class="fstyle"><input name="botcatcher" type="text" value=""/>  </p> 
	 </form> 


		<tr>
			<td class="white14" align="right" width="150" valign="top">
				<b>Dominic Kelly</b><br>
			</td>
			<td>
            	Composer/Songwriter
                <br>
                President<br>
                Dom Enterprises International Inc.<br>  
                 <b>domkelly(at)dommusic.com</b> <br>
				 cel: <b>(310)266-5922</b>
				 
				 <br><br>
				 Contact us for high quality .wav or .aif versions of any music track you would like to use in your productions.
				 <br><br>
				 If you require alternate submixes of any track  that is not on the website, please let us know and we will send you a download link.	 
			</td>
		 </tr>			
         <tr>
			<td colspan="2" align="center">
            	<h3>Production Music Libary in Los Angeles</h3>
				<a href="index.cfm?fa=search_music&adv=1" class="leftmenu"> <b>Search Our Production Music Library</b></a> for your next television, film, online, or smart phone production or application.
				Check out the many diverse production music styles & catalogs in the Dom MusicProduction Music Library in Los Angeles for all your production music needs.
					  <br /><br />
					  <cfoutput query="catalog_title">
                          <a href="index.cfm?fa=search_music&cat=#catalog_title.id#&adv=1&sub=1" class="bodylink">#catalog_title.catalog_title#</a> TV & Film music | 
                      </cfoutput>
			</td>
		</tr> 	
	</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="FFFFFF" align="center" class="header14" colspan="5">
					<img src="images/DomMusic_production_music_library_header.jpg" title="Dom Music Production Music Library Header" alt="Dom Music Production Music Library Header" class="vdo-reel-img">
				</td>
			</tr>
		 </table>
  <br><br>
