package chengyu.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import chengyu.bean.user;



/**
 * �û���Ϣ����ӿڣ���Ҫ���ܰ�����
 * 1.�����û���Ϣ��
 * 2.�޸��û���Ϣ��
 * 3.ɾ���û���Ϣ��
 * 4.��ѯ�����û���Ϣ��
 *
 */
public interface userDAO {
	 /**
     * �����û���Ϣ�� 
     * @param user �����û���Ϣ�Ķ���
     * @return ���ӵ��û���������
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public int adduser(user user) throws SQLException;
    
    /**
     * ɾ��ָ�����û���Ϣ��
     * @param string Ҫɾ�����û���ID��
     * @return �Ѿ�ɾ�����û���������
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    //public int removeuser(String string) throws SQLException;
    
    /**
     * �޸�ָ�����û���Ϣ�������޸ĵ���Ϣ������
     * �û�id �û��� ���롣
     * @param user �����û���Ϣ�Ķ���
     * @return ���޸ĵ��û���������
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public int modifyuser(user user) throws SQLException;
    
    /**
     * ��ѯ���е��û���Ϣ��
     * @return �����û���Ϣ�����ݽṹ�����û�з���NULL��
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public ArrayList findusers() throws SQLException;
    
    /**
     * ��ѯ��һ���û���Ϣ��
     * @param user ��username
     * @return ���û���������Ϣ
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public user finduser(String string) throws SQLException;
}

