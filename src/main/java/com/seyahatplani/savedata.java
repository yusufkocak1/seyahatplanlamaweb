package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class savedata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public savedata() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String seyahat_bas = request.getParameter("seyahat_bas");
		String seyahat_bit = request.getParameter("seyahat_bit");
		String personel_ad = request.getParameter("personel_ad");
		String departman = request.getParameter("departman");
		String musteri_Ad = request.getParameter("musteri_Ad");
		String proje_ad = request.getParameter("proje_ad");
		String Lokasyon = request.getParameter("Lokasyon");
		String nerede = request.getParameter("nerede");
		String arac = request.getParameter("arac");
		String avans = request.getParameter("avans");
		String plaka = request.getParameter("plaka");
		String personel_no = request.getParameter("personel_no");
		String pbrm = request.getParameter("pbrm");


		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			stmt.executeUpdate("insert into seyahatplani values ('" + seyahat_bas + "','" + seyahat_bit + "','"
					+ personel_ad + "','" + departman + "','" + musteri_Ad + "','" + proje_ad + "','" + Lokasyon + "','"
					+ nerede + "','" + arac + "','" + avans + "','" + plaka + "','" + personel_no + "','" + pbrm + "')");

			connection.commit();
			stmt.close();
			connection.close();
			response.sendRedirect("index.html");
			return;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("Records created successfully");
	}
}
