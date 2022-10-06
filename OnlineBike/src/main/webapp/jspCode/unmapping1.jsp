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
<h1><center  style="font-size: 25px;">Unmapping Customer Request And Service Engineer </center></h1><hr>
<pre>
<form action=../jspCode/unmapping.jsp method=get> <center><%@page import="java.sql.*" %>
<%
try{
	Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst=conn.prepareStatement("select * from service");
	ResultSet rs=pst.executeQuery();
	out.println("Tracking Id : <select style='width: 250px;' name=tf1 />");
	while(rs.next())
	{
		out.println("<option value="+rs.getInt("track_id")+">" +rs.getInt("track_id")	+"	</option>");
	}
	out.println("</select>");
}
catch(Exception e){
	out.println(e);
 }
%>
  <b> Approval     :<input type=radio name=tf2 value="Deny" />Deny <br>   
  <center><button type=submit name=submit value=SUBMIT>Submit</button></center>
</form>
</pre>
</div>
</body>
</html>