package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.user;



/**
 * 用户信息处理接口，主要功能包括：
 * 1.增加用户信息。
 * 2.修改用户信息。
 * 3.删除用户信息。
 * 4.查询所有用户信息。
 *
 */
public interface userDAO {
	 /**
     * 增加用户信息。 
     * @param user 包含用户信息的对象。
     * @return 增加的用户的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public int adduser(user user) throws SQLException;
    
    /**
     * 删除指定的用户信息。
     * @param string 要删除的用户的ID。
     * @return 已经删除的用户的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    //public int removeuser(String string) throws SQLException;
    
    /**
     * 修改指定的用户信息，可以修改的信息包括：
     * 用户id 用户名 密码。
     * @param user 包含用户信息的对象。
     * @return 被修改的用户的数量。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public int modifyuser(user user) throws SQLException;
    
    /**
     * 查询所有的用户信息。
     * @return 包含用户信息的数据结构，如果没有返回NULL。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public ArrayList findusers() throws SQLException;
    
    /**
     * 查询单一的用户信息。
     * @param user 的username
     * @return 该用户的所有信息
     * @throws SQLException 执行操作发生任何异常时。
     */
    public user finduser(String string) throws SQLException;
}

