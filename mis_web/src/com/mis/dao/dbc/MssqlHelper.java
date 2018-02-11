package com.mis.dao.dbc;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.util.logging.*;
import javax.swing.table.*;
public class MssqlHelper {

    private static String driver = "";
    private static String url = "";
    private static String userName = "";
    private static String password = "";

    private static Properties pp = null;
    private static InputStream fis = null;

/**
 *  SQL ��������
 * ͨ����,���Ժ����ɵ�ʹ�� JDBC ���������ݿ�
 * @author Michael
 */


/*    *//**
     * ����
     *//*
    public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    *//**
     * �����ַ���
     *//*
    public static String url = "jdbc:sqlserver://10.64.20.118:1433;databaseName=readlog;";
    *//**
     * �û���
     *//*
    public static String user = "license_log_user";
    *//**
     * ����
     *//*
    public static String password = "tti@lic2018";*/
    // ����������ֻ��Ҫһ��
    static {
        try {
        	//File fileB = new File( MysqlHelper.class.getClass().getResource( "" ).getPath()); 
        	//String path=fileB.getPath();
            // �������ļ�dbinfo.properties�ж�ȡ������Ϣ
            pp = new Properties();
            String path="jdbc.properties";
            fis =  MssqlHelper.class.getClassLoader(). getResourceAsStream(path);
            pp.load(fis);
            driver = pp.getProperty("MssqlDriver");
            url = pp.getProperty("MssqlUrl");
            userName = pp.getProperty("MssqlUserName");
            password = pp.getProperty("MssqlPwd");

           // Class.forName(driver);
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
/*    *//**
     * ������ʵ��������
     *//*
    private MssqlHelper()
    {
    }
*/
    /**
     * ��ȡһ�����ݿ�����
     * ͨ���������  driver / url / user / password ���ĸ���̬������ �������ݿ���������
     * @return ���ݿ�����
     */
    public static Connection getConnection()
    {
        try
        {
            // ��ȡ����,����ʹ�õ��� sqljdbc_1.2.2828.100_chs.exe,��ͬ�汾������,���������ͬ
            Class.forName(driver);
        } catch (ClassNotFoundException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

        try
        {
            return DriverManager.getConnection(url, userName , password);
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /**
     * ��ȡһ�� Statement
     * �� Statement �Ѿ��������ݼ� ���Թ���,���Ը���
     * @return �����ȡʧ�ܽ����� null,����ʱ�ǵü�鷵��ֵ
     */
    public static Statement getStatement()
    {
        Connection conn = getConnection();
        if (conn == null)
        {
            return null;
        }
        try
        {
            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        // �������ݼ����Թ���,���Ը���
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            close(conn);
        }
        return null;
    }

    /**
     * ��ȡһ�� Statement
     * �� Statement �Ѿ��������ݼ� ���Թ���,���Ը���
     * @param conn ���ݿ�����
     * @return �����ȡʧ�ܽ����� null,����ʱ�ǵü�鷵��ֵ
     */
    public static Statement getStatement(Connection conn)
    {
        if (conn == null)
        {
            return null;
        }
        try
        {

            return conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        // �������ݼ����Թ���,���Ը���
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    /**
     * ��ȡһ���������� PreparedStatement
     * �� PreparedStatement �Ѿ��������ݼ� ���Թ���,���Ը���
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �����ȡʧ�ܽ����� null,����ʱ�ǵü�鷵��ֵ
     */
    public static PreparedStatement getPreparedStatement(String cmdText, Object... cmdParams)
    {
        Connection conn = getConnection();
        if (conn == null)
        {
            return null;
        }

        PreparedStatement pstmt = null;
        try
        {
            pstmt = conn.prepareStatement(cmdText, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            int i = 1;
            for (Object item : cmdParams)
            {
                pstmt.setObject(i, item);
                i++;
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
            close(conn);
        }
        return pstmt;
    }

    /**
     *  ��ȡһ���������� PreparedStatement
     * �� PreparedStatement �Ѿ��������ݼ� ���Թ���,���Ը���
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �����ȡʧ�ܽ����� null,����ʱ�ǵü�鷵��ֵ
     */
    public static PreparedStatement getPreparedStatement(Connection conn, String cmdText, Object... cmdParams)
    {
        if (conn == null)
        {
            return null;
        }

        PreparedStatement pstmt = null;
        try
        {
            pstmt = conn.prepareStatement(cmdText, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            int i = 1;
            for (Object item : cmdParams)
            {
                pstmt.setObject(i, item);
                i++;
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
            close(pstmt);
        }
        return pstmt;
    }

    /**
     * ִ�� SQL ���,���ؽ��Ϊ����
     * ��Ҫ����ִ�зǲ�ѯ���
     * @param cmdText SQL ���
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
     */
    public static int ExecSql(String cmdText)
    {
        Statement stmt = getStatement();
        if (stmt == null)
        {
            return -2;
        }
        int i;
        try
        {
            i = stmt.executeUpdate(cmdText);
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null,
                    ex);
            i = -1;
        }
        closeConnection(stmt);
        return i;
    }

    /**
     * ִ�� SQL ���,���ؽ��Ϊ����
     * ��Ҫ����ִ�зǲ�ѯ���
     * @param cmdText SQL ���
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
     */
    public static int ExecSql(Connection conn, String cmdText)
    {
        Statement stmt = getStatement(conn);
        if (stmt == null)
        {
            return -2;
        }
        int i;
        try
        {
            i = stmt.executeUpdate(cmdText);

        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null,
                    ex);
            i = -1;
        }
        close(stmt);
        return i;
    }

    /**
     * ִ�� SQL ���,���ؽ��Ϊ����
     * ��Ҫ����ִ�зǲ�ѯ���
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
     */
    public static int ExecSql(String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);
        if (pstmt == null)
        {
            return -2;
        }
        int i;
        try
        {
            i = pstmt.executeUpdate();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null,
                    ex);
            i = -1;
        }
        closeConnection(pstmt);
        return i;
    }

    /**
     * ִ�� SQL ���,���ؽ��Ϊ����
     * ��Ҫ����ִ�зǲ�ѯ���
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �Ǹ���:����ִ��; -1:ִ�д���; -2:���Ӵ���
     */
    public static int ExecSql(Connection conn, String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(conn, cmdText, cmdParams);
        if (pstmt == null)
        {
            return -2;
        }
        int i;
        try
        {
            i = pstmt.executeUpdate();

        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            i = -1;
        }
        close(pstmt);
        return i;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е�ֵ,��������
     * @param cmdText SQL ���
     * @return
     */
    public static Object ExecScalar(String cmdText)
    {
        ResultSet rs = getResultSet(cmdText);
        Object obj = buildScalar(rs);
        closeConnection(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е�ֵ,��������
     * @param conn ���ݿ�����
     * @param cmdText SQL ���
     * @return
     */
    public static Object ExecScalar(Connection conn, String cmdText)
    {
        ResultSet rs = getResultSet(conn, cmdText);
        Object obj = buildScalar(rs);
        closeEx(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е�ֵ,��������
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static Object ExecScalar(String cmdText, Object... cmdParams)
    {
        ResultSet rs = getResultSet(cmdText, cmdParams);
        Object obj = buildScalar(rs);
        closeConnection(rs);
        return obj;
    }

    /**
     * ���ؽ�����ĵ�һ�е�һ�е�ֵ,��������
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static Object ExecScalar(Connection conn, String cmdText, Object... cmdParams)
    {
        ResultSet rs = getResultSet(conn, cmdText, cmdParams);
        Object obj = buildScalar(rs);
        closeEx(rs);
        return obj;
    }

    /**
     * ����һ�� ResultSet
     * @param cmdText SQL ���
     * @return
     */
    public static ResultSet getResultSet(String cmdText)
    {
        Statement stmt = getStatement();
        if (stmt == null)
        {
            return null;
        }
        try
        {
            return stmt.executeQuery(cmdText);
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            closeConnection(stmt);
        }
        return null;
    }

    /**
     * ����һ�� ResultSet
     * @param conn
     * @param cmdText SQL ���
     * @return
     */
    public static ResultSet getResultSet(Connection conn, String cmdText)
    {
        Statement stmt = getStatement(conn);
        if (stmt == null)
        {
            return null;
        }
        try
        {
            return stmt.executeQuery(cmdText);
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            close(stmt);
        }
        return null;
    }

    /**
     * ����һ�� ResultSet
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static ResultSet getResultSet(String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);
        if (pstmt == null)
        {
            return null;
        }
        try
        {
            return pstmt.executeQuery();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            closeConnection(pstmt);
        }
        return null;
    }

    /**
     * ����һ�� ResultSet
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return
     */
    public static ResultSet getResultSet(Connection conn, String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(conn, cmdText, cmdParams);
        if (pstmt == null)
        {
            return null;
        }
        try
        {
            return pstmt.executeQuery();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            close(pstmt);
        }
        return null;
    }

    public static Object buildScalar(ResultSet rs)
    {
        if (rs == null)
        {
            return null;
        }
        Object obj = null;
        try
        {
            if (rs.next())
            {
                obj = rs.getObject(1);
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    /**
     * �� ResultSet �й��� DefaultTableModel
     * @param rs ResultSet
     * @return
     */
    @SuppressWarnings("serial")
	public static DefaultTableModel buildTableModel(ResultSet rs)
    {
        if (rs == null)
        {
            return null;
        }
        ResultSetMetaData rsm;
        String[] columnNames = null; // �б���
        Object[][] data = null; // ������
        DefaultTableModel model; // ���ģ��
        try
        {
            // ��ѯ���
            rsm = rs.getMetaData();
            // �ж�ʱ�����ʵ�ֶ����ݿ�ĸ���
            if (rs.getConcurrency() == ResultSet.CONCUR_UPDATABLE)
            {
                System.out.println("Can UPDATABLE");
            } else
            {
                System.out.println("Only Ready");
            }
            // ��ȡ�б���
            columnNames = new String[rsm.getColumnCount()];
            for (int i = 0; i < rsm.getColumnCount(); i++)
            {
                columnNames[i] = rsm.getColumnName(i + 1);
            }

            int row = 0;
            int colum = 0;
            int columCount = rsm.getColumnCount();
            // ��ȡ����,û��ֱ�ӵķ���,�������ƶ�����¼��β,��ȡ�к�,��Ϊ����,Ȼ�����ƻ���
            rs.last();
            int rowCount = rs.getRow();
            rs.beforeFirst();
            System.out.println("rowCount:" + rowCount);
            // ��ȡ���ݵ����������
            data = new Object[rowCount][columCount];
            while (rs.next())
            {
                for (colum = 0; colum < rsm.getColumnCount(); colum++)
                {
                    data[row][colum] = rs.getObject(colum + 1);
                }
                row++;
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null,
                    ex);
            return null;
        }

        // ��ʼ������ģ��
        model = new DefaultTableModel(data, columnNames)
        {

            /**
             * ��д getColumnClass ����ʹ����Զ�ʶ����������
             */
            @SuppressWarnings({ "unchecked", "rawtypes" })
            @Override
            public Class getColumnClass(int c)
            {
                // ����Ҫ�Կ����ݼ����м���
                if (dataVector.isEmpty() == false && getValueAt(0, c) != null)
                {
                    return getValueAt(0, c).getClass();
                } else
                {
                    return Object.class;
                }
            }
        };

        return model;
    }

    /**
     * ��ȡһ������ģ�� �ñ��ģ��ֻ��������ʾ���ݣ������Ҫ�������ݣ���ʹ�� DataSet getDataSet(String cmdText)
     *
     * @param conn ���ݿ�����
     * @param cmdText
     *                �ܷ���һ�����ݼ��Ĳ�ѯSQL ���
     * @return �������ģ��
     */
    public static DefaultTableModel getTableModel(Connection conn, String cmdText)
    {
        ResultSet rs = getResultSet(conn, cmdText);
        DefaultTableModel tm = buildTableModel(rs);
        closeEx(rs);
        return tm;
    }

    /**
     * ��ȡһ������ģ�� �ñ��ģ��ֻ��������ʾ���ݣ������Ҫ�������ݣ���ʹ�� DataSet getDataSet(String cmdText)
     *
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �������ģ��
     */
    public static DefaultTableModel getTableModel(String cmdText, Object... cmdParams)
    {
        // ��ѯ���
        ResultSet rs = getResultSet(cmdText, cmdParams);
        DefaultTableModel tm = buildTableModel(rs);
        closeConnection(rs);
        return tm;
    }

    /**
     * ��ȡһ������ģ�� �ñ��ģ��ֻ��������ʾ���ݣ������Ҫ�������ݣ���ʹ�� DataSet getDataSet(String cmdText)
     * 
     * @param cmdText
     *                �ܷ���һ�����ݼ��Ĳ�ѯSQL ���
     * @return �������ģ��
     */
    public static DefaultTableModel getTableModel(String cmdText)
    {
        // ��ѯ���
        ResultSet rs = getResultSet(cmdText);
        DefaultTableModel tm = buildTableModel(rs);
        closeConnection(rs);
        return tm;
    }

    /**
     * ��ȡһ������ģ�� �ñ��ģ��ֻ��������ʾ���ݣ������Ҫ�������ݣ���ʹ�� DataSet getDataSet(String cmdText)
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �������ģ��
     */
    public static DefaultTableModel getTableModel(Connection conn, String cmdText, Object... cmdParams)
    {
        ResultSet rs = getResultSet(conn, cmdText, cmdParams);
        DefaultTableModel tm = buildTableModel(rs);
        closeEx(rs);
        return tm;
    }

/*    *//**
     * ��ȡһ�����и��¹��ܵ�����ģ�� ���ֻҪ��ȡ���ݣ��Ͳ�Ҫ������
     * @param cmdText �ܷ���һ�����ݼ��Ĳ�ѯSQL ���
     * @return �������ģ��
     *//*
    public static DataSet getDataSet(String cmdText)
    {
        Statement stmt = getStatement();
        DataSet dbc = new DataSet();
        if (stmt == null)
        {
            dbc.code = -2;
            return dbc;
        }
        try
        {
            // ��ѯ���
            dbc.rs = stmt.executeQuery(cmdText);
            dbc.model = buildTableModel(dbc.rs);
            dbc.code = dbc.model.getRowCount();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            dbc.code = -1;
        }

        return dbc;
    }

    *//**
     * ��ȡһ�����и��¹��ܵ�����ģ�� ���ֻҪ��ȡ���ݣ��Ͳ�Ҫ������
     * @param conn ���ݿ�����
     * @param cmdText �ܷ���һ�����ݼ��Ĳ�ѯSQL ���
     * @return �������ģ��
     *//*
    public static DataSet getDataSet(Connection conn, String cmdText)
    {
        Statement stmt = getStatement(conn);
        DataSet dbc = new DataSet();
        if (stmt == null)
        {
            dbc.code = -2;
            return dbc;
        }
        try
        {
            // ��ѯ���
            dbc.rs = stmt.executeQuery(cmdText);
            dbc.model = buildTableModel(dbc.rs);
            dbc.code = dbc.model.getRowCount();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            dbc.code = -1;
        }

        return dbc;
    }

    *//**
     * ��ȡһ�����и��¹��ܵ�����ģ�� ���ֻҪ��ȡ���ݣ��Ͳ�Ҫ������
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �������ģ��
     *//*
    public static DataSet getDataSet(String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(cmdText, cmdParams);
        DataSet dbc = new DataSet();
        if (pstmt == null)
        {
            dbc.code = -2;
            return dbc;
        }
        try
        {
            // ��ѯ���
            dbc.rs = pstmt.executeQuery();
            dbc.model = buildTableModel(dbc.rs);
            dbc.code = dbc.model.getRowCount();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            dbc.code = -1;
        }

        return dbc;
    }

    *//**
     * ��ȡһ�����и��¹��ܵ�����ģ�� ���ֻҪ��ȡ���ݣ��Ͳ�Ҫ������
     * @param conn ���ݿ�����
     * @param cmdText ��Ҫ ? ������ SQL ���
     * @param cmdParams SQL ���Ĳ�����
     * @return �������ģ��
     *//*
    public static DataSet getDataSet(Connection conn, String cmdText, Object... cmdParams)
    {
        PreparedStatement pstmt = getPreparedStatement(conn, cmdText, cmdParams);
        DataSet dbc = new DataSet();
        if (pstmt == null)
        {
            dbc.code = -2;
            return dbc;
        }
        try
        {
            // ��ѯ���
            dbc.rs = pstmt.executeQuery();
            dbc.model = buildTableModel(dbc.rs);
            dbc.code = dbc.model.getRowCount();
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
            dbc.code = -1;
        }
        return dbc;
    }*/

    private static void close(Object obj)
    {
        if (obj == null)
        {
            return;
        }
        try
        {
            if (obj instanceof Statement)
            {
                ((Statement) obj).close();
            } else if (obj instanceof PreparedStatement)
            {
                ((PreparedStatement) obj).close();
            } else if (obj instanceof ResultSet)
            {
                ((ResultSet) obj).close();
            } else if (obj instanceof Connection)
            {
                ((Connection) obj).close();
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void closeEx(Object obj)
    {
        if (obj == null)
        {
            return;
        }

        try
        {
            if (obj instanceof Statement)
            {
                ((Statement) obj).close();
            } else if (obj instanceof PreparedStatement)
            {
                ((PreparedStatement) obj).close();
            } else if (obj instanceof ResultSet)
            {
                ((ResultSet) obj).getStatement().close();
            } else if (obj instanceof Connection)
            {
                ((Connection) obj).close();
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static void closeConnection(Object obj)
    {
        if (obj == null)
        {
            return;
        }
        try
        {
            if (obj instanceof Statement)
            {
                ((Statement) obj).getConnection().close();
            } else if (obj instanceof PreparedStatement)
            {
                ((PreparedStatement) obj).getConnection().close();
            } else if (obj instanceof ResultSet)
            {
                ((ResultSet) obj).getStatement().getConnection().close();
            } else if (obj instanceof Connection)
            {
                ((Connection) obj).close();
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(MssqlHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

