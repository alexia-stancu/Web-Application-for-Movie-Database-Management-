<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eroare</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	color: #ffffff;
	background: linear-gradient(135deg, #1e1e2f, #3e3e6b);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	text-align: center;
}

.error-container {
	background-color: rgba(255, 0, 0, 0.8);
	color: #ffffff;
	padding: 30px 20px;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	width: 90%;
	max-width: 600px;
}

.error-container h1 {
	margin: 0 0 20px;
	font-size: 2.5rem;
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
}

.error-container p {
	font-size: 1.2rem;
	margin: 10px 0 20px;
}

.button-container {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 20px;
}

.button-container a {
	background-color: #f39c12;
	color: #ffffff;
	padding: 15px 30px;
	border-radius: 8px;
	text-decoration: none;
	font-weight: bold;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
	transition: transform 0.2s ease, background-color 0.3s ease;
	width: 200px;
	text-align: center;
	display: inline-block;
}

.button-container a:hover {
	background-color: #e67e22;
	transform: translateY(-5px);
}

.button-container a:active {
	transform: scale(0.95);
	background-color: #d35400;
}
</style>
</head>
<body>
	<div class="error-container">
		<h1>⚠️ Eroare!</h1>
		<p>Trebuie să selectezi o singura linie pentru a efectua
			modificarea!</p>
		<div class="button-container">
			<a href="modifica_film.jsp">🔙 Înapoi la tabel</a> <a
				href="index.html">🏠 Înapoi la Acasă</a>
		</div>
	</div>
</body>
</html>
