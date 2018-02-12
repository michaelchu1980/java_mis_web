package com.mis.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mis.dao.dbc.MssqlHelper;
import com.mis.common.JSONHelper;

public class CadlogcontentDAO {

	public static String findCadLog()throws Exception{
		String sqlStr="select top(200)* from CAD_LOG_ALL_V";
		
	String jsonData=	JSONHelper.RsToJSONString(MssqlHelper.getResultSet(sqlStr));
		
		if(jsonData!=null) {
			return jsonData;
		}
		else {
			return "[]";
		}
		
	}
}
