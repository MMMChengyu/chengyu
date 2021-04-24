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
	public ArrayList<Idoms> findIdoms() throws SQLException {
		String sql = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms";
		return findObjs(sql, Idoms.class);
	}

	@Override
	public Idoms findIdom(int idomsid) throws SQLException {
		String sql = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
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
	@Override
	public ArrayList<Idoms> findIdomsbySortid(int sortid) throws SQLException {
		String sql = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where sort = ?";
		Object[] params = {sortid};
		return findObjs(sql, params,  Idoms.class);
	}
}
