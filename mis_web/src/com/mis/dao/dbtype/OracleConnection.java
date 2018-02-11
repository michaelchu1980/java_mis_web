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
 
 // 加载驱动，只需要一次
 static {
     try {
     	//File fileB = new File( MysqlHelper.class.getClass().getResource( "" ).getPath()); 
     	//String path=fileB.getPath();
         // 从配置文件dbinfo.properties中读取配置信息
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
     * OracleConnection构造函数 
     * @param String connectionString : 
     *                 数据库连接参数，格式：url;user;passworld. 
     *                 例如：jdbc:oracle:thin:@localhost:1521:db;system;manager 
     * @throws Exception 
     */ 
    public OracleConnection() throws Exception 
    { 
        Class.forName(this._driver); 
      //  String[] _sa = connectionString.split(";"); 
        this.connection = DriverManager.getConnection(url, userName, password); 
    } 
    
    /** 
     * 关闭数据库连接 
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
     * 从OracleConnection类创建事务处理的OracleTransaction类实例 
     * @return 
     * @throws Exception 
     */ 
    public OracleTransaction BeginTransaction() throws Exception 
    { 
        OracleTransaction tran = new OracleTransaction(this); 
        return tran; 
    } 
    
    /** 
     * 获取java.sql.Connection对象 
     * @return java.sql.Connection对象 
     */ 
    public Connection GetConnection() 
    { 
        return this.connection; 
    } 
    
    private String _driver = "oracle.jdbc.driver.OracleDriver"; 
    private Connection connection = null; 

} 
