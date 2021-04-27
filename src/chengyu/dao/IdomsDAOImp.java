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

	@Override
	public ArrayList<Idoms> findthreeIdoms(int idomsid) throws SQLException {
		int random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-3));
		while(random == idomsid) {
			random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-3));
		}
		String sql1 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql2 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql3 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		Object[] params1 = {random};
		Object[] params2 = {random+1};
		Object[] params3 = {random+2};
		ArrayList<Idoms> myidoms= new ArrayList<Idoms>(3);
		myidoms.add((Idoms) findObj(sql1, params1,  Idoms.class));
		myidoms.add((Idoms) findObj(sql2, params2,  Idoms.class));
		myidoms.add((Idoms) findObj(sql3, params3,  Idoms.class));
		return myidoms;
	}
	@Override
	public ArrayList<Idoms> findfIdoms(int idomsid) throws SQLException {
		int random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-4));
		while(random == idomsid) {
			random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-4));
		}
		String sql1 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql2 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql3 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql4 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		Object[] params1 = {random};
		Object[] params2 = {random+1};
		Object[] params3 = {random+2};
		Object[] params4 = {random+3};
		ArrayList<Idoms> myidoms= new ArrayList<Idoms>(4);
		myidoms.add((Idoms) findObj(sql1, params1,  Idoms.class));
		myidoms.add((Idoms) findObj(sql2, params2,  Idoms.class));
		myidoms.add((Idoms) findObj(sql3, params3,  Idoms.class));
		myidoms.add((Idoms) findObj(sql4, params4,  Idoms.class));
		return myidoms;
	}
	@Override
	public ArrayList<Idoms> findfiveIdoms() throws SQLException {
		int random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-5));

		String sql1 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql2 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql3 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql4 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql5 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		Object[] params1 = {random};
		Object[] params2 = {random+1};
		Object[] params3 = {random+2};
		Object[] params4 = {random+3};
		Object[] params5 = {random+4};
		ArrayList<Idoms> myidoms= new ArrayList<Idoms>(4);
		myidoms.add((Idoms) findObj(sql1, params1,  Idoms.class));
		myidoms.add((Idoms) findObj(sql2, params2,  Idoms.class));
		myidoms.add((Idoms) findObj(sql3, params3,  Idoms.class));
		myidoms.add((Idoms) findObj(sql4, params4,  Idoms.class));
		myidoms.add((Idoms) findObj(sql5, params5,  Idoms.class));
		return myidoms;
	}
	
	@Override
	public ArrayList<Idoms> findnIdoms() throws SQLException{
		int random = (int) (Math.random()*(getTotalIdoms("select * from idoms")-9));
		ArrayList<Idoms> myidoms= new ArrayList<Idoms>(9);
		String sql1 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql2 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql3 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql4 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql5 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql6 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql7 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql8 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		String sql9 = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms where id = ?";
		Object[] params1 = {random};
		Object[] params2 = {random+1};
		Object[] params3 = {random+2};
		Object[] params4 = {random+3};
		Object[] params5 = {random+4};
		Object[] params6 = {random+5};
		Object[] params7 = {random+6};
		Object[] params8 = {random+7};
		Object[] params9 = {random+8};
		myidoms.add((Idoms) findObj(sql1, params1,  Idoms.class));
		myidoms.add((Idoms) findObj(sql2, params2,  Idoms.class));
		myidoms.add((Idoms) findObj(sql3, params3,  Idoms.class));
		myidoms.add((Idoms) findObj(sql4, params4,  Idoms.class));
		myidoms.add((Idoms) findObj(sql5, params5,  Idoms.class));
		myidoms.add((Idoms) findObj(sql6, params6,  Idoms.class));
		myidoms.add((Idoms) findObj(sql7, params7,  Idoms.class));
		myidoms.add((Idoms) findObj(sql8, params8,  Idoms.class));
		myidoms.add((Idoms) findObj(sql9, params9,  Idoms.class));
		return myidoms;
	}
}
