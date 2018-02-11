package com.mis.dao.im;

import java.util.List;

/**
 * ͼ����Ϣ�����ӿ�
 */

import com.mis.dao.bean.Book;;

public interface IBookDAO {
	/**
	 * ���ݿ�����Ӳ���
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public boolean doCreate(Book book)throws Exception;
	/**
	 * ���ݿ�ĸ��²���
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public boolean doUpdate(Book book)throws Exception;
	/**
	 * ���ݿ��ɾ������
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean doDelete(String id)throws Exception;
	/**
	 * ���ݿ�Ĳ��Ҳ���(��id����)
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Book findById(String id)throws Exception;
	/**
	 * ���ݿ�Ĳ��Ҳ���(���ؼ��ֲ���)
	 * @param keyword
	 * @return
	 * @throws Exception
	 */
	public List<Book> findAll(String keyword)throws Exception;
}
