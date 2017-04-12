package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class saveuser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public saveuser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String personel_no = request.getParameter("personel_no");
		String personel_ad = request.getParameter("personel_ad");
		String departman = request.getParameter("departman");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("personelOpened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			stmt.executeUpdate("insert into personel values ('" + personel_no + "','" + personel_ad + "','" + departman
					+ "','" + personel_no + "')");
			connection.commit();
			stmt.close();
			connection.close();
			response.sendRedirect("usersave.html");
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("Records created successfully");
		doGet(request, response);
	}
}