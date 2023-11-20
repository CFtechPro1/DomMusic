<CFAPPLICATION name="vbands" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,10,0)#" 
clientmanagement="yes" clientstorage="ezsite">

<CFSET application.dsn = "ezsite">
<CFSET application.filepath = "D:\home\dommusic.com\wwwroot\">
<CFSET application.urlpath = "http://dommusic-com.securec81.ezhostingserver.com/">

<cfparam name="client.name" default=0>
<cfparam name="client.email" default=0>
<cfparam name="client.sid" default=0>
<cfparam name="client.s_name" default=0>
<cfparam name="client.s_email" default=0>




