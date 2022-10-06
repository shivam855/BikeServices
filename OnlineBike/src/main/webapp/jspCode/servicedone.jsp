<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Id Generator</title>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
</head>
<body>
<table class="login">
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/englogin.html" >LOGOUT</a></th><tr>
</table>
<%@page import="java.sql.*" %>

<%@page import="dbcon.*" %>
<%
	String name="";	
int user_id = (Integer)session.getAttribute("user_id");	
int track_id = (Integer)session.getAttribute("track_id");
String user_name = (String)session.getAttribute("user_name");	
	try{
	Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst = conn.prepareStatement("select * from admin_details");
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> USER_ID   :"+user_id+"</div></b>");
	out.println("<b><div class=user> USER_NAME :"+user_name+"</div></b>");
	}
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
	
<h4><center>Online Bike Service Portal</center></h4>
<div class="abc">
<h1><center>Request Tracking Id</center></h1><hr><br>
 Hi.. Thanks requesting on my page. <br>
			  Your Tracking_id and Eng_id is here...
<%@page import = "java.sql.*" %>
	<%
	String str="";
	String approval="";	
	try
	{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
		PreparedStatement pst= conn.prepareStatement("select * from service where track_id=?");
		pst.setInt(1, track_id);
		ResultSet rs = pst.executeQuery();
		while(rs.next())
		{
			approval = rs.getString("approval");
			if(approval.equals("Approval"))
			{	
			  	out.println("<h1>Your Tracking Id = "+track_id+"</h1>");
			  session.setAttribute("user_id", user_id);
			}
			else if(approval.equals("Deny"))
			{
				out.println("<body><div class=abc><h1> Sorry your service request is rejected</h1></div></body>");	
			}
			else
			{
				out.println("<body><h1> wait for the approval</h1></body>");
				out.println("<a href='../jspCode/servicedone.jsp'><button>REFRESH</button></a>");	
			}
			}
	}
	catch(Exception e)
	{
		out.println("<body><div class=abc><h1>"+e+"</h1></div></body>");			
	}
	%>
	

<br><br><center><a class =low href="../jspCode/onlinebike.jsp">Customer Page</a></center>	
<br><br>
</html>




	