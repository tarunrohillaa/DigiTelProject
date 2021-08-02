<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User</title>
</head>
<body>



<%
String id=request.getParameter("id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydb1", "root", "1@Rootpassword");
Statement st=conn.createStatement();
int i = st.executeUpdate("DELETE FROM userlogin WHERE id='"+id+"'");

if(i>0){
	out.println("<script type=\"text/javascript\">");
    out.println("alert('User has been deleted successfully!');");
    out.println("window.location.href = \"admindashboard.jsp\";");
    out.println("</script>");
	//response.sendRedirect("./Dashboard.jsp");
}
else{
	out.println("Error occured");
}
%>
</body>
</html>