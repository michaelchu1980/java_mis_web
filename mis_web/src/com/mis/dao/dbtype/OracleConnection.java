package com.mis.dao.dbtype;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
public class OracleConnection { 
    
	
	 private static String driver = "";
	    private static String url = "";
	    private static String userName = "";
	    private static String password = "";
 private static Properties pp = null;
 private static FileInputStream fis = null;
 
 // ����������ֻ��Ҫһ��
 static {
     try {
     	//File fileB = new File( MysqlHelper.class.getClass().getResource( "" ).getPath()); 
     	//String path=fileB.getPath();
         // �������ļ�dbinfo.properties�ж�ȡ������Ϣ
         pp = new Properties();
         fis =  new FileInputStream("/jdbc.properties");
         pp.load(fis);
         driver = pp.getProperty("oracleDriver");
         url = pp.getProperty("oracleUrl");
         userName = pp.getProperty("oracleUser");
         password = pp.getProperty("oarclePassword");

         Class.forName(driver);
     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         if (fis != null)
             try {
                 fis.close();
             } catch (IOException e) {
                 e.printStackTrace();
             }
         fis = null;

     }
 }
    /** 
     * OracleConnection���캯�� 
     * @param String connectionString : 
     *                 ���ݿ����Ӳ�������ʽ��url;user;passworld. 
     *                 ���磺jdbc:oracle:thin:@localhost:1521:db;system;manager 
     * @throws Exception 
     */ 
    public OracleConnection() throws Exception 
    { 
        Class.forName(this._driver); 
      //  String[] _sa = connectionString.split(";"); 
        this.connection = DriverManager.getConnection(url, userName, password); 
    } 
    
    /** 
     * �ر����ݿ����� 
     * @throws Exception 
     */ 
    public void Close() throws Exception 
    { 
        if(!connection.isClosed()&&connection.getAutoCommit()) 
        { 
            this.connection.close(); 
        } 
    } 
    
    /** 
     * ��OracleConnection�ഴ���������OracleTransaction��ʵ�� 
     * @return 
     * @throws Exception 
     */ 
    public OracleTransaction BeginTransaction() throws Exception 
    { 
        OracleTransaction tran = new OracleTransaction(this); 
        return tran; 
    } 
    
    /** 
     * ��ȡjava.sql.Connection���� 
     * @return java.sql.Connection���� 
     */ 
    public Connection GetConnection() 
    { 
        return this.connection; 
    } 
    
    private String _driver = "oracle.jdbc.driver.OracleDriver"; 
    private Connection connection = null; 

} 
