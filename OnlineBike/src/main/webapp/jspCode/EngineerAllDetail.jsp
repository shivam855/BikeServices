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
</table>
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
<h1><center>Approval for Service Engineer Request </center></h1><hr><br>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	String id="";
	String str=request.getParameter("tf1");
	String str2=request.getParameter("tf2");
	
 try{
	 Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("Select * from eng where eng_id = ?");
	pst.setString(1,str);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		id=rs.getString("eng_id");
	}
	
	if(str.equals(id))
	{
		 try{
				if(str2.equals("Approval"))
				{
				String sql="Update eng set approval ='Approval' where eng_id='"+id+"'";
				PreparedStatement pst1 = conn.prepareStatement(sql);
				pst.setString(1, str2);
				out.println("<h1><center>Your Request "+str2 +".</center></h1>");
				pst1.execute();
				}
				else if(str2.equals("Deny"))
				{
					String sql="Update eng set approval ='Deny' where eng_id='"+id+"'";
					PreparedStatement pst1 = conn.prepareStatement(sql);
					pst.setString(1, str2);
					out.println("<h1><center>Your Request "+str2 +".</center></h1>");
					pst1.execute();
				}
				else
				{
					
					
				}
		 }
		 catch(Exception e)
		 {
			 out.println(e);
		 }
	}	
	else
	{
		out.println("<h2 style='color: red;'><center>Service Engineer Does'nt Exist!!!!!<br><br>Please Enter Valid Id......... </center></h2>");
	}
	pst.execute(); 
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>

		<br><br><center><a href="../jspCode/AdminPortal.jsp">Admin Page</a></center>	
<br><center><a href="../jspCode/ServiceEngineer.jsp">Next Approval</a></center><br>
<br>
</div>
</body>
</html>
