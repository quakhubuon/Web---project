package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

/**
 * Servlet implementation class updateProduct2
 */
@WebServlet("/web admin/updatePro2")
public class updateProduct2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		
		String pro_id = request.getParameter("id");
		
		String cat_id = request.getParameter("cat_id");
		
		int cat_id2 = Integer.parseInt(cat_id);
		String pro_name = request.getParameter("pro_name");
		
		String status = request.getParameter("status2");
		int status2 = Integer.parseInt(status);
		
		String description = request.getParameter("description");
		
		String price = request.getParameter("price");
		double price2 = Double.parseDouble(price);
		
		String image = request.getParameter("images");
		
		String quantity = request.getParameter("quantity");
		int quantity2 = Integer.parseInt(quantity);
		
		ProductDAO productDAO = new ProductDAO();
		productDAO.update(pro_id, pro_name, cat_id2, image, price2, description, status2, date, quantity2);
		
		out.print("Update Successfully!!!");
	}

}
