package com.mis.dao.dbtype;

public class DataTable { 
    
    public DataTable(DataRow[] rows) 
    { 
        Rows = rows.clone(); 
    } 
    
    public DataTable() 
    { 
        
    } 
    
    public void AddRow(DataRow row) 
    { 
        DataRow[] _rows = Rows.clone(); 
        this.Rows = null; 
        this.Rows = new DataRow[_rows.length+1]; 
        for(int i=0;i<_rows.length;i++) 
        { 
            this.Rows[i] = _rows[i]; 
        } 
        this.Rows[this.Rows.length-1] = row; 
        _rows = null; 
    } 
    
    public DataRow[] Rows = new DataRow[0]; 
} 
