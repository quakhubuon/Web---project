package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OptionDAO {
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
}
