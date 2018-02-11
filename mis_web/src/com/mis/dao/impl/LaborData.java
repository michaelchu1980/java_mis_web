package com.mis.dao.impl;
import com.mis.common.JSONHelper;
import com.mis.dao.dbc.*;
import com.mis.dao.dbtype.CommandType;
import com.mis.dao.dbtype.DataSet;

public class LaborData {

public static String  GetLaborData() throws Exception {
	String[] parameter=null;
  String jsonData=   JSONHelper.RsToJSONString( OracleHelper.executeQuery( "select * from PROD_MANU_TTI_REPORT_TEMP_V1 where rownum<1000",parameter));
	return jsonData.isEmpty()?"[]":jsonData;
	
}
   
}
