<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
	<%
	String str ="";
	String s1 = request.getParameter("tf1");
	String s2 = request.getParameter("tf2");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst= conn.prepareStatement("select * from eng where email=? ");
	pst.setString(1, s1);	
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{
		 str = pass.getString("password");		
	}
	if(s2.equals(str) && s1!= null && str!= null )
	{
		response.sendRedirect("../htmlCode/Service.html");	
	}
	else
	{
		response.sendRedirect("../htmlCode/login.html");	
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }
%>