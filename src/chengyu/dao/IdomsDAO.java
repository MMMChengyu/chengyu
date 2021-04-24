package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Idoms;

public interface IdomsDAO {
	//
	
	public ArrayList findIdoms() throws SQLException;
	
	public Idoms findIdom(int idomsid) throws SQLException;
	
	ArrayList<Idoms> findIdoms(String sql, Object[] params);
	
	public int getTotalIdoms(String strsql);
}
