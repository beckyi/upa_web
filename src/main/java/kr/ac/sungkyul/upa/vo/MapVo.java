package kr.ac.sungkyul.upa.vo;

public class MapVo {
	private Long index;
	private String latitude;
	private String longitude;
	private String name;
	private String address;
	private String starttime;
	private String endtime;
	private Integer state;
	private String image;
	private String image2;
	private String image3;
	private String master;
	private Integer fee;
	private String note;
	public Long getIndex() {
		return index;
	}
	public void setIndex(Long index) {
		this.index = index;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public Integer getFee() {
		return fee;
	}
	public void setFee(Integer fee) {
		this.fee = fee;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "MapVo [index=" + index + ", latitude=" + latitude + ", longitude=" + longitude + ", name=" + name
				+ ", address=" + address + ", starttime=" + starttime + ", endtime=" + endtime + ", state=" + state
				+ ", image=" + image + ", image2=" + image2 + ", image3=" + image3 + ", master=" + master + ", fee="
				+ fee + ", note=" + note + "]";
	}
}
