
<!DOCTYPE html>
<html>
<head>
    <title>Lista Prodotti</title>
    <%@ page import="java.util.Base64" %>
	<%@ page import="entity.Product" %>
	<%@ page import="java.io.InputStream" %>
	<%@ page import="java.util.List" %>
	<%@include file="template/head.jsp" %>
</head>
<body>
<%@include file="template/header.jsp" %>
<style>
	td{
		text-align:center;
	}

	
</style>

    <h1>Lista Prodotti</h1>
    <table id="productTable" style="width:100%; padding:20px;">
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Nome</th>
            <th>Prezzo</th>

        </tr>
        <% 
			List<Product> productList = (List<Product>) request.getAttribute("productList");
			    for (Product product : productList) {
			        // Visualizza le informazioni del prodotto
			%>
			<tbody>
		        <tr>
		            <td><%= product.getId() %></td>
		            <td>
						    <% if (product.getImage() != null) {
						        InputStream inputStream = product.getImage();
						        byte[] imageBytes = new byte[inputStream.available()];
						        inputStream.read(imageBytes);
						        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
						    %>
						        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Product Image" style="width:100px; height:auto;">
						    <% } %>
				    
			    	</td>
		            <td><%= product.getName() %></td>
		            <td><%= product.getPrice() %></td>
		            <td>
		            	<form method="get" action="product">
		            		<input type="hidden" name="id" value="<%=product.getId()%>">
		            		<input type="hidden" name="admin" value="1">
		            		<input type="submit" value="EDIT">
		            	</form>
		            </td>
		            <!-- Altre colonne dei prodotti -->
			        
			<%
			   }
		%>
		</tr>
		</tbody>
    </table>
</body>
</html>