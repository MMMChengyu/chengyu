package chengyu.test;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Before;
import org.junit.jupiter.api.Test;

import chengyu.bean.Idoms;
import chengyu.dao.IdomsDAO;
import chengyu.utils.DAOFactory;

class IdomsDAOTest {
	IdomsDAO idomsDAO = null;

	@Before
	void setUp() throws Exception {
		idomsDAO = (IdomsDAO)DAOFactory.newInstance("IdomsDAO");
	}
	
	@Test
	void test() throws SQLException {
		ArrayList<Idoms> myidoms= idomsDAO.findIdoms();
		System.out.println(myidoms);
	}

}
