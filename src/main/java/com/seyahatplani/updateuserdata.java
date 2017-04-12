package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateuserdata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateuserdata() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String value = request.getParameter("per_no");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			String query = "SELECT * FROM personel WHERE per_no='" + value + "'";
			ResultSet resultSet = stmt.executeQuery(query);

			String per_id = "";
			String per_no = "";
			String old_no = "";
			String per_ad = "";
			String depart = "";

			while (resultSet.next()) {

				per_id = resultSet.getString("id");
				old_no = resultSet.getString("old_no");
				per_no = resultSet.getString("per_no");
				per_ad = resultSet.getString("per_ad");
				depart = resultSet.getString("depart");

			}
			request.getSession().setAttribute("per_id", per_id);
			request.getSession().setAttribute("per_no", per_no);
			request.getSession().setAttribute("old_no", old_no);
			request.getSession().setAttribute("per_ad", per_ad);
			request.getSession().setAttribute("depart", depart);

			connection.commit();
			stmt.close();
			connection.close();

			System.out.println("Disconnected from database");

			response.sendRedirect("userupdate.jsp");
			return;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("Data updated successfully");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}