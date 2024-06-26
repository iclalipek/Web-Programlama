package com.java.finalproject.servlet;

import java.io.IOException;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.dao.UserDAO;
import com.java.finalproject.model.Message;
import com.java.finalproject.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userGender = request.getParameter("gender");
			String userAddress = request.getParameter("user_address");
			String userCity = request.getParameter("city");
			String userPincode = request.getParameter("pincode");
			String userState = request.getParameter("state");
			
			User user = new User(userName, userEmail, userPassword, userPhone, userGender, userAddress, userCity, userPincode, userState);
			UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
			boolean flag = userDao.saveUser(user);
			
			HttpSession session = request.getSession();
			Message message;
			if(flag) {
				message = new Message("Registration successful", "success", "alert-success");
			}
			else {
				message = new Message("Something went wrong", "error", "alert-danger");
			}
			
			session.setAttribute("message", message);
			response.sendRedirect("register.jsp");
			return;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
