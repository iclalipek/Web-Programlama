<%@page import="com.java.finalproject.model.Message"%>
<%@page import="com.java.finalproject.model.Product"%>
<%@page import="com.java.finalproject.dao.ProductDAO"%>
<%@page import="com.java.finalproject.model.Wishlist"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_ex.jsp"%>
<%@page import="com.java.finalproject.model.User"%>
<%@page import="com.java.finalproject.connect.ConnectionPro"%>
<%@page import="com.java.finalproject.dao.WishlistDAO"%>

<%
User u1 = (User) session.getAttribute("activeUser");
if (u1 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
WishlistDAO wishListDao = new WishlistDAO(ConnectionPro.getConnection());
List<Wishlist> wlist = wishListDao.getListByUserId(u1.getUserId());
ProductDAO pDao = new ProductDAO(ConnectionPro.getConnection());
%>
<div class="container px-3 py-3">
	<%
	if (wlist == null || wlist.size() == 0) {
	%>
	<div class="container mt-5 mb-5 text-center">
		<img src="image/wishlist.png" style="max-width: 200px;"
			class="img-fluid">
		<h4 class="mt-3">EmptyWishlist</h4>
		You have no items in your wish. Start adding!
	</div>
	<%
	} else {
	%>
	<h4>
		My Wish (<%=wlist.size()%>)
	</h4>
	<hr>
	<div class="container">
		<table class="table table-hover">
			<%
			for (Wishlist w : wlist) {
				Product p = pDao.getProductsByProductId(w.getProductId());
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=p.getProductImages()%>"
					style="width: 50px; height: 50px; width: auto;"></td>
				<td class="text-start"><%=p.getProductName()%></td>
				<td>&#8378;<%=p.getProductPrice()%></td>
				<td><a
					href="WishlistServ?uid=<%=u1.getUserId()%>&pid=<%=p.getProductId()%>&op=delete"
					class="btn btn-secondary" role="button">Remove</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	}
	%>
</div>
