package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public user() {
		super();
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("personel_no");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();
			String query = "SELECT * FROM personel WHERE id='" + no + "'";

			ResultSet resultSet = stmt.executeQuery(query);

			String personel_no = "";
			String personel_ad = "";
			String departman = "";

			while (resultSet.next()) {
				personel_no = resultSet.getString("id");
				personel_ad = resultSet.getString("per_ad");
				departman = resultSet.getString("depart");
			}

			request.getSession().setAttribute("personel_no", personel_no);
			request.getSession().setAttribute("personel_ad", personel_ad);
			request.getSession().setAttribute("departman", departman);

			connection.commit();
			stmt.close();
			connection.close();
			System.out.println("Disconnected from database");
			response.sendRedirect("form.jsp");
			return;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}