package com.java.finalproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.dao.OrderDAO;
import com.java.finalproject.dao.UserDAO;
import com.java.finalproject.model.Order;

public class UpdateOrderServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int oid = Integer.parseInt(request.getParameter("oid"));
		String status = request.getParameter("status");
		OrderDAO orderDao =  new OrderDAO(ConnectionPro.getConnection());
		orderDao.updateOrderStatus(oid, status);
		
		if(status.trim().equals("Shipped") || status.trim().equals("Out for delivery")){
				Order order = orderDao.getOrderById(oid);
				UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
		}
		response.sendRedirect("display_orders.jsp");
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		doPost(request, response);
		}
}
