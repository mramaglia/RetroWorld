package control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDAO;
import Database.Database;
import entity.Product;

@WebServlet("/product")
public class viewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
       
   @Override
   public void init() throws ServletException{
	   super.init();
	Database connection = new Database();
	productDAO = new ProductDAO(connection);
   }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));
		int isAdmin = Integer.parseInt(request.getParameter("admin"));
		
		try {
			Product product = productDAO.getProductById(productId);
            if (product != null) {
                // Imposta l'oggetto Product come attributo della richiesta
            	request.setAttribute("product", product);
            	if(isAdmin == 1)
            		request.getRequestDispatcher("/product_edit.jsp").forward(request, response);
            	else {
            		isAdmin = 0;
            	request.getRequestDispatcher("/product.jsp").forward(request, response);
            	}
            } else {
                // Prodotto non trovato, reindirizza a una pagina di errore o gestisci in altro modo
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'eccezione o reindirizza a una pagina di errore
            response.sendRedirect("error.jsp");
        }
    }
}

	

