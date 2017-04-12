<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KAYIT</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$("#personel_no").keydown(function() {
			setTimeout(function(){
				$("#btn").click();
			},1000);
		});
	});
	
	function makeDelay(ms) {
	    var timer = 0;
	    return function(callback){
	        clearTimeout (timer);
	        timer = setTimeout(callback, ms);
	    };
	};
</script>

</head>

<style>
body {
	background-image:
		url("assets/img/light-blue.jpg");
}

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
	margin: 1cm 1cm 1cm 6cm;
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

.btn1 {
	opacity: 0;
	margin-left: 360px;
}

.btn2 {
	border-radius: 4px;
	background-color: #4CAF50;
	border: 1;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 310px;
	cursor: pointer;
}

div {
	padding: 50px;
}
</style>

<body bgcolor="#c2d6d6">

	<ul>
		<li><a href="http://localhost:8080/seyahatplaniweb/index.html" target="_top">ANASAYFA</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/usersaveall.html" target="_top">PERSONEL KAYIT</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/index.jsp" target="_top">SEYAHAT KAYIT TABLOSU</a></li>
		<li><a href="http://localhost:8080/seyahatplaniweb/exit.jsp" target="_top">ÇIKIŞ</a></li>
		<li style="float: right"><a class="active" href="http://localhost:8080/seyahatplaniweb/about.html" target="_top">HAKKINDA</a></li>
	</ul>

	<div>
		<form action="user" id="get" method="post">
			<label for="personelno"><span>Personel Numarası:</span>
			<input type="text" id="personel_no" name="personel_no"
				pattern="[0-9]{1,10}"
				value="<%=request.getSession().getAttribute("personel_no") == null ? "" : request.getSession().getAttribute("personel_no")%>"
				title="Sadece sayı max 10 karakterlik giriş yapınız" required />
			<input type="submit" class="btn1" form="get" name="btn" id="btn" value="GETİR" /> </label>
		</form>

<!-- ---hidden--------------------------------------------------------------------------------- -->

		<form action="savedata" id="saveForm" method="post">
			<label for="personelno"><span></span>
			<input type="hidden" id="personel_no" name="personel_no" 
				value="<%=request.getSession().getAttribute("personel_no")%>"
				pattern="[0-9]{1,10}"
				title="Sadece sayı max 10 karakterlik giriş yapınız" required /></label>
			
<!-- ---hidden--------------------------------------------------------------------------------- -->
		
			<label for="personelad"><span>Personel Adı:</span>
			<input type="text" id="personel_ad" name="personel_ad"
				value="<%=request.getSession().getAttribute("personel_ad") == null ? "" : request.getSession().getAttribute("personel_ad")%>"
				pattern="[a-zA-Z\s]+"
				title="Sadece harf ve boşluk içeren giriş yapınız" required></label><br>

			<label for="departman"><span>Departman:</span>
			<select id="departman" name="departman">
					<option value="<%=request.getSession().getAttribute("departman") == null ? "" : request.getSession().getAttribute("departman")%>"><%=request.getSession().getAttribute("departman") == null ? "" : request.getSession().getAttribute("departman")%></option>
					<option value="Bilgi İşlem">Bilgi İşlem</option>
					<option value="ArGe">ArGe</option>
					<option value="İnsan Kaynakları">İnsan Kaynakları</option>
					<option value="Teknik Destek">Teknik Destek</option>
			</select></label> <br> <br> <br>
			
			<label for="seyahatBa"><span>Seyahat Tarihi Başlangıcı:</span> 
			<input type="datetime-local"
				data-date-inline-picker="true" id="seyahat_bas" name="seyahat_bas"></label><br>

			<label for="seyahatBi"><span>Seyahat Tarihi Bitişi:</span>
			<input type="datetime-local" data-date-inline-picker="true"
				id="seyahat_bit" name="seyahat_bit"></label> <br> <br>
			
			<label for="musteriadi"><span>Müşteri Adı:</span>
			<select id="musteri_Ad" name="musteri_Ad" required>
					<option value="">--------</option>
					<option value="Adidas">Adidas</option>
					<option value="Nike">Nike</option>
					<option value="Puma">Puma</option>
					<option value="Ralph Lauren">Ralph Lauren</option>
					<option value="RWE Türkiye">RWE Türkiye</option>
					<option value="Akzo Nobel">Akzo Nobel</option>
					<option value="Tefal">Tefal</option>
					<option value="Deloitte">Deloitte</option>
					<option value="Honeywell">Honeywell</option>
					<option value="Bulgari">Bulgari</option>
					<option value="Yaşar">Yaşar</option>
			</select></label> <br>
			
			<label for="projeadi"><span>Proje Adı:</span>
			<select id="proje_ad" name="proje_ad" required>
					<option value="">--------</option>
					<option value="DBS">DBS</option>
					<option value="E-Fatura">E-Fatura Aracı</option>
					<option value="E-Defter">E-Defter</option>
					<option value="E-Arşiv">E-Arşiv</option>
					<option value="BA/BS">E-BA/BS</option>
					<option value="SAP ZUGFeRD">SAP ZUGFeRD</option>
					<option value="SAP SAF-T">SAP SAF-T</option>
			</select></label> <br>
			
			<label for="sehir"><span>Lokasyon:</span>
			<select id="Lokasyon" name="Lokasyon">
					<option value="">--------</option>
					<option value="Adana">Adana</option>
					<option value="Adıyaman">Adıyaman</option>
					<option value="Afyonkarahisar">Afyonkarahisar</option>
					<option value="Ağrı">Ağrı</option>
					<option value="Amasya">Amasya</option>
					<option value="Ankara">Ankara</option>
					<option value="Antalya">Antalya</option>
					<option value="Artvin">Artvin</option>
					<option value="Aydın">Aydın</option>
					<option value="Balıkesir">Balıkesir</option>
					<option value="Bilecik">Bilecik</option>
					<option value="Bingöl">Bingöl</option>
					<option value="Bitlis">Bitlis</option>
					<option value="Bolu">Bolu</option>
					<option value="Burdur">Burdur</option>
					<option value="Bursa">Bursa</option>
					<option value="Çanakkale">Çanakkale</option>
					<option value="Çankırı">Çankırı</option>
					<option value="Çorum">Çorum</option>
					<option value="Denizli">Denizli</option>
					<option value="Diyarbakır">Diyarbakır</option>
					<option value="Edirne">Edirne</option>
					<option value="Elazığ">Elazığ</option>
					<option value="Erzincan">Erzincan</option>
					<option value="Erzurum">Erzurum</option>
					<option value="Eskişehir">Eskişehir</option>
					<option value="Gaziantep">Gaziantep</option>
					<option value="Giresun">Giresun</option>
					<option value="Gümüşhane">Gümüşhane</option>
					<option value="Hakkâri">Hakkâri</option>
					<option value="Hatay">Hatay</option>
					<option value="Isparta">Isparta</option>
					<option value="Mersin">Mersin</option>
					<option value="İstanbul">İstanbul</option>
					<option value="İzmir">İzmir</option>
					<option value="Kars">Kars</option>
					<option value="Kastamonu">Kastamonu</option>
					<option value="Kayseri">Kayseri</option>
					<option value="Kırklareli">Kırklareli</option>
					<option value="Kırşehir">Kırşehir</option>
					<option value="Kocaeli">Kocaeli</option>
					<option value="Konya">Konya</option>
					<option value="Kütahya">Kütahya</option>
					<option value="Malatya">Malatya</option>
					<option value="Manisa">Manisa</option>
					<option value="Kahramanmaraş">Kahramanmaraş</option>
					<option value="Mardin">Mardin</option>
					<option value="Muğla">Muğla</option>
					<option value="Muş">Muş</option>
					<option value="Nevşehir">Nevşehir</option>
					<option value="Niğde">Niğde</option>
					<option value="Ordu">Ordu</option>
					<option value="Rize">Rize</option>
					<option value="Sakarya">Sakarya</option>
					<option value="Samsun">Samsun</option>
					<option value="Siirt">Siirt</option>
					<option value="Sinop">Sinop</option>
					<option value="Sivas">Sivas</option>
					<option value="Tekirdağ">Tekirdağ</option>
					<option value="Tokat">Tokat</option>
					<option value="Trabzon">Trabzon</option>
					<option value="Tunceli">Tunceli</option>
					<option value="Şanlıurfa">Şanlıurfa</option>
					<option value="Uşak">Uşak</option>
					<option value="Van">Van</option>
					<option value="Yozgat">Yozgat</option>
					<option value="Zonguldak">Zonguldak</option>
					<option value="Aksaray">Aksaray</option>
					<option value="Bayburt">Bayburt</option>
					<option value="Karaman">Karaman</option>
					<option value="Kırıkkale">Kırıkkale</option>
					<option value="Batman">Batman</option>
					<option value="Şırnak">Şırnak</option>
					<option value="Bartın">Bartın</option>
					<option value="Ardahan">Ardahan</option>
					<option value="Iğdır">Iğdır</option>
					<option value="Yalova">Yalova</option>
					<option value="Karabük">Karabük</option>
					<option value="Kilis">Kilis</option>
					<option value="Osmaniye">Osmaniye</option>
					<option value="Düzce">Düzce</option>
			</select></label><br>
			
			<label for="seyahatarac"><span>Seyahat Aracı:</span>
			<select id="arac" name="arac">
					<option value="">--------</option>
					<option value="Otobüs">Otobüs</option>
					<option value="Şirket Otomobili">Şirket Otomobili</option>
					<option value="Uçak">Uçak</option>
					<option value="Tren">Tren</option>
					<option value="Vapur">Vapur</option>
					<option value="Diğer">Diğer</option>
			</select></label> <br>
			
			<label for="nerede"><span>Araç Konumu:</span>
			<input type="text" id="nerede" name="nerede"
			    pattern="[a-zA-Z\s]+"
				title="Sadece harf ve boşluk içeren giriş yapınız" required></label><br> <br> <br>
			
			<label for="plaka"><span>Araç Plaka No:</span>
			<input type="text" id="plaka" name="plaka">
<!-- 				pattern="^([0-9 ]{3}-?[A-Za-z ]{4}-?[0-9]{3})?([0-9 ]{3}-?[A-Za-z ]{4}-?[0-9]{4})?([0-9 ]{3}-?[A-Za-z ]{3}-?[0-9]{3})?([0-9 ]{3}-?[A-Za-z ]{3}-?[0-9]{4})?$" -->
<!-- 				title="'00 ab-c 000-0 şeklinde giriş yapınız'" required -->
				</label><br>

			<label for="seyahatav"><span>Seyahat Avansı:</span>
			<input type="text" id="avans" name="avans" pattern="([0-9 ]{4,11})" title="'000-0000000 şeklinde giriş yapınız'" required>
			<select id="pbrm" name="pbrm">
					<option value="">--------</option>
					<option value="TL">TL</option>
					<option value="USD">USD</option>
					<option value="EUR">EUR</option>
					<option value="GBP">GBP</option>
					<option value="RUB">RUB</option>
					<option value="QAR">QAR</option>
					<option value="SAR">SAR</option>
					<option value="INR">INR</option>
					<option value="SDD">SDD</option>
					<option value="PLZ">JPY</option>
			</label><br>

			<input type="button" value="KAYDET" onclick="saveFunction()" class="btn2"/>
            <input type="submit" value="Save" id="save" class="btn1"/>
		</form>
	</div>

	<script>
		function saveFunction() {
			// Save it!
			if (confirm('Bu bilgileri kayıt etmek istiyor musun?')) {
				var str1 = document.getElementById("seyahat_bas").value;
				var str2 = document.getElementById("seyahat_bit").value;

		    if (str1 < str2) {

					mySubmitButton = document.getElementById("save");
					mySubmitButton.click();
					myOpenButton = document.getElementById("Next");
					myOpenButton.click();

					$("#saveForm").submit();
					window.location.reload();
					window.location.href = "http://localhost:8080/seyahatplaniweb/index.html";
					return true;
				} else {
					alert("Başlangıç tarihi bitişten sonra olamaz!");
				}
			} else {
				// Do nothing!
			}
		}
	</script>

</body>
</html>