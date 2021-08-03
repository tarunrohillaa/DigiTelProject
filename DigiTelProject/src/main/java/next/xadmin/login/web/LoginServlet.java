package next.xadmin.login.web;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import next.xadmin.login.database.LoginDao;
import next.xadmin.login.bean.LoginBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		session.setAttribute("uname", username);
//		request.setAttribute( "theUserName", username );
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setPassword(password);
		loginBean.setUsername(username);
		
		LoginDao loginDao = new LoginDao();
		if(loginDao.validate(loginBean))
		{
			response.sendRedirect("loginSuccess.jsp");
		}
	   if(loginDao.validateTele(loginBean))
		{
			response.sendRedirect("loginSuccess.jsp");
		}
		if(loginDao.userValidate(loginBean))
		{
			
//			RequestDispatcher rd = request.getRequestDispatcher("/userdashboard.jsp");  
//			try {  
//			       rd.forward(request, response);  
//			            return;  
//			     }catch(Exception e){}
			
//			if(loginDao.lastLogin(loginBean)!=0)
//			{
				request.setAttribute( "theUserName", username );
				
//				response.sendRedirect("userdashboard.jsp");
				
				
				RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
				rd.forward(request, response);
				
				
				
//			}
			
		}
		if(loginDao.userValidateTele(loginBean))
		{
			
//			if(loginDao.lastLogin(loginBean)!=0)
//			{
				request.setAttribute( "theUserName", username );
//				response.sendRedirect("userdashboard.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
				rd.forward(request, response);
//			}
			
			

			
//			RequestDispatcher rd = request.getRequestDispatcher("/userdashboard.jsp");  
//			try {  
//			       rd.forward(request, response);  
//			            return;  
//			     }catch(Exception e){}
			
		}
		
		if(!loginDao.validate(loginBean))
		{
			out.println("<script type=\"text/javascript\">");
     	   out.println("alert('Please cheack Email/Telephone Number Or password enter and login again');");
     	   out.println("location='login.jsp';");
     	   out.println("</script>");
		}
	   if(!loginDao.validateTele(loginBean))
		{
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Please cheack Email/Telephone Number Or password enter and login again');");
    	   out.println("location='login.jsp';");
    	   out.println("</script>");
		}
		if(!loginDao.userValidate(loginBean))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please cheack Email/Telephone Number Or password enter and login again');");
     	   out.println("location='login.jsp';");
     	   out.println("</script>");
		}
		if(!loginDao.userValidateTele(loginBean))
		{
			out.println("<script type=\"text/javascript\">");
     	   out.println("alert('Please cheack Email/Telephone Number Or password enter and login again');");
     	   out.println("location='login.jsp';");
     	   out.println("</script>");
		}
		
	
		
		
		
	}

}