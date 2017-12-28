<%@ page session="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>中華科技大學</title>

<script src="/eis/inc/js/plugin/jquery-ui.js"></script>
<script src="/eis/inc/js/plugin/jquery-ui-timepicker-addon/jquery-ui-timepicker-addon.min.js"></script>
<script src="/eis/inc/bootstrap/plugin/bootstrap-typeahead.js"></script>

<link href="/eis/inc/css/jquery-ui.css" rel="stylesheet"/>
<link href="/eis/inc/css/bootstrap-tree.css" rel="stylesheet"/>
<link href="/eis/inc/js/plugin/jquery-ui-timepicker-addon/jquery-ui-timepicker-addon.min.css" rel="stylesheet"/>
<script>
	$(document).ready(function() {

		$('#q1').popover("show");

		setTimeout(function() {
			$('#q1').popover("hide");
		}, 3000);

	});
</script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class=".col-md-3 .col-md-offset-4">
		  <div class="page-header">
		  <h1>中華科技大學 <small>資訊系統</small></h1>		  
		</div>
	</div>		
	</div>
    <div class="row">
    
        <div class="col-md-4">
        	<c:if test="${!empty msg.msg}"><div class="alert alert-warning">${msg.msg}</div></c:if>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">重設密碼</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="ReSetPassword" method="post" class="form-signin">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="身分證號" name="idno" id="idno" value="${cookie['loginusername'].value}" autofocus>
                            </div>
                            <div class="form-group">
                                <input class="form-control timepick" placeholder="生日" name="birthday" id="birthday" type="text" value="">
                            </div>
                            
                            
                  
                            <input type="submit" name="method:reset" value="重設" class="btn btn-danger" />
							<input type="button" id="q1" rel="popover" title="說明" data-content="請閱讀使用方式與注意事項" data-placement="right" value="?" class="btn btn-warning" />
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        
        
        <div class="col-md-8">
        
        
        <h2>操作方式 <small>請先閱讀下列說明後進行操作</small></h2>
        <dl class="dl-horizontal">		  	
			    <dt>身分證號欄位</dt>
			    <dd>請同學或同仁一律輸入身分證號</dd>		  	
			    <dt>生日欄位</dt>
			    <dd>請點選日曆或自行輸入(例如88年8月18日請輸入19990818)</dd>		  	
			    <dt>執行成功後</dt>
			    <dd>同學帳號為學號,同仁則為身分證號<br>密碼為西元出生日期(例如生日88年8月18日密碼為19990818)</dd>
			</a>
		</dl>
        
        
        <h2>常見問題 <small>操作過程中許多人容易發生的疑問</small></h2>
        <dl class="dl-horizontal">
        	<dt>操作過程複雜</dt>
			<dd>依據資訊安全規定,處理過程必需配合較複雜的輸入與比對,處理結果不可與最初預設值一致</dd>
        	<dt>操作無法順利完成</dt>
			<dd>請檢查輸入資料是否正確,英文字母不區分大小寫<br>若持續顯示無此帳號,同仁請洽人事單位,同學請洽教務單位確認</dd>
        	<dt>完成但仍無法登入</dt>
        	<dd>同學帳號為學號,同仁則為身分證號<br>密碼為西元出生日期(例如生日88年8月18日密碼為19990818)</dd>
        	<dt>紙本申請</dt>
        	<dd>填妥申請書 <a href="http://www.cust.edu.tw/cc/download/account.pdf" target="_blank" class ="btn btn-primary btn-small"><i class="i glyphicon glyphicon-floppy-disk"></i> pdf</a> 攜學生證或識別證至電算中心辦理</dd>
        	<dt>自定帳號失效</dt>
        	<dd>請在登入後更改帳號為其它文字</dd>
        </dl>
        </div>
        
        
			
    </div>
</div>

<script>

$('.timepick').datepicker({
	dateFormat: "yymmdd",
	changeMonth: true,
	changeYear: true,
	//minDate: '@minDate',
	yearRange: "-60:-16"
	//showButtonPanel: true,
	//dateFormat: 'yy-MM-dd'
});
</script>
</body>
</html>