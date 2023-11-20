<!--- THIS FREE TAG IS BASED ON CFDateSelectPopup v.1.1 written by Selene Bainum (selene@webtricks.com)
Updated by: Dimitris Siskopoulos (Dimitris@Siskopoulos.gr) www.code.gr
There have been a lot of changes and i've left the code for use with other languages that are not supporting by CFLocale (i'm using Greek) ... just read the comments and you'll found out, if you don't mail me for further infos.
--->

<cfset Lang="UK"> <!--- change it to GR for Greek or your custom language --->

<CFHEADER Name="Expires" Value="#Now()#">
<CFHEADER NAME="pragma" VALUE="no-cache">
<HTML>
<HEAD>
<TITLE><cfif lang is not 'GR'>Calendar<cfelse>Ημερολόγιο</cfif></TITLE> 
<style>  A.www_code_gr  {
  	COLOR : Maroon;
  	TEXT-DECORATION : none;
  }
  
  A.www_code_gr:hover  {
  	COLOR : Navy;
  	TEXT-DECORATION : none;
  }
  
  A.www_code_gr:active  {
  	COLOR : Maroon;
  	TEXT-DECORATION : none;
  }
  
  a.belos  {
  	TEXT-DECORATION : none;
  	font-weight : bold;
  	color : White;
  }
  
  a.belos:active  {
  	TEXT-DECORATION : none;
  	font-weight : bold;
  	color : White;
  }
  
  a.belos:hover  {
  	background-color : White;
  	TEXT-DECORATION : none;
  	font-weight : bold;
  	color : Black;
  }
  
  a.yearaddremove  {
  	TEXT-DECORATION : none;
  	color : Yellow;	
  }
  
  a.yearaddremove:active  {
  	TEXT-DECORATION : none;
  	color : Yellow;		
  }
  
  a.yearaddremove:hover  {
  	TEXT-DECORATION : none;
  	color : Chartreuse;		
  }
  
  .yearcombo  {
  color: DarkRed;
  font-family: verdana;
  font-weight: bold;
  font-size: 7pt;
}	
  }
  
  </style>
</HEAD>
<BODY BGCOLOR = "White" leftmargin="1" topmargin="1">
<!--- 
if you place this to the body the popup window is always on top but then you can not use the text box
onblur="this.focus();"
--->

<!--- Set the month and year parameters to equal the current values if they do not exist. --->	
<CFPARAM NAME = "month" DEFAULT = "#DatePart('m', Now())#">
<CFPARAM NAME = "year" DEFAULT = "#DatePart('yyyy', Now())#">

<!--- Set the requested (or current) month/year date and determine the number of days in the month. --->
<CFSET ThisMonthYear = CreateDate(year, month, '1')>
<CFSET Days = DaysInMonth(ThisMonthYear)>

<!--- Set the values for the previous and next months for the back/next links. --->
<CFSET LastMonthYear = DateAdd('m', -1, ThisMonthYear)>
<CFSET LastMonth = DatePart('m', LastMonthYear)>
<CFSET LastYear = DatePart('yyyy', LastMonthYear)>
<CFSET NextMonthYear = DateAdd('m', 1, ThisMonthYear)>
<CFSET NextMonth = DatePart('m', NextMonthYear)>
<CFSET NextYear = DatePart('yyyy', NextMonthYear)>
<SCRIPT LANGUAGE = "JavaScript">
<!--
// function to populate the date on the form and to close this window. --->
function ShowDate(DayOfMonth)
{
	<CFOUTPUT>
		var FormName = "#FormName#";
		var FieldName = "#FieldName#";
		var DateToShow =    "#month#/"+ DayOfMonth +"/#year#";
		eval("self.opener.document." + FormName + "." + FieldName + ".value = DateToShow");
		window.close();
	</CFOUTPUT>
}
//-->
</SCRIPT>
<form action="CFDateSelect.cfm" method="POST">

<table border="0" cellspacing="0" cellpadding="0" align="CENTER" bgcolor="Black">
  <TR>
    <TD ALIGN = "left" bgcolor="132E72" valign="middle"> 
	<CFOUTPUT> 

	<cfif lang is not 'GR'>
<!---  Comment the following if you use custom month names. The following is for US month names --->
		<cfset DispMonth=MonthAsString(month)>
	<cfelse>		
	<!--- If your country is not supported by CF Locales use the following code to display the months, i'm using GREEK month names, i hope some day Allaire will include our country at their Setlocale tag!--->	

      <cfif month is 1>
        <cfset DispMonth="Ιανουάριος"> 
        </cfif>
        <cfif month is 2>
        <cfset DispMonth="Φεβρουάριος">
        </cfif>
        <cfif month is 3>
        <cfset DispMonth="Μάρτιος">
        </cfif>
        <cfif month is 4>
        <cfset DispMonth="Απρίλιος">
        </cfif>
        <cfif month is 5>
        <cfset DispMonth="Μαϊος">
        </cfif>
        <cfif month is 6>
        <cfset DispMonth="Ιούνιος">
        </cfif>
        <cfif month is 7>
        <cfset DispMonth="Ιούλιος">
        </cfif>
        <cfif month is 8>
        <cfset DispMonth="Αύγουστος">
        </cfif>
        <cfif month is 9>
        <cfset DispMonth="Σεπτέμβριος">
        </cfif>
        <cfif month is 10>
        <cfset DispMonth="Οκτώβριος">
        </cfif>
        <cfif month is 11>
        <cfset DispMonth="Νοέμβριος">
        </cfif>
        <cfif month is 12>
        <cfset DispMonth="Δεκέμβριος">
        </cfif>
</cfif>
      <A HREF = "CFDateSelect.cfm?month=#LastMonth#&year=#LastYear#&FormName=#FormName#&FieldName=#FieldName#" class="belos"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font face="Geneva, Arial, Helvetica, san-serif" size="2">&lt;&lt;</font></b></font></A></td>
    <td bgcolor="132E72" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White"><b>#DispMonth#</b></font> 
      <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><A HREF = "CFDateSelect.cfm?month=#Month#&year=#evaluate(Year-1)#&FormName=#FormName#&FieldName=#FieldName#" class="yearaddremove">-</A>
<input type="Text" name="year" size="3" maxlength="5" class="yearcombo" value="#year#">
<!--- If you just want to display the YEAR and not to EDIT it, delete the INPUT and the FORM tags and place the following tag out of the comments
<font color="White">#year#</font> --->
<A HREF = "CFDateSelect.cfm?month=#Month#&year=#evaluate(Year+1)#&FormName=#FormName#&FieldName=#FieldName#" class="yearaddremove">+</A>
<input type="Hidden" name="month" value="#month#">
<input type="Hidden" name="FormName" value="#FormName#">
<input type="Hidden" name="FieldName" value="#FieldName#">
</font></b></td>
    <td bgcolor="132E72" align="right" valign="middle"> <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><A HREF = "CFDateSelect.cfm?month=#NextMonth#&year=#NextYear#&FormName=#FormName#&FieldName=#FieldName#" class="belos"><font face="Geneva, Arial, Helvetica, san-serif" size="2">&gt;&gt;</font></A> 
      </font></b></td>
  <tr>
    <td width="569" colspan="3"></CFOUTPUT> 
      <TABLE BORDER = "0" cellpadding="0" cellspacing="1" bgcolor="Black">
        <TR bgcolor="eeeeee"> 
		<cfif lang is not 'GR'>
				<!--- Display the day of week headers.  I've truncated the values to display only the first three letters  --->
				<!--- of each day of the week.  --->
					<CFLOOP FROM = "1" TO = "7" INDEX = "LoopDay">
						<CFOUTPUT>
							<TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">#Left(DayOfWeekAsString(LoopDay), 3)#</font></TD>
						</CFOUTPUT>
					</CFLOOP>		
		<cfelse>			
		<!--- The following is for CUSTOM day names! Comment the CLOOP /CFLOOP tags and un-comments the following lines! --->		
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Κυρ</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Δευ</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Τρί</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Τετ</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Πέμ</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Παρ</font></TD>
              <TD WIDTH = "80" ALIGN = "center" bgcolor="Gray"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="White">
			  		Σαβ</font></TD>
			</cfif>
        </TR>

				<!--- Set the ThisDay variable to 0.  This value will remain 0 until the day of the week on which the --->
				<!--- first day of the month falls on is reached. --->
        <CFSET ThisDay = 0>

				<!--- Loop through until the number of days in the month is reached.  --->		
        <CFLOOP CONDITION = "ThisDay LTE Days">
			<TR>
					<!--- Loop through each day of the week. --->			
            <CFLOOP FROM = "1" TO = "7" INDEX = "LoopDay">
						<!--- If ThisDay is still 0, check to see if the current day of the week in the loop --->
						<!--- matches the day of the week for the first day of the month. --->
						<!--- If the values match, set ThisDay to 1. --->
						<!--- Otherwise, the value will remain 0 until the correct day of the week is found. --->
              <CFIF ThisDay IS 0>
          	    <CFIF DayOfWeek(ThisMonthYear) IS LoopDay>
           			   <CFSET ThisDay = 1>
            	  </CFIF>
              </CFIF>
						<!--- If the ThisDay value is still 0, or it is greater than the number of days in the month, --->
						<!--- display nothing in the column. --->
						<!--- Otherwise, display the day of the month and increment the value. --->
			  
              <CFIF (ThisDay IS NOT 0) AND (ThisDay LTE Days)>
              <CFOUTPUT> 
                <td width="80" height="14" align="CENTER" bgcolor="#IIF(thisday is Day(Now()) AND Month(ThisMonthYear) IS Month(Now()) AND Year(ThisMonthYear) IS Year(Now()), DE("GOLD"), DE("WHITE"))#">
				<font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>
				<A HREF = "javascript:ShowDate(#ThisDay#)" class="www_code_gr">#ThisDay#</A>
				</b></font>
				</TD>
              </CFOUTPUT> 
              <CFSET ThisDay = ThisDay + 1>
              <CFELSE>
              <TD width="80" height="14" bgcolor="eeeeee"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></TD>
              </CFIF>
            </CFLOOP>
          </TR>
        </CFLOOP>
      </TABLE>
		</TD>
	</TR>
</TABLE>
</form>	
</BODY>
</HTML>

