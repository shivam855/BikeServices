<%@page import="java.sql.*" %>
<%@page import="dbcon.*" %>
	<%
	String str="";
	String s1 = request.getParameter("tf1");
	int x = Integer.parseInt(s1);
	String s2 = request.getParameter("tf2");
	try{
		Class.forName(dbcon.dbdriver());
		Connection conn=DriverManager.getConnection(dbcon.db(), dbcon.dbname(), dbcon.dbpass());
	PreparedStatement pst= conn.prepareStatement("select * from eng where eng_id=? ");
	pst.setInt(1, x);	
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{
		 str = pass.getString("password");		
	}
	if(s2.equals(str) && x != 0)
	{
		response.sendRedirect("../jspCode/engineerBase.jsp");
		session.setAttribute("eng_id",x);
	}
	else	
	{
		response.sendRedirect("../htmlCode/engineerlogin1.html");			
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }

	%>
	