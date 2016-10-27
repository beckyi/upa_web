package kr.ac.sungkyul.upa.vo;

public class UserVo {
	private String id;
	private String password;
	private String carnum;
	private String phonenum;
	private String regdate;
	private String image;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "UserDao [id=" + id + ", password=" + password + ", carnum=" + carnum + ", phonenum=" + phonenum
				+ ", image=" + image + ", status=" + status + "]";
	}
}
