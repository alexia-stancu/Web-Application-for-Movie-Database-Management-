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
<title>Adaugă Film</title>
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
	max-width: 800px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
}

.content h3 {
	color: #f39c12;
	margin-bottom: 30px;
	font-size: 2rem;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.error-container {
	background-color: rgba(255, 0, 0, 0.8);
	color: #f39c12;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	margin-bottom: 20px;
	font-size: 0.75rem;
	display: none; 
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
	width: 65%;
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

.view-button {
	background-color: #f39c12;
	color: #ffffff;
	font-weight: bold;
	padding: 15px 30px;
	text-decoration: none;
	border-radius: 8px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
	display: inline-block;
	margin-top: 20px;
	transition: transform 0.3s ease, background-color 0.3s ease;
	cursor: pointer;
}

.view-button:hover {
	background-color: #e67e22;
	transform: translateY(-5px);
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
<script>
	function hideError() {
		setTimeout(function() {
			var errorContainer = document.getElementById("errorContainer");
			errorContainer.style.display = "none"; // Ascunde mesajul după 5 secunde
		}, 5000); // 5 secunde
	}

	window.onload = function() {
		// Verificăm dacă există mesaj de eroare
		var errorContainer = document.getElementById("errorContainer");
		if (errorContainer && errorContainer.style.display === "block") {
			hideError();
		}
	};
</script>
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Adaugă Film 🎥</h1>
	</header>
	<div class="content">
		<%
		String titlu = request.getParameter("titlu");
		String gen = request.getParameter("gen");
		String an_lansare = request.getParameter("an_lansare");
		String durata = request.getParameter("durata");
		String descriere = request.getParameter("descriere");

		if (titlu != null && gen != null && an_lansare != null && durata != null && descriere != null && !titlu.trim().isEmpty()
				&& !gen.trim().isEmpty() && !an_lansare.trim().isEmpty() && !durata.trim().isEmpty()
				&& !descriere.trim().isEmpty()) {
			jb.connect();
			jb.adaugaFilm(titlu, gen, an_lansare, durata, descriere);
			jb.disconnect();
			// Redirectionare catre pagina de succes dupa adaugare
			response.sendRedirect("adaugare_cu_succes_film.jsp");
		%>
		<%
		} else if (titlu != null) {
		%>
		<div class="error-container" id="errorContainer"
			style="display: block;">
			<h2>⚠️ Eroare! Trebuie să introduci date în toate câmpurile
				pentru a putea efectua adăugarea!</h2>
		</div>
		<%
		}
		%>
		<h3>Adaugă un film nou:</h3>
		<form action="nou_film.jsp" method="post">
			<table>
				<tr>
					<td><label for="titlu">Titlu film:</label></td>
					<td><input type="text" name="titlu" id="titlu" /></td>
				</tr>
				<tr>
					<td><label for="gen">Gen film:</label></td>
					<td><input type="text" name="gen" id="gen" /></td>
				</tr>
				<tr>
					<td><label for="an_lansare">An lansare:</label></td>
					<td><input type="text" name="an_lansare" id="an_lansare" /></td>
				</tr>
				<tr>
					<td><label for="durata">Durata:</label></td>
					<td><input type="text" name="durata" id="durata" /></td>
				</tr>
				<tr>
					<td><label for="descriere">Descriere:</label></td>
					<td><input type="text" name="descriere" id="descriere" /></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<input type="submit" value="➕ Adaugă Filmul" />
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
