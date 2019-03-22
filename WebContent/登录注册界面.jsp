<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>登录</title>
	<link rel="stylesheet" href="css/auth.css">
</head>

<body>
	<div id="logn" class="lowin lowin-blue" style="display: block">
		<div class="lowin-brand">
			<img src="images/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">
					<form>
					  <p>请登录</p>
					  <div class="lowin-group">
					    <label>用户名</label>
					    <input type="text"  name="user_name" class="lowin-input" placeholder="user001">
						</div>
						<div class="lowin-group password-group">
						  <label>密码<a href="#" class="forgot-link">忘记密码?</a></label>
						  <input type="password" name="password" autocomplete="current-password" class="lowin-input" placeholder="•••••••••••" >
						</div>
						<button class="lowin-btn login-btn">
							登录
						</button>
						<div class="text-foot">
							新客户请： <a id="btn_lg"  style="cursor: pointer" class="register-link">注册</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="resgist" class="lowin lowin-blue"  style="display: none">
		
		<div class="lowin-brand">
			<img src="images/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-register">
				<div class="lowin-box-inner">
					<form>
						
						<p>请填写注册信息</p>
						<div class="lowin-group">
							<label>姓名</label>
							<input type="text" name="name" autocomplete="name" class="lowin-input"  placeholder="张三">
						</div>
						<div class="lowin-group">
							<label>用户名</label>
							<input type="text"  name="user_name" class="lowin-input" placeholder="user001">
						</div>
						<div class="lowin-group">
							<label>密码</label>
							<input type="password" name="user_password" autocomplete="current-password" class="lowin-input" placeholder="•••••••••••">
						</div>
						<div class="text-foot">
							已有账号？ <a id="btn_rg" style="cursor: pointer" class="register-link">返回</a>
						</div>
						<button class="lowin-btn">
							注册并登陆
						</button>
						
					</form>
				</div>
			</div>
		</div>	
	</div>
	<script type="text/javascript">

		//登录div的变量与注册div变量;
	var lg = document.getElementById("logn");
	var rg = document.getElementById("resgist");
	
		//注册按钮,返回按钮;
	var rg_btn = document.getElementById("btn_rg");
	var lg_btn = document.getElementById("btn_lg")
	//点击注册按钮跳转到注册界面；
	
	lg_btn.onclick=function(){	
		
			lg.style.display="none";
			rg.style.display="block";
	
	}	
	
	rg_btn.onclick=function(){
		
			rg.style.display="none";
			lg.style.display="block";
	}	
	
	</script>
	
</body>
</html>