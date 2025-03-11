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
<title>Modifică producător</title>
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
	max-width: 800px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

.content h2 {
	color: #f39c12;
	margin-bottom: 30px;
	font-size: 2rem;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

form table {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
	text-align: left;
	color: #ffffff;
	margin-bottom: 20px;
}

form table td {
	padding: 7.5px;
}

form table td:first-child {
	text-align: right;
	width: 30%;
}

form table td:last-child {
	text-align: left;
	width: 60%;
}

form input[type="text"] {
	width: 55%;
	padding: 10px;
	border: 1px solid #ffffff;
	border-radius: 7.5px;
	background-color: #3e3e6b;
	color: #ffffff;
}

form input[type="submit"] {
	background-color: #f39c12;
	border-radius: 8px;
	padding: 15px 30px;
	color: #ffffff;
	font-weight: bold;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
	text-decoration: none;
	transition: transform 0.2s ease, background-color 0.3s ease;
	cursor: pointer;
	width: 200px;
	text-align: center;
}

form input[type="submit"]:hover {
	background-color: #e67e22;
	transform: translateY(-5px);
}

form input[type="submit"]:active {
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

.home-icon {
	margin-top: 40px;
}

.home-icon a {
	display: inline-block;
	color: #f39c12;
	font-size: 2rem;
	text-decoration: none;
	transition: transform 0.3s ease;
}

.home-icon a:hover {
	transform: scale(1.5);
	color: #e67e22;
}
</style>
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Modificare Producători 🎥</h1>
	</header>
	<div class="content">
		<h2>Modifică un producător:</h2>

		<%
		String[] selectedKeys = request.getParameterValues("primarykey");

		if (selectedKeys == null || selectedKeys.length != 1) {
			response.sendRedirect("eroare_modificare_producator.jsp");
			return;
		}

		String selectedKey = selectedKeys[0];
		%>

		<%
		jb.connect();
		int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
		ResultSet rs = jb.intoarceLinieDupaId("producatori", "idproducator", aux);
		rs.first();
		String nume = rs.getString("nume");
		String prenume = rs.getString("prenume");
		String adresa = rs.getString("adresa");
		String nationalitate = rs.getString("nationalitate");
		String venit = rs.getString("venit");
		rs.close();
		jb.disconnect();
		%>

		<form action="m2_producator.jsp" method="post">
			<table align="center">
				<tr>
					<td align="right">IdProducător:</td>
					<td><input type="text" name="idproducator" size="30"
						value="<%=aux%>" readonly /></td>
				</tr>
				<tr>
					<td align="right">Nume:</td>
					<td><input type="text" name="nume" size="30" value="<%=nume%>" /></td>
				</tr>
				<tr>
					<td align="right">Prenume:</td>
					<td><input type="text" name="prenume" size="30"
						value="<%=prenume%>" /></td>
				</tr>
				<tr>
					<td align="right">Adresă:</td>
					<td><input type="text" name="adresa" size="30"
						value="<%=adresa%>" /></td>
				</tr>
				<tr>
					<td align="right">Naționalitate:</td>
					<td><input type="text" name="nationalitate" size="30"
						value="<%=nationalitate%>" /></td>
				</tr>
				<tr>
					<td align="right">Venit:</td>
					<td><input type="text" name="venit" size="30"
						value="<%=venit%>" /></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<input type="submit" value="✏️ Modifică linia" />
			</div>
		</form>

		<div class="home-icon">
			<a href="index.html" title="Înapoi la Acasă">🏠</a>
		</div>
	</div>
	<footer>
		<p>&copy; 2025 CinemaTrack. Toate drepturile rezervate.</p>
	</footer>
</body>
</html>
