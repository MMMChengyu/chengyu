package chengyu.action;


import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

public abstract class baseControl extends HttpServlet {
	/**
	 * ��־����
	 */
	protected Logger logger = Logger.getLogger(getClass());
}
