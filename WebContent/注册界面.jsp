<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>注册</title>
	<link rel="stylesheet" href="css/auth.css">
</head>

<body>
	<div class="lowin lowin-blue">
		
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
						<button class="lowin-btn">
							注册并登陆
						</button>
						
					</form>
				</div>
			</div>
		</div>	
	</div>

</body>
</html>