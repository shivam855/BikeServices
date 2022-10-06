<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
</head>
<body>
<table class=login>
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/adlogin.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	String name="";	
	int eng_id = 	(Integer)session.getAttribute("eng_id");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst = conn.prepareStatement("select * from eng where eng_id=?");
	pst.setInt(1,eng_id);
	pst.execute();
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> Ser_Eng_ID   :"+eng_id+"</div></b>");
	out.println("<b><div class=user> Eng_NAME :"+rs.getString("name")+"</div></b>");
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
<%@page import="dbcon.*" %>
<%
	String id="";
	String str=request.getParameter("tf1");
	String str2=request.getParameter("tf2");
	
 try{

		out.println("<center><h1>Approved Service Engineer</h1></center><br><br>");

Class.forName(dbcon.dbdriver());
Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("Select * from service where track_id = ?");
	pst.setString(1,str);
	pst.execute();
	if(str2.equalsIgnoreCase("Approval"))
	{
		String sql="update service set status ='Approval' where track_id='"+str+"'";
		PreparedStatement pst1 = conn.prepareStatement(sql);
		out.println("<center>Request Successfully Approved.</center>");
		pst1.execute();
	}
	else if(str2.equals("Panding"))
	{
		out.println("<center>Request are in "+str2 +".</center>");
	}	
	else if(str2.equals("Deny"))
	{
			String sql="delete from service where track_id='"+str+"'";
			PreparedStatement pst1 = conn.prepareStatement(sql);
			/* pst.setString(1, str2); */
			out.println("<center>Request Successfully "+str2 +".</center>");
			pst1.execute();
	}	
 }
catch(Exception e){
	out.println(e);
 }
%>

<br><br><center><a href="../jspCode/engServiceApproval.jsp">Next Approval</a></center>
<br>
<br>	
</body>
</html>
