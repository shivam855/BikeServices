<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title><style>	
body{
	margin-left: 2px;
	margin-right: 2px;
	margin-top:5px;
 	color:black;
 	font-size:18px;
 	background-size: 100%;
 	/* background-image: url(img.png); */
 	background-color : floralwhite;
 	background-repeat: no-repeat;
 	background-size:100% ; 
 	}
 h2{
  text-align:center;
  font-family: monospace;
  background-color : blue;
  color:white;
  padding:8px;
  
 }
 h4
{
	background-color: lightblue;
	font-size: 40px;
}
 a.hover{
 	border:3px solid black;
	background-color: #138496;	
}
.login
{
	margin-top:0px;
	font-size:15px;
	margin-left:85%;
	background-color: yellow;
} 
.user
{
	font-size:18px;
	margin-left:85%;
	margin-top:5px;
}
.mno
{
font-size: 20px;
}
</style>
<body>
<table class=login>
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/adlogin.html" >LOGOUT</a></th><tr>
</table><br />
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>

<%
	String name="";	
	int user_id = 	(Integer)session.getAttribute("user_id");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst = conn.prepareStatement("select * from cus_details where user_id=?");
	pst.setInt(1, user_id);
	pst.execute();
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> USER_ID   :"+user_id+"</div></b>");
	out.println("<b><div class=user> USER_NAME :"+rs.getString("name")+"</div></b>");
	}
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
	
<h4><center>Online Bike Service Portal</center></h4>
<div class=abc>
<%@page import="java.sql.*" %>
<%
	String id="";
	 int x = Integer.parseInt(request.getParameter("tf6")); 
	/* int x = 3; */
 try{
	 Class.forName(dbcon.dbdriver());
	 Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst = conn.prepareStatement("select * from service where track_id=?");
	pst.setInt(1, x);
	pst.execute();
	ResultSet rs=pst.executeQuery();
	out.println("<center><h2>Customer service Status</h2></center>");
	out.println("<table border = 4 bgcolor=lightGray style='height: 80%; width: 100% ;'>");
	out.println("<thead><th>Track ID</th><th>User ID</th><th>Engineer ID</th><th>Bike Name</th><th>Status</th></thead>");
	
	while(rs.next())
	{
		out.print("<tr style='text-align:center;'><td> "+rs.getString("track_id")+"  "+"</td>");
		out.print("<td>  "+rs.getString("user_id")+"  "+"</td>");
		out.print("<td>  "+rs.getString("eng_id")+"  "+"</td>");
		out.print("<td>  "+rs.getString("bike_name")+"  "+"</td>");
		out.print("<td>  "+rs.getString("status")+"  "+"</td>");
	}
	out.println("</table>");
	pst.execute(); 	
	rs.close();
	pst.close();
 }

catch(Exception e){
	out.println(e);
 }
%>	

<br><br><center><a href="../jspCode/onlinebike.jsp">Customer Page</a></center>
</body>
</html>
