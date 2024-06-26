package com.java.finalproject.model;

public class Wishlist {

	private int wishlistId;
	private int userId;
	private int productId;
	
	public Wishlist() {
		super();
	}

	public Wishlist(int wishlistId, int productId) {
		super();
		this.wishlistId = wishlistId;
		this.productId = productId;
	}

	public int getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
}
