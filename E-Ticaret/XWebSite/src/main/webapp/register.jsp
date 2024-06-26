<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@include file="Attachment/collective_css.jsp"%>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	
	<%@include file="Attachment/navbar.jsp"%>

	<div class="container-fluid mt-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="image/sign_up.png" style="max-width: 80px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Create Account</h3>
						<%@include file="Attachment/alert.jsp"%>

						<!--registration-form-->
						<form id="register-form" action="RegisterServ" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Your name</label> <input type="text"
										name="user_name" class="form-control"
										placeholder="First and last name" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Email</label> <input type="email"
										name="user_email" placeholder="Email address"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Mobile number</label> <input
										type="number" name="user_mobile_no"
										placeholder="Mobile number" class="form-control">
								</div>
								<div class="col-md-6 mt-5">
									<label class="form-label pe-3">Gender</label> <input
										class="form-check-input" type="radio" name="gender"
										value="Male"> <span class="form-check-label pe-3 ps-1">
										Male </span> <input class="form-check-input" type="radio"
										name="gender" value="Female"> <span
										class="form-check-label ps-1"> Female </span>
								</div>
							</div>
							<div class="mt-2">
								<label class="form-label">Address</label> <input type="text"
									name="user_address"
									placeholder="Enter Address"
									class="form-control" required>
							</div>  
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">City</label> <input
										class="form-control" type="text" name="city"
										placeholder="City" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Pincode</label> <input
										class="form-control" type="number" name="pincode"
										placeholder="Pincode" maxlength="6" required>
								</div>  
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
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
								<div class="col-md-6 mt-2">
									<label class="form-label">Password</label> <input
										type="password" name="user_password"
										placeholder="Enter Password" class="form-control" required>
								</div>
							</div>

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3">Submit</button>
								<button type="reset" class="btn btn-outline-primary">Reset</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									Already have an account?<a href="login.jsp"
										style="text-decoration: none"> Sign in</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>