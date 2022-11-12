package dao;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Category {
	int cat_id;
	String cat_name;
	int status;
	Date date_create;
	Date date_update;

	public Category() {

	}

	public Category(int cat_id, String cat_name, int status, Date date_create, Date date_update) {
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
		this.status = status;
		this.date_create = date_create;
		this.date_update = date_update;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDate_create() {
		return date_create;
	}

	public void setDate_create(Date date_create) {
		this.date_create = date_create;
	}

	public Date getDate_update() {
		return date_update;
	}

	public void setDate_update(Date date_update) {
		this.date_update = date_update;
	}

	@Override
	public String toString() {
		return "Category [cat_id=" + cat_id + ", cat_name=" + cat_name + ", status=" + status + ", date_create="
				+ date_create + ", date_update=" + date_update + "]";
	}
	
	
}
