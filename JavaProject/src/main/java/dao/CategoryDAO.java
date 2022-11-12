package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import dao.ConnectionManager;
import dao.Category;

public class CategoryDAO {
	public boolean save(Category c) {
		try {
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
			Date date = new Date(System.currentTimeMillis());
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO tbl_category(cat_name, status, date_create) VALUES(?,?,?)");
			ps.setString(1, c.getCat_name());
			ps.setInt(2, c.getStatus());
			ps.setDate(3, date);
			int r = ps.executeUpdate();

			ps.close();
			conn.close();
			if (r == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Category> selectAllCategory() {
		ArrayList<Category> categorys = new ArrayList<>();
		Category category;
		
		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_category";
			ResultSet result = stmt.executeQuery(query);
			
			while (result.next()) {
				int id = result.getInt("cat_id");
				String cat_name = result.getNString("cat_name");
				int status = result.getInt("status");
				Date date_create = result.getDate("date_create");
				Date date_update = result.getDate("date_update");
				categorys.add(new Category(id, cat_name, status, date_create, date_update));
			}
	        conn.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorys;
	}
	
	public List<Category> selectAllCategory1() {
		ArrayList<Category> categorys = new ArrayList<>();
		Category category;
		
		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_category WHERE `status` = 1";
			ResultSet result = stmt.executeQuery(query);
			
			while (result.next()) {
				int id = result.getInt("cat_id");
				String cat_name = result.getNString("cat_name");
				int status = result.getInt("status");
				Date date_create = result.getDate("date_create");
				Date date_update = result.getDate("date_update");
				categorys.add(new Category(id, cat_name, status, date_create, date_update));
			}
	        conn.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorys;
	}
	
	public List<Category> selectAllCategoryP() {
		ArrayList<Category> categorys = new ArrayList<>();
		Category category;
		
		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_product, tbl_category WHERE tbl_product.cat_id = tbl_category.cat_id";
			ResultSet result = stmt.executeQuery(query);
			
			while (result.next()) {
				int id = result.getInt("cat_id");
				String cat_name = result.getNString("cat_name");
				int status = result.getInt("status");
				Date date_create = result.getDate("date_create");
				Date date_update = result.getDate("date_update");
				categorys.add(new Category(id, cat_name, status, date_create, date_update));
			}
	        conn.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorys;
	}
	
	public boolean remove(String prodNum) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM tbl_category WHERE cat_id = ?");
			ps.setString(1, prodNum);
			
			int r = ps.executeUpdate();
			ps.close();
			conn.close();
			
			if(r == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean update(String cat_name, int status, Date date_update, String cat_id) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE tbl_category SET cat_name = ?, status= ?, date_update = ? WHERE cat_id = ?");
			ps.setString(1, cat_name);
			ps.setInt(2, status);
			ps.setDate(3, date_update);
			ps.setString(4, cat_id);
			
			int r = ps.executeUpdate();
			ps.close();
			conn.close();
			
			if(r == 1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public Category find(String prodNum) {
		Category category = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_category WHERE cat_id = ?");
			ps.setString(1, prodNum);
			ResultSet result = ps.executeQuery();
			if(result.next()) {
				category = new Category();
				category.setCat_name(result.getNString("cat_name"));
				category.setStatus(result.getInt("status"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}

}
