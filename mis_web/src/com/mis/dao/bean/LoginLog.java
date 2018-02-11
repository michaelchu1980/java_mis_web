package com.mis.dao.bean;

import java.util.Date;


public class LoginLog {

	private int Id;
	private String UserName;
	private String UserIp;
	private String City;
	private boolean Success;
	private Date LoginDate;
	
public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserIp() {
		return UserIp;
	}
	public void setUserIp(String userIp) {
		UserIp = userIp;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public boolean isSuccess() {
		return Success;
	}
	public void setSuccess(boolean success) {
		Success = success;
	}
	public Date getLoginDate() {
		return LoginDate;
	}
	public void setLoginDate(Date loginDate) {
		LoginDate = loginDate;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "LoginLog [Id=" + Id + ", UserName=" + UserName + ", UserIp=" + UserIp + ", City=" + City + ", Success="
				+ Success + ", LoginDate=" + LoginDate + "]";
	}


}
