package com.mis.common;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RsHandler<T> {
	/**
     * Turn the <code>ResultSet</code> into an Object.
     *
     * @param rs Ҫ���������ݼ�
     * @return �����ض���ʽ��resultset����
     * @throws SQLException ���ݿ��쳣
     */
    String  handle(ResultSet rs) throws SQLException;
}
