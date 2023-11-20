
<cfparam name="url.bid" default=0>


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
        <cfoutput query="blogs">
          <tr>
              <td class="white12" align="right" bgcolor="999999" width="100">
                  #blogs.date_posted# 
              </td>
              <td bgcolor="000000">
                  <b>#blogs.title#</b>
                  <br /><br />
                  #blogs.description#
                  <br /><br />
                  <strong>Tags:</strong> #blogs.keywords#
              </td>
           </tr>	
          <tr>
              <td class="black14" align="left" bgcolor="FFFFFF" width="100" colspan="2">
                  #blogs.post_content# 
              </td>
           </tr>		
           <tr>
              <td class="black12" align="left" bgcolor="333333" width="100" height="10" colspan="2">
                  
              </td>
           </tr>
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
