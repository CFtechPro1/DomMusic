<cfparam name="form.title" default="" >
<cfparam name="form.description" default="" >
<cfparam name="form.keywords" default="" >
 <cfparam name="form.post_content" default="" > 
<cfparam name="form.captcha" default="" >
<cfparam name="url.edit" default=0 >
<cfparam name="url.del" default=0 >
<cfparam name="url.bid" default=0 >

<!--- <cfoutput>
	<cfdump var="#form.fieldnames#">
</cfoutput>

<cfabort> --->
  <cfif url.del eq 1>
      
      <cfquery name="edit_blog" datasource="#application.dsn#">
          DELETE dom_blog WHERE id = #url.bid#
      </cfquery>
      
      <cflocation url="index.cfm?fa=blog_view&del=1" addtoken="no">    
      
 </cfif>
 
<cfif form.captcha eq "paris">

  <cfif url.edit eq 1>
      
      <cfquery name="edit_blog" datasource="#application.dsn#">
          UPDATE dom_blog
              SET title = '#trim(form.title)#',
                  description = '#trim(form.description)#',
                  keywords = '#trim(form.keywords)#',
                  post_content = '#trim(form.post_content)#'
                  WHERE id = #url.bid#
      </cfquery>
      
      <cflocation url="index.cfm?fa=blog_edit&updated=1&bid=#url.bid#" addtoken="no">
  
  <cfelse>
  
      <cfquery name="add_blog" datasource="#application.dsn#">
          INSERT INTO dom_blog
              (title, description, keywords, date_posted, post_content)
          VALUES
              ('#form.title#', '#form.description#', '#form.keywords#', '#DateFormat(Now(),"mm/dd/yyyy")#', '#form.post_content#')
      </cfquery>	
  
      <cflocation url="index.cfm?fa=blog_create&added=1" addtoken="no">
  
  </cfif>
	
<cfelse>
	<cflocation url="index.cfm?fa=blog_create&nocap=1" addtoken="no">
</cfif>
	