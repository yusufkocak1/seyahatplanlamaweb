<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String per_no = request.getParameter("per_no");
	String driverName = "org.postgresql.Driver";
	String connectionUrl = "jdbc:postgresql://localhost:5432/";
	String dbName = "personel";
	String userId = "postgresql";
	String password = "1";

	try {
		Class.forName("org.postgresql.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
%>

<meta http-equiv="refresh" content="10;URL=usertable.jsp">
<style>
body {
	background-image:
		url("assets/img/white.jpg");
}


.responstable {
	width: 50%;
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

a:link, a:visited {
    background-color: grey;
    color: white;
    border: 1;
    padding: 14px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

</style>

<body>

	<table class="responstable" align="center" cellpadding="5" cellspacing="5" border="1" method="post" onsubmit="updateform.jsp">

		<tr>
			<th><b>Personel Numarası</b></th>
			<th><b>Personel Adı</b></th>
			<th><b>Departman Adı</b></th>
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

				String sql = "SELECT * FROM personel";

				resultSet = stmt.executeQuery(sql);
				while (resultSet.next()) {
		%>

		<tr>
			<td><%=resultSet.getString("id")%></td>
			<td><%=resultSet.getString("per_ad")%></td>
			<td><%=resultSet.getString("depart")%></td>
			<td><a href="updateuserdata?per_no=<%=resultSet.getInt("per_no")%>" target="_top">Güncelle</a></td>
			<td><input type="button" onclick="location.href='deleteuser?per_id=<%=resultSet.getInt("id")%>' " value="Sil"></td>
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