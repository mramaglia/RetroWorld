
<%@ page import="java.util.Base64" %>
<%@ page import="entity.Product" %>
<%@ page import="java.io.InputStream" %>


<html>
<head>
	<%@include file="template/head.jsp" %>
	<link rel="stylesheet" href="css/style_product.css">
    <title>Product Details</title>
</head>
<body>
	<%@include file="template/header.jsp" %>
    <% Product product = (Product) request.getAttribute("product"); %>
    <div class="page">
	    <div class="container_p">
			<div id="image_p">
		    	<%-- Converte l'input stream dell'immagine in un formato visualizzabile --%>
			    <% if (product.getImage() != null) {
			        InputStream inputStream = product.getImage();
			        byte[] imageBytes = new byte[inputStream.available()];
			        inputStream.read(imageBytes);
			        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			    %>
			        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Product Image">
			    <% } %>
		    </div>
		    
		  	<div id="info_p">
			  	<%
				int brandID = product.getBrandId(); // Ottenere il valore da product.getBrandId()
				String brandImageURL = "image_brand/brand_" + String.valueOf(brandID) + ".png";
				%>
	
				<img src="<%= brandImageURL %>" alt="Brand image" class="brand_logo" style="width: 100px;")>
			    <p>
			    <span id="name"><%= product.getName() %></span>
			    </p>
			    <hr class="divider">
			    <div class="a_c">
				    <p id="amount">Amount:<%= product.getAmount() %></p>
				    <p id="tag">Tag:<%= product.getTag() %></p>
			    </div>
			    
			    <div class="img_price">
			    	<img src="image/coin.png" id="img">
			    	<p id="price" style="font-size:20px">$<%= product.getPrice()%></p>
			    </div>
			    <p id="description"><%= product.getDescription() %></p>
			    
			    <form action="" method="get" class=form_p>
			    	<div class="quantity_container">
				    	<label for="quantity">Quantity:</label>
						<input type="number" id="quantity" name="quantity" min="1" max="100" step="1" style="width: 20px;">
					</div>
					<input type="submit" value="ADD TO CART" id="button">
			    </form>
		    </div>
	    </div>
	    <div class="corr">
		    <p>Correlati</p>
			<hr class="divider_c"> 
		</div>
   	</div>

	
</body>
</html>