package com.mis.dao.factory;

import com.mis.dao.im.IBookDAO;

import com.mis.dao.proxy.IBookDAOImplProxy;


/**
 * ����������
 * 
 * @author Administrator
 * 
 */

public class DAOFactory {
	
	public static IBookDAO getIBookDAOInstance() {
		//ͼ����Ϣ��������
		return new IBookDAOImplProxy();
	}

}
