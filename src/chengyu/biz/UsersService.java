package chengyu.biz;

import java.sql.SQLException;

import chengyu.bean.Users;
import chengyu.dao.UsersDAO;
import chengyu.utils.DAOFactory;

/**
 * 
 * @author fcxl9876
 * 业务逻辑：判断用户是否存在、验证用户登录通过等
 * 2018年11月20日
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
	public boolean validateUsers(Users user) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {

		UsersDAO UsersDAO = (UsersDAO) DAOFactory.newInstance("UsersDAO");
		
		Users cus = UsersDAO.finduser(user.getUsername());
		if(cus==null)
		{
			System.out.print("sasas");
			return false;
		}
		else {
			System.out.print("oooo");
			if(cus.getPassword().equals(user.getPassword()))
				return true;
			else 
				return false;
		}
		
	}
}
