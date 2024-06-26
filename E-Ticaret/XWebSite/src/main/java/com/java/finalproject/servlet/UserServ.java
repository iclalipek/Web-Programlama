package com.java.finalproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.dao.UserDAO;
import com.java.finalproject.model.Message;
import com.java.finalproject.model.User;

@WebServlet("/UserServ")
public class UserServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
		HttpSession session = request.getSession();
		Message message = null;
		
		if(operation.trim().equals("save")) {
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String pincode = request.getParameter("pincode");
			String state = request.getParameter("state");
			
			
			User user = new User(name, email, password, phone, gender, address, city, pincode, state);
			boolean flag = userDao.saveUser(user);
			
			if(flag) {
				message = new Message("New user registered successfully!", "success", "alert-success");
			}
			else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}
			
			session.setAttribute("message", message);
			response.sendRedirect("display_users.jsp");
			
		}
		else if(operation.trim().equals("delete")) {
			
			int uid = Integer.parseInt(request.getParameter("uid"));
			boolean flag = userDao.deleteUser(uid);
			
			if(flag) {
				message = new Message("User deleted successfully!", "success", "alert-success");
			}
			else {
				message = new Message("Sorry! Something went wrong", "error", "alert-danger");
			}
			
			session.setAttribute("message", message);
			response.sendRedirect("display_users.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
