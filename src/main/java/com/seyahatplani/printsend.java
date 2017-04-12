package com.seyahatplani;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class printsend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public printsend() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("seyahat_id");

		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = null;
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
			connection.setAutoCommit(false);
			if (connection != null)
				System.out.println("Opened database successfully");

			java.sql.Statement stmt = connection.createStatement();

			String query = "SELECT * FROM seyahatplani WHERE seyahat_id='" + value + "'";
			ResultSet resultSet = stmt.executeQuery(query);

			String seyahat_bas = "";
			String seyahat_bit = "";
			String personel_ad = " ";
			String departman = "";
			String musteri_Ad = "";
			String proje_ad = "";
			String Lokasyon = "";
			String nerede = "";
			String arac = "";
			String avans = "";
			String plaka = "";
			String personel_no = "";

			while (resultSet.next()) {
				seyahat_bas = resultSet.getString("seyahat_bas");
				seyahat_bit = resultSet.getString("seyahat_bit");
				personel_ad = resultSet.getString("personel_ad");
				departman = resultSet.getString("departman");
				musteri_Ad = resultSet.getString("musteri_Ad");
				proje_ad = resultSet.getString("proje_ad");
				Lokasyon = resultSet.getString("Lokasyon");
				nerede = resultSet.getString("nerede");
				arac = resultSet.getString("arac");
				avans = resultSet.getString("avans");
				plaka = resultSet.getString("plaka");
				personel_no = resultSet.getString("personel_no");
			}

			request.getSession().setAttribute("seyahat_bas", seyahat_bas);
			request.getSession().setAttribute("seyahat_bit", seyahat_bit);
			request.getSession().setAttribute("personel_ad", personel_ad);
			request.getSession().setAttribute("departman", departman);
			request.getSession().setAttribute("musteri_Ad", musteri_Ad);
			request.getSession().setAttribute("proje_ad", proje_ad);
			request.getSession().setAttribute("Lokasyon", Lokasyon);
			request.getSession().setAttribute("nerede", nerede);
			request.getSession().setAttribute("arac", arac);
			request.getSession().setAttribute("avans", avans);
			request.getSession().setAttribute("plaka", plaka);
			request.getSession().setAttribute("personel_no", personel_no);

			request.getSession().setAttribute("seyahat_id", value);

			connection.commit();
			stmt.close();
			connection.close();
			System.out.println("Disconnected from database");

			response.sendRedirect("print.jsp");
			return;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			System.exit(0);
		}
		System.out.println("Records printed successfully");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}