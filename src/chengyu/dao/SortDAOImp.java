package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Sort;

public class SortDAOImp extends baseDAO implements SortDAO {

	@Override
	public ArrayList findSorts() throws SQLException {
		String sql = "select id ,sname_ch name from sort";
		return findObjs(sql, Sort.class);
	}

	@Override
	public Sort findSort(int sortid) throws SQLException {
		String sql = "select id ,sname_ch name from sort where id=?";
		Object[] params = {sortid};
		return (Sort) findObj(sql, params,  Sort.class);
	}

	@Override
	public int getTotalSort(String strsql) {
		// TODO Auto-generated method stub
		return 0;
	}

}
