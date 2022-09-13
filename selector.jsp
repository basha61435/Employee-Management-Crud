<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* "%>
<%
String eid=request.getParameter("eid");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
	PreparedStatement ps=con.prepareStatement("select*from employee where eid=?");
	
	ps.setString(1, eid);
	ResultSet rs=ps.executeQuery();
	
	ResultSetMetaData rss=rs.getMetaData();
	int n=rss.getColumnCount();
	
	
		
		if(rs.next())
		{
			out.println("<table border='1' style=border-collapse:collapse");
			
			out.println("<tr>");
				for(int i=1;i<=n;i++)
					
					
					out.println("<td><br>"+rss.getColumnName(i));
					out.println("</tr>");
	for(int i=1;i<=n;i++)
	
		out.print("<td><br>"+rs.getString(i));
		out.println("<tr>");
	
	out.println("</table>");
	}
		else
	out.print("<h1 style=color:red>record not found</h1>");
	
}
catch(Exception ex)
{
	out.println(ex);
}
%>