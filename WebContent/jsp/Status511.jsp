<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

body {
  width:100%;
  height:100%;
  background:#48A9E6;
  font-family:Microsoft JhengHei, Raleway, sans-serif;
  font-weight:300;
  margin:0;
  padding:0;
	overflow-x:hidden;
	overflow-y:hidden;
}

a.button {
  font: bold 1em/1.5em sans-serif;
  text-decoration: none;
  color: white;
  padding: 0.5em 1em;
  background: #b8c6df; /* old browsers */
  background: -moz-linear-gradient(top, #b8c6df 0%, #6d88b7 100%); /* firefox */
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#b8c6df), color-stop(100%,#6d88b7)); /* webkit */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b8c6df', endColorstr='#6d88b7',GradientType=0 ); /* ie */
  zoom: 1;
  border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  -box-shadow: 0 1px 3px  rgba(0,0,0,0.5);
  -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
  -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
  text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
}
a.button:hover {
  background: #d8e6ff; /* old browsers */
  background: -moz-linear-gradient(top, #d8e6ff 0%, #8da8d7 100%); /* firefox */
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#d8e6ff), color-stop(100%,#8da8d7)); /* webkit */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d8e6ff', endColorstr='#8da8d7',GradientType=0 ); /* ie */
}

#title {
  text-align:center;
  font-size:40px;
  margin-top:40px;
  margin-bottom:-40px;
  position:relative;
  color:#fff;
}

.circles:after {
  content:'';
  display:inline-block;
  width:100%;
  height:100px;
  background:#fff;
  position:absolute;
  top:-50px;
  left:0;
  transform:skewY(-4deg);
  -webkit-transform:skewY(-4deg);
}

.circles { 
	background:#fff;
	text-align: center;
	position: relative;
  margin-top:-60px;
  box-shadow:inset -1px -4px 4px rgba(0,0,0,0.2);
}

.circles p {
	font-size: 240px;
	color: #fff;
	padding-top: 60px;
	position: relative;
  z-index: 9;
  line-height: 100%;
}

.circles p small { 
  font-size: 40px; 
  line-height: 100%; 
  vertical-align: top;   
}

.circles .circle.small {
	width: 140px;
	height: 140px;
	border-radius: 50%;
	background: #48A9E6;
	position: absolute;
	z-index: 1;
	top: 80px;
	left: 50%;
	animation: 7s smallmove infinite cubic-bezier(1,.22,.71,.98);	
	-webkit-animation: 7s smallmove infinite cubic-bezier(1,.22,.71,.98);
	animation-delay: 1.2s;
	-webkit-animation-delay: 1.2s;
}

.circles .circle.med {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	background: #48A9E6;
	position: absolute;
	z-index: 1;
	top: 0;
	left: 10%;
	animation: 7s medmove infinite cubic-bezier(.32,.04,.15,.75);	
	-webkit-animation: 7s medmove infinite cubic-bezier(.32,.04,.15,.75);
	animation-delay: 0.4s;
	-webkit-animation-delay: 0.4s;
}

.circles .circle.big {
	width: 400px;
	height: 400px;
	border-radius: 50%;
	background: #48A9E6;
	position: absolute;
	z-index: 1;
	top: 200px;
	right: 0;
	animation: 8s bigmove infinite;	
	-webkit-animation: 8s bigmove infinite;
	animation-delay: 3s;
	-webkit-animation-delay: 1s;
}

@-webkit-keyframes smallmove {
	0% { top: 10px; left: 45%; opacity: 1; }
	25% { top: 300px; left: 40%; opacity:0.7; }
	50% { top: 240px; left: 55%; opacity:0.4; }
	75% { top: 100px; left: 40%;  opacity:0.6; }
	100% { top: 10px; left: 45%; opacity: 1; }
}
@keyframes smallmove {
	0% { top: 10px; left: 45%; opacity: 1; }
	25% { top: 300px; left: 40%; opacity:0.7; }
	50% { top: 240px; left: 55%; opacity:0.4; }
	75% { top: 100px; left: 40%;  opacity:0.6; }
	100% { top: 10px; left: 45%; opacity: 1; }
}

@-webkit-keyframes medmove {
	0% { top: 0px; left: 20%; opacity: 1; }
	25% { top: 300px; left: 80%; opacity:0.7; }
	50% { top: 240px; left: 55%; opacity:0.4; }
	75% { top: 100px; left: 40%;  opacity:0.6; }
	100% { top: 0px; left: 20%; opacity: 1; }
}

@keyframes medmove {
	0% { top: 0px; left: 20%; opacity: 1; }
	25% { top: 300px; left: 80%; opacity:0.7; }
	50% { top: 240px; left: 55%; opacity:0.4; }
	75% { top: 100px; left: 40%;  opacity:0.6; }
	100% { top: 0px; left: 20%; opacity: 1; }
}

@-webkit-keyframes bigmove {
	0% { top: 0px; right: 4%; opacity: 0.5; }
	25% { top: 100px; right: 40%; opacity:0.4; }
	50% { top: 240px; right: 45%; opacity:0.8; }
	75% { top: 100px; right: 35%;  opacity:0.6; }
	100% { top: 0px; right: 4%; opacity: 0.5; }
}
@keyframes bigmove {
	0% { top: 0px; right: 4%; opacity: 0.5; }
	25% { top: 100px; right: 40%; opacity:0.4; }
	50% { top: 240px; right: 45%; opacity:0.8; }
	75% { top: 100px; right: 35%;  opacity:0.6; }
	100% { top: 0px; right: 4%; opacity: 0.5; }
}
</style>
<script src="/eis/inc/js/jquery.js"></script>
<script src="/eis/inc/js/plugin/jquery.blockUI.js"></script>
<%   String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
        %>
<script>
$(document).ready(function(){
	$.blockUI({ 
		message: "記錄",
		centerY: 0, 
        css: { 
        	//text-align:'right',
        	top: '10px', 
        	left: '', 
        	right: '10px',
        	border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff'
        }
	}); 
	$.getJSON('http://gd.geobytes.com/GetCityDetails?callback=?', function(d){	
		//ipin=JSON.stringify(d, null, 2);	
		$(".blockMsg").html("<ul style='text-align:left;'><li>讀取檔頭顯示IP:<%=ip%></li><li>確保網路設備屏蔽IP, 轉第三方驗證</li><li>第三方驗證代理伺服器IP:"+
		d.geobytesipaddress+"</li><li>第三方驗證遠端使用者IP:"+d.geobytesremoteip+"</li><li>異常存取已記錄, 10秒後解除鎖定</li></ul>");
		$.ajax({
				type:"GET",
				url:"/ssos/whoIs",
			    data:{
			    	ipaddress:d.geobytesipaddress,
			    	remoteaddress:d.geobytesremoteip
			    },		  
		})
		
		setTimeout(function(){
			$.unblockUI(); 
		}, 15000);		
	});
});
</script>
</head>
<body>
<section id="not-found">
	<div id="title"><b>未登入或重複登入 &bull; 請停止存取內容</b><p><a class="btn" href="/ssos/">系統首頁</a></p></div>
	<div class="circles">
		<p>511<br> <small>權限不足</small></p>		
		<span class="circle big"></span> <span class="circle med"></span> <span class="circle small"></span>
	</div>
</section>
</body>
</html>