package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
	public int save(Order o) {
		try {
			// for insert a new candidate
			ResultSet rs = null;

			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO tbl_orders(order_id, user_id, total_price, note, phone, address, payment, created, status3, date_delivery) VALUES(?,?,?,?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, o.getOrder_id());
			ps.setInt(2, o.getUser_id());
			ps.setDouble(3, o.getTotal_price());
			ps.setString(4, o.getNote());
			ps.setString(5, o.getPhone());
			ps.setString(6, o.getAddress());
			ps.setString(7, o.getPayment());
			ps.setDate(8, o.getCreated());
			ps.setInt(9, o.getStatus3());
			ps.setString(10, o.getDate_delivery());
			int r = ps.executeUpdate();

			if (r == 1)
				// get id
				rs = ps.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1);
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Order> selectAllOrder(int id) {
		ArrayList<Order> orders = new ArrayList<>();
		Order order;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_orders WHERE user_id = ?");
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				int order_id = result.getInt("order_id");
				int user_id = result.getInt("user_id");
				double total_price = result.getDouble("total_price");
				String note = result.getString("note");
				String phone = result.getString("phone");
				String address = result.getString("address");
				String payment = result.getString("payment");
				Date date_create = result.getDate("created");
				int status3 = result.getInt("status3");
				String date_delivery = result.getString("date_delivery");

				orders.add(new Order(order_id, user_id, total_price, note, phone, address, payment, date_create,
						status3, date_delivery));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	public List<Order> selectAllOrderA() {
		ArrayList<Order> orders = new ArrayList<>();
		Order order;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"SELECT tbl_orders.*, tbl_user.name FROM tbl_user, tbl_orders WHERE tbl_user.user_id = tbl_orders.user_id");
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				int order_id = result.getInt("order_id");
				int user_id = result.getInt("user_id");
				double total_price = result.getDouble("total_price");
				String note = result.getString("note");
				String phone = result.getString("phone");
				String address = result.getString("address");
				String payment = result.getString("payment");
				Date date_create = result.getDate("created");
				int status3 = result.getInt("status3");
				String date_delivery = result.getString("date_delivery");

				orders.add(new Order(order_id, user_id, total_price, note, phone, address, payment, date_create,
						status3, date_delivery));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	public Order Infor(String id) {
		Order order = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_orders WHERE order_id = ?");
			ps.setString(1, id);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				int order_id = result.getInt("order_id");
				int user_id = result.getInt("user_id");
				double total_price = result.getDouble("total_price");
				String note = result.getString("note");
				String phone = result.getString("phone");
				String address = result.getString("address");
				String payment = result.getString("payment");
				Date date_create = result.getDate("created");
				int status3 = result.getInt("status3");
				String date_delivery = result.getString("date_delivery");

				order = new Order(order_id, user_id, total_price, note, phone, address, payment, date_create, status3,
						date_delivery);
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}

	public boolean remove(String prodNum) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM tbl_orders WHERE order_id = ?");
			ps.setString(1, prodNum);

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
	
	public double total_price(String prodNum) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT total_price FROM tbl_orders WHERE `order_id` = ?");
			ps.setString(1, prodNum);

			ResultSet result = ps.executeQuery();
			if (result.next()) {
				return result.getDouble("total_price");
			}		
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean update(String status, String id) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE tbl_orders SET status3 = ? WHERE order_id = ?");
			ps.setString(1, status);
			ps.setString(2, id);
			
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
	
	public List<Order> find(String delivery) {
		ArrayList<Order> orders = new ArrayList<>();
		Order order;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"SELECT * FROM tbl_orders WHERE `date_delivery` LIKE '" + "%" + delivery + "%" + "'");
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				int order_id = result.getInt("order_id");
				int user_id = result.getInt("user_id");
				double total_price = result.getDouble("total_price");
				String note = result.getString("note");
				String phone = result.getString("phone");
				String address = result.getString("address");
				String payment = result.getString("payment");
				Date date_create = result.getDate("created");
				int status3 = result.getInt("status3");
				String date_delivery = result.getString("date_delivery");

				orders.add(new Order(order_id, user_id, total_price, note, phone, address, payment, date_create,
						status3, date_delivery));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	
}
