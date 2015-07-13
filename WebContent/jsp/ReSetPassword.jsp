<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.box {
	width: 300px;
	height: 300px;
	box-shadow: 1px 5px 5px #666;
	max-width: 300px;
	padding: 19px 29px 29px;
	background-color: #f8f8f8;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}
</style>
<script>
	$(document).ready(function() {

		$('#q1').popover("show");

		setTimeout(function() {
			$('#q1').popover("hide");
		}, 3000);

	});
</script>
<div class="container">

	<div class="masthead">
		<h3 class="muted">重設帳號密碼</h3>
	</div>
	<hr>
	<div class="row-fluid">
		<div class="span4">
			<div class="box">
				<form action="ReSetPassword" method="post" class="form-signin">

					<div class="input-prepend">
						<span class="add-on">身份證號 </span> <input type="text" name="idno" id="idno" placeholder="學生或教職員身分證號">
					</div>

					<div class="input-prepend">
						<span class="add-on">出生日期</span> <input type="password" name="birthday" id="birthday" placeholder="民國年月日">
					</div>

					<label class="checkbox"> </label> <input type="submit" name="method:reset" value="重設" class="btn btn-danger" />
					<input type="button" id="q1" rel="popover" title="說明" data-content="請閱讀使用方式與注意事項" data-placement="right" value="?" class="btn btn-warning" />
				</form>
			</div>
		</div>
		<div class="span4">
			<h2>使用方式</h2>
			<p>身份證號欄位請輸入本校教職員或學生之身分證號。</p>
			<p>出生日期欄位請輸入本校教職員或學生之出生日期。例如出生日期為88年8月18日，請輸入880818。</p>
			<p>完成後，教職員帳號將設為預設身分證號，密碼為出生日期，例如出生日期為88年8月18日，密碼即為880818。</p>
			<p>完成後，學生帳號將設為學號，密碼為身分證號。若不清楚學號請洽教務單位</p>
		</div>
		<div class="span4">
			<h2>注意事項</h2>
			<p>當顯示無此帳號時，請檢查輸入的資料是否正確。英文字母不區分大小寫</p>
			<p>若仍顯示無此帳號時，同仁請洽人事單位，同學請洽教務單位確認</p>
			<p>由於本校資訊安全規定，處理過程不顯示任何直接對應資料</p>
		</div>

	</div>

	<hr>

	<div class="footer">
		<p>&copy; 中華科技大學</p>
	</div>

</div>
<!-- /container -->