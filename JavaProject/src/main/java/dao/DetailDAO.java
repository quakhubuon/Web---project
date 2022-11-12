package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DetailDAO {
	public boolean save(Detail d) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO tbl_detail(detail_id, pro_id, quantity, price) VALUES(?,?,?,?)");
			ps.setInt(1, d.getDetail_id());
			ps.setInt(2, d.getPro_id());
			ps.setInt(3, d.getQuanity());
			ps.setDouble(4, d.getPrice());
		
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
	
	public List<Item> selectAllItem(String prodNum) {
		ArrayList<Item> items = new ArrayList<>();
		Item item;
		
		try {	
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT tbl_product.*, tbl_detail.quantity FROM tbl_product, tbl_orders, tbl_detail WHERE tbl_detail.pro_id = tbl_product.pro_id AND tbl_detail.detail_id = ?;");
			ps.setString(1, prodNum);
			ResultSet result = ps.executeQuery();
			
			while (result.next()) {
				int pro_id = result.getInt("pro_id");
				String pro_name = result.getNString("pro_name");
				int cat_id = result.getInt("cat_id");
				String images = result.getNString("images");
				Double price = result.getDouble("price");
				String description = result.getNString("description");
				int status2 = result.getInt("status2");
				Date date_create = result.getDate("date_create");
				int quantity = result.getInt("tbl_product.quantity");
				int quantity2 = result.getInt("tbl_detail.quantity");
				Product p = new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create, quantity);
			
				items.add(new Item(p, quantity2));
			}
	        conn.close();
	        ps.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return items;
	}
	
	public List<Detail> selectDetail(String prodNum) {
		ArrayList<Detail> details = new ArrayList<>();
		Detail item;
		
		try {	
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_detail WHERE `detail_id` = ?");
			ps.setString(1, prodNum);
			ResultSet result = ps.executeQuery();
			
			while (result.next()) {
				int detail_id = result.getInt("detail_id");
				int pro_id = result.getInt("pro_id");
				int quantity = result.getInt("quantity");
				double price = result.getDouble("price");
				details.add(new Detail(detail_id, pro_id, quantity, price));
			}
	        conn.close();
	        ps.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return details;
	}
}
