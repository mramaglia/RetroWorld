<!DOCTYPE html>
<html>
<head>
  <%@include file="template/head.jsp" %>
  <title>Registrazione Utente</title>
</head>
<body>
  <%@include file="template/header.jsp" %>
  <h1>Registrazione Utente</h1>
  <form id="registrationForm" onsubmit="registerUser(event)">
    <label for="name">Nome:</label>
    <input type="text" id="name" required>

    <label for="email">Email:</label>
    <input type="email" id="email" required>

    <label for="password">Password:</label>
    <input type="password" id="password" required>

    <input type="submit" value="Registrati">
  </form>

  <script src="app.js"></script>
</body>
</html>
