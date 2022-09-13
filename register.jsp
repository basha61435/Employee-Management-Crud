<%@ page import="java.sql.* "%>
<%
Integer eid=Integer.parseInt(request.getParameter("eid"));
String name=request.getParameter("uname");
String password=request.getParameter("pwd");
String email=request.getParameter("email");
long mobileno=Long.parseLong(request.getParameter("phno"));
String gender=request.getParameter("gen");
String address=request.getParameter("addr");
String country=request.getParameter("country");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","basha1","basha123");
	
	PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?)");
	ps.setInt(1,eid );
	ps.setString(2,name);
	ps.setString(3,password);
	ps.setString(4,email);
	ps.setLong(5, mobileno);
	ps.setString(6,gender);
	ps.setString(7,address);
	ps.setString(8, country);

	int i=ps.executeUpdate();
	
	out.println("<h1 style=color:blue>"+i+"  record inserted"+"</h1>");
	con.close();
	
	
}
catch(Exception ex)
{
	out.println(ex);
}


%>