<%@page import="com.java.finalproject.model.Message"%>
<%@page import="com.java.finalproject.model.OrderProduct"%>
<%@page import="com.java.finalproject.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.java.finalproject.dao.OrderProductDAO"%>
<%@page import="com.java.finalproject.dao.OrderDAO"%>
<%@page import="com.java.finalproject.connect.ConnectionPro"%>
<%@page import="com.java.finalproject.model.User"%>
<%@page errorPage="error_ex.jsp"%>

<%
User u2 = (User) session.getAttribute("activeUser");
if (u2 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
OrderDAO orderDao = new OrderDAO(ConnectionPro.getConnection());
OrderProductDAO ordProdDao = new OrderProductDAO(ConnectionPro.getConnection());

List<Order> orderList = orderDao.getAllOrderByUserId(u2.getUserId());
%>
<div class="container-fluid px-3 py-3">
	<%
	if (orderList == null || orderList.size() == 0) {
	%>
	<div class="container mt-5 mb-5 text-center">
		<img src="image/sepet_bos.png" style="max-width: 200px;"
			class="img-fluid">
		<h4 class="mt-3">Zero Order found</h4>
		Looks like you haven't placed any order!
	</div>
	<%
	} else {
	%>
	<h4>My Order</h4>
	<hr>
	<div class="container">
		<table class="table table-hover">
			<tr class="text-center table-secondary">
			  <th>Product</th>
			  <th>Order ID</th>
			  <th>Name</th>
			  <th>Quantity</th>
			  <th>Total Price</th>
			  <th>Date and Time</th>
			  <th>Payment Type</th>
			  <th>Status</th>
			</tr>
			<%
			for (Order order : orderList) {
				List<OrderProduct> ordProdList = ordProdDao.getAllOrderProduct(order.getId());
				for (OrderProduct orderProduct : ordProdList) {
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=orderProduct.getImage()%>"
					style="width: 40px; height: 40px; width: auto;"></td>
				<td class="text-start"><%=order.getOrderId()%></td>
				<td class="text-start"><%=orderProduct.getName()%></td>
				<td><%=orderProduct.getQuantity()%></td>
				<td><%=orderProduct.getPrice() * orderProduct.getQuantity()%></td>
				<td><%=order.getDate()%></td>
				<td><%=order.getPaymentType()%></td>
				<td class="fw-semibold" style="color: green;"><%=order.getStatus()%></td>
			</tr>
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
