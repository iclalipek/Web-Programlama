package com.java.finalproject.model;

public class Product {

	private int productId;
	private String productName;
	private String productDescription;
	private float productPrice;
	private int productQuantity;
	private String productImages;
	private int categoryId;
	
	public Product() {
		super();
	}

	public Product(int productId, String productName, String productDescription, float productPrice,
			int productQuantity, String productImages, int categoryId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}

	public Product(String productName, String productDescription, float productPrice,
			int productQuantity, String productImages, int categoryId) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}

	public Product(int productId, String productName, float productPrice, int productQuantity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public float getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ",productQuantity=" + productQuantity 
				+ ", productImages=" + productImages + ", categoryId=" + categoryId + "]";
	}
}
