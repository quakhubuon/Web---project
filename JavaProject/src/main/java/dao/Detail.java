package dao;

public class Detail {
	int detail_id;
	int pro_id;
	double price;
	int quanity;
	
	
	public Detail() {
		
	}

	public Detail(int detail_id, int pro_id, int quanity, double price) {
		super();
		this.detail_id = detail_id;
		this.pro_id = pro_id;
		this.quanity = quanity;
		this.price = price;
	}

	public int getDetail_id() {
		return detail_id;
	}

	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Detail [detail_id=" + detail_id + ", pro_id=" + pro_id + ", quanity=" + quanity + ", price=" + price
				+ "]";
	}
	
}
