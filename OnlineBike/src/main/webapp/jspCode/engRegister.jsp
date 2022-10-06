<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Engineer Id Generator</title>
<link rel="stylesheet" type="text/css" href="../cssCode/back.css" />
</head>
<body>
<table class="login">
<tr><th><a  href="../index.html" >HOME</a></th>  <th><a href="../htmlCode/englogin.html" >LOGIN</a></th><tr>
</table>
<font size=6px><b></b><h2><center>Online Bike Service Portal</center></h2></font>
<div class="abc">
<h1><center>Enigneer Id</center></h1><hr><br>
<pre>
<font>
  Hi.. Thanks for the registeration. 
  Your Engineer Id is here...
  </font>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
	<%
	String approval="";
	String email = (String)session.getAttribute("email");	
	try{Class.forName(dbcon.dbdriver());
	Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst= conn.prepareStatement("select * from eng where email=?");	
	pst.setObject(1, email);
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{	
		approval = pass.getString("approval");
		int eng_id = pass.getInt("eng_id");
		if(approval.equals("approval"))
		{	
		  out.println("<b><div> Engineer ID:"+eng_id+"</div></b><br>");
		  session.setAttribute("emg_id",eng_id);
		}
		else if(approval.equals("deny"))
		{
			out.println("<body><h2> Sorry your service request is rejected</h2></body>");	
		}
		else
		{
			out.println("<body><h2> wait for the approval</h2></body>");
			out.println("<a href='../jspCode/engRegister.jsp'><button>REFRESH</button></a>");
		} 
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }
	%>
</pre></div>
</body>
</html>