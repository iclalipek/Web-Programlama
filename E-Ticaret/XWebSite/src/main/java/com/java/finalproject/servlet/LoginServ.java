package com.java.finalproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.dao.AdminDAO;
import com.java.finalproject.dao.UserDAO;
import com.java.finalproject.model.Admin;
import com.java.finalproject.model.Message;
import com.java.finalproject.model.User;

public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("login");
		if (login.trim().equals("user")) {
			try {
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");

				UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
				User user = userDao.getUserByEmailPassword(userEmail, userPassword);

				HttpSession session = request.getSession();
				if (user != null) {
					session.setAttribute("activeUser", user);
					response.sendRedirect("index.jsp");
				} else {
					Message message = new Message("Invalid details! Try again!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("login.jsp");
					return;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (login.trim().equals("admin")) {
			try {
				String userName = request.getParameter("email");
				String password = request.getParameter("password");

				AdminDAO adminDao = new AdminDAO(ConnectionPro.getConnection());
				Admin admin = adminDao.getAdminByEmailPassword(userName, password);
				
				HttpSession session = request.getSession();
				if (admin != null) {
					session.setAttribute("activeAdmin", admin);
					response.sendRedirect("admin.jsp");
				} else {
					Message message = new Message("Invalid details! Try again!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("adminlogin.jsp");
					return;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
