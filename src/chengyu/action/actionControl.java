package chengyu.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chengyu.bean.Users;
import chengyu.bean.Idoms;
import chengyu.biz.IdomsService;
import chengyu.dao.IdomsDAO;
import chengyu.utils.ConfigFactory;
import chengyu.utils.DAOFactory;
import chengyu.utils.PageModel;

public class actionControl extends baseControl {
	private static final long serialVersionUID = 1L;
	private String searchTH;
	private static Properties prop = null;
	private Map cart = new HashMap();
	private int pageSize = 10;
	
	public actionControl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actiontype = request.getParameter("actiontype");
//		System.out.println("进入doGet");
		switch (actiontype) {
		case "detail":
			try {
				showdetail(request, response);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		// 显示某一个菜品的详细信息
//		case "cart":
//			try {
//				addCart(request, response);
//			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			break;
//		case "del":
//			delCart(request, response);
//		    break;
//		case "addone":
//			try {
//				addOne(request, response);
//			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			break;
//		case "goCart":
//			goCart(request,response);
//			break;
//			// 添加到购物车
		case "logOut":
			logOut(request,response);
			break;
//		case "order":
//			try {
//				order(request,response);
//			} catch (SQLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			break;
//		case "delorder":
//			try {
////				System.out.println("进入函数");
//				delorder(request,response);
//			} catch (SQLException e2) {
//				// TODO Auto-generated catch block
//				e2.printStackTrace();
//			}
//		case "comment":
//			try {
//				comment(request,response);
//			} catch (SQLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			break;
//		case "checkout":
//			checkout(request,response);
//			break;
		case "search":
			try {
				search(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NumberFormatException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		String In = request.getParameter("query"); //查询字符串
		String kw;
		if(In.equals("-1")){
			kw = searchTH; 
		}
		else{
			System.out.println(In+" this is In");
			searchTH = In;
			kw = searchTH;
		}
		// 获取当前页号
		int pageNo = Integer.parseInt(request.getParameter("pageNO"));
		// 分页查询
		 String pageSize = ConfigFactory.readProperty("pageSize");
		// 生成pageModel对象
		IdomsService Idomsserv = new IdomsService();
		PageModel<Idoms> pagemodel = Idomsserv.findIdoms5PageList(pageNo, Integer.parseInt(pageSize), kw);
		// 跳转到show页面
		request.setAttribute("Idomslist", pagemodel.getList());
		System.out.println(pagemodel.getTotalPages() + " 总页数");
		System.out.println(pagemodel.getList().size() + "大小");
		request.setAttribute("pageModel", pagemodel);
		request.setAttribute("qs", kw);
		RequestDispatcher rd = request
				.getRequestDispatcher("search.jsp?pageNO=" + pageNo + "&totalpages=" + pagemodel.getTotalPages());
		rd.forward(request, response);
	
		
	}
	
	private void showdetail(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
		    IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
		//System.out.println("123");
		String idomsid = request.getParameter("idomsid");
		Idoms current = new Idoms();
		IdomsDAO Idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
		int id = Integer.parseInt(idomsid);
		current = Idomsdao.findIdom(id);
		request.setAttribute("current", current);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}

//	private void addCart(HttpServletRequest request, HttpServletResponse response) throws InstantiationException,
//			IllegalAccessException, ClassNotFoundException, SQLException, ServletException, IOException {
//		HttpSession session = request.getSession(true);
//		CartItem nc = new CartItem();
//		if (session.getAttribute("loginuser") == null) {
//			response.sendRedirect("customerLogin.jsp"); 
//		} else {
//			String nn = (request.getParameter("number"));
//			String Did = request.getParameter("Idomsid");
//			Idoms current = new Idoms();
//		
//			IdomsDAO Idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
//			int id = Integer.parseInt(Did);
//			current = Idomsdao.findIdoms(id);
//			request.setAttribute("current", current);
//			int number = Integer.parseInt(nn);
//			Customer now = (Customer) session.getAttribute("loginuser");
//			nc.setUsername(now.getUsername());
//			nc.setId(id);
//			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
//			int flag = 0;
//			while(it.hasNext()){
//			Map.Entry entry = (Map.Entry) it.next();
//			CartItem ncin = new CartItem();
//			ncin = (CartItem)entry.getKey();
//			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
//				flag = 1;
//				cart.put(ncin, (Integer) cart.get(ncin) + number);
//			   } 
//			}
//			if(flag==0){
//					cart.put(nc, number);
//			}
//			session.setAttribute("shopcart", cart);
//		    response.sendRedirect("cart.jsp");   
//		}
//	}


//	private void delCart(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		HttpSession session = request.getSession(true);
//		String Did = request.getParameter("Idomsid");
//		Customer now = (Customer) session.getAttribute("loginuser");
//		session.setAttribute("shopcart", cart);
//		Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
//		while(it.hasNext())
//		{
//			Map.Entry entry = (Map.Entry) it.next();
//			CartItem ncin = new CartItem();
//			ncin = (CartItem)entry.getKey();
//			if (ncin.getId()==Integer.parseInt(Did)&&ncin.getUsername()==now.getUsername()) {
//			
//				cart.remove(ncin);
//				break;
//			   } 
//			}
//		response.sendRedirect("cart.jsp");
//	}

//	private void addOne(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
//		HttpSession session = request.getSession(true);
//		CartItem nc = new CartItem();
//		if (session.getAttribute("loginuser") == null) {
//			response.sendRedirect("customerLogin.jsp");
//		} else {
//			String Did = request.getParameter("Idomsid");
//			Idoms current = new Idoms();
//			IdomsDAO Idomsdao = (IdomsDAO) DAOFactory.newInstance("IdomsDAO");
//			int id = Integer.parseInt(Did);
//			current = Idomsdao.findIdoms(id);
//			request.setAttribute("current", current);
//			Customer now = (Customer) session.getAttribute("loginuser");
//			nc.setUsername(now.getUsername());
//			nc.setId(id);
//			Iterator<Map.Entry<Integer, Integer>> it = cart.entrySet().iterator();
//			int flag = 0;
//			while(it.hasNext()){
//			Map.Entry entry = (Map.Entry) it.next();
//			CartItem ncin = new CartItem();
//			ncin = (CartItem)entry.getKey();
//			if (nc.getId()==ncin.getId()&&nc.getUsername()==ncin.getUsername()) {
//				flag = 1;
//				cart.put(ncin, (Integer) cart.get(ncin) + 1);
//			   } 
//			}
//			if(flag==0){
//					cart.put(nc, 1);
//			}
//			session.setAttribute("shopcart", cart);
//			response.sendRedirect("cart.jsp");
//		}
//		
//	}
//	private void goCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
//		HttpSession session = request.getSession(true);
//		if(session.getAttribute("loginuser")==null){
//			response.sendRedirect("customerLogin.jsp");
//		}
//		else{
//			response.sendRedirect("cart.jsp");
//		}
//	}
	
	private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		session.removeAttribute("loginuser");
		response.sendRedirect("index.jsp");
	}
	
//	private void order(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
//		//获取订单号
//		String orderid=request.getParameter("orderid");
//		request.setAttribute("orderid", orderid);
//		request.getRequestDispatcher("orderitem.jsp").forward(request, response);
//	}
	
//	private void delorder(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
//		//获取订单号
//		String orderid=request.getParameter("orderid");
//		OrderDAO orderdao=(OrderDAO)DAOFactory.newInstance("OrderDAO");
//		System.out.println(orderid);
//		orderdao.removeOrder(orderid);
//		response.sendRedirect("order.jsp");
//	}
	
//	private void comment(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException{
//		//获取Idomsid
//		int Idomsid=Integer.parseInt(request.getParameter("Idomsid"));
//		request.setAttribute("Idomsid", Idomsid);
//		request.getRequestDispatcher("IdomsComment.jsp").forward(request, response);
//	}
	
	private void checkout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginuser")==null){
			response.sendRedirect("login.jsp");
		}
		else{
			response.sendRedirect("checkout.jsp");
		}
	}
}
