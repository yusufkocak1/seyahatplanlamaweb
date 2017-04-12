package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteuser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("per_id");
		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			stmt.executeUpdate("DELETE FROM personel WHERE id='" + value + "'");

			connection.commit();
			stmt.close();
			connection.close();

			System.out.println("Disconnected from database");

			response.sendRedirect("usertable.jsp");
			return;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("User delete successfully");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}