package gomi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestScheduleEdit
 */
@WebServlet("/TestScheduleEdit")
public class TestScheduleEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("date", "2020-7-24");
		request.setAttribute("title", "BBQ");
		request.setAttribute("content","豊洲でBBQ" );
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/schedule/schedule_edit.jsp");
		dispatcher.forward(request, response);
		return;
	}

}
