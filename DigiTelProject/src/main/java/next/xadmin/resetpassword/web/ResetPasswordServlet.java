package next.xadmin.resetpassword.web;


import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import next.xadmin.resetpassword.database.ResetPasswordDao;
import next.xadmin.resetpassword.bean.ResetPasswordBean;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/Reset")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final long passwordexpire = 30L * 24L * 60L * 60L * 1000L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("resetpassword.jsp");
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newpassword = request.getParameter("newpassword");
		String telenumber = request.getParameter("telenumber");
		ResetPasswordBean resetPasswordBean = new ResetPasswordBean();
		
		resetPasswordBean.setEmail(email);
		resetPasswordBean.setPassword(password);
		resetPasswordBean.setNewpassword(newpassword);
		resetPasswordBean.setTelenumber(telenumber);
		
		ResetPasswordDao resetPasswordDao = new ResetPasswordDao();
		
		
		
			if(resetPasswordDao.ResetPassword(resetPasswordBean) !=0)
			{
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password Reset Successfully, click 'OK' to login again ');");
				 out.println("location='login.jsp';");
				 out.println("</script>");
			}
			else {
				out.println("<script type=\"text/javascript\">");
	        	   out.println("alert('Cannot Reset Password, Please check your Email/Telephone Number or Password');");
	        	   out.println("window.location.href = \"resetpassword.jsp\";");
	        	   
	        	   out.println("</script>");
			}

		
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("resetsuccess.jsp");
//		dispatcher.forward(request,response);
		
	}
	}