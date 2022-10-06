<!DOCTYPE html>
<html>
<head>
<title>Welcome User</title>
</head>
<style>	
body{
	margin-left: 2px;
	margin-right: 2px;
	margin-top:5%;
 	color:black;
 	font-size:15px;
 	background-size: 100%;
 	}
 h2{
  text-align:center;
  font-family: monospace;
  background-color : blue;
  color:white;
  padding:8px;
  
 }

</style>
<body>

<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
<%
	int eng_id =(Integer)session.getAttribute("eng_id");
	int track_id1;
	String bike_name="";
 try{
	 Class.forName(dbcon.dbdriver());
	 Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst1 = conn.prepareStatement("insert into eng_service(eng_id,track_id,bike_name,status) values(?,?,?,?)");
	PreparedStatement pst2 = conn.prepareStatement("select * from eng_service");
	PreparedStatement pst3 = conn.prepareStatement("select * from service");
	ResultSet rs=pst3.executeQuery();
	ResultSet rs1=pst2.executeQuery();
	while(rs.next())
	{	 track_id1 = rs.getInt("track_id");
		 bike_name  = rs.getString("bike_name");
			 pst1.setInt(1,eng_id);
			 pst1.setInt(2,track_id1);
			 pst1.setString(3,bike_name);
			 pst1.setString(4,"panding");
			 pst1.execute();
			response.sendRedirect("../jspCode/engServiceApproval.jsp");
	}	
	}
	catch(Exception e){
		out.println(e);
	 }
	%>
	
	</body>
	</html>