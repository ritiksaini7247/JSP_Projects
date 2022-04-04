package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDao {

	private Connection con;
	private PreparedStatement pstmt;
	private String SQL;
	private ResultSet rs;

	public UserDao() throws IOException, ClassNotFoundException, SQLException {
		con = GetConnection.getConnection();
	}

	public Boolean checkUser(User user) throws SQLException {
		SQL = "select * from users where username = ? and password = ?";
		pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getPassword());
		rs = pstmt.executeQuery();
		if (rs.next())
			return true;
		return false;
	}

	public List<User> getAllUsers() throws SQLException {
		SQL = "select * from users";
		pstmt = con.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		List<User> allUsers = new ArrayList<>();
		while (rs.next()) {
			User user = new User();
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			allUsers.add(user);
		}
		if (allUsers.size() >= 1) {
			return allUsers;
		}
		return null;
	}

	public static void main(String[] args)
			throws InterruptedException, ClassNotFoundException, SQLException, IOException {
		List<User> allUsers = new UserDao().getAllUsers();
		System.out.println(allUsers);
	}

}
