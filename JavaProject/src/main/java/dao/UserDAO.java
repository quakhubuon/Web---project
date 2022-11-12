package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	public boolean save(User u) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO tbl_user(user_id, name, email, password, user_type, phone, address, status4) VALUES(?,?,?,?,?,?,?,?)");
			ps.setInt(1, u.getUser_id());
			ps.setString(2, u.getName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getUser_type());
			ps.setString(6, u.getPhone());
			ps.setString(7, u.getAddress());
			ps.setInt(8, u.getStatus4());
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

	public User login(String email, String password) {
		User user = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"SELECT * FROM tbl_user WHERE email = ? AND password = ? AND status4 = 1 AND user_type='admin'");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public User loginU(String email, String password) {
		User user = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("SELECT * FROM tbl_user WHERE email = ? AND password = ? AND status4 = 1");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public User find(String id) {
		User user = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_user WHERE `user_id` = ?");
			ps.setString(1, id);

			ResultSet result = ps.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public User findU(String email, String password) {
		User user = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_user WHERE `email` = ? AND `password` = ?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet result = ps.executeQuery();
			if (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public List<User> selectAllUser() {
		ArrayList<User> users = new ArrayList<>();
		User user;

		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_user";
			ResultSet result = stmt.executeQuery(query);

			while (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
				users.add(user);
			}
			conn.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	
	public List<User> selectAllUserU() {
		ArrayList<User> users = new ArrayList<>();
		User user;

		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_user WHERE `user_type` = 'user'";
			ResultSet result = stmt.executeQuery(query);

			while (result.next()) {
				user = new User();
				user.setUser_id(result.getInt("user_id"));
				user.setName(result.getNString("name"));
				user.setEmail(result.getNString("email"));
				user.setPassword(result.getNString("password"));
				user.setUser_type(result.getNString("user_type"));
				user.setPhone(result.getNString("phone"));
				user.setAddress(result.getNString("address"));
				user.setStatus4(result.getInt("status4"));
				users.add(user);
			}
			conn.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	public boolean update(String user_id, String name, String email, String pass, String user_type, String phone, String address, int status4) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"UPDATE tbl_user SET name = ?, email= ?, password = ?, user_type = ?, phone = ?, address = ?, status4 = ? WHERE user_id = ?");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, user_type);
			ps.setString(5, phone);
			ps.setString(6, address);
			ps.setInt(7, status4);
			ps.setString(8, user_id);

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
}
