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

public class ProductDAO {
	public boolean save(Product d) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO tbl_product(pro_id, pro_name, cat_id, images, price, description, status2, date_create, quantity) VALUES(?,?,?,?,?,?,?,?,?)");

			ps.setInt(1, d.getPro_id());
			ps.setNString(2, d.getPro_name());
			ps.setInt(3, d.getCat_id());
			ps.setString(4, d.getImages());
			ps.setDouble(5, d.getPrice());
			ps.setString(6, d.getDescription());
			ps.setInt(7, d.getStatus2());
			ps.setDate(8, d.getDate_create());
			ps.setInt(9, d.getQuantity());

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

	public List<Product> selectAllProduct() {
		ArrayList<Product> products = new ArrayList<>();
		Product product;

		try {
			Connection conn = ConnectionManager.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM tbl_product";
			ResultSet result = stmt.executeQuery(query);

			while (result.next()) {
				int pro_id = result.getInt("pro_id");
				String pro_name = result.getNString("pro_name");
				int cat_id = result.getInt("cat_id");
				String images = result.getNString("images");
				Double price = result.getDouble("price");
				String description = result.getNString("description");
				int status2 = result.getInt("status2");
				Date date_create = result.getDate("date_create");
				int quantity = result.getInt("quantity");

				products.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
			conn.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public List<Product> selectAllProductC(String prodNum) {
		ArrayList<Product> products = new ArrayList<>();
		Product product;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_product WHERE tbl_product.cat_id = ?");
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
				int quantity = result.getInt("quantity");

				products.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public boolean update(String pro_id, String pro_name, int cat_id, String images, double price, String description,
			int status2, Date date_create, int quantity) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(
					"UPDATE tbl_product SET pro_name = ?, cat_id= ?, images = ?, price = ?, description = ?, status2 = ?, date_create = ?, quantity = ? WHERE pro_id = ?");
			ps.setString(1, pro_name);
			ps.setInt(2, cat_id);
			ps.setString(3, images);
			ps.setDouble(4, price);
			ps.setString(5, description);
			ps.setInt(6, status2);
			ps.setDate(7, date_create);
			ps.setInt(8, quantity);
			ps.setNString(9, pro_id);

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

	public Product find(String prodNum) {
		Product product = null;
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tbl_product WHERE pro_id = ?");
			ps.setString(1, prodNum);
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				product = new Product();
				product.setPro_id(result.getInt("pro_id"));
				product.setCat_id(result.getInt("cat_id"));
				product.setPro_name(result.getNString("pro_name"));
				product.setDate_create(result.getDate("date_create"));
				product.setDescription(result.getNString("description"));
				product.setPrice(result.getDouble("price"));
				product.setImages(result.getNString("images"));
				product.setQuantity(result.getInt("quantity"));
				product.setStatus2(result.getInt("status2"));
			}
			result.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}

	public List<Product> selectAllProductL(String name) {
		ArrayList<Product> products = new ArrayList<>();
		Product product;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("SELECT * FROM tbl_product WHERE pro_name LIKE '" + "%" + name + "%" + "'");
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
				int quantity = result.getInt("quantity");

				products.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}

	public boolean remove(String prodNum) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE FROM tbl_product WHERE pro_id = ?");
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

	public int getTotalProduct() {
		String query = "SELECT COUNT(*) FROM tbl_product WHERE `status2` = 1";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return 0;
	}

	public List<Product> pagingProduct(int index) {
		List<Product> list = new ArrayList<>();
		Product product;
		String query = "SELECT * FROM tbl_product WHERE `status2` = 1 LIMIT ?, 6";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, (index - 1) * 6);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int pro_id = rs.getInt("pro_id");
				String pro_name = rs.getNString("pro_name");
				int cat_id = rs.getInt("cat_id");
				String images = rs.getNString("images");
				Double price = rs.getDouble("price");
				String description = rs.getNString("description");
				int status2 = rs.getInt("status2");
				Date date_create = rs.getDate("date_create");
				int quantity = rs.getInt("quantity");

				list.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return list;
	}
	
	public int getTotalProduct3(int id) {
		String query = "SELECT COUNT(*) FROM tbl_product WHERE `status2` = 1 AND `cat_id` = ?";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return 0;
	}
	
	public List<Product> pagingProduct3(int id,int index) {
		List<Product> list = new ArrayList<>();
		Product product;
		String query = "SELECT * FROM tbl_product WHERE `cat_id` = ? AND `status2` = 1 LIMIT ?, 3";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.setInt(2, (index - 1) * 3);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int pro_id = rs.getInt("pro_id");
				String pro_name = rs.getNString("pro_name");
				int cat_id = rs.getInt("cat_id");
				String images = rs.getNString("images");
				Double price = rs.getDouble("price");
				String description = rs.getNString("description");
				int status2 = rs.getInt("status2");
				Date date_create = rs.getDate("date_create");
				int quantity = rs.getInt("quantity");

				list.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return list;
	}
	
	public int getTotalProductS(String s) {
		String query = "SELECT COUNT(*) FROM tbl_product WHERE pro_name LIKE '" + "%" + s + "%" + "' AND `status2` = 1";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return 0;
	}
	
	public List<Product> pagingProductS(String s,int index) {
		List<Product> list = new ArrayList<>();
		Product product;
		String query = "SELECT * FROM tbl_product WHERE pro_name LIKE '" + "%" + s + "%" + "' AND `status2` = 1 LIMIT ?, 3";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, (index - 1) * 3);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int pro_id = rs.getInt("pro_id");
				String pro_name = rs.getNString("pro_name");
				int cat_id = rs.getInt("cat_id");
				String images = rs.getNString("images");
				Double price = rs.getDouble("price");
				String description = rs.getNString("description");
				int status2 = rs.getInt("status2");
				Date date_create = rs.getDate("date_create");
				int quantity = rs.getInt("quantity");

				list.add(new Product(pro_id, pro_name, cat_id, images, price, description, status2, date_create,
						quantity));
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return list;
	}
	
	public int getTotalProductAdvance(String name, String cat_id, double price1, double price2) {
		String query = "SELECT COUNT(*) FROM tbl_product WHERE pro_name LIKE '" + "%" + name + "%" + "' AND `cat_id` = ? AND `price` BETWEEN ? AND ? AND `status2` = 1";
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, cat_id);
			ps.setDouble(2, price1);
			ps.setDouble(3, price2);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		return 0;
	}
	
	public List<Product> selectAllProductAdvance(String name, String cat_id, double price1, double price2, int index) {
		ArrayList<Product> products = new ArrayList<>();
		Product product;

		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("SELECT * FROM tbl_product WHERE pro_name LIKE '" + "%" + name + "%" + "' AND `cat_id` = ? AND `price` BETWEEN ? AND ? AND `status2` = 1 LIMIT ?, 3");
			ps.setString(1, cat_id);
			ps.setDouble(2, price1);
			ps.setDouble(3, price2);
			ps.setInt(4, (index - 1) * 3);
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				int pro_id = result.getInt("pro_id");
				String pro_name = result.getNString("pro_name");
				int cat_id2 = result.getInt("cat_id");
				String images = result.getNString("images");
				Double price = result.getDouble("price");
				String description = result.getNString("description");
				int status2 = result.getInt("status2");
				Date date_create = result.getDate("date_create");
				int quantity = result.getInt("quantity");

				products.add(new Product(pro_id, pro_name, cat_id2, images, price, description, status2, date_create,
						quantity));
			}
			conn.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
}
