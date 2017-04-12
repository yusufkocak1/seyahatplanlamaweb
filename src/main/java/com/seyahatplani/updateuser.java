package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateuser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String per_id = request.getParameter("per_id");
		String old_no = request.getParameter("old_no");
		String per_ad = request.getParameter("per_ad");
		String depart = request.getParameter("depart");
		String per_no = request.getParameter("per_no");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			stmt.executeUpdate("update \"seyahatplani\" set \"personel_no\"='" + per_no + "',\"personel_ad\"='" + per_ad
					+ "',\"departman\"='" + depart + "' where personel_no='" + old_no + "'");

			connection.commit();
			stmt.close();
			connection.close();
		}

		catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			old_no = per_no;
			stmt.executeUpdate("update \"personel\" set \"per_no\"='" + per_no + "',\"per_ad\"='" + per_ad
					+ "',\"old_no\"='" + old_no + "',\"depart\"='" + depart + "' where id='" + per_id + "'");

			connection.commit();
			stmt.close();
			connection.close();
			response.sendRedirect("usersaveall.html");
			return;
		} catch (Exception e1) {
			System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
			System.exit(0);
		}
		System.out.println("Records created successfully");
	}
}