<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tabela Producători</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	color: #ffffff;
	background: linear-gradient(135deg, #1e1e2f, #3e3e6b);
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	animation: fadeIn 1.5s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
header {
	background-color: #24243e;
	color: #ffffff;
	padding: 20px 0;
	text-align: center;
	border-bottom: 3px solid #f39c12;
}

header h1 {
	margin: 0;
	font-size: 2.5rem;
	text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
}

.content {
	flex: 1;
	padding: 40px;
	text-align: center;
	background-color: rgba(36, 36, 62, 0.9);
	margin: 20px auto;
	width: 90%;
	max-width: 1200px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

.content h2 {
	color: #f39c12;
	margin-bottom: 30px;
	font-size: 2rem;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.table-container {
	overflow-x: auto;
	margin-bottom: 20px;
}

.table-container table {
	width: 100%;
	border-collapse: collapse;
	background-color: #3e3e6b;
	color: #ffffff;
	border-radius: 0px;
	overflow: hidden;
}

.table-container th, .table-container td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ffffff;
}

.table-container th {
	background-color: #f39c12;
	color: #ffffff;
	font-weight: bold;
}

.table-container tr:nth-child(even) {
	background-color: rgba(255, 255, 255, 0.1);
}

.button-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 40px;
}

.button-container a, .button-container input[type="submit"] {
	background-color: #f39c12;
	border-radius: 8px;
	padding: 15px 30px;
	color: #ffffff;
	font-weight: bold;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
	text-decoration: none;
	transition: transform 0.2s ease, background-color 0.3s ease;
	width: 234px;
	text-align: center;
	cursor: pointer;
}

.button-container a:hover, .button-container input[type="submit"]:hover
	{
	background-color: #e67e22;
	transform: translateY(-5px);
}

.button-container a:active, .button-container input[type="submit"]:active
	{
	transform: scale(0.95);
	background-color: #d35400;
}

footer {
	background-color: #2e2e4f;
	color: #ffffff;
	text-align: center;
	padding: 15px 0;
	border-top: 2px solid #f39c12;
	font-size: 0.9rem;
}
</style>
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Tabela Producători 🎥</h1>
	</header>
	<div class="content">
		<h2>Lista producătorilor</h2>
		<form action="m1_producator.jsp" method="post">
			<div class="table-container">
				<table>
					<thead>
						<tr>
							<th>Select</th>
							<th>IdProducator</th>
							<th>Nume</th>
							<th>Prenume</th>
							<th>Adresa</th>
							<th>Naționalitate</th>
							<th>Venit</th>
						</tr>
					</thead>
					<tbody>
						<%
						jb.connect();
						ResultSet rs = jb.vedeTabela("producatori");
						long x;
						while (rs.next()) {
							x = rs.getLong("idproducator");
						%>
						<tr>
							<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
							<td><%=x%></td>
							<td><%=rs.getString("nume")%></td>
							<td><%=rs.getString("prenume")%></td>
							<td><%=rs.getString("adresa")%></td>
							<td><%=rs.getString("nationalitate")%></td>
							<td><%=rs.getString("venit")%></td>
						</tr>
						<%
						}
						rs.close();
						jb.disconnect();
						%>
					</tbody>
				</table>
			</div>
			<div class="button-container">
				<a href="nou_producator.jsp">➕ Adaugă un nou producător</a> <a
					href="index.html">🏠 Acasă</a> <input type="submit"
					value="✏️ Modifică liniile selectate" />
			</div>
		</form>
	</div>
	<footer>
		<p>&copy; 2025 CinemaTrack. Toate drepturile rezervate.</p>
	</footer>
</body>
</html>
