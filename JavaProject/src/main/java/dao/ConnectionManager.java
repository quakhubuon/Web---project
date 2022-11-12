package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	public static final String db_url = "jdbc:mysql://localhost:3306/project";
	public static final String username = "root";
	public static final String password = "";
	
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		return DriverManager.getConnection(db_url, username, password);
	}
}
