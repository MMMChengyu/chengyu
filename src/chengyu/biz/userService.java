package chengyu.biz;

import java.sql.SQLException;

import chengyu.bean.user;
import chengyu.dao.userDAO;
import chengyu.utils.DAOFactory;

/**
 * 
 * @author fcxl9876
 * ҵ���߼����ж��û��Ƿ���ڡ���֤�û���¼ͨ����
 * 2018��11��20��
 */
public class userService {
	userDAO userDAO = null;
	public boolean isExistuser(String username) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		userDAO = (userDAO) DAOFactory.newInstance("userDAO");
		user user = userDAO.finduser(username);
		if(user != null)
			return true;
		else return false;
	}
	public boolean validateuser(user user) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		userDAO userDAO = (userDAO) DAOFactory.newInstance("userDAO");
		user cus = userDAO.finduser(user.getUsername());
		if(cus==null)
		{
			return false;
		}
		else {
			if(cus.getPassword().equals(user.getPassword()))
			return true;
		else return false;
		}
		
	}
}
