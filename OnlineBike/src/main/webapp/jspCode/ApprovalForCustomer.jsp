<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
<script src="js1.js"></script>
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
<h1><center>Approval for Customer Service Request </center></h1><hr><br>
<pre>
<form name="myform" action=../jspCode/CustomerApproval.jsp method=get onsubmit="return validate()">
   <b> User Id*     :<input type=text name=tf1 required="required"  /><br><br></b>
   <b> Approval     :<input type=radio name=tf2 value="Approval" required="required"/>Accepted <input type=radio name=tf2 value="Deny" required="required"/>Deny<br>
      
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>  
 </b></form>   
<br><br><center><h2><a href="../jspCode/AdminPortal.jsp">Back to AdminPortal </a></h2></center>
</pre></div>
</body>
</html>