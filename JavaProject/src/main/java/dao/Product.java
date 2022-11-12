package dao;

import java.sql.Date;

public class Product {
	int pro_id;
	String pro_name;
	int cat_id;
	String images;
	double price;
	String description;
	int status2;
	Date date_create;
	int quantity;
	
	
	public Product() {
		
	}
	
	public Product(int pro_id, String pro_name, int cat_id, String images, double price, String description,
			int status2, Date date_create, int quantity) {
		super();
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.cat_id = cat_id;
		this.images = images;
		this.price = price;
		this.description = description;
		this.status2 = status2;
		this.date_create = date_create;
		this.quantity = quantity;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus2() {
		return status2;
	}

	public void setStatus2(int status2) {
		this.status2 = status2;
	}

	public Date getDate_create() {
		return date_create;
	}

	public void setDate_create(Date date_create) {
		this.date_create = date_create;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Product [pro_id=" + pro_id + ", pro_name=" + pro_name + ", cat_id=" + cat_id + ", images=" + images
				+ ", price=" + price + ", description=" + description + ", status2=" + status2 + ", date_create="
				+ date_create + ", quantity=" + quantity + "]";
	}
	
}
