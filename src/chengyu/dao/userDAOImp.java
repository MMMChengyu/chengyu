package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.user;

public class userDAOImp extends baseDAO implements userDAO {

	@Override
	public int adduser(user user) throws SQLException {
		String sql = "insert into user values(?, ?, ?)";
		Object[] params = {user.getUsername(), user.getPassword(), user.getEmail()};
		return modifyObj(sql, params);
	}

//	@Override
//	public int removeuser(String string) throws SQLException {
//		String sql = "delete from user where username = ?";
//		Object[] params = {string};
//		return modifyObj(sql, params);
//	}

	@Override
	public int modifyuser(user user) throws SQLException {
		String sql = "update user set password = ?, email = ? where username = ?";
		Object[] params = {user.getPassword(), user.getEmail(), user.getUsername()} ;
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findusers() throws SQLException {
		String sql = "select username Username, email Email, password Password from user";
		return findObjs(sql, user.class);
	}

	@Override
	public user finduser(String string) throws SQLException {
		String sql = "select username Username, password Password, email Email from user where username = ?";
		Object[] params = {string};
		return (user) findObj(sql, params, user.class);
	}

}

