package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDao {

	private Connection con;
	private PreparedStatement pstmt;
	private String SQL;
	private ResultSet rs;

	public UserDao() throws IOException, ClassNotFoundException, SQLException {
		con = GetConnection.getConnection();
	}

	public String checkUser(User user) throws SQLException {
		SQL = "select * from users where username = ? and password = ?";
		pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getPassword());
		rs = pstmt.executeQuery();

		if (rs.next())
			return "welcome.jsp";
		else
			return "error.jsp";

	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException, IOException {
		User user = new User();
		user.setUsername("user");
		user.setPassword("user");
		String checkUser = new UserDao().checkUser(user);
		System.out.println(checkUser);
	}

}
