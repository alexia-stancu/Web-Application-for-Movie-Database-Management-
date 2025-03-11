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
<title>Ștergere Actor</title>
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

.content h2 {
	color: #f39c12;
	margin-bottom: 30px;
	font-size: 2rem;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
}

.success-container {
	color: #ffffff;
	padding: 20px;
	margin-bottom: 20px;
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
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Șterge Actor 🎥</h1>
	</header>
	<div class="content">
		<%
		String[] s = request.getParameterValues("primarykey");
		jb.connect();
		jb.stergeDateTabela(s, "actori", "idactor");
		jb.disconnect();
		%>
		<h2>Datele au fost șterse cu succes!</h2>
		<a href="tabela_actori.jsp" class="view-button">🎬 Vizualizează
			Actori</a>
		<div class="home-icon">
			<a href="index.html" title="Înapoi la Acasă">🏠</a>
		</div>
	</div>
	<footer>
		<p>&copy; 2025 CinemaTrack. Toate drepturile rezervate.</p>
	</footer>
</body>
</html>
