<!DOCTYPE html>
<html>
<head>
<%@include file="template/head.jsp" %>
  <title>Login Utente</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%@include file="template/header.jsp" %>
  <h1>Login Utente</h1>
  <form id="loginForm" onsubmit="loginUser(event)">
    <label for="email">Email:</label>
    <input type="email" id="email" required>

    <label for="password">Password:</label>
    <input type="password" id="password" required>

    <input type="submit" value="Accedi">
  </form>

  <script src="app.js"></script>
</body>
</html>
