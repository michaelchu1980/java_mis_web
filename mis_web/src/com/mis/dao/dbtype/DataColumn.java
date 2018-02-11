package com.mis.dao.dbtype;

public class DataColumn extends Object { 
    public DataColumn() 
    { 
    } 
    public DataColumn(String n,Object v) 
    { 
        colName = n; 
        colValue = v; 
    } 

    public Object colValue = null; 
    public String colName = null; 
    
} 
