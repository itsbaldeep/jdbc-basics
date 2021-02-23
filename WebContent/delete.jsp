<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" errorPage="error.jsp"%>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://localhost:3306/jdbc";
	Connection con = DriverManager.getConnection(url, "root", "");
	Statement st = con.createStatement();
	String rollno = request.getParameter("rollno");
	st.executeQuery("DELETE FROM people WHERE rollno = " + rollno);
	st.close();
	con.close();
	response.sendRedirect("/" + application.getServletContextName() + "/index.jsp");
%>