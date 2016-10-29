package kr.ac.sungkyul.upa.vo;

public class MapVo {
	private Long index;
	private String latitude;
	private String longitude;
	private String name;
	private String address;
	private Double starttime;
	private Double endtime;
	private Integer state;
	private String image;
	private String master;
	private Integer fee;
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
	public Double getStarttime() {
		return starttime;
	}
	public void setStarttime(Double starttime) {
		this.starttime = starttime;
	}
	public Double getEndtime() {
		return endtime;
	}
	public void setEndtime(Double endtime) {
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
	
	@Override
	public String toString() {
		return "MapVo [index=" + index + ", latitude=" + latitude + ", longitude=" + longitude + ", name=" + name
				+ ", address=" + address + ", starttime=" + starttime + ", endtime=" + endtime + ", state=" + state
				+ ", image=" + image + ", master=" + master + ", fee=" + fee + "]";
	}
}
