package com.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class GetConnection {

	private static Connection con;

	private GetConnection() {
		super();
	}

	public static Connection getConnection() throws IOException, SQLException, ClassNotFoundException {
		FileReader reader = new FileReader(
				"C:\\Users\\Lenovo\\eclipse-workspace\\JSPProject\\src\\main\\java\\com\\dao\\connection.properties");
		Properties p = new Properties();
		p.load(reader);

		String driver = p.getProperty("driver");
		String URL = p.getProperty("url");
		String username = p.getProperty("username");
		String password = p.getProperty("password");

		if (con == null) {
			Class.forName(driver);
			System.out.println("Driver load successfully...");
			con = DriverManager.getConnection(URL, username, password);
			System.out.println("Connection create successfully..");
		}
		return con;

	}

}
