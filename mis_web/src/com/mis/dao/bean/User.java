package com.mis.dao.bean;

import java.util.Date;

public class User {
private int Id;
private String UserId;
private String UserName;
private String UserPwd;
private boolean IsAble;
private boolean IfChangePwd;
private Date AddDate;
private String Description;
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "User [Id=" + Id + ", UserId=" + UserId + ", UserName=" + UserName + ", UserPwd=" + UserPwd + ", IsAble="
			+ IsAble + ", IfChangePwd=" + IfChangePwd + ", AddDate=" + AddDate + ", Description=" + Description + "]";
}
/**
 * @return the id
 */
public int getId() {
	return Id;
}
/**
 * @param id the id to set
 */
public void setId(int id) {
	Id = id;
}
/**
 * @return the userId
 */
public String getUserId() {
	return UserId;
}
/**
 * @param userId the userId to set
 */
public void setUserId(String userId) {
	UserId = userId;
}
/**
 * @return the userName
 */
public String getUserName() {
	return UserName;
}
/**
 * @param userName the userName to set
 */
public void setUserName(String userName) {
	UserName = userName;
}
/**
 * @return the userPwd
 */
public String getUserPwd() {
	return UserPwd;
}
/**
 * @param userPwd the userPwd to set
 */
public void setUserPwd(String userPwd) {
	UserPwd = userPwd;
}
/**
 * @return the isAble
 */
public boolean isIsAble() {
	return IsAble;
}
/**
 * @param isAble the isAble to set
 */
public void setIsAble(boolean isAble) {
	IsAble = isAble;
}
/**
 * @return the ifChangePwd
 */
public boolean isIfChangePwd() {
	return IfChangePwd;
}
/**
 * @param ifChangePwd the ifChangePwd to set
 */
public void setIfChangePwd(boolean ifChangePwd) {
	IfChangePwd = ifChangePwd;
}
/**
 * @return the addDate
 */
public Date getAddDate() {
	return AddDate;
}
/**
 * @param addDate the addDate to set
 */
public void setAddDate(Date addDate) {
	AddDate = addDate;
}
/**
 * @return the description
 */
public String getDescription() {
	return Description;
}
/**
 * @param description the description to set
 */
public void setDescription(String description) {
	Description = description;
}
}
