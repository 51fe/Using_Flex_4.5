<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->

<%
	String fName = (String) request.getParameter("firstname");
	String lName = (String) request.getParameter("lastname");
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title>DynamicFlashVarTestWrapper.jsp</title>
        <script type="text/javascript" src="swfobject.js"></script>
        
        <script type="text/javascript">
            var swfVersionStr = "0";
            var xiSwfUrlStr = "";
            var flashvars = {};
            flashvars.firstname = "<%= fName %>";
            flashvars.lastname = "<%= lName %>";
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            var attributes = {};
            attributes.id = "FlashVarTest";
            attributes.name = "FlashVarTest";
            attributes.align = "middle";
            swfobject.embedSWF(
                "FlashVarTest.swf", "flashContent",
                "100%", "100%",
                swfVersionStr, xiSwfUrlStr,
                flashvars, params, attributes);
        </script>
    </head>

    <body>
        <div id="flashContent"/>
   </body>
</html>
