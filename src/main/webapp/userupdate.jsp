<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KULLANICI KAYIT GÜNCELLER</title>
</head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: grey;
}

.active {
	background-color: #4CAF50;
}

form {
	margin: 0cm 0cm 0cm 6cm;
}

h1 {
	color: #000000;
	text-align: center;
	font-family: "SIMPSON";
}

label {
	display: block;
}

label span {
	display: inline-block;
	text-align: right;
	width: 25%;
}

input[type=text], [type=datetime-local], select {
	margin: 0cm 0cm 0cm 0, 9cm;
	width: 30%;
	padding: 10px 20px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	border-radius: 4px;
	background-color: #4CAF50;
	border: 1;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 350px;
	cursor: pointer;
}

div {
	padding: 25px;
}
</style>

<body bgcolor=#ffcc66>

	<ul>
		<li><a href="http://localhost:8080/seyahatplaniweb/index.html" target="_top">ANASAYFA</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/form.jsp" target="_top">SEYEHAT KAYIT</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/index.jsp" target="_top">SEYEHAT KAYIT TABLOSU</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/exit.jsp" target="_top">ÇIKIŞ</a></li>
		<li style="float: right"><a class="active" href="http://localhost:8080/seyahatplaniweb/about.html" target="_top">HAKKINDA</a></li>
	</ul>

	<div>
		<form action="updateuser" id="save" method="post">

			<!-- gizli input -->
			<label for="per_id"><span></span>
			<input type="hidden"
				id="per_id" name="per_id"
				value="<%=request.getSession().getAttribute("per_id")%>"></label><br>
				
			<!-- gizli input 2-->
			<label for="old_no"><span></span>
			<input type="hidden"
				id="old_no" name="old_no"
				value="<%=request.getSession().getAttribute("old_no")%>"></label> <br>

<!-- ------------------------------------------------------------------------------------------- -->

			<label for="personelno"><span>Personel Numarası:</span>
			<input type="text" id="per_no" name="per_no"
				value="<%=request.getSession().getAttribute("per_no")%>"
				pattern="[0-9]{1,10}"
				title="Sadece sayı max 10 karakterlik giriş yapınız" required /> </label> </br>

			<label for="personelad"><span>Personel Adı:</span>
			<input type="text" id="per_ad" name="per_ad"
				value="<%=request.getSession().getAttribute("per_ad")%>"
				pattern="[a-zA-Z\s]+"
				title="Sadece harf ve boşluk içeren giriş yapınız" required></label><br>

			<label for="departman"><span>Departman:</span>
			<select id="depart" name="depart"> value="<%=request.getSession().getAttribute("depart")%>"
					<option value="Bilgi İşlem">Bilgi İşlem</option>
					<option value="ArGe">ArGe</option>
					<option value="İnsan Kaynakları">İnsan Kaynakları</option>
					<option value="Teknik Destek">Teknik Destek</option>
			</select></label> <br> <br>
			<input type="submit" form="save" name="btnGüncelle" id="btnGüncelle" value="GÜNCELLE" />
		</form>
	</div>
	
</body>
</html>