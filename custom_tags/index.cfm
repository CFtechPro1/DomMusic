<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>CFSelect Example</title>
<SCRIPT LANGUAGE = "JavaScript">
<!--
// function to load the calendar window.
function ShowCalendar(FormName, FieldName)
{
    window.open("CFDateSelect.cfm?FormName=" + FormName + "&FieldName=" + FieldName, "CalendarWindow", "width=200,height=125");
}
//-->
</SCRIPT>	
</head>

<body>
<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
<p><b>CFSelect Popup Example:</b></p>
Just click the fields to select the date from the popup window: 
<form action="ActionFile.cfm" method="POST" name="form1">
  Date1: 
  <input type="text" name="datefield1" onclick="javascript:ShowCalendar('form1', 'datefield1')">
  Date2: 
  <input type="text" name="datefield2" onclick="javascript:ShowCalendar('form1', 'datefield2')" onFocus="this.blur()">
</form>
<p>Notice that with the onFocus=&quot;this.blur()&quot; javascript code at the 
  input tag, we make this field read only! (IE only, don't use it with NS. If 
  you want it to work with NS too, just place an image or a button next to the text field and place ther javascript onclick code there... )</p>
<p>To make this work just create a text input and place the following javascript 
  code to it:</p>
<p>Example:<br>
  If you have: &lt;input type=&quot;text&quot; name=&quot;textfield&quot;&gt; 
  <input type="text" name="textfield">
  (this is what you get) 
<form action="ActionFile.cfm" method="POST" name="FormName">
  change it to: &lt;input type=&quot;text&quot; name=&quot;textfield&quot; onclick=&quot;javascript:ShowCalendar('FormName', 
  'FieldName')&quot; onFocus=&quot;this.blur()&quot;&gt; 
  <input type="text" name="FieldName" onclick="javascript:ShowCalendar('FormName', 'FieldName')" onFocus="this.blur()">
  with a form tag and you're done! 
</form>
<p><br>
  <i> Dimitris Siskopoulos</i> (dimitris@siskopoulos.gr) <a href="http://www.code.gr/" target="_blank">code.gr</a></p>
<p>&nbsp;</p>
</font> 
</body>
</html>
