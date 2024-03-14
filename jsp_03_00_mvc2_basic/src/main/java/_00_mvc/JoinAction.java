package _00_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 클래스 = HttpServelt클래스를 상속받은 클래스

@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
//	get, post를 따로 분리해서 코드를 작성하면 가독성이 떨어지니 하나로 몰아서 작성한다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// jsp페이지에서 전달한 데이터를 저장
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// 서블릿 에서 처리한 데이터를 jsp페이지로 이동
		request.setAttribute("name", name);
		request.setAttribute("name", age);
		
		// 서블릿 페이지에서 jsp 페이지로 이동
		RequestDispatcher rd = request.getRequestDispatcher("joinPro.jsp");
		rd.forward(request, response);
	}
}
