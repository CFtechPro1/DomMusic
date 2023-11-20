
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

 $(function() {
     $( "#my_dialog" ).dialog({
     autoOpen: false
   });

    $("#b1").click(function(){
        $( "#my_dialog" ).dialog( "open" );
    })
});
</script>

<div id="my_dialog" title="basic  dialog">
  <p>Jquery pop up dialogue</p>
  
</div>

<input type="button" id="b1" value="open">


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            modal: true,
            autoOpen: false,
            title: "jQuery Dialog",
            width: 300,
            height: 150
        });
        $("#btnShow").click(function () {
            $('#dialog').dialog('open');
        });
    });
</script>
<input type="button" id="btnShow" value="Show Popup" />
<div id="dialog" style="display: none" align = "center">
    This is a jQuery Dialog.
</div>


<script>
    $(function () {

        /*$('#modalPopUp').dialog({
            modal: true,
            autoOpen: false,
            title: 'jQuery Dialog',
            width: 300,
            height: 150
        });*/
        $('#bshow').click(function(){
            $('#modalPopUp').slideToggle();
        });


    });
</script>
<input type="button" id="bshow" value="Toggle">

<div id="modalPopUp" style="display: none" align = "center">
    This is a jQuery Dialog.
</div>

