package com.java.finalproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.java.finalproject.model.User;

public class UserDAO {
	
	private Connection con;
	
	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		
		try {
			String query = "insert into user(name, email, password, phone, gender, address, city, pincode, state) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getUserEmail());
			psmt.setString(3, user.getUserPassword());
			psmt.setString(4, user.getUserPhone());
			psmt.setString(5, user.getUserGender());
			psmt.setString(6, user.getUserAddress());
			psmt.setString(7, user.getUserCity());
			psmt.setString(8, user.getUserPincode());
			psmt.setString(9, user.getUserState());
			
			psmt.executeUpdate();
			flag = true;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByEmailPassword(String userEmail, String userPassword) {
		User user = null;
		
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, userEmail);
			psmt.setString(2, userPassword);
			
			ResultSet rst = psmt.executeQuery();
			while(rst.next()) {
				user = new User();
				
				user.setUserId(rst.getInt("userid"));
				user.setUserName(rst.getString("name"));
				user.setUserEmail(rst.getString("email"));
				user.setUserPassword(rst.getString("password"));
				user.setUserPhone(rst.getString("phone"));
				user.setUserGender(rst.getString("gender"));
				user.setDateTime(rst.getTimestamp("registerdate"));
				user.setUserAddress(rst.getString("address"));
				user.setUserCity(rst.getString("city"));
				user.setUserPincode(rst.getString("pincode"));
				user.setUserState(rst.getString("state"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<User> getAllUser(){
		List<User> list = new ArrayList<User>();
		
		try {
			String query = "select * from user";
			Statement statement = this.con.createStatement();
			
			ResultSet rst = statement.executeQuery(query);
			while(rst.next()) {
				User user = new User();
				user.setUserId(rst.getInt("userid"));
				user.setUserName(rst.getString("name"));
				user.setUserEmail(rst.getString("email"));
				user.setUserPassword(rst.getString("password"));
				user.setUserPhone(rst.getString("phone"));
				user.setUserGender(rst.getString("gender"));
				user.setDateTime(rst.getTimestamp("registerdate"));
				user.setUserAddress(rst.getString("address"));
				user.setUserCity(rst.getString("city"));
				user.setUserPincode(rst.getString("pincode"));
				user.setUserState(rst.getString("state"));
				
				list.add(user);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateUserAddress(User user) {
		
		try {
			String query = "update user set address=?, city=?, pincode=?, state=? where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, user.getUserAddress());
			psmt.setString(2, user.getUserCity());
			psmt.setString(3, user.getUserPincode());
			psmt.setString(4, user.getUserState());
			psmt.setInt(5, user.getUserId());
			
			psmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUserPasswordByEmail(String password, String mail) {
			
		try {
			String query = "update user set password=? where email=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, password);
			psmt.setString(2, mail);
			
			psmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(User user) {
		
		try {
			String query = "update user set name=?, email=?, phone=?, gender=?, address=?, city=?, pincode=?, state=? where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getUserEmail());
			psmt.setString(3, user.getUserPhone());
			psmt.setString(4, user.getUserGender());
			psmt.setString(5, user.getUserAddress());
			psmt.setString(6, user.getUserCity());
			psmt.setString(7, user.getUserPincode());
			psmt.setString(8, user.getUserState());
			psmt.setInt(9, user.getUserId());
			
			
			psmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int userCount() {
		int count = 0;
		
		try {
			String query = "select count(*) from user";
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public String getUserAddress(int uid) {
	String address = "";
	
		try {
			String query = "select address, city, pincode, state from user where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			address = rs.getString(1) + "," + rs.getString(2) + "-" + rs.getString(3) + ", " + rs.getString(4);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return address;
	}
	
	public String getUserName(int uid) {
		String name = "";
		
		try {
			String query = "select name from user where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			name = rs.getString(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	

	public String getUserEmail(int uid) {
		String email = "";
		
		try {
			String query = "select email from user where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			email = rs.getString(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return email;
	}
	
	public String getUserPhone(int uid) {
		String phone = "";
		
		try {
			String query = "select phone from user where userid=?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			rs.next();
			phone = rs.getString(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return phone;
	}
	
    public boolean deleteUser(int uid) {
        boolean flag = false;

        try {
            String query = "delete from user where userid=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setInt(1, uid);
            psmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
	
	public List<String> getAllEmail() {
		List<String> list = new ArrayList<>();
		
		try {
			String query = "select email from user";
			Statement statement = this.con.createStatement();
			
			ResultSet rst = statement.executeQuery(query);
			while(rst.next()) {
				list.add(rst.getString(1));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
