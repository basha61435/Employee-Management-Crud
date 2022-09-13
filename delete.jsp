<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.* "%>
    <% 
int eid=Integer.parseInt(request.getParameter("eid"));
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
			PreparedStatement ps=con.prepareStatement("delete from employee where eid=?");
			ps.setInt(1, eid);
			int i=ps.executeUpdate();
			if(i==0)
			{
				out.println("<h1 style=color:red>record not found</h1>");
				
			}else
			{
				out.println(i+"<h1 style=color:blue>recoard is deleted</h1>");
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		
			}
    %>