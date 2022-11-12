package dao;

import java.sql.Date;

public class Order {
	int order_id;
	int user_id;
	double total_price;
	String note;
	String phone;
	String address;
	String payment;
	Date created;
	int status3;
	String date_delivery;
	
	public Order() {

	}

	public Order(int order_id, int user_id, double total_price, String note, String phone, String address,
			String payment, Date created, int status3, String date_delivery) {
		this.order_id = order_id;
		this.user_id = user_id;
		this.total_price = total_price;
		this.note = note;
		this.phone = phone;
		this.address = address;
		this.payment = payment;
		this.created = created;
		this.status3 = status3;
		this.date_delivery = date_delivery;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public int getStatus3() {
		return status3;
	}

	public void setStatus3(int status3) {
		this.status3 = status3;
	}

	public String getDate_delivery() {
		return date_delivery;
	}

	public void setDate_delivery(String date_delivery) {
		this.date_delivery = date_delivery;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", total_price=" + total_price + ", note="
				+ note + ", phone=" + phone + ", address=" + address + ", payment=" + payment + ", created=" + created
				+ ", status3=" + status3 + ", date_delivery=" + date_delivery + "]";
	}
	
	
}
