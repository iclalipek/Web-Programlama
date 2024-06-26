<%@page import="com.java.finalproject.model.Message"%>
<%@page import="com.java.finalproject.dao.UserDAO"%>
<%@page errorPage="error_ex.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.java.finalproject.model.OrderProduct"%>
<%@page import="com.java.finalproject.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.java.finalproject.dao.OrderProductDAO"%>
<%@page import="com.java.finalproject.dao.OrderDAO"%>
<%@page import="com.java.finalproject.connect.ConnectionPro"%>

<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
OrderDAO orderDao = new OrderDAO(ConnectionPro.getConnection());
OrderProductDAO ordProdDao = new OrderProductDAO(ConnectionPro.getConnection());
List<Order> orderList = orderDao.getAllOrder();
UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Order's</title>
<%@include file="Attachment/collective_css.jsp"%>
</head>
<body>
	
	<%@include file="Attachment/navbar.jsp"%>


	<div class="container-fluid px-3 py-3">
		<%
		if (orderList == null || orderList.size() == 0) {
		%>
		<div class="container mt-5 mb-5 text-center">
			<img src="image/sepet_bos.png" style="max-width: 200px;"
				class="img-fluid">
			<h4 class="mt-3">Order not found</h4>
		</div>
		<%
		} else {
		%>
		<div class="container-fluid">
			<table class="table table-hover">
				<tr class="table-primary" style="font-size: 18px;">
					<th class="text-center">Product</th>
					<th>Order ID</th>
					<th>Product Details</th>
					<th>Delivery Address</th>
					<th>Date & Time</th>
					<th>Payment Type</th>
					<th>Status</th>
					<th colspan="2" class="text-center">Action</th>
				</tr>
				<%
				for (Order order : orderList) {
					List<OrderProduct> ordProdList = ordProdDao.getAllOrderProduct(order.getId());
					for (OrderProduct orderProduct : ordProdList) {
				%>
				<form action="UpdateOrderServ?oid=<%=order.getId()%>" method="post">
				<tr>
					<td class="text-center"><img
						src="Product_imgs\<%=orderProduct.getImage()%>"
						style="width: 50px; height: 50px; width: auto;"></td>
					<td><%=order.getOrderId()%></td>
					<td><%=orderProduct.getName()%><br>Quantity: <%=orderProduct.getQuantity()%><br>Total
						Price: &#8378;<%=orderProduct.getPrice() * orderProduct.getQuantity()%></td>
					<td><%=userDao.getUserName(order.getUserId())%><br>Mobile No. <%=userDao.getUserPhone(order.getUserId())%><br><%=userDao.getUserAddress(order.getUserId())%></td>
					<td><%=order.getDate()%></td>
					<td><%=order.getPaymentType()%></td>
					<td><%=order.getStatus()%></td>
					<td><select id="operation" name="status" class="form-select">
							<option>--Select Operation--</option>
							<option value="Order Confirmed">Order Confirmed</option>
							<option value="Shipped">Shipped</option>
							<option value="Out For Delivery">Out For Delivery</option>
							<option value="Delivered">Delivered</option>
					</select></td>
					<td>
						<%
						if (order.getStatus().equals("Delivered")) {
						%>
						<button type="submit" class="btn btn-success disabled">Update</button>
						<%
						} else {
						%>
						<button type="submit" class="btn btn-secondary">Update</button> 
						<%
						 }
						 %>
					</td>
				</tr>
				</form>
				<%
				}
				}
				%>
			</table>

		</div>
		<%
		}
		%>
	</div>
</body>
</html>