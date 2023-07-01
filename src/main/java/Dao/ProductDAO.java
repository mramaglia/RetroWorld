package Dao;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Database.Database;
import entity.Product;


public class ProductDAO {
    private Database connection;

    public ProductDAO(Database database) {
        this.connection = database;
    }
    
    public List<Product> findAll() throws SQLException {
        List<Product> productList = new ArrayList<>();

        try (Connection conn = connection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM product");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("product_name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String tag = rs.getString("tag");
                String type = rs.getString("product_type");
                int brandId = rs.getInt("brand_id");
                int consoleId = rs.getInt("console_id");
                Blob imageBlob = rs.getBlob("image");
                InputStream inputStream = imageBlob.getBinaryStream();

                Product product = new Product(id, name, price, description, brandId, consoleId, amount, tag, type, inputStream);
                productList.add(product);
            }
        }

        return productList;
    }

	public void addProduct(Product product) throws SQLException {
        PreparedStatement stmt = null;
        Connection conn = null;
        
        try {
        	conn = connection.getConnection();
            stmt = conn.prepareStatement("INSERT INTO product (product_name, description, brand_id, console_id, product_type, amount, tag, image, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setInt(3, product.getBrandId());
            stmt.setInt(4, product.getConsoleId());
            stmt.setString(5, product.getType());
            stmt.setInt(6, product.getAmount());
            stmt.setString(7, product.getTag());
            stmt.setBinaryStream(8, product.getImage());
            stmt.setDouble(9, product.getPrice());
            stmt.executeUpdate();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }

	public Product getProductById(int productId) throws SQLException {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    Product product = null;

	    try {
	        conn = connection.getConnection();
	        String query = "SELECT * FROM product WHERE id = ?";
	        stmt = conn.prepareStatement(query);
	        stmt.setInt(1, productId);
	        rs = stmt.executeQuery();

	        if (rs.next()) {
	        	int id = rs.getInt("id");
                String name = rs.getString("product_name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                int amount = rs.getInt("amount");
                String tag = rs.getString("tag");
                String type = rs.getString("product_type");
                int brandId = rs.getInt("brand_id");
                int consoleId = rs.getInt("console_id");
                Blob imageBlob = rs.getBlob("image");
                InputStream inputStream = imageBlob.getBinaryStream();
                
	            // Creare l'oggetto Product con i dati ottenuti dal database
	            product = new Product(id, name, price, description, brandId, consoleId, amount, tag, type, inputStream);
	        }

	    } finally {
	        if (rs != null) {
	            rs.close();
	        }
	        if (stmt != null) {
	            stmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    }

	    return product;
	}

	public ProductDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
