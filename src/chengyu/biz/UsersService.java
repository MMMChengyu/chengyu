package chengyu.biz;

import java.sql.SQLException;

import chengyu.bean.Users;
import chengyu.dao.UsersDAO;
import chengyu.utils.DAOFactory;

/**
 * 
 * @author fcxl9876
 * ҵ���߼����ж��û��Ƿ���ڡ���֤�û���¼ͨ����
 * 2018��11��20��
 */
public class UsersService {
	UsersDAO UsersDAO = null;
	public boolean isExistUsers(String Usersname) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		UsersDAO = (UsersDAO) DAOFactory.newInstance("UsersDAO");
		Users Users = UsersDAO.finduser(Usersname);
		if(Users != null)
			return true;
		else return false;
	}
	public boolean validateUsers(Users Users) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		UsersDAO UsersDAO = (UsersDAO) DAOFactory.newInstance("UsersDAO");
		Users cus = UsersDAO.finduser(Users.getUsername());
		if(cus==null)
		{
			return false;
		}
		else {
			if(cus.getPassword().equals(Users.getPassword()))
			return true;
		else return false;
		}
		
	}
}
