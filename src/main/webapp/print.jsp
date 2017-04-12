<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<style type="text/css">
h2 {
	text-transform: capitalize;
}

b {
margin-right: 12em;
float: right;
	display:inline-block;
	text-align:center;
}

span {
margin-right: 12em;
float: right;
}

form {
	margin: 0;
	padding: 0;
}

fieldset {
	margin-bottom: 2em;
	border: 2px solid #888;
	border-right: 2px solid #666;
	border-bottom: 2px solid #666;
}

legend {
	margin: 0 auto;
	font-weight: bold;
}

div#header {
	position: relative;
	background-image: url(rocketship.gif);
	background-repeat: no-repeat;
	background-position: 10px 0px;
}

div#header h1 {
	height: 80px;
	line-height: 80px;
	margin: 0 auto;
	padding-left: 27%;
	color: #333;
	vertical-align: middle;
	line-height: 1.5;
}

div#extra {
	color: #333;
	background-image: url(fade.jpg);
	background-repeat: repeat-x;
}

div#extra h2, div#extra span {
	margin-left: 10px;
	margin-right: 10px;
}

div#wrapper {
	float: left;
	width: 100%;
	margin: 0 auto;
}

div#content {
	margin-right: 30%;
	margin-left: 30%;
	margin-bottom: 2em;
}

div#navigation {
	float: left;
	width: 25%;
	margin: 0 auto;
}

div#extra {
	float: left;
	width: 25%;
	margin: 0 auto;
}

p{
	margin-left: 110px;
	font-size: 20px;


}
.btn2 {
	border-radius: 4px;
	background-color: black;
	border: 1;
	color: white;
	padding: 7px 33px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin-left: 220px;
	cursor: pointer;
}
</style>

<script>
	function myFunction() {
		window.print();
		window.close();
	}
</script>

</head>

<body>
	<div id="container">
		<div id="wrapper">
			<div id="content">
				<h2></h2>
				<br>
				<form>
					<fieldset id="myFieldset">
						<legend><img src="assets/img/sni.png"></legend>

						<!-- ---hidden--------------------------------------------------------------------------------- -->

						<label for="seyahat_id"><span></span> <input type="hidden" id="seyahat_id" name="seyahat_id" value="<%=request.getSession().getAttribute("seyahat_id")%>"></label><br>

						<!-- ---hidden--------------------------------------------------------------------------------- -->

						<label for="personel_no"><b>Personel Numarası : </b><span><%=request.getSession().getAttribute("personel_no")%></span></label><br><br>
						<label for="personelad"><b> Personel Adı : </b><span><%=request.getSession().getAttribute("personel_ad")%></span></label><br><br>
						<label for="departman"><b>Departman : </b><span><%=request.getSession().getAttribute("departman")%></span></label><br><br>
						<label for="seyahatBa"><b>Seyahat Tarihi Başlangıcı : </b><span><%=request.getSession().getAttribute("seyahat_bas")%></span></label><br><br>
						<label for="seyahatBi"><b>Seyahat Tarihi Bitişi : </b><span><%=request.getSession().getAttribute("seyahat_bit")%></span></label><br><br>
						<label for="musteriadi"><b>Müşteri Adı : </b><span><%=request.getSession().getAttribute("musteri_Ad")%></span></label><br><br>
						<label for="projeadi"><b>Proje_ad : </b><span><%=request.getSession().getAttribute("proje_ad")%></span></label><br><br>
						<label for="sehir"><b>Şehir : </b><span><%=request.getSession().getAttribute("Lokasyon")%></span></label><br><br>
						<label for="seyahatarac"><b>Araç : </b><span><%=request.getSession().getAttribute("arac")%></span></label><br><br>
						<label for="nerede"><b>Araç Konumu : </b><span><%=request.getSession().getAttribute("nerede")%></span></label><br><br>
						<label for="plaka"><b>Plaka : </b><span><%=request.getSession().getAttribute("plaka")%></span></label><br><br>
						<label for="seyahatav"><b>Seyahat Avansı : </b><span><%=request.getSession().getAttribute("avans")%> <%=request.getSession().getAttribute("pbrm")%></span></label><br><br>
					<br>
					<hr>
										<br>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong></b>Personel İmza</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong></b>Yönetici İmza</strong>
					<br><br><br>
					
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="printDiv('content')" value="YAZDIR" class="btn2" />
	<script>
	function printDiv(content) {
	     var printContents = document.getElementById(content).innerHTML;
	     var originalContents = document.body.innerHTML;

	     document.body.innerHTML = printContents;

	     window.print();

	     document.body.innerHTML = originalContents;
	}
</script>
</body>
</html>
