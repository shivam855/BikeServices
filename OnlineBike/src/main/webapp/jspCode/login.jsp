<html>
<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
	<%
	String str="";
	String user="";
	String s1 = request.getParameter("tf1");
	int x = Integer.parseInt(s1);
	String s2 = request.getParameter("tf2");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst= conn.prepareStatement("select * from cus_details where user_id=? ");
	pst.setInt(1, x);	
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{
		 str = pass.getString("password");
		 user = pass.getString("name");
	}
	if(s2.equals(str) && x != 0)
	{
		response.sendRedirect("../jspCode/onlinebike.jsp");	
		session.setAttribute("user_id",x);
		session.setAttribute("user_name",user);
	}
	else	
	{
		response.sendRedirect("../htmlCode/login1.html");			
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }
	%>
</html>	