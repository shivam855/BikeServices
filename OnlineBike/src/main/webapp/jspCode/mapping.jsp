	<html>
	<head>
	<title>Mapping</title>
	<style>	
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
	 	background-size:100% 100%; 
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
	</head>
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
	<div class=abc>
	<%@page import="java.sql.*" %>
	<%@page import="dbcon.*" %>
	<%
	 try{
		 Class.forName(dbcon.dbdriver());
		 Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
		String sql = "select * from service";
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		out.println("<center><h2>Mapping Tables</h2></center>");
		out.println("<table border = 4 bgcolor=lightGray style='height: 50px; width: 100% ;'>");
		out.println("<thead><th>Track ID</th><th>User ID</th><th>Engineer Id</th><th>Status</th><th>Approval</th></thead>");
		
		while(rs.next())
		{
		if(rs.getString("approval").equals("Approval"))
		{
			out.print("<tr style='text-align:center;'><td> "+rs.getString("track_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("user_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("eng_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("status")+"  "+"</td>");
			out.print("<td>  "+rs.getString("approval")+"  "+"</td>");
		}
		else if(rs.getString("approval").equals("panding"))
		{
			out.print("<tr style='text-align:center;'><td> "+rs.getString("track_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("user_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("eng_id")+"  "+"</td>");
			out.print("<td>  "+rs.getString("status")+"  "+"</td>");
			out.print("<td>  "+rs.getString("approval")+"  "+"</td>");
		}
		else if(rs.getString("approval").equals("deny"))
		{
			PreparedStatement pst2 = conn.prepareStatement("delete from service where status="+"Approval");
			pst2.execute();
		}	
	}
	out.println("</table>");
	pst.execute(); 	
	out.println("<h3><b>Give Approval for this Id <a href='../jspCode/mappingCE.jsp'>User Id</a></b></h3>");	
	out.println("<h3><b>Unmapped Service Engineer Id <a href='../jspCode/unmapping1.jsp'>User Id</a></b></h3>");	
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>
<br><br><div class=mno><center><a href="../jspCode/AdminPortal.jsp">Admin Portal</a></div></center>	
</body>
</html>