package com.mis.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mis.common.JSONHelper;
import com.mis.dao.im.IBookDAO;
import com.mis.dao.bean.Book;

/**
 * 图书信息操作接口实现类
 * @author Administrator
 *
 */
public class IBookDAOImpl implements IBookDAO {
	private Connection conn=null;
	public IBookDAOImpl(Connection conn){
		this.conn=conn;
	}
	@Override
	public boolean doCreate(Book book) throws Exception {
		// 增加图书信息
		boolean flag=false;
		PreparedStatement pstmt=null;
		String sql="INSERT INTO library_book(id,name,author,classify,price,news,publishdata)VALUES(?,?,?,?,?,?,?)";
		try{
			pstmt=this.conn.prepareStatement(sql);
			pstmt.setString(1, book.getId());
			pstmt.setString(2, book.getName());
			pstmt.setString(3, book.getAuthor());
			pstmt.setString(4,book.getClassify());
			pstmt.setDouble(5, book.getPrice());
			pstmt.setString(6,book.getNews());
			pstmt.setDate(7, new java.sql.Date(book.getPublishdata().getTime()));
			if(pstmt.executeUpdate()>0){
				flag=true;
			}
		}catch(Exception e){
		  throw e;
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				
			}catch(Exception e){}
		}

		return flag;
	}

	@Override
	public boolean doDelete(String id) throws Exception {
		//删除图书信息
		boolean flag=false;
		PreparedStatement pstmt=null;
		String sql="DELETE FROM library_book WHERE id=?";
		try{
			pstmt=this.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			if(pstmt.executeUpdate()>0){
				flag=true;
			}
		}catch(Exception e){
		  throw e;
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				
			}catch(Exception e){}
		}

		return flag;

	}

	@Override
	public boolean doUpdate(Book book) throws Exception {
		// 更新图书信息
		boolean flag=false;
		PreparedStatement pstmt=null;
		String sql="UPDATE library_book SET name=?,author=?,classify=?,price=?,news=?,publishdata=? WHERE id=?";
		try{
			pstmt=this.conn.prepareStatement(sql);
			pstmt.setString(1, book.getName());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3,book.getClassify());
			pstmt.setDouble(4, book.getPrice());
			pstmt.setString(5,book.getNews());
			pstmt.setDate(6, new java.sql.Date(book.getPublishdata().getTime()));
			pstmt.setString(7,book.getId());
			if(pstmt.executeUpdate()>0){
				flag=true;
			}
		}catch(Exception e){
		  throw e;
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				
			}catch(Exception e){}
		}

		return flag;
	}

	@Override
	public List<Book> findAll(String keyword) throws Exception {
		// 查找图书信息---关键字查找
		List<Book> all=new ArrayList<Book>();
		PreparedStatement pstmt=null;
		String sql="SELECT incre_id,id,name,author,classify,price,news,publishdata FROM library_book where id LIKE ? OR name LIKE ? OR author LIKE ? OR classify LIKE ? " ;
		try{
			pstmt=this.conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setString(3, "%"+keyword+"%");
			pstmt.setString(4, "%"+keyword+"%");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Book book=new Book();
				book.setIncre_id(rs.getInt(1));
				book.setId(rs.getString(2));
				book.setName(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setClassify(rs.getString(5));
				book.setPrice(rs.getDouble(6));
				book.setNews(rs.getString(7));
				book.setPublishdata(rs.getDate(8));
				all.add(book);
			}
			rs.close();
		}catch(Exception e){
		  throw e;
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				
			}catch(Exception e){}
		}
		return all;
	}

	@Override
	public Book findById(String id) throws Exception {
		// 查找图书信息-ID查找
		Book book = null;
		PreparedStatement pstmt=null;
		String sql="SELECT incre_id,id,name,author,classify,price,news,publishdata FROM library_book WHERE id=?";
		try{
			pstmt=this.conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				book =new Book();
				book.setIncre_id(rs.getInt(1));
				book.setId(rs.getString(2));
				book.setName(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setClassify(rs.getString(5));
				book.setPrice(rs.getDouble(6));
				book.setNews(rs.getString(7));
				book.setPublishdata(rs.getDate(8));
			}
			rs.close();
		}catch(Exception e){
		  throw e;
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				
			}catch(Exception e){}
		}
		return book;
	}

}
