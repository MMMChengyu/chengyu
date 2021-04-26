package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.Users;

public class UsersDAOImp extends baseDAO implements UsersDAO {

	@Override
	public int adduser(Users user) throws SQLException {
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
	public int modifyuser(Users user) throws SQLException {
		String sql = "update user set password = ?, email = ? where username = ?";
		Object[] params = {user.getPassword(), user.getEmail(), user.getUsername()} ;
		return modifyObj(sql, params);
	}

	@Override
	public ArrayList findusers() throws SQLException {
		String sql = "select username Username, email Email, password Password from user";
		return findObjs(sql, Users.class);
	}

	@Override
	public Users finduser(String string) throws SQLException {
		String sql = "select username Username, password Password, email Email from user where username = ?";
		Object[] params = {string};
		return (Users) findObj(sql, params, Users.class);
	}

}

