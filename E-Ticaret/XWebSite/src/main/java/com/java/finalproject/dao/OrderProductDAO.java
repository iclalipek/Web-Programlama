package com.java.finalproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.finalproject.model.OrderProduct;

public class OrderProductDAO {

	private Connection con;
	
	public OrderProductDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public void insertOrderProduct(OrderProduct ordProduct) {
		
		try {
			String query = "insert into order_product(name, quantity, price, image, orderid) values(?, ?, ?, ?, ?)";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setString(1, ordProduct.getName());
			psmt.setInt(2, ordProduct.getQuantity());
			psmt.setFloat(3, ordProduct.getPrice());
			psmt.setString(4, ordProduct.getImage());
			psmt.setInt(5, ordProduct.getOrderId());
			
			psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public List<OrderProduct> getAllOrderProduct(int oid){
		List<OrderProduct> list = new ArrayList<OrderProduct>();
		
		try {
			String query = "select * from order_product where orderid = ?";
			PreparedStatement psmt = this.con.prepareStatement(query);
			psmt.setInt(1, oid);
			
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				OrderProduct orderProd = new OrderProduct();
				orderProd.setName(rs.getString("name"));
				orderProd.setQuantity(rs.getInt("quantity"));
				orderProd.setPrice(rs.getFloat("price"));
				orderProd.setImage(rs.getString("image"));
				orderProd.setOrderId(oid);
				
				list.add(orderProd);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}