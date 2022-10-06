<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
<script src="../jsCode/js1.js"></script>
</head>
<body>
<table class="login">
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/login.html" >LOGOUT</a></th><tr>
</table>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	String str=" ";	
	int user_id = 	(Integer)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	out.println("<b><div class=user> USER_ID:"+user_id+"</div></b>");
	out.println("<b><div class=user> USER_NAME:"+user_name+"</div></b>");
	session.setAttribute("user_name", user_name);
	}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
<br>	
<h4><center>Online Bike Service Portal</center></h4>	
<div class="abc">
<h1><center>Tracking Request </center></h1><hr><br>
<pre>
<form action=../jspCode/VehicleStatus.jsp method=get name="myform" onsubmit="return validate()"><font size=3px>
  <%@page import="java.sql.*" %>
<%
try{
	Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("select * from service where user_id=?");
	pst.setInt(1,user_id);
	pst.execute();
	ResultSet rs=pst.executeQuery();
	out.println(" <b>Tracking Id     :<select style='width: 320px;' name=tf6 />");
	while(rs.next())
	{
		out.println("<option value="+rs.getInt("track_id")+">" +rs.getInt("track_id")	+"	</option>");
	}
	out.println("</select></b>");
}
catch(Exception e){
	out.println(e);
 }
%>	   
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>  
    
    		<br><br><center><h6><a href="../jspCode/onlinebike.jsp">Back to Customer Portal </a></h6></center>
                    
</form>
</pre></div>
</body>
</html>