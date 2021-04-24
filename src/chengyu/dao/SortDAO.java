package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Sort;

public interface SortDAO {
	//查找所有分类信息
	public ArrayList findSorts() throws SQLException;
	
	//查找单个分类信息
	public Sort findSort(int sortid) throws SQLException;
	
	public int getTotalSort(String strsql);
}
