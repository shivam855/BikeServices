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
	int admin_id = (Integer)session.getAttribute("admin_id");
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
</head>
<body>
<div class=abc>
<h1><center  style="font-size: 25px;">Unmapping Completed </center></h1><hr>
<pre>
provided service engineer now free to 
take another task
<form action=../jspCode/mappingApproval.jsp method=get> <center>
<%@page import="java.sql.*" %>
<%
	int track_id = Integer.parseInt(request.getParameter("tf1"));
try{
	Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("delete from service where track_id=?");
	pst.setInt(1, track_id);
	pst.execute();
	}
catch(Exception e){
	out.println(e);
 }
%>
    		<br><center><font size=2px><a href="../jspCode/AdminPortal.jsp">Back to AdminPortal </a></font></center>
    		
    		<br><center><font><a href="../jspCode/mapping.jsp">Next mapping Status</a></font></center>
</form>
</pre>
</div>
</body>
</html>