package com.mis.dao.proxy;

import java.util.List;


import com.mis.dao.im.IBookDAO;
import com.mis.dao.dbc.DataBaseConnection;
import com.mis.dao.impl.IBookDAOImpl;
import com.mis.dao.bean.Book;

/**
 * 图书信息操作接口代理类
 * @author Administrator
 *
 */
public class IBookDAOImplProxy implements IBookDAO {
	private IBookDAO dao=null;
    private DataBaseConnection dbc=null;
    public IBookDAOImplProxy(){
    	this.dbc=new DataBaseConnection();
    	this.dao=new IBookDAOImpl(this.dbc.getConnection());
    }
	@Override
	public boolean doCreate(Book book) throws Exception {
		// 增加图书信息(代理实现)
		boolean flag=true;
		try{
			flag=this.dao.doCreate(book);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean doDelete(String id) throws Exception {
		// 删除图书信息(代理实现)
		boolean flag=true;
		try{
			flag=this.dao.doDelete(id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public boolean doUpdate(Book book) throws Exception {
		//更新图书信息(代理实现)
		boolean flag=true;
		try{
			flag=this.dao.doUpdate(book);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}

	@Override
	public List<Book> findAll(String keyword) throws Exception {
		//查找图书信息-关键字查找(代理实现)
		List<Book> all=null;
		try{
			all=this.dao.findAll(keyword);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}

	@Override
	public Book findById(String id) throws Exception {
		//查找图书信息-ID查找(代理实现)
		Book book=null;
		try{
			book=this.dao.findById(id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return book;
	}

}
