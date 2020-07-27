package jp.co.benesse.actualservlet;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.benesse.dataaccess.cm.ConnectionManager;
import jp.co.benesse.dataaccess.dao.ScheduleDAO;
import jp.co.benesse.dataaccess.value.ScheduleBean;

@WebServlet("/user/actualindex")
public class ActualIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// セッションスコープから値を取得
		 HttpSession session = request.getSession();
		 int userId = (Integer)session.getAttribute("userId");
//		 String userIdStr = (String) session.getAttribute("userId");
//		 int userId = Integer.parseInt(userIdStr);
//		int userId = 1;
		// String userName = (String) session.getAttribute("userId");
		String dateStr = request.getParameter("date");
		// 月送りの判定フラグ
		String monthFlag = request.getParameter("monthFlag");

		LocalDate date;
		List<ScheduleBean> scheduleBeanList = new ArrayList<>();

		// 遷移元の判定フラグ
		final String FLAG = "0";

		ConnectionManager connectionManager = new ConnectionManager();
		ScheduleDAO scheduleDAO;

		try {
			if (monthFlag == null || dateStr == null) {// 実績確認画面以外から
				date = LocalDate.now();
			} else if (monthFlag.equals("0")) {// 前月
				date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth()); // 初日
				date = firstDayOfMonth.minusDays(1);// 先月の末日
			} else if (monthFlag.equals("1")) {// 翌月
				date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate lastDayOfMonth = date.with(TemporalAdjusters.lastDayOfMonth()); // 末日
				date = lastDayOfMonth.plusDays(1);// 次月の初日
			} else {// 実績確認画面以外から
				date = LocalDate.now();
			}
		} catch (DateTimeParseException e) {
			// 日付の不正入力のうち、フロントではじけなかった場合はエラー画面へ
			RequestDispatcher dispatcher = request.getRequestDispatcher("../WEB-INF/views/error/error.jsp");
			dispatcher.forward(request, response);
			return;
		}

		try {
			Connection connection = connectionManager.getConnection();
			scheduleDAO = new ScheduleDAO(connection);
			scheduleBeanList = scheduleDAO.getOneMonthSchedule(date, userId);

			// リクエストスコープにセット
			request.setAttribute("flag", FLAG);
			request.setAttribute("date", date);
			request.setAttribute("month", date.getMonthValue());
			request.setAttribute("year", date.getYear());
			request.setAttribute("scheduleBeanList", scheduleBeanList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("../WEB-INF/views/actual/actual_index.jsp");
			dispatcher.forward(request, response);
			return;
		} catch (RuntimeException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("../WEB-INF/views/error/error.jsp");
			dispatcher.forward(request, response);
			return;
		} finally {
			connectionManager.closeConnection();
		}
	}

}