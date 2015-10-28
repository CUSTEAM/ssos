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
                    <h3 class="panel-title">復原密碼</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="ReSetPassword" method="post" class="form-signin">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="學號或教職員帳號" name="idno" id="idno" value="${cookie['loginusername'].value}" autofocus>
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
        
        
        <div class="col-md-4">
        <h2>使用方式</h2>
			<p>身分證號欄位請輸入本校教職員或學生登記身份文件證號(身分證、居留證或其他文件)。</p>
			<p>出生日期欄位請輸入您的生日(例如出生日期為88年8月18日請輸入19990818)。</p>
			<p>執行成功後，<span class="label label-primary">教職員帳號為身分證號</span><span class="label label-success">學生帳號為學號</span>，密碼皆為出生日期(例如出生日期為88年8月18日密碼即為19990818)。</p>
			<p>教職員登入後可將預設帳號自行更改為其它文字</p>
        </div>
        <div class="col-md-4">
        <h2>注意事項</h2>
			<p>當顯示無此帳號時，請檢查輸入的資料是否正確。英文字母不區分大小寫。</p>
			<p>若仍顯示無此帳號時，同仁請洽人事單位，同學請洽教務單位確認。</p>
			<p>由於本校資訊安全規定，處理過程不顯示任何直接對應資料。</p>
        </div>
    </div>
</div>

<script>

$('.timepick').datepicker({
	dateFormat: "yymmdd",
	changeMonth: true,
	changeYear: true,
	//minDate: '@minDate',
	yearRange: "-100:-15"
	//showButtonPanel: true,
	//dateFormat: 'yy-MM-dd'
});
</script>
</body>
</html>