package com.mis.dao.im;

import java.util.List;

/**
 * 图书信息操作接口
 */

import com.mis.dao.bean.Book;;

public interface IBookDAO {
	/**
	 * 数据库的增加操作
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public boolean doCreate(Book book)throws Exception;
	/**
	 * 数据库的更新操作
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public boolean doUpdate(Book book)throws Exception;
	/**
	 * 数据库的删除操作
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean doDelete(String id)throws Exception;
	/**
	 * 数据库的查找操作(按id查找)
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Book findById(String id)throws Exception;
	/**
	 * 数据库的查找操作(按关键字查找)
	 * @param keyword
	 * @return
	 * @throws Exception
	 */
	public List<Book> findAll(String keyword)throws Exception;
}
