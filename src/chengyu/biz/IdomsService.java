package chengyu.biz;

import java.util.ArrayList;

import chengyu.bean.Idoms;
import chengyu.dao.IdomsDAO;
import chengyu.utils.DAOFactory;
import chengyu.utils.PageModel;

public class IdomsService {
	private IdomsDAO idomsdao;
	
	public IdomsDAO getIdomsDAO() {
		return idomsdao;
	}
	
	public PageModel<Idoms> findIdoms4PageList(int pageNO,int pageSize) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
		String strsql = "select id, name, sort  Sort, video  Video, img Img, descri_ch Descri_ch , descri_py Descri_py ,story_ch Story_ch, story_py Story_py from idoms limit ?,?";
		int actualpageNO = (pageNO-1)*pageSize;
		Object[] params = {actualpageNO,pageSize};
		ArrayList<Idoms> idomslist = idomsdao.findIdoms(strsql, params);
		PageModel<Idoms> pagemodel = new PageModel<Idoms>(pageSize,pageNO,getTotalIdoms(),idomslist);
		return pagemodel;
	}
	
	public PageModel<Idoms> findIdoms5PageList(int pageNO,int pageSize,String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
		String strsql = "select  id idomsid, name idomsname,sort sort, video video, img img, descri_ch descri_ch, descri_py descri_py,story_ch story_ch, story_py story_py from idoms where dishname like '%"+str+"%' limit ?, ?";
		int actualpageNO = (pageNO-1)*pageSize;
		Object[] params = {actualpageNO, pageSize};
		ArrayList<Idoms> dishlist = idomsdao.findIdoms(strsql, params);
		System.out.println(dishlist.size());
		PageModel<Idoms> pagemodel = new PageModel<Idoms>(pageSize,pageNO,getPerIdoms(str),dishlist);
		return pagemodel;
	}

	public int getTotalIdoms() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
		String strsql = "select count(*) from idoms";
		return idomsdao.getTotalIdoms(strsql);
	}
	
	public int getPerIdoms(String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
		String strsql = "select count(*) from idoms where idomsname like '%"+str+"%'";
		return idomsdao.getTotalIdoms(strsql);
	}
	
}
