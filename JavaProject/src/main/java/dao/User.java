package dao;

public class User {
	int user_id;
	String name;
	String email;
	String password;
	String user_type;
	String phone;
	String address;
	int status4;
	
	public User() {
		
	}
	
	public User(int user_id, String name, String email, String password, String user_type, String phone, String address, int status4) {
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.user_type = user_type;
		this.phone = phone;
		this.address = address;
		this.status4 = status4;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
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

	public int getStatus4() {
		return status4;
	}

	public void setStatus4(int status4) {
		this.status4 = status4;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", user_type=" + user_type + ", phone=" + phone + ", address=" + address + ", status4=" + status4
				+ "]";
	}
	
	
}
