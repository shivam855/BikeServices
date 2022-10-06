<!DOCTYPE html>
<html>
<head>
<title>Welcome User</title>
</head>
<style>	
body{
	margin-top:5px;
 	color:black;
 	font-size:15px;
 	background-size: 100%;
 	/* background-image: url(img.png); */
 	background-color :floralwhite;
 	background-repeat: no-repeat;
 	background-size:100% 100%;
 	}
 	 h3{
  text-align:center;
  font-family: monospace;
  background-color : blue;
  color:white;
  padding:8px; 
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
 h4
{
	background-color: lightblue;
	font-size: 40px;
}
</style>
<body>
<table class=login>
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
<pre>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
 try{
	Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	String sql = "select * from eng";
	PreparedStatement pst = conn.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	out.println("<center><h3  style='color:black ;font-size:25px;'>Service engineer request</h3></center>");
	out.println("<table border = 4 bgcolor=lightGray style='height: 80%; width: 100% ;'>");
	out.println("<thead><th>Engineer ID</th><th>Name</th><th>Email ID</th><th>Phone No.<th>Address</th><th>Expirence</th><th>Adhaar no</th><th>City</th><th>Requirement</th><th>Approval</th></thead>");
	while(rs.next())
	{
		if(rs.getString("approval").equals("Approval"))
		{			
			PreparedStatement pst1 = conn.prepareStatement("update eng set approval='approval'");
			pst1.execute();
			pst1.close();
		}
		else if(rs.getString("approval").equals("panding"))
		{			
			out.print("<tr style='text-align:center;'><td>"+rs.getString("eng_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("name")+"  "+"</td>");
			out.print("<td>  "+rs.getString("email")+"  "+"</td>");
			out.print("<td>  "+rs.getString("phone")+"  "+"</td>");
			out.print("<td>  "+rs.getString("address")+"  "+"</td>");
			out.print("<td>  "+rs.getString("experiance")+"  "+"</td>");
			out.print("<td>  "+rs.getString("adhaar")+"  "+"</td>");
			out.print("<td>  "+rs.getString("city")+"  "+"</td>");
			out.print("<td>  "+rs.getString("requirement")+"  "+"</td>");
			out.print("<td>  "+rs.getString("approval")+"  "+"</td></tr></h4>");
			session.setAttribute("admin_id", admin_id);
			}	
		else if(rs.getString("approval").equals("deny"))
		{
			PreparedStatement pst1 = conn.prepareStatement("delete from eng where eng_id=?");
			pst1.setInt(1,rs.getInt("eng_id"));
			pst1.execute();
			session.setAttribute("admin_id", admin_id);
		}
	}
	out.println("</table>");
	pst.execute(); 
	
	out.println("<h2 style='color:black ;font-size:20px;'><b>Give Approval for this Id <a href='../jspCode/ApprovalForEngineer.jsp'>Id</a></b></h2>");
	out.println("<h2 style='color:black ;font-size:20px;'><b>list of  Approval id's<a href='../jspCode/engineerDetails.jsp'>  click here</a></b></h2>");
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>

<br><br><center><h2><a href="../jspCode/AdminPortal.jsp">Back to AdminPortal </a></h2></center>
</body>
</html>