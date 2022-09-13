<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* "%>
<%
int eid=Integer.parseInt(request.getParameter("eid"));
String name=request.getParameter("uname");
String password=request.getParameter("pwd");
String email=request.getParameter("email");
String mobileno=request.getParameter("phno");
String address=request.getParameter("addr");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
	PreparedStatement ps=con.prepareStatement("update employee set name=?,password=?,email=?,mobileno=?,address=? where eid=?");
	ps.setString(1,name);
	ps.setString(2,password);
	ps.setString(3,email);
	ps.setString(4,mobileno);
	ps.setString(5,address);
	ps.setInt(6, eid);
	int i=ps.executeUpdate();
	if(i==0)
	{
		out.println("<h1 style=color:red>record not found</h1>");
	}else
	{
		out.println(i+"<h1 style=color:blue>recoard is update</h1>");
	}
	con.close();
}
catch(Exception ex)
{
	out.println(ex);

	}


%>