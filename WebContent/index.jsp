<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>中華科技大學</title>
<link rel="stylesheet" href="/eis/inc/css/advance/autoscale_1152.css" />
<!--script src="/eis/inc/js/plugin/gmaps.js"></script-->
<script src="/eis/inc/js/plugin/jquery.cookie.js"></script>
<!--script src="http://maps.google.com/maps/api/js?sensor=true"></script-->
<!--script src="https://www.google.com/jsapi"></script-->
<script src="/eis/inc/js/plugin/hello.min.js"></script>
<script>

$(document).ready(function () {	
	/*if(google.loader.ClientLocation ){
		 alert( "country:"+ google.loader.ClientLocation.address.country+",longitude:"+google.loader.ClientLocation.longitude+", latitude:"+google.loader.ClientLocation.latitude);
		$("#lat").val(google.loader.ClientLocation.latitude);
		$("#lng").val(google.loader.ClientLocation.longitude);
		new GMaps({
			div: '#map',
			lat: google.loader.ClientLocation.latitude,
			lng: google.loader.ClientLocation.longitude
		});
	
	}else{
		alert("error");
	}*/
	/*hello.init({
		facebook : '771747726229394',
		//windows : '000000004403AD10'
	});
	hello.on('auth.login', function(auth){
		// call user information, for the given network
		hello( auth.network ).api( '/me' ).then( function(r){
			// Inject it into the container
			var label = document.getElementById( "profile_"+ auth.network );
			if(!label){
				label = document.createElement('div');
				label.id = "profile_"+auth.network;
				document.getElementById('profile').appendChild(label);
			}
			label.innerHTML = '<img src="'+ r.thumbnail +'" /> Hey '+r.name;
		});
	});*/
  	
  	//記住帳號
    $('#remember').change(function(){
        this.checked ? 
        $.cookie("loginusername",$("#username").val(), {expires:999, path: "/"}) : 
        $.removeCookie('loginusername', { path:'/' });
    });
    
});

$.get("/tis/Logout", null, null);
$.get("/stis/Logout", null, null);
$.get("/CIS/Logout.do", null, null);
$.get("/eis/Logout", null, null);
$.get("/sais/Logout", null, null);
$.get("/sris/Logout", null, null);
$.get("/eis/Logout", null, null);
$.get("/csis/Logout", null, null);
</script>
</head>
<body>

<!-- button onclick="hello('facebook').login()">windows</button-->

<!-- lat:<input type="text" id="lat" />lng:<input type="text" id="lng"-->
<div class="container">
	<div class="masthead">
	  <h3 class="muted">登入資訊系統</h3>
	</div>
    <hr>
    <div class="row-fluid table">
		<div class="span4">
			<div class="box">
			<form action="Login" method="post" class="form-signin">
				<ul class="nav nav-pills">
					<li class="active"><a href="#">資訊系統</a></li>
					<li><a href="http://www.cust.edu.tw">學校首頁</a></li>			
					<li><a href="http://www.cust.edu.tw">校園郵件</a></li>
				</ul>
				<div class="input-prepend">
					<span class="add-on">帳號 </span>
					<input type="text" name="username" id="username" value="${cookie['loginusername'].value}" class="span10" placeholder="學號或教職員身份證號">
				</div>
				<div class="input-prepend">
					<span class="add-on">密碼 </span> 
					<input type="password" class="span10" name="password" placeholder="密碼">
				</div>
				<label class="checkbox">
				<input type="checkbox" <c:if test="${cookie['loginusername'].value!=null}">checked</c:if> id="remember" value="remember"> 儲存登入資訊..
				</label> <input type="submit" id="login" name="method:login" value="登入" class="btn btn-danger"/>
				<a href="ReSetPassword">忘記密碼</a>
				<input type="hidden" name="ip" id="ip" />
				<input type="hidden" name="mac" id="mac" />
			</form>
			</div>
		</div>
		<div class="span4">
			<h2>學生登入方式</h2>
			<p>帳號為同學的學號</p>
			<p>密碼預設為同學的身分證字號</p>
			<p>當顯示無此帳號時，請檢查輸入的資料是否正確，英文字母不區分大小寫</p>
			<p>若仍顯示無此帳號時，請洽教務單位確認學籍資料</p>
		</div>
		<div class="span4">
			<h2>教職員登入方式</h2>
			<p>帳號預設為同仁身分證號，可在登入後立即修改帳號</p>
			<p>密碼預設為同仁生日，例如生日為88年8月18日，密碼即為880818</p>
			<p>當顯示無此帳號時，請檢查輸入的資料是否正確，英文字母不區分大小寫</p>
			<p>若仍顯示無此帳號時，請洽人事單位確認人事資料</p>
		</div>
	</div>
</div>
<script>
$.getJSON("http://192.192.230.35/services/pub/GetIp?callback=?", function (data) {
    //alert("Your ip: " + data.ip+", mac: "+data.mac);
    $("#ip").val(data.ip);
    $("#mac").val(data.mac);
});
</script>
</body>
</html>