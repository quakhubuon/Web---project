package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDAO;

/**
 * Servlet implementation class updateP
 */
@MultipartConfig
@WebServlet("/web admin/updateP")
public class updateP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateP() {
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
		
		String status = request.getParameter("status");
		int status2;
		if(status!=null) {
			status2 = Integer.parseInt(status);
		}else {
			status2 = 0;
		}
		
		
		String description = request.getParameter("description");
		
		String price = request.getParameter("price");
		double price2 = Double.parseDouble(price);
		
		Part part = request.getPart("image");
		String realPath = request.getServletContext().getRealPath("/images");
		String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		
		if(!Files.exists(Path.of(realPath))) {
			Files.createDirectory(Path.of(realPath));
		}
		part.write(realPath+"/"+filename);
		
		String quantity = request.getParameter("quantity");
		int quantity2 = Integer.parseInt(quantity);
		
//		out.println(pro_id + " " +cat_id +" "+ pro_name + " " + status2 + " " + price2 + " " + filename + " " + quantity2);
		
		ProductDAO productDAO = new ProductDAO();
		productDAO.update(pro_id, pro_name, cat_id2, filename, price2, description, status2, date, quantity2);
		
		out.print("Update Successfully!!!");
	}

}
