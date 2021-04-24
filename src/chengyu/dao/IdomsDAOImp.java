package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Idoms;

public class IdomsDAOImp extends baseDAO implements IdomsDAO {
	//获取所有的成语	
	public int idomsid;
	public String idomsname;
	public int sort;
	public String video;
	public String img;
	public String descri_ch;
	public String descri_py;
	public String story_ch;
	public String story_py;
	@Override
	public ArrayList findIdoms() throws SQLException {
		String sql = "select id idomsid, name idomsname,sort sort, video video, img img, descri_ch descri_ch, descri_py descri_py,story_ch story_ch, story_py story_py from idoms";
		return findObjs(sql, Idoms.class);
	}

	@Override
	public Idoms findIdom(int idomsid) throws SQLException {
		String sql = "select  id idomsid, name idomsname,sort sort, video video, img img, descri_ch descri_ch, descri_py descri_py,story_ch story_ch, story_py story_py from idoms where dishid = ?";
		Object[] params = {idomsid};
		return (Idoms) findObj(sql, params,  Idoms.class);
	}

	@Override
	public int getTotalIdoms(String strsql) {
		return getTotalRecords(strsql);
	}
	
	public ArrayList<Idoms> findIdoms(String sql,Object[] params){
		return  this.findObjs(sql, params, Idoms.class);
	}

}
