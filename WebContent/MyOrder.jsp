<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>我的订单</title>
  


  <!-- Bootstrap -->
  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

	
	<style type="text/css">
	
		.a{ 
		width: 205px; 
			position: relative;
	} 
	
	.c{ 
		width: 300px;
		height: 150px;
		background-color: skyblue;
		display: none; 
        z-index: -1;
	   } 
	
	.a:hover
	{ 
		cursor: pointer; 
	} 
	.a:hover .c
	{ 
		display: block; 
	} 
	
	</style>

</head>

<body class="body-wrapper">

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index.jsp">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						<ul class="navbar-nav ml-auto mt-10">
							<a  href="HomePage.jsp" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;"  >返回</a>
						
							
							     &nbsp;
					  
								<a href="ShoppingCart.jsp" style="background-color: burlywood; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;" >购物车</a>
						</ul>
						</div>
					</nav>
					</div>	
		</div>	
	</div>
</section>
<!--==================================
=            User Profile            =
===================================-->
<section class="dashboard section">
	
	<div class="container">
		<!-- Row Start -->
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-4 offset-lg-0" style="display: block" id="uuuuu">
				<div class="sidebar">
					<!-- User Widget -->
					<div class="widget user-dashboard-profile">
						<!-- User Image -->
						<div class="profile-thumb">
							<img src="images/user/user-thumb.jpg" alt="" class="rounded-circle">
						</div>
						<!-- User Name -->
						<h5 class="text-center" id = "user_name">唐家三少</h5>
					
					</div>
				</div>
				
				<div class="widget user">
                        <h4>详细信息</h4>
					    <hr><br>
						<p class="member-time">I  D ：<a   id ="user_id"> yhhbbgr</a></p>
					    <hr><br>
						<p class="member-time">地址 ：<a id = "user_address"> 北京 </a></p>
					    <hr><br>
					    <p class="member-time">生日 ：<a id = "user_birthary" >1990-10-10</a></p>
					    <hr><br>
					</div>
				
				<div class="widget disclaimer">
						<h4>其他信息</h4>
						<hr><br>
						<p class="member-time" >成交订单数 ：<a id = "user_orders"> 20  </a></p>
					    <hr><br>
						<p class="member-time" >购物车总数 ：<a id = "user_products"> 10 </a></p>
					    <hr><br> 
						<p class="member-time" >兴趣爱好 ： <a id = "user_hobbies"> 打篮球 </a></p>
					    <hr><br>
					</div>
				
				<div class="widget coupon text-center">
						
						<p>请点击按钮修改信息
						</p>
					
						<button class="btn btn-transparent-white" id="btn_ud">修改信息</button>
					</div>	
			</div>
			
						<div class="col-md-10 offset-md-1 col-lg-4 offset-lg-0" style="display: none" id="modify" >
				<div class="sidebar">
					<!-- User Widget -->
					<div class="widget user-dashboard-profile">
						<!-- User Image -->
						<div class="profile-thumb">
							<img src="images/user/user-thumb.jpg" alt="" class="rounded-circle">
						</div>
						
						<h5 class="text-center">图片:<input  id="modify_image"></h5>
						<!-- User Name -->
						<h5 class="text-center">用户名:<input  type="text" id="modify_name"></h5>
					
					</div>
				</div>
				
				<div class="widget user">
                        <h4>详细信息</h4>
					    <hr><br>
						<p class="member-time">I  D ： <input type="text"  id="modify_id"></p>
					    <hr><br>
						<p class="member-time">地址 ：  <input type="text" id = "modify_address"></p>
					    <hr><br>
					    <p class="member-time">生日 ：  <input type="date" id = "modify_birthday"></p>
					    <hr><br>
					</div>
				
				<div class="widget disclaimer">
						<h4>其他信息</h4>
						<hr><br>
						<p class="member-time">成交订单数 ：<input type="text" id = "modify_orders" ></p>
					    <hr><br>
						<p class="member-time">购物车总数 ：<input type="text" id = "modify_products"></p>
					    <hr><br> 
						<p class="member-time">兴趣爱好 ： <input type="text" id = "modify_hobbies"></p>
					    <hr><br>
					</div>
				
				<div class="widget coupon text-center">
						
						<p>请点击按钮确认修改
						</p>
					
						<button class="btn btn-transparent-white" id="btn_mf">提交</button>
					</div>
					
				
				
			</div>
			<div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<h3 class="widget-header">我的订单</h3>
					<table class="table table-responsive product-dashboard-table">
						<thead>
							<tr>
								<th>图片</th>
								<th>信息</th>
								<th >价钱</th>
								<th >数量</th>
								<th class="text-right">选项</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">Macbook Pro 15inch</h3>
									<span class="add-id"><strong>Ad ID:</strong> ng3D5hAMHPajQrM</span>
									<span><strong>Posted on: </strong><time>Jun 27, 2017</time> </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>Dhaka,Bangladesh</span>
								</td>
								<td class="product-category"><span class="categories">￥：52</span></td>
								<td class="product-category"><span class="categories">2</span></td>
								<td class="action" data-title="Action">
									<div class="text-right">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item a">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>
												
												<div class="c"> 
                                              <ul class="text-left">
											  <li>订单编号：<a>6003254646</a></li>
                                              <li>订单状态：<a>已付款</a></li>
											  <li>快递单号：<a>3302564698</a></li> 
											  <li>下单日期：<a style="width: 100px; font: 40px">2018-12-12</a></li> 
												</ul> 
										</div> 		
											</li>
										
										
												
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-2.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">Study Table Combo</h3>
									<span class="add-id"><strong>Ad ID:</strong> ng3D5hAMHPajQrM</span>
									<span><strong>Posted on: </strong><time>Feb 12, 2017</time> </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>USA</span>
								</td>
									<td class="product-category"><span class="categories">￥：52</span></td>
								<td class="product-category"><span class="categories">2</span></td>
								<td class="action" data-title="Action">
									<div class="text-right">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
											
											
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-3.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">Macbook Pro 15inch</h3>
									<span class="add-id"><strong>Ad ID:</strong> ng3D5hAMHPajQrM</span>
									<span><strong>Posted on: </strong><time>Jun 27, 2017</time> </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>Dhaka,Bangladesh</span>
								</td>
									<td class="product-category"><span class="categories">￥：52</span></td>
								<td class="product-category"><span class="categories">2</span></td>
								<td class="action" data-title="Action">
									<div class="text-right">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
											
											
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-4.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">Macbook Pro 15inch</h3>
									<span class="add-id"><strong>Ad ID:</strong> ng3D5hAMHPajQrM</span>
									<span><strong>Posted on: </strong><time>Jun 27, 2017</time> </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>Dhaka,Bangladesh</span>
								</td>
									<td class="product-category"><span class="categories">￥：52</span></td>
								<td class="product-category"><span class="categories">2</span></td>
								<td class="action" data-title="Action">
									<div class="text-right">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
											
											
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">Macbook Pro 15inch</h3>
									<span class="add-id"><strong>Ad ID:</strong> ng3D5hAMHPajQrM</span>
									<span><strong>Posted on: </strong><time>Jun 27, 2017</time> </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>Dhaka,Bangladesh</span>
								</td>
									<td class="product-category"><span class="categories">￥：52</span></td>
								<td class="product-category"><span class="categories">2</span></td>
								<td class="action" data-title="Action">
									<div class="text-right">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>

										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
		<!-- Row End -->
	</div>
		
	<!-- Container End -->
</section>

<footer class="footer-bottom">
    <!-- Container Start -->
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-12">
          <!-- Copyright -->
          <div class="copyright">
            <p>制作团队：  郭榕 邓家豪 何俊霖 梁卓越</p>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <!-- Social Icons -->
          <ul class="social-media-icons text-right">
			  
              <li><a class="fa fa-apple"></a></li>
              <li><a class="fa fa-wechat"></a></li>
              <li><a class="fa fa-qq"></a></li>
              <li><a class="fa fa-weibo"></a></li>
			  
			  
            </ul>
        </div>
      </div>
    </div>

</footer>

	<script type="text/javascript">
	
		//更新的信息界面
	    var ud = document.getElementById("uuuuu");
		//需要输入修改的信息界面
		var mf = document.getElementById("modify");
	
		//修改信息的按钮和确认修改的按钮;
		var btn1 = document.getElementById("btn_ud");
		var btn2 = document.getElementById("btn_mf");
	
	    //原始界面各参数的变量
		var u_name =document.getElementById("user_name");
		var u_id   =document.getElementById("user_id");
		var u_address =document.getElementById("user_address");
		var u_birthday =document.getElementById("user_birthary");
		var u_orders  =document.getElementById("user_orders");
		var u_products =document.getElementById("user_products");
		var u_hobbies =document.getElementById("user_hobbies");
	
		//修改界面的各参数的变量
		
		var m_name =document.getElementById("modify_name");
		var m_id   =document.getElementById("modify_id");
		var m_address =document.getElementById("modify_address");
		var m_birthday =document.getElementById("modify_birthday");
		var m_orders  =document.getElementById("modify_orders");
		var m_products =document.getElementById("modify_products");
		var m_hobbies =document.getElementById("modify_hobbies");
		
		
		
		btn1.onclick=function(){
		
			m_name.value = u_name.innerHTML;
			
			m_id.value   = u_id.innerHTML;
			
			m_address.value =  u_address.innerHTML;
			
			m_birthday.value   = u_birthday.innerHTML;
			
			m_orders.value   = u_orders.innerHTML;
			
			m_products.value   = u_products.innerHTML;
			
			m_hobbies.value   = u_hobbies.innerHTML;
			
			mf.style.display="block";
			ud.style.display="none";
		}
		
		btn2.onclick=function(){
			
			
			 u_name.innerHTML = m_name.value ;
			
			    u_id.innerHTML = m_id.value;
			
			  u_address.innerHTML = m_address.value ;
			
			  u_birthday.innerHTML   =  m_birthday.value;
			
			    u_orders.innerHTML = m_orders.value ;
			
			    u_products.innerHTML = m_products.value;
			
			    u_hobbies.innerHTML = m_hobbies.value;
			
			
			
			
			ud.style.display="block";
			mf.style.display="none";
			
			
		}
	</script>

</body>

</html>