package com.java.finalproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.java.finalproject.connect.ConnectionPro;
import com.java.finalproject.connect.OrderIdGen;
import com.java.finalproject.dao.CartDAO;
import com.java.finalproject.dao.OrderDAO;
import com.java.finalproject.dao.OrderProductDAO;
import com.java.finalproject.dao.ProductDAO;
import com.java.finalproject.model.Cart;
import com.java.finalproject.model.Order;
import com.java.finalproject.model.OrderProduct;
import com.java.finalproject.model.Product;
import com.java.finalproject.model.User;


public class OrderOpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String from = (String) session.getAttribute("from");
		String paymentType = request.getParameter("payementMode");
		User user = (User) session.getAttribute("activeUser");
		String orderId = OrderIdGen.getOrderId();
		String status = "Order Placed";

		if (from.trim().equals("cart")) {
			try {

				Order order = new Order(orderId, status, paymentType, user.getUserId());
				OrderDAO orderDao = new OrderDAO(ConnectionPro.getConnection());
				int id = orderDao.insertOrder(order);

				CartDAO cartDao = new CartDAO(ConnectionPro.getConnection());
				List<Cart> listOfCart = cartDao.getCartListByUserId(user.getUserId());
				OrderProductDAO orderedProductDao = new OrderProductDAO(ConnectionPro.getConnection());
				ProductDAO productDao = new ProductDAO(ConnectionPro.getConnection());
				for (Cart item : listOfCart) {

					Product prod = productDao.getProductsByProductId(item.getProductId());
					String prodName = prod.getProductName();
					int prodQty = item.getQuantity();
					float price = prod.getProductPrice();
					String image = prod.getProductImages();

					OrderProduct orderedProduct = new OrderProduct(prodName, prodQty, price, image, id);
					orderedProductDao.insertOrderProduct(orderedProduct);
				}
				session.removeAttribute("from");
				session.removeAttribute("totalPrice");
				
				cartDao.removeAllProduct();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (from.trim().equals("buy")) {

			try {

				int pid = (int) session.getAttribute("pid");
				Order order = new Order(orderId, status, paymentType, user.getUserId());
				OrderDAO orderDao = new OrderDAO(ConnectionPro.getConnection());
				int id = orderDao.insertOrder(order);
				OrderProductDAO orderedProductDao = new OrderProductDAO(ConnectionPro.getConnection());
				ProductDAO productDao = new ProductDAO(ConnectionPro.getConnection());

				Product prod = productDao.getProductsByProductId(pid);
				String prodName = prod.getProductName();
				int prodQty = 1;
				float price = prod.getProductPrice();
				String image = prod.getProductImages();

				OrderProduct orderedProduct = new OrderProduct(prodName, prodQty, price, image, id);
				orderedProductDao.insertOrderProduct(orderedProduct);
				
				productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) - 1);
				
				session.removeAttribute("from");
				session.removeAttribute("pid");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	    session.setAttribute("order", "success");
        response.sendRedirect("index.jsp");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
