<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>购物车</title>
  

  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">


  <style type="text/css">
	  .weidget{
		  width: 100%;
		  height: 100%;
	  }
	  	  </style>
	
		<script type="text/javascript">
			
		
			function show(state1,state2,state3){
				
				var count = document.getElementById(state3);
				
				var x = parseInt(count.innerHTML);
				
				var pri = document.getElementById(state2);
				
				if(x>0)
				var p = parseFloat(pri.innerHTML)/x;
				
				
				if(state1=="sub"){
					if(x<=0){
						count.innerHTML="0";
						pri.innerHTML="0";
					}else{
						x--;
						count.innerHTML = x;
						p=p*x;
						pri.innerHTML=p.toString();
					}
				}else if(state1=="sum"){
					if(x==0)
						{
						  count.innerHTML="1";
							pri.innerHTML="26";
						}
					else{
					x++;
					count.innerHTML=x;
					p=p*x;
					pri.innerHTML=p.toString();
					}
				}	
			}
		</script>
</head>

<body class="body-wrapper">

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index.html">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
					
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						<ul class="navbar-nav ml-auto mt-10">
							
								<a  href="主页.html" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;"  >返回</a>
							
							
							     &nbsp;
					  
								<a href="我的订单.html" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;" >我的订单</a>
							
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
	<!-- Container Start -->
	<div class="container">
		<!-- Row Start -->
		<div class="row">
			
			<div class="weidget">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<h3 class="widget-header">用户XXX的购物车</h3>
					<table class="table table-responsive product-dashboard-table">
						<thead>
							<tr>
								<th>数量</th>
								<th class="text-center">图片</th>
								<th>描述</th>
								<th>价格</th>
								<th>选项</th>	
								<th class="text-center">勾选</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="gw_num text-center"><a class="jian" href="javascript:void(0)"  onClick="show('sub','price_1','num_1')">-</a> <span id="num_1">1</span> <a class="add" href="javascript:void(0)" onClick="show('sum','price_1','num_1')">+</a></div>									
								</td>
								<td class="product-details text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"> ISBN-9603 </span>
									<span> 2019.12.1 </span>
									<span class="status active">唐家三少</span>
									<span class="location">北京师范大学出版社</span>
								</td>
								<td><span class="categories"><a>￥：</a><b id="price_1">26</b><c> 元</c></span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item">
												<a class="edit" href="">
													<i class="fa fa-pencil"></i>
												</a>		
											</li>
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
										</ul>
									</div>
								</td>
								<td class="counts text-center"><input class="checkbox" name="checkbox_1" type="checkbox" checked="value"></td>
								
							</tr>
							<tr>
								<td>
									<div class="gw_num text-center"><a class="jian" href="javascript:void(0)" onClick="show('sub','price_2','num_2')">-</a> <span id="num_2">1</span> <a class="add" href="javascript:void(0)"  onClick="show('sum','price_2','num_2')">+</a></div>									
								</td>
								<td class="product-thumb text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"> ISBN-9603 </span>
									<span> 2019.12.1 </span>
									<span class="status active">唐家三少</span>
									<span class="location">北京师范大学出版社</span>
								</td>
								<td class="product-category"><a>￥：</a><b id="price_2">26</b><c> 元</c></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item">
												<a class="edit" href="">
													<i class="fa fa-pencil"></i>
												</a>		
											</li>
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
										</ul>
									</div>
								</td>
								<td class="counts text-center"><input class="checkbox" name="checkbox_2" type="checkbox" checked="value"></td>
								
							</tr>
							<tr>
								<td>
									<div class="gw_num text-center"><a class="jian" href="javascript:void(0)"  onClick="show('sub','price_3','num_3')">-</a> <span id="num_3">1</span> <a class="add" href="javascript:void(0)" onClick="show('sum','price_3','num_3')">+</a></div>									
								</td>
								<td class="product-thumb text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"> ISBN-9603 </span>
									<span> 2019.12.1 </span>
									<span class="status active">唐家三少</span>
									<span class="location">北京师范大学出版社</span>
								</td>
								<td class="product-category"><a>￥：</a><b id="price_3">26</b><c> 元</c></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item">
												<a class="edit" href="">
													<i class="fa fa-pencil"></i>
												</a>		
											</li>
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
										</ul>
									</div>
								</td>
								<td class="counts text-center"><input class="checkbox" name="checkbox_3" type="checkbox" checked="value"></td>
								
							</tr>
							<tr>
								<td>
									<div class="gw_num text-center"><a class="jian" href="javascript:void(0)" onClick="show('sub','price_4','num_4')">-</a> <span id="num_4">1</span> <a class="add" href="javascript:void(0)" onClick="show('sum','price_4','num_4')">+</a></div>									
								</td>
								<td class="product-thumb text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"> ISBN-9603 </span>
									<span> 2019.12.1 </span>
									<span class="status active">唐家三少</span>
									<span class="location">北京师范大学出版社</span>
								</td>
								<td class="product-category"><a>￥：</a><b id="price_4">26</b><c> 元</c></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item">
												<a class="edit" href="">
													<i class="fa fa-pencil"></i>
												</a>		
											</li>
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
										</ul>
									</div>
								</td>
							<td class="counts text-center"><input class="checkbox" name="checkbox_4" type="checkbox" checked="value"></td>
								
							</tr>
							<tr>
								<td>
									<div class="gw_num text-center"><a class="jian" href="javascript:void(0)" onClick="show('sub','price_5','num_5')">-</a> <span id="num_5">1</span> <a class="add" href="javascript:void(0)" onClick="show('sum','price_5','num_5')">+</a></div>									
								</td>
								<td class="product-thumb text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"> ISBN-9603 </span>
									<span> 2019.12.1 </span>
									<span class="status active">唐家三少</span>
									<span class="location">北京师范大学出版社</span>
								</td>
								<td class="product-category"><a>￥：</a><b id="price_5">26</b><c> 元</c></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											
											<li class="list-inline-item">
												<a class="edit" href="">
													<i class="fa fa-pencil"></i>
												</a>		
											</li>
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
										</ul>
									</div>
								</td>
							<td class="counts text-center"><input class="checkbox" name="checkbox_5" type="checkbox" checked="value"></td>
								
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
		<!-- Row End -->
	</div>
	
	
	<div class="topD">
						<div class="topf text-center">
							
							<p style="font-size:20px"><a>合计:<b>162</b>元</a></p>
							</div>
						<hr>
						<div class="topg text-center" >
							<a href="我的订单.html" style="background-color: darkseagreen; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;" >结账</a>
							</div>
						
						
						
					</div>
</section>
<!--============================
=            Footer            =
=============================-->
<!-- Footer Bottom -->
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

 
</body>

</html>