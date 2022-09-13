<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* "%>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
	PreparedStatement ps=con.prepareStatement("select *  from emp where id=? and name=?");
	ps.setInt(1, id);
	ps.setString(2, name);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		out.print("login successfull");
	}
	else {
		out.print("enter valid details");
	}
}
catch(Exception e)
{
	out.print(e);
}
%>