<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<title>SEYAHAT KAYITLARI</title>

<%
	String seyahat_id = request.getParameter("seyahat_id");
	String driverName = "org.postgresql.Driver";
	String connectionUrl = "jdbc:postgresql://localhost:5432/";
	String dbName = "seyahatplani";
	String userId = "postgresql";
	String password = "1";

	try {
		Class.forName("org.postgresql.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
%>

<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	border-radius: 10px;
}

li {
	float: left;
}

li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: grey;
}

}
.active {
	background-color: #4CAF50;
}

body {
	background-image:
		url("assets/img/louis_vuitton.jpg");
}

.responstable {
	margin: 1em 0;
	width: 100%;
	overflow: hidden;
	background: #FFF;
	color: #024457;
	border-radius: 10px;
	border: 1px solid #167F92;
}

.responstable tr {
	border: 1px solid #D9E4E6;
}

.responstable tr:nth-child(odd) {
	background-color: #ccffff;
}

.responstable th {
	display: none;
	border: 1px solid #FFF;
	background-color: #000066;
	color: #FFF;
	padding: 1em;
}

.responstable th:first-child {
	display: table-cell;
	text-align: center;
}

.responstable th:nth-child(2) {
	display: table-cell;
	text-align: center;
}

.responstable th:nth-child(2) span {
	display: none;
}

.responstable th:nth-child(2):after {
	content: attr(data-th);
}

@media ( min-width : 480px) {
	.responstable th:nth-child(2) span {
		display: block;
	}
	.responstable th:nth-child(2):after {
		display: none;
	}
}

.responstable td {
	display: block;
	word-wrap: break-word;
	max-width: 7em;
}

.responstable td:first-child {
	display: table-cell;
	text-align: center;
	border-right: 1px solid #D9E4E6;
}

@media ( min-width : 480px) {
	.responstable td {
		border: 1px solid #D9E4E6;
	}
}

.responstable th, .responstable td {
	text-align: center;
	margin: .5em 1em;
}

@media ( min-width : 480px) {
	.responstable th, .responstable td {
		display: table-cell;
		padding: 5px;
	}
}

h1 {
	font-family: Verdana;
	font-weight: normal;
	color: #8B0000;
}

h1 span {
	color: #167F92;
}

input[type=button] {
	height: 40px;
	background-color: grey;
	border: 1;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

</style>

<body>

	<ul>
		<li><a href="http://localhost:8080/seyahatplaniweb/index.html" target="_top">ANASAYFA</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/usersaveall.html" target="_top">PERSONEL KAYIT</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/form.jsp" target="_top">SEYAHAT KAYIT</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/exit.jsp" target="_top">ÇIKIŞ</a></li>
		<li style="float: right"><a class="active" href="http://localhost:8080/seyahatplaniweb/about.html" target="_top">HAKKINDA</a></li>
	</ul>

	<table class="responstable" align="center" cellpadding="5" cellspacing="5" border="1" method="post" onsubmit="updateform.jsp">

		<tr>
			<th><b>Personel Numarası</b></th>
			<th><b>Personel Adı</b></th>
			<th><b>Departman Adı</b></th>
			<th><b>Seyahat Başlangıç Tarihi</b></th>
			<th><b>Seyahat Bitiş Tarihi</b></th>
			<th><b>Müşteri Adı</b></th>
			<th><b>Proje Adı</b></th>
			<th><b>Lokasyon</b></th>
			<th><b>Seyehat Aracı</b></th>
			<th><b>Araç Konumu</b></th>
			<th><b>Araç Plaka No</b></th>
			<th><b>Seyahat Avansı</b></th>
		</tr>

		<%
			ResultSet resultSet = null;

			try {
				Class.forName("org.postgresql.Driver");
				Connection connection = null;
				connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "1");
				connection.setAutoCommit(false);
				if (connection != null)
					System.out.println("Opened database successfully");

				java.sql.Statement stmt = connection.createStatement();

				String sql = "SELECT * FROM seyahatplani";

				resultSet = stmt.executeQuery(sql);
				while (resultSet.next()) {
		%>

		<tr>
			<td><%=resultSet.getString("personel_no")%></td>
			<td><%=resultSet.getString("personel_ad")%></td>
			<td><%=resultSet.getString("departman")%></td>
			<td><%=resultSet.getString("seyahat_bas")%></td>
			<td><%=resultSet.getString("seyahat_bit")%></td>
			<td><%=resultSet.getString("musteri_Ad")%></td>
			<td><%=resultSet.getString("proje_ad")%></td>
			<td><%=resultSet.getString("Lokasyon")%></td>
			<td><%=resultSet.getString("arac")%></td>
			<td><%=resultSet.getString("nerede")%></td>
			<td><%=resultSet.getString("plaka")%></td>
			<td><%=resultSet.getString("avans")%> <%=resultSet.getString("pbrm")%></td>
			<td><input type="button" onclick="location.href='printsend?seyahat_id=<%=resultSet.getInt("seyahat_id")%>' "  value="Yazdır"></td>
			<td><input type="button" onclick="location.href='update?seyahat_id=<%=resultSet.getInt("seyahat_id")%>' " value="Güncelle"></td>
			<td><input type="button" onclick="location.href='deletedata?seyahat_id<%=resultSet.getInt("seyahat_id")%>' " value="Sil"></td>
		</tr>

		<%
			}
				stmt.close();
				connection.close();
				System.out.println("Disconnected from database");
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>
</body>