<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="template/head.jsp" %>
    <title>Add Product</title>
</head>
<body>
	<%@include file="template/header.jsp" %>
	<script src="js/add-product.js"></script>

    <h1>Add Product</h1>
    
    <form action="addProductServlet" method="post" enctype="multipart/form-data">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" ><br>
        
        <label for="price">Price:</label>
        <input type="number" name="price" id="price" step="0.01" ><br>
        
        <label for="description">Description:</label>
        <textarea name="description" id="description" ></textarea><br>
        
        <label for="brand">Brand:</label>
        <select name="brand" id="brand"  onchange="changeParameter(this.value)">
            <option value="" disabled selected>Select brand</option>
            <option value="nintendo">Nintendo</option>
            <option value="sony">Sony</option>
            <option value="sega">Sega</option>
            <option value="microsoft">Microsoft</option>
        </select><br>
        
        <label for="console">Console:</label>
        <select name="console" id="console" >
            <option value="" disabled selected>Select console</option>
        </select><br>
        <label for="type">Type:</label>
        <select name="type" id="type">
            <option value="console">Console</option>
            <option value="game">Game</option>
            <option value="accessory">Accessory</option>
        </select><br>
        <label for="amount">Amount:</label>
        <input type="number" name="amount" id="amount" ><br>
        
        <label for="tag">Tag:</label>
        <input type="text" name="tag" id="tag"><br>
        <input type="file" name="image" id="image">
        <input type="submit" value="Add Product">
        
    </form>
</body>
</html>
