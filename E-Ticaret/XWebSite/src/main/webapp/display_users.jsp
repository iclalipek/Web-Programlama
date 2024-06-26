<%@page import="com.java.finalproject.model.Message"%>
<%@page import="com.java.finalproject.dao.UserDAO"%>
<%@page errorPage="error_ex.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User's</title>
<%@include file="Attachment/collective_css.jsp"%>
</head>
<body>
	
	<%@include file="Attachment/navbar.jsp"%>

	
	<div class="container-fluid px-5 py-3">
		<div class="container-fluid px-5 py-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body px-3">
						<div class="container text-center">
							<img src="image/admin.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Add User</h3>
						<%@include file="Attachment/alert.jsp"%>

						
						<form action="UserServ?operation=save" method="get">
							<div class="row">
								<div class="mb-3">
									<label class="form-label">Name</label> <input type="text"
										name="name" placeholder="Enter name" class="form-control"
										required>
								</div>
								<div class="mb-3">
									<label class="form-label">Email</label> <input type="email"
										name="email" placeholder="Email address" class="form-control"
										required>
								</div>
							</div>
							<div class="row">
								<div class="mb-3">
									<label class="form-label">Password</label> <input
										type="password" name="password" placeholder="Enter password"
										class="form-control" required>
								</div>
								<div class="mb-3">
									<label class="form-label">Phone</label> <input type="number"
										name="phone" placeholder="Enter phone number"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="mt-5">
									<label class="form-label pe-3">Gender</label> <input
										class="form-check-input" type="radio" name="gender"
										value="Male"> <span class="form-check-label pe-3 ps-1">
										Male </span> <input class="form-check-input" type="radio"
										name="gender" value="Female"> <span
										class="form-check-label ps-1"> Female </span>
								</div>
								<div class="mb-3">
								<label class="form-label">Address</label> <input type="text"
									name="user_address"
									placeholder="Enter Address"
									class="form-control" required>
								</div>  
							</div>
							<div class="row">
								<div class="mb-3">
									<label class="form-label">City</label> <input
										class="form-control" type="text" name="city"
										placeholder="City" required>
								</div>
								<div class="mb-3">
									<label class="form-label">Pincode</label> <input
										class="form-control" type="number" name="pincode"
										placeholder="Pincode" maxlength="6" required>
								</div>  
							</div>
							<div class="row">
								<div class="mt-3">
									<label class="form-label">State</label> <select name="state"
										class="form-select">
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
							<div class="d-grid gap-2 col-6 mx-auto py-3">
								<button type="submit" class="btn btn-primary me-3">Register</button>
							</div>
						</form>
					</div>

				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body px-3">
						<table class="table table-hover">
							<tr class="text-center table-primary" style="font-size: 18px;">
								<th>User Name</th>
								<th>Email</th>
								<th>Phone No.</th>
								<th>Gender</th>
								<th>Address</th>
								<th>Register Date</th>
								<th>Action</th>
							</tr>
							<%
							UserDAO userDao = new UserDAO(ConnectionPro.getConnection());
							List<User> userList = userDao.getAllUser();
							for (User u : userList) {
							%>
							<tr>
								<td><%=u.getUserName()%></td>
								<td><%=u.getUserEmail()%></td>
								<td><%=u.getUserPhone()%></td>
								<td><%=u.getUserGender()%></td>
								<td><%=userDao.getUserAddress(u.getUserId())%></td>
								<td><%=u.getDateTime()%></td>
								<td><a href="UpdateUserServ?operation=deleteUser&uid=<%=u.getUserId()%>" role="button" class="btn btn-danger">Remove</a></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>