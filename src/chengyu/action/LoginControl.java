package chengyu.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chengyu.bean.Users;
import chengyu.biz.UsersService;

/**
 * Servlet implementation class LoginContrler
 */
//@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request,response);
		}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request,response);
		
		String username = request.getParameter("loginName");
		String password = request.getParameter("loginPass");
		System.out.println(username);
		System.out.println(password);
//		HttpSession session = request.getSession(true);
//		String code=session.getAttribute("code").toString();
//		System.out.println(code);
		String inputcode=request.getParameter("code").toLowerCase();
		Users loginuser = new Users();
		loginuser.setUsername(username);
		loginuser.setPassword(password);
		
		//���ݿ���֤
		UsersService cService = new UsersService();
		try {
			HttpSession session = request.getSession(true);
			String code=session.getAttribute("code").toString().toLowerCase();
			System.out.println(code);
			System.out.println(inputcode);
			if(inputcode.equals(code))
			{
				System.out.println("1");
				System.out.print(cService.validateUsers(loginuser));
				if (cService.validateUsers(loginuser)) {
					//��ͨ�û� ��֤ͨ��
					session.setAttribute("loginuser", loginuser);
					System.out.println("2");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else {
					//�������µ�¼
					PrintWriter out = response.getWriter();
					String a = URLEncoder.encode("�û�����������������µ�¼��", "UTF-8"); 
					System.out.println("3");
						out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='login.jsp'</script>");
				}
			}else {
				//�������µ�¼
				PrintWriter out = response.getWriter();
				String a = URLEncoder.encode("��֤����������µ�¼��", "UTF-8");  
				out.print("<script>alert(decodeURIComponent('"+a+"') );window.location.href='login.jsp'</script>");
			}
			
			
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print("err");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("err");
			e.printStackTrace();
			
		} 
	}

}
