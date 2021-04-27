package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Idoms;

public interface IdomsDAO {
	//
	
	public ArrayList findIdoms() throws SQLException;
	
	public Idoms findIdom(int idomsid) throws SQLException;
	
	ArrayList<Idoms> findIdoms(String sql, Object[] params);
	
	public ArrayList<Idoms> findthreeIdoms(int idomsid) throws SQLException;
	public ArrayList<Idoms> findfIdoms(int idomsid) throws SQLException;
	public ArrayList<Idoms> findfiveIdoms() throws SQLException;
	
	public int getTotalIdoms(String strsql);

	ArrayList<Idoms> findIdomsbySortid(int sortid) throws SQLException;
	
	
	 public  ArrayList<Idoms> findnIdoms() throws SQLException;
}
