<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
</head>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
<body>
<table class=login>
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/login.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	String name="";	
	int user_id = 	(Integer)session.getAttribute("user_id");
 	try{
 		Class.forName(dbcon.dbdriver());
 		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
 	PreparedStatement pst = conn.prepareStatement("select * from cus_details");
 	ResultSet rs = pst.executeQuery();
 	while(rs.next())
 	{
 	out.println("<b><div class=user> ADMIN_ID   :"+user_id+"</div></b>");
 	out.println("<b><div class=user> ADMIN_NAME :"+rs.getString("name")+"</div></b>");
 	}
 }
 	catch(Exception e)
     {
 		out.println(e);
     }
	%> 
	<h4><center>Online Bike Service Portal</center></h4>
<div class="abc">
<h1><center>Feedback Form</center></h1><hr><br>
<pre>
Have a Good jurney and best offluck..  
	<%@page import = "java.sql.*" %>
	<%@page import="dbcon.*" %>
	<%
	String str="";
	String service = request.getParameter("tf1");
	String facility = request.getParameter("tf2");
	String suggestion = request.getParameter("tf3");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst= conn.prepareStatement("insert into feedback(user_id,service,facility,suggestion) values (?,?,?,?)");	
	pst.setInt(1, 120);
	pst.setString(2, service);
	pst.setString(3, facility);
	pst.setString(4, suggestion);
	pst.execute();
	out.println("<h3>Thanks for your Feedback</h3>");
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
</pre>
</div>
</body>
</html>




