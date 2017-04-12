package com.seyahatplani;

import java.sql.*;

public class databaseconnection {

	public static void main(String[] args) {

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();
			connection.commit();
			stmt.close();
			connection.close();
			System.out.println("Disconnected from database");
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("Database connected successfully");
	}
}