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
<title>Tabela Filme</title>
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

.content table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0 40px;
	color: #ffffff;
}

.content table th, .content table td {
	border: 1px solid #ffffff;
	padding: 10px;
	text-align: center;
}

.content table th {
	background-color: #3e3e6b;
	color: #f39c12;
}

.content table tr:nth-child(even) {
	background-color: rgba(255, 255, 255, 0.1);
}

.button-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin: 20px 0;
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
	width: 225px;
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

.confirm-dialog {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #24243e;
	color: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
	z-index: 1000;
	text-align: center;
	width: 300px;
}

.confirm-dialog h3 {
	margin: 0 0 15px;
	font-size: 1.2rem;
	color: #f39c12;
}

.confirm-dialog button {
	background-color: #f39c12;
	border: none;
	padding: 10px 20px;
	margin: 10px;
	color: #ffffff;
	font-weight: bold;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.confirm-dialog button:hover {
	background-color: #e67e22;
}

.confirm-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 999;
}
</style>
<script>
	function validateDeletion() {
		const checkboxes = document.querySelectorAll('input[name="primarykey"]:checked');
		if (checkboxes.length === 0) {
			window.location.href = "eroare_film.jsp";
			return false;
		}
		showConfirmationDialog();
		return false;
	}

	function showConfirmationDialog() {
		const overlay = document.createElement('div');
		overlay.className = 'confirm-overlay';

		const dialog = document.createElement('div');
		dialog.className = 'confirm-dialog';

		const title = document.createElement('h3');
		title.textContent = 'Mesaj de confirmare';
		dialog.appendChild(title);

		const message = document.createElement('p');
		message.textContent = 'Ești sigur că vrei să ștergi liniile selectate?';
		dialog.appendChild(message);

		const confirmButton = document.createElement('button');
		confirmButton.textContent = 'Confirmă';
		confirmButton.onclick = function () {
			document.querySelector('form').submit();
			document.body.removeChild(overlay);
		};
		dialog.appendChild(confirmButton);

		const cancelButton = document.createElement('button');
		cancelButton.textContent = 'Anulează';
		cancelButton.onclick = function () {
			document.body.removeChild(overlay);
		};
		dialog.appendChild(cancelButton);

		overlay.appendChild(dialog);
		document.body.appendChild(overlay);
	}
</script>
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Tabela Filme 🎥</h1>
	</header>
	<div class="content">
		<h2>Lista de Filme</h2>
		<form action="sterge_film.jsp" method="post"
			onsubmit="return validateDeletion();">
			<table>
				<thead>
					<tr>
						<th>Mark</th>
						<th>IdFilm</th>
						<th>Titlu</th>
						<th>Gen</th>
						<th>An lansare</th>
						<th>Durata</th>
						<th>Descriere</th>
					</tr>
				</thead>
				<tbody>
					<%
					jb.connect();
					ResultSet rs = jb.vedeTabela("filme");
					long x;
					while (rs.next()) {
						x = rs.getInt("idfilm");
					%>
					<tr>
						<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
						<td><%=x%></td>
						<td><%=rs.getString("titlu")%></td>
						<td><%=rs.getString("gen")%></td>
						<td><%=rs.getInt("an_lansare")%></td>
						<td><%=rs.getString("durata")%></td>
						<td><%=rs.getString("descriere")%></td>
					</tr>
					<%
					}
					rs.close();
					jb.disconnect();
					%>
				</tbody>
			</table>
			<div class="button-container">
				<a href="nou_film.jsp">➕ Adaugă un nou film</a> <a href="index.html">🏠
					Acasă</a> <input type="submit" value="❌ Șterge liniile marcate" />
			</div>
		</form>
	</div>
	<footer>
		<p>&copy; 2025 CinemaTrack. Toate drepturile rezervate.</p>
	</footer>
</body>
</html>
