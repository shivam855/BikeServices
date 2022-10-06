<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
<title>Mapping</title>
</head>
<body><table class=login>
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/adlogin.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	String name="";	
	int admin_id = 	(Integer)session.getAttribute("admin_id");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst = conn.prepareStatement("select * from admin_details");
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> ADMIN_ID   :"+admin_id+"</div></b>");
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
<h1><center> Mapping Status </center></h1><hr><br>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	int track_id = Integer.parseInt(request.getParameter("tf1"));
	int eng_id = Integer.parseInt(request.getParameter("tf3"));
 try{
	 Class.forName(dbcon.dbdriver());
	 Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("update service set eng_id=? where track_id=?");
	pst.setInt(2,track_id);
	pst.setInt(1,eng_id);
	int i = pst.executeUpdate();
	if(i>0)
	{
		out.println("<h1><center style='font-size:25px;'>Your Mapping Done With This Engineer Id = "+ eng_id +"</center></h1>");
	}
	else
	{
		out.println("unsuccessfully done");		
	}
 }
catch(Exception e){
	out.println(e);
 }
%>	
<br><br><center><a href="../jspCode/AdminPortal.jsp">Admin Page</a></center>
<br><center><a href="../jspCode/mapping.jsp">Next Mapping</a></center>
<br>
</div></body>
</html>
