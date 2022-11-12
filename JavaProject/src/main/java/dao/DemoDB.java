package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class DemoDB {

	public static void main(String[] args) {
		UserDAO userDAO = new UserDAO();
		List<User> users = userDAO.selectAllUserU();
		for(User u : users) {
			System.out.println(u);
		}
	}
}

