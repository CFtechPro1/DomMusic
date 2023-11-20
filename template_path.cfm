<cfoutput>
	#GetCurrentTemplatePath()#
</cfoutput>

<cfoutput>
	#GetBaseTemplatePath()#
</cfoutput>


<!--- Get request from ColdFusion page contenxt. --->
<cfset objRequest = GetPageContext().GetRequest() />
 

<!--- Get requested URL from request object. --->
<cfset strUrl = objRequest.GetRequestUrl().Append(
"?" & objRequest.GetQueryString()
).ToString()
/>

<cfoutput>#strUrl#</cfoutput>