<%@page import="com.java.finalproject.dao.ProductDAO"%>
<%@page import="com.java.finalproject.model.Product"%>
<%@page import="com.java.finalproject.connect.ConnectionPro"%>
<%@page errorPage="error_ex.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
ProductDAO productDao = new ProductDAO(ConnectionPro.getConnection());
List<Product> productList = productDao.getAllLateProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="Attachment/collective_css.jsp"%>
<style type="text/CSS">

<%@include file="CSS/style.css"%>

.cus-card {
	border-radius: 50%;
	border-color: transparent;
	max-height: 200px;
	max-width: 200px;
}

.real-price {
	font-size: 20px !important;
	font-weight: 600;
}

.product-price {
	font-size: 17px !important;
	text-decoration: line-through;
}

.product-discount {
	font-size: 15px !important;
	color: #027a3e;
}
</style>
</head>
<body>
	
	<%@include file="Attachment/navbar.jsp"%>

	
	<div class="container-fluid px-3 py-3"
		style="background-color: #E6E6FA; ; ">
		<div class="row">
			<div class="card-group">
			
				<%
				for (Category c : categoryList) {
				%>
				<div class="col text-center">
					<a href="products.jsp?category=<%=c.getCategoryId()%>"
						style="text-decoration: none;">
						<div class="card cus-card h-100">
							<div class="container text-center">
								<img src="Product_imgs\<%=c.getCategoryImage()%>" class="mt-3 "
									style="max-width: 100%; max-height: 100px; width: auto; height: auto;">
							</div>
							<h6><%=c.getCategoryName()%></h6>
						</div>
					</a>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
	
	
	<div id="carouselAutoplaying" class="carousel slide carousel-dark mt-3 mb-3" data-bs-ride="carousel">
	   <div class="carousel-inner">
	       <div class="carousel-item active">
	           <img src="image/sale1.jpg" class="d-block w-100" alt="First slide">
	       </div>
	       <div class="carousel-item">
	           <img src="image/sale2.jpg" class="d-block w-100" alt="Second slide">
	       </div>
	       <div class="carousel-item">
	           <img src="image/sale3.jpg" class="d-block w-100" alt="Third slide">
	       </div>
	   </div>
	   <button class="carousel-control-prev" type="button" data-bs-target="#carouselAutoplaying" data-bs-slide="prev">
	       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	       <span class="visually-hidden">Previous</span>
	   </button>
	   <button class="carousel-control-next" type="button" data-bs-target="#carouselAutoplaying" data-bs-slide="next">
	       <span class="carousel-control-next-icon" aria-hidden="true"></span>
	       <span class="visually-hidden">Next</span>
	   </button>
	</div>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script>
	var carouselElement = document.querySelector('#carouselAutoplaying');
	var carousel = new bootstrap.Carousel(carouselElement, {
	    interval: 3000, // Slayt geçiş süresi (ms)
	    wrap: true // Otomatik olarak en başa döner
	});
	</script>

	
	<div class="container-fluid py-3 px-3" style="background: #f2f2f2;">
		<div class="row row-cols-1 row-cols-md-4 g-3">
			<div class="col">
				<div class="container text-center px-5 py-5">
					<h1>Latest Products</h1>
					<img src="image\product.png" class="card-img-top"
						style="max-width: 100%; max-height: 200px; width: auto;">
				</div>
			</div>
			<%
			for (int i = 0; i < Math.min(3, productList.size()); i++) {
			%>
			<div class="col">
				<a href="viewProduct.jsp?pid=<%=productList.get(i).getProductId()%>"
					style="text-decoration: none;">
					<div class="card h-100">
						<div class="container text-center">
							<img
								src="Product_imgs\<%=productList.get(i).getProductImages()%>"
								class="card-img-top m-2"
								style="max-width: 100%; max-height: 200px; width: auto;">
						</div>
						<div class="card-body">
							<h5 class="card-title text-center"><%=productList.get(i).getProductName()%></h5>

							<div class="container text-center">
								<span class="price">&#8378;<%=productList.get(i).getProductPrice()%></span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<%
			}
			%>
		</div>
	</div>

	
	<%
	String order = (String) session.getAttribute("order");
	if (order != null) {
	%>
	<script type="text/javascript">
		console.log("testing..4...");
		Swal.fire({
		  icon : 'success',
		  title: 'Order Placed, Thank you!',
		  text: 'Confirmation will be sent to <%=user.getUserEmail()%>',
		  width: 600,
		  padding: '3em',
		  showConfirmButton : false,
		  timer : 3500,
		  backdrop: `
		    rgba(0,0,123,0.4)
		  `
		});
	</script>
	<%
	}
	session.removeAttribute("order");
	%>
	
</body>
</html>