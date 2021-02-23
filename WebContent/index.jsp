<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JDBC Basics</title>
<style>
	table, td, th {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://localhost:3306/jdbc";
		Connection con = DriverManager.getConnection(url, "root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM people ORDER BY rollno ASC");
	%>
	<h1>Insert Values</h1>
	<form action="insert.jsp" method="POST">
		<div>
			<label>Roll no: </label>
			<input type="number" name="rollno" required/>
		</div>
		<div>
			<label>Name: </label>
			<input type="text" name="name" required/>
		</div>
		<br>
		<input type="submit" value="Submit" />
	</form>
	<h1>Delete Values</h1>
	<form action="delete.jsp" method="POST">
		<div>
			<label>Roll no: </label>
			<input type="number" name="rollno" required/>
		</div>
		<br>
		<input type="submit" value="Submit" />
	</form>
	<h1>Current Values</h1>
	<table>
		<tr>
			<th>Roll no.</th>
			<th>Name</th>
		</tr>
		<% while (rs.next()) { %>
		<tr>
			<td><%= rs.getInt("rollno") %></td>
			<td><%= rs.getString("name") %></td>
		</tr>
		<% } %>
	</table>
	<%
		st.close();
		con.close();
	%>
</body>
</html>