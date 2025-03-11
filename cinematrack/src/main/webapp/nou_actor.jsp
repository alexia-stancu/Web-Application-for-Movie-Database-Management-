<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*, java.math.*, db.*, java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adaugă Actor</title>
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

form input[type="text"], form select {
    width: 65%; 
    height: 40px; 
    padding: 10px; 
    border: 1px solid #ffffff;
    border-radius: 7.5px;
    background-color: #3e3e6b;
    color: #ffffff;
    box-sizing: border-box; 
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
            var errorContainer = document.getElementById("errorContainer");
            if (errorContainer && errorContainer.style.display === "block") {
                hideError();
            }
        };
    </script>
</head>
<body>
	<header>
		<h1>🎬 CinemaTrack - Adaugă Actor 🎥</h1>
	</header>
	<div class="content">
		<%
        String id1 = request.getParameter("idfilm");
        String id2 = request.getParameter("idproducator");
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String rol = request.getParameter("rol");

        // Verifica dacă formularul a fost trimis si datele nu sunt complete
        if (request.getMethod().equalsIgnoreCase("POST")) {
            if (id1 != null && id2 != null && nume != null && prenume != null && rol != null &&
                !id1.trim().isEmpty() && !id2.trim().isEmpty() && !nume.trim().isEmpty() && !prenume.trim().isEmpty() && !rol.trim().isEmpty()) {
                jb.connect();
                jb.adaugaActor(Integer.parseInt(id1), Integer.parseInt(id2), nume, prenume, rol);
                jb.disconnect();
                response.sendRedirect("adaugare_cu_succes_actor.jsp");
            } else {
        %>
		<div class="error-container" id="errorContainer"
			style="display: block;">
			<h2>⚠️ Eroare! Trebuie să introduci date în toate câmpurile
				pentru a putea efectua adăugarea!</h2>
		</div>
		<%
            }
        }
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("filme");
        ResultSet rs2 = jb.vedeTabela("producatori");
        %>
		<h3>Adaugă un actor nou:</h3>
		<form action="nou_actor.jsp" method="post">
			<table>
				<tr>
					<td><label for="idfilm">Film:</label></td>
					<td><select name="idfilm" id="idfilm">
							<option value="">-- Selectează filmul --</option>
							<%
                        while (rs1.next()) {
                            int idfilm = rs1.getInt("idfilm");
                            String titlu = rs1.getString("titlu");
                           /* String gen = rs1.getString("gen");
                            String an_lansare = rs1.getString("an_lansare");
                            String durata = rs1.getString("durata");
                            String descriere = rs1.getString("descriere");*/
                        %>
							<option value="<%=idfilm%>"><%=titlu%>	</option>
							<%
                        }
                        %>
					</select></td>
				</tr>
				<tr>
					<td><label for="idproducator">Producător:</label></td>
					<td><select name="idproducator" id="idproducator">
							<option value="">-- Selectează producătorul --</option>
							<%
                        while (rs2.next()) {
                            int idproducator = rs2.getInt("idproducator"); 
                            String numep = rs2.getString("nume");
                            String prenumep = rs2.getString("prenume");
                           /* String adresa = rs2.getString("adresa");
                            String nationalitate = rs2.getString("nationalitate");
                            String venit = rs2.getString("venit");*/
                        %>
							<option value="<%=idproducator%>"><%=numep%>
								<%=prenumep%></option>
							<%
                        }
                        %>
					</select></td>
				</tr>
				<tr>
					<td><label for="nume">Nume Actor:</label></td>
					<td><input type="text" name="nume" id="nume" /></td>
				</tr>
				<tr>
					<td><label for="prenume">Prenume Actor:</label></td>
					<td><input type="text" name="prenume" id="prenume" /></td>
				</tr>
				<tr>
					<td><label for="rol">Rol:</label></td>
					<td><input type="text" name="rol" id="rol" /></td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<input type="submit" value="➕ Adaugă Actorul" />
			</div>
		</form>
		<%
        jb.disconnect();
        %>
		<div class="home-icon">
			<a href="index.html" title="Înapoi la Acasă">🏠</a>
		</div>
	</div>
	<footer>
		<p>&copy; 2025 CinemaTrack. Toate drepturile rezervate.</p>
	</footer>
</body>
</html>
