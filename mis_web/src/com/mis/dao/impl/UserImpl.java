package com.mis.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mis.dao.bean.User;
import com.mis.dao.dbc.*;

public class UserImpl {

	public static User UserLogin(String loginId,String loginPwd) {
		User user=null;
		StringBuilder sbStr=new StringBuilder();
		sbStr.append("select Id,UserId,UserName,UserPwd,IsAble,IfChangePwd,AddDate,Description from tbUser ");
		sbStr.append("where UserId=? ");
		String[] sqlParameter=new String[1];
		sqlParameter[0]=loginId;
		ResultSet rs=MysqlHelper.executeQuery(sbStr.toString(), sqlParameter);
		
		try {
			while(rs.next()) {
				user=new User();
				user.setId(rs.getInt(1));
				user.setUserId(rs.getString(2));
				user.setUserName(rs.getString(3));
				//user.setUserName(rs.getString("UserName"));// Result.getString(String ColumnLabel)
				user.setUserPwd(rs.getString(4));
				user.setIsAble(rs.getBoolean(5));
				user.setIfChangePwd(rs.getBoolean(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null){
					rs.close();
				}
				
			}catch(Exception e){}
		
		
	}
		return user;
}
}
