package com.java.finalproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.dao.CartDAO;
import com.java.finalproject.dao.ProductDAO;
import com.java.finalproject.model.Cart;
import com.java.finalproject.model.Message;


public class AddToCartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		int pid = Integer.parseInt(req.getParameter("pid"));

		CartDAO cartDao = new CartDAO(ConnectionPro.getConnection());
		int qty = cartDao.getQuantity(uid, pid);
		HttpSession session = req.getSession();
		Message message = null;
		
		if (qty == 0) {
			Cart cart = new Cart(uid, pid, qty + 1);
			cartDao.addToCart(cart);
			message = new Message("Product is added to cart successfully!", "success", "alert-success");
			
		}else {
			int cid = cartDao.getIdByUserIdAndProductId(uid, pid);
			cartDao.updateQuantity(cid, qty+1);
			message = new Message("Product quantity is increased!", "success", "alert-success");
		}
		
		ProductDAO productDao = new ProductDAO(ConnectionPro.getConnection());
		productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) - 1);
		session.setAttribute("message", message);
		resp.sendRedirect("viewProduct.jsp?pid="+pid);
	}


}
