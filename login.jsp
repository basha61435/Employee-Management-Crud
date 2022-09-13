<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* "%>
<% 

String email=request.getParameter("email");
String password=request.getParameter("pwd");

try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
PreparedStatement ps=con.prepareStatement("select * from employee where email=? and password=?");
ps.setString(1,email) ;
ps.setString(2,password);
 
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	response.sendRedirect("userhome.html");
}
else
{
	out.println("<h1 style=color:red>please enter valid user name and password</h1>");
}
}
catch(Exception ex)
{
	out.println(ex);
}



%>