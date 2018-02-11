package com.mis.dao.dbc;
 

import com.mis.dao.dbtype.*;

import java.sql.*; 


public class OracleHelperDt { 

	
    

    /** 
     * 
     * @param connectionString 
     * @param commandType 
     * @param commandText 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(CommandType commandType, String commandText) throws Exception { 
        return ExecuteDataSet(new OracleConnection(), 
                commandType, commandText); 
    } 

    /** 
     * 
     * @param connectionString 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(String connectionString, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 
        return ExecuteDataSet(new OracleConnection(), 
                commandType, commandText, parameters); 
    } 

    /** 
     * 
     * @param connection 
     * @param commandType 
     * @param commandText 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(OracleConnection connection, 
            CommandType commandType, String commandText) throws Exception { 
        return ExecuteDataSet(connection, commandType, commandText, 
                new Parameter[0]); 
    } 

    /** 
     * 
     * @param connection 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(OracleConnection connection, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 

        DataSet ds = new DataSet(); 
        if (commandType.equals(CommandType.Text)) { 
            Statement s = connection.GetConnection().createStatement(); 
            ResultSet rs = s.executeQuery(commandText); 
            ds.AddTable(ConvertResultSetToDataTable(rs)); 
        } else if (commandType.equals(CommandType.StoreProcedure)) { 

            Parameter[] paras = parameters; 

            String sql = ""; 
            for (int i = 0; i < paras.length; i++) { 
                sql = sql + "?,"; 
            } 
            if (sql.length() > 0) { 
                sql = "(" + sql.substring(0, sql.length() - 1) + ")"; 
            } 

            sql = "{ call " + commandText + sql + " }"; 
            CallableStatement proc = null; 
            proc = connection.GetConnection().prepareCall(sql); 
            for (int i = 0; i < paras.length; i++) { 
                Parameter p = paras[i]; 
                if (p.parameterDirection == ParameterDirection.IN) { 
                    proc.setObject(i + 1, p.Value, p.parameterType); 
                } else if (p.parameterDirection == ParameterDirection.OUT) { 
                    proc.registerOutParameter(i + 1, p.parameterType); 
                } 
            } 
            try { 
                proc.execute(); 

                for (int i = 0; i < paras.length; i++) { 
                    Parameter p = paras[i]; 
                    if (p.parameterDirection == ParameterDirection.OUT) { 
                        p.Value = proc.getObject(i + 1); 
                        if (p.parameterType == oracle.jdbc.OracleTypes.CURSOR) { 
                            ResultSet rs = (ResultSet) p.Value; 
                            DataTable dt = ConvertResultSetToDataTable(rs); 
                            DataSet _lds = new DataSet(); 
                            _lds.AddTable(dt); 
                            p.Value = _lds; 
                            ds.AddTable(dt); 
                        } 
                    } 
                } 
            } catch (Exception e) { 
                throw e; 
            } finally { 
                connection.Close(); 
            } 

        } else { 
            throw new Exception("commandType is invalid"); 
        } 

        return ds; 
    } 

    /** 
     * 
     * @param transaction 
     * @param commandType 
     * @param commandText 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(OracleTransaction transaction, 
            CommandType commandType, String commandText) throws Exception { 
        return ExecuteDataSet(transaction.Connection, commandType, commandText); 
    } 

    /** 
     * 
     * @param transaction 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @return 
     * @throws Exception 
     */ 
    public static DataSet ExecuteDataSet(OracleTransaction transaction, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 
        return ExecuteDataSet(transaction.Connection, commandType, commandText, 
                parameters); 
    } 

    /** 
     * 
     * @param connectionString 
     * @param commandType 
     * @param commandText 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(String connectionString, 
            CommandType commandType, String commandText) throws Exception { 
        ExecuteNonQuery(new OracleConnection(), commandType, 
                commandText); 
    } 

    /** 
     * 
     * @param connectionString 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(String connectionString, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 
        ExecuteNonQuery(new OracleConnection(), commandType, 
                commandText, parameters); 
    } 

    /** 
     * 
     * @param connection 
     * @param commandType 
     * @param commandText 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(OracleConnection connection, 
            CommandType commandType, String commandText) throws Exception { 
        ExecuteNonQuery(connection, commandType, commandText, new Parameter[0]); 
    } 

    /** 
     * 
     * @param connection 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(OracleConnection connection, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 
        
        if (commandType.equals(CommandType.Text)) { 
            Statement s = connection.GetConnection().createStatement(); 
            s.execute(commandText); 
            
        } else if (commandType.equals(CommandType.StoreProcedure)) { 

            Parameter[] paras = parameters; 

            String sql = ""; 
            for (int i = 0; i < paras.length; i++) { 
                sql = sql + "?,"; 
            } 
            if (sql.length() > 0) { 
                sql = "(" + sql.substring(0, sql.length() - 1) + ")"; 
            } 

            sql = "{ call " + commandText + sql + " }"; 
            CallableStatement proc = null; 
            proc = connection.GetConnection().prepareCall(sql); 
            for (int i = 0; i < paras.length; i++) { 
                Parameter p = paras[i]; 
                if (p.parameterDirection == ParameterDirection.IN) { 
                    proc.setObject(i + 1, p.Value, p.parameterType); 
                } else if (p.parameterDirection == ParameterDirection.OUT) { 
                    proc.registerOutParameter(i + 1, p.parameterType); 
                } 
            } 
            try { 
                proc.execute(); 

                for (int i = 0; i < paras.length; i++) { 
                    Parameter p = paras[i]; 
                    if (p.parameterDirection == ParameterDirection.OUT) { 
                        p.Value = proc.getObject(i + 1); 
                        if (p.parameterType == oracle.jdbc.OracleTypes.CURSOR) { 
                            ResultSet rs = (ResultSet) p.Value; 
                            DataTable dt = ConvertResultSetToDataTable(rs); 
                            DataSet _lds = new DataSet(); 
                            _lds.AddTable(dt); 
                            p.Value = _lds; 
                        } 
                    } 
                } 
            } catch (Exception e) { 
                throw e; 
            } finally { 
                connection.Close(); 
            } 

        } else { 
            throw new Exception("commandType is invalid"); 
        }    
    } 

    /** 
     * 
     * @param transaction 
     * @param commandType 
     * @param commandText 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(OracleTransaction transaction, 
            CommandType commandType, String commandText) throws Exception { 
        ExecuteNonQuery(transaction.Connection, commandType, commandText); 
    } 

    /** 
     * 
     * @param transaction 
     * @param commandType 
     * @param commandText 
     * @param parameters 
     * @throws Exception 
     */ 
    public static void ExecuteNonQuery(OracleTransaction transaction, 
            CommandType commandType, String commandText, 
            Parameter... parameters) throws Exception { 
        ExecuteNonQuery(transaction.Connection, commandType, commandText, 
                parameters); 
    } 

    /** 
     * 将ResultSet装换为DataTable的函数 
     * 
     * @param rs 
     * @return 
     * @throws Exception 
     */ 
    private static DataTable ConvertResultSetToDataTable(ResultSet rs) 
            throws Exception { 
        ResultSetMetaData rsmd = rs.getMetaData(); 
        int columnCount = rsmd.getColumnCount(); 

        DataTable dt = new DataTable(); 
        while (rs.next()) { 
            DataRow dr = new DataRow(); 
            for (int i = 1; i <= columnCount; i++) { 
                DataColumn dc = new DataColumn(rsmd.getColumnName(i), rs 
                        .getObject(i)); 
                dr.AddColumn(dc); 
            } 
            dt.AddRow(dr); 
        } 
        return dt; 
    } 
} 
