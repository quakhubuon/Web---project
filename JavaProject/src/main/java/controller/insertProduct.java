package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.OptionDAO;
import dao.Product;
import dao.ProductDAO;

/**
 * Servlet implementation class insertProduct
 */
@MultipartConfig
@WebServlet("/web admin/insertProduct")
public class insertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		OptionDAO optionDAO = new OptionDAO();
		List<dao.Category> categorys = optionDAO.selectAllCategory();
		request.setAttribute("listS", categorys);
		request.getRequestDispatcher("addproduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

			PrintWriter out = response.getWriter();
			
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
			Date date = new Date(System.currentTimeMillis());
			
			
			String cat_id = request.getParameter("cat_id");
			int id = Integer.parseInt(cat_id); 
					
			String pro_name = request.getParameter("pro_name");
					
			String price = request.getParameter("price");
			double gia = Double.parseDouble(price);
			
			String quantity = request.getParameter("quantity");
			int sl = Integer.parseInt(quantity);
			
			
			String description = request.getParameter("description");
			String status2 = request.getParameter("status2");
	
			Part part = request.getPart("image");
			String realPath = request.getServletContext().getRealPath("/images");
			String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
			
			if(!Files.exists(Path.of(realPath))) {
				Files.createDirectory(Path.of(realPath));
			}
			part.write(realPath+"/"+filename);
			
			ProductDAO productDAO = new ProductDAO();
			int pro_id = 0;
			productDAO.save(new Product(pro_id, pro_name, id, filename , gia, description, Integer.parseInt(status2), date, sl));
			
			out.print("Insert Successfully!!!");
			
			
	}

}
