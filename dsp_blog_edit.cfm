
	<cfparam name="url.bid" default=0>
	<cfparam name="url.updated" default=0>
    

	<cfquery datasource="#application.dsn#" name="blogs">
    	SELECT id, title, description, date_posted, keywords, post_content
        FROM dom_blog
        WHERE id = #url.bid#
    </cfquery>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="#666666">
			<tr> 
				<td bgcolor="000000" align="center" colspan="2">
					<h1>View Production Music Library BLOG Post</h1>
				</td>
			</tr>
          <tr>
              <td class="white12" align="right" width="100" bgcolor="333333">
                  <strong>Date Posted </strong>
              </td>
              <td bgcolor="333333">
                  <strong>Production Music Library BLOG Post</strong>
              </td>
           </tr>
		<cfif url.updated eq 1>
              <tr>
                <td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
                    <font color="red">***</font> Your blog post has been updated. <font color="red">***</font>
                </td>
             </tr>	
        </cfif>	
      <cfoutput query="blogs">
        <form action="act_blog_create.cfm?bid=#url.bid#&edit=1" method="post">
          <tr>
              <td class="white12" align="right" bgcolor="999999" width="100">
                  #blogs.date_posted#
                  <br /><br />
                  <a href="act_blog_create.cfm?bid=#blogs.id#&del=1" class="bodylink" onclick="return confirm('Are you sure you want to delete?')">Delete Post</a>
              </td>
              <td bgcolor="000000">
              		TITLE:<br />
                  <input type="text" size="60" name="title" value="#blogs.title#" maxlength="100">
                	<br /><br />
                	DESCRIPTION:<br />
                  <input type="text" size="80" name="description" value="#blogs.description#" maxlength="240">
                   	<br /><br />
                  	KEYWORDS:<br />
                  <input type="text" size="40" name="keywords" value="#blogs.keywords#" maxlength="150">
              </td>
           </tr>	
          <tr>
              <td class="black12" align="left" bgcolor="FFFFFF" width="100" colspan="2">
              BLOG CONTENT:<br />
              <textarea name="post_content" cols="60" rows="10">#blogs.post_content#</textarea>    
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
                    <input type="Submit" value=" UPDATE BLOG POST ">
                </td>
             </tr>	
           <tr>
              <td class="black12" align="left" bgcolor="333333" width="100" height="10" colspan="2">
                  
              </td>
           </tr>
         </form>
       </cfoutput>
		
         <tr>
			<td colspan="2" align="center" bgcolor="#000000">
            <br />
            	<h2>Production Music, TV Music, Film Music in Los Angeles</h2>
				<a href="index.cfm?fa=search_music&adv=1" class="leftmenu"> <b>Search Our Production Music Library</b></a> for your TV music, film music, advertising music production needs.
				Check out the many diverse production music styles & catalogs of TV music, film music, advertising music in the DOM Production Music Library.
					  <br /><br />
					  <cfoutput query="catalog_title">
                          <a href="index.cfm?fa=search_music&cat=#catalog_title.id#&adv=1&sub=1" class="bodylink">#catalog_title.catalog_title#</a> | 
                      </cfoutput>
			</td>
		</tr> 	
	</table>
  <br><br>
