<script Language="JavaScript"><!--
function Valid(theForm)
{

  if (theForm.title.value == "")
  {
    alert("Please enter a value for the \" Title\" field.");
    theForm.title.focus();
    return (false);
  }

  if (theForm.description.value == "")
  {
    alert("Please enter a value for the \" Description\" field.");
    theForm.description.focus();
    return (false);
  }

  if (theForm.post_content.value == "")
  {
    alert("Please enter a value for the \"Post Content\" field.");
    theForm.post_content.focus();
    return (false);
  }
  

  return (true);
}
//--></script>


	
	<cfparam name="url.added" default=0>
	<cfparam name="url.nocap" default=0>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="5" class="white14">
			<tr> 
				<td bgcolor="000000" align="center" class="header14" colspan="5">
					<img src="images/header_sm_contact.jpg">
				</td>
			</tr>
		 </table>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14">
	<form action="act_blog_create.cfm" method="post" onsubmit="return Valid(this)">  
	<cfif url.added eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				<font color="red">***</font> Your blog post has been added. <font color="red">***</font>
			</td>
		 </tr>	
	</cfif>	
    <cfif url.nocap eq 1>
		  <tr>
			<td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
				<font color="red">***</font> The captcha text did not match. Are you a robot? <font color="red">***</font>
			</td>
		 </tr>	
	</cfif>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="100">
				Title: 
			</td>
			<td>
				<input type="text" size="60" name="title" value="" maxlength="100">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="150">
				Description: 
			</td>
			<td>
				<input type="text" size="80" name="description" value="" maxlength="240">
			</td>
		 </tr>		
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="150">
				Keywords: 
			</td>
			<td>
				<input type="text" size="40" name="keywords" value="" maxlength="150">
			</td>
		 </tr>	  
	
		  <tr>											
			<td class="white12" align="right" bgcolor="1A1A1A" width="150">
				Post Content: 
			</td>	
			<td>

 				<textarea name="post_content" cols="60" rows="10">BLOG post content goes here.</textarea>
			</td>
		 </tr>	
		<tr>
			<td class="white12" align="right" bgcolor="1A1A1A" width="150">
				Verify: 
			</td>
			<td nowrap valign="top">
				<cfimage action="captcha" width="150" height="40" text="paris">
				<input type="text" size="30" name="captcha" value="" maxlength="150">
			</td>
		 </tr>	 
		 
		 <tr>
			<td colspan="2" bgcolor="666666" height="20" align="center">
				<input type="Submit" value=" ADD BLOG POST ">
			</td>
		 </tr>	 
         <br /><br />

	 </form>

<script>
	$('.jqte-test').jqte();
</script>
		
         <tr>
			<td colspan="2" align="center">
            	<h3>Production Music Libary in Los Angeles</h3>
				<a href="index.cfm?fa=search_music&adv=1" class="leftmenu"> <b>Search Our Production Music Library</b></a> for your next television, film, online, or smart phone production or application.
				Check out the many diverse production music styles & catalogs in the DOM Production Music Library for all your production music needs.
					  <br /><br />
					  <cfoutput query="catalog_title">
                          <a href="index.cfm?fa=search_music&cat=#catalog_title.id#&adv=1&sub=1" class="bodylink">#catalog_title.catalog_title#</a> | 
                      </cfoutput>
			</td>
		</tr> 	
	</table>
  <br><br>
