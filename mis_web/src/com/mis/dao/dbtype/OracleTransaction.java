package com.mis.dao.dbtype;

public class OracleTransaction { 

    public OracleTransaction(OracleConnection connection) throws Exception 
    {    
        this.Connection = connection; 
        this.Connection.GetConnection().setAutoCommit(false); 
    } 
    
    /** 
     * �����ύ 
     * @throws Exception 
     */ 
    public void Commit() throws Exception 
    { 
        try 
        { 
            this.Connection.GetConnection().commit(); 
        } 
        catch(Exception e) 
        { 
            throw e; 
        } 
        finally 
        { 
            this.Connection.GetConnection().setAutoCommit(true); 
            this.Connection.Close(); 
        } 
    } 
    /** 
     * ����ع� 
     * @throws Exception 
     */ 
    public void Rollback() throws Exception 
    { 
        try 
        { 
            this.Connection.GetConnection().rollback(); 
        } 
        catch(Exception e) 
        { 
            throw e; 
        } 
        finally 
        { 
            this.Connection.GetConnection().setAutoCommit(true); 
            this.Connection.Close(); 
        } 
    } 
    
    public OracleConnection Connection = null; 

} 
