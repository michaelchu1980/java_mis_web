package com.mis.dao.impl;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mis.dao.dbc.MssqlHelper;
import com.mis.dao.dbc.MysqlHelper;

import microsoft.sql.Types;

import com.mis.common.JSONHelper;

public class loginlogImpl {

	public static String CheckLogin(String ip,String lastLoginTime)throws Exception{
		String result="";
		ResultSet rs=null;

		 String[] parameters=new  String[] {ip, lastLoginTime};
		 String sql="{call sp_checklogin(?,?)}";
	CallableStatement cs=(CallableStatement)	MysqlHelper.callProcInput(sql, parameters);
		 rs=cs.executeQuery();
	  if(rs.next()) {
	
			  result=rs.getString(1);
		  
	  }
		return result;
		}
		
	}

