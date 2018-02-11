package com.mis.dao.factory;

import com.mis.dao.im.IBookDAO;

import com.mis.dao.proxy.IBookDAOImplProxy;


/**
 * 创建工厂类
 * 
 * @author Administrator
 * 
 */

public class DAOFactory {
	
	public static IBookDAO getIBookDAOInstance() {
		//图书信息操作工厂
		return new IBookDAOImplProxy();
	}

}
