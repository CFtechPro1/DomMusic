
      <cfparam name="url.del" default=0>
      

	<cfquery datasource="#application.dsn#" name="blogs">
    	SELECT id, title, description, date_posted, post_content
        FROM dom_blog
        ORDER BY date_posted
    </cfquery>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="5" class="white14" bgcolor="#666666">
			<tr> 
				<td bgcolor="000000" align="center" colspan="2">
					<h1>Production Music Library BLOG</h1>
				</td>
			</tr>
          <tr>
              <td class="white12" align="right" width="100" bgcolor="333333">
                  <strong>Date Posted </strong>
              </td>
              <td bgcolor="333333">
                  <strong>DOM Production Music Library BLOG</strong>
              </td>
           </tr>
		<cfif url.del eq 1>
              <tr>
                <td colspan="2" align="center" bgcolor="CCCCCC" class="black14">
                    <font color="red">***</font> Your blog post has been deleted. <font color="red">***</font>
                </td>
             </tr>	
        </cfif>	
        <cfoutput query="blogs">
          <tr>
              <td class="white12" align="right" bgcolor="999999" width="100">
                  #blogs.date_posted# <br />
                  <cfif client.sid neq 0>
                  	<a href="index.cfm?fa=blog_edit&bid=#blogs.id#" class="bodylink">EDIT POST</a>
                  </cfif>
              </td>
              <td bgcolor="000000">
                  <a href="index.cfm?fa=blog_post&bid=#blogs.id#" class="bodylink"><b>#blogs.title#</b></a><br />
                  #blogs.description#<br />
                  <a href="index.cfm?fa=blog_post&bid=#blogs.id#" class="tinylink">Read More.....</a><br />
              </td>
           </tr>	
           <tr>
              <td class="black12" align="left" bgcolor="333333" width="100" height="10" colspan="2">
                  
              </td>
           </tr>	
         </cfoutput>
		
         <tr>
			<td colspan="2" align="center" bgcolor="#000000">
            <br /><br />
            	<h2>Production Music Libary in Los Angeles</h2>
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
