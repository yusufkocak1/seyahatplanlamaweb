package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String us = request.getParameter("user");
		String pass = request.getParameter("password");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			String sql = "SELECT * FROM login";

			ResultSet resultSet = stmt.executeQuery(sql);

			String user = "";
			String password = "";

			while (resultSet.next()) {

				user = resultSet.getString("user");
				password = resultSet.getString("password");

				if (user.equals(us) && password.equals(pass)) {
					response.sendRedirect("index.html");
					break;
				} else
					response.setHeader("Refresh", "0; URL=http://localhost:8080/seyahatplaniweb/login.html");
			}
			
			connection.commit();
			stmt.close();
			connection.close();
			System.out.println("Disconnected from database");
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