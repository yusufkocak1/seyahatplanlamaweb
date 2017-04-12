<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ÇIKIŞ</title>

<script language="javascript" type="text/javascript">
	function kapat() {
		window.close()
	}
</script>

</head>

<style>

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

body {
	background-image:
		url("http://cdn1.cloudpro.co.uk/sites/cloudprod7/files/Time%20to%20say%20goodbye.jpg");
	background-position: center center;
	background-attachment: fixed;
	background-size: 100% 100%;
	background-repeat: no-repeat;
}
</style>

<body>

    <INPUT Type="button" VALUE="Geri Dön" onClick="history.go(-1);return true;">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="Sayfayı Kapat" onclick="kapat()">

</body>
</html>