package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Sort;

public interface SortDAO {
	//�������з�����Ϣ
	public ArrayList findSorts() throws SQLException;
	
	//���ҵ���������Ϣ
	public Sort findSort(int sortid) throws SQLException;
	
	public int getTotalSort(String strsql);
}
