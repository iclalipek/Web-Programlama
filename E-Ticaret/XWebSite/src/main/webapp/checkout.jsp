<%@page import="com.java.finalproject.model.Message"%>
<%@page import="com.java.finalproject.dao.ProductDAO"%>
<%@page import="com.java.finalproject.dao.CartDAO"%>
<%@page errorPage="error_ex.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
User activeUser = (User) session.getAttribute("activeUser");
if (activeUser == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
String from = (String)session.getAttribute("from");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="Attachment/collective_css.jsp"%>
</head>
<body>
	
	<%@include file="Attachment/navbar.jsp"%>

	<div class="container mt-5" style="font-size: 17px;">
		<div class="row">

			
			<div class="col-md-8">
				<div class="card">
					<div class="container px-3 py-3">
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Delivery Address</h4>
							</div>
						</div>
						<div class="mt-3 mb-3">
							<h5><%=user.getUserName()%>
								&nbsp;
								<%=user.getUserPhone()%></h5>
							<%
							StringBuilder str = new StringBuilder();
							str.append(user.getUserAddress() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserPincode());
							out.println(str);
							%>
							<br>
							<div class="text-end">
								<button type="button" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									Change Address</button>
							</div>
						</div>
						<hr>
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Payment Options</h4>
							</div>
						</div>
						<form action="OrderOpServ" method="post">
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio" name="paymentMode"
									value="Card Payment" required><label class="form-check-label">Credit
									/Debit</label><br>
								<div class="mb-3">

									<input class="form-control mt-3" type="number"
										placeholder="Enter card number" name="cardno">
									<div class="row gx-5">
										<div class="col mt-3">
											<input class="form-control" type="number"
												placeholder="Enter CVV" name="cvv">
										</div>
										<div class="col mt-3">
											<input class="form-control" type="text"
												placeholder="Valid through i.e '07/23'">
										</div>
									</div>
									<input class="form-control mt-3" type="text"
										placeholder="Enter name" name="name">
								</div>
								<input class="form-check-input" type="radio" name="payementMode"
									value="Cash on Delivery"><label
									class="form-check-label">Cash</label>
							</div>
							<div class="text-end">
								<button type="submit"
									class="btn btn-lg btn-outline-primary mt-3">Place
									Order</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			

			<div class="col-md-4">
				<div class="card">
					<div class="container px-3 py-3">
						<h4>Price Details</h4>
						<hr>
						<%
						if (from.trim().equals("cart")) {
							CartDAO cartDao = new CartDAO(ConnectionPro.getConnection());
							int totalProduct = cartDao.getCartCountByUserId(user.getUserId());
							float totalPrice = (float) session.getAttribute("totalPrice");
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td><%=totalProduct%></td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td>&#8378; <%=totalPrice%></td>
							</tr>
							<tr>
								<td>Delivery Charge</td>
								<td>&#8378; 20</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td>&#8378; 10</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										&#8378;
										<%=totalPrice + 30%></h5></td>
							</tr>
						</table>
						<%
						} else {
							ProductDAO productDao = new ProductDAO(ConnectionPro.getConnection());
							int pid = (int) session.getAttribute("pid");
							float price = productDao.getProductPriceById(pid);
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td>1</td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td>&#8378; <%=price%></td>
							</tr>
							<tr>
								<td>Delivery Charges</td>
								<td>&#8378; 20</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td>&#8378; 10</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										&#8378;
										<%=price + 30%></h5></td>
							</tr>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>


	
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Change
						Address</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="UpdateUserServ" method="post">
					<input type="hidden" name="operation" value="changeAddress">
					<div class="modal-body mx-3">
						<div class="mt-2">
							<label class="form-label fw-bold">Address</label>
							<textarea name="user_address" rows="3"
								placeholder="Enter Address(Area and Street))"
								class="form-control" required></textarea>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">City</label> <input
								class="form-control" type="text" name="city"
								placeholder="City/District/Town" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Pincode</label> <input
								class="form-control" type="number" name="pincode"
								placeholder="Pincode" maxlength="6" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">State</label> <select
								name="state" class="form-select">
								<option selected>--Select State--</option>
								<option value="Almanya">Almanya</option>
								<option value="Turkiye">Turkiye</option>
								<option value="Kazakistan">Kazakistan</option>
								<option value="Rusya">Rusya</option>
								<option value="Ingiltere">Ingiltere</option>
								<option value="Fransa">Fransa</option>
								<option value="Guney Kore">Guney Kore</option>
								<option value="Misir">Misir</option>
								<option value="Hindistan">Hindistan</option>
								<option value="Turkmenistan">Turkmenistan</option>
								<option value="Hollanda">Hollanda</option>
								<option value="Polonya">Polonya</option>
								<option value="Amerika">Amerika</option>
								<option value="Azerbaycan">Azerbaycan</option> 
								<option value="Bulgaristan">Bulgaristan</option>
								<option value="Gurcistan">Gurcistan</option>
								<option value="Italya">Italya</option>
								<option value="Japonya">Japonya</option>
								<option value="Cin">Cin</option>
								<option value="Tayland">Tayland</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>