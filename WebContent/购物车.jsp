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
  
  <!-- PLUGINS CSS STYLE -->

  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body class="body-wrapper">

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index.html">
						<img src="images/logo.png" alt="">
					</a>
					
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						<ul class="navbar-nav ml-auto mt-10">
							<li class="nav-item">
								<a class="nav-link login-button" href="主页.html">返回</a>
							</li>
							<li class="nav-item">
								<a class="nav-link add-button" href="我的订单.html"><i class="fa fa-plus-circle"></i> 我的订单</a>
							</li>
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
			<div class="col-md-10 offset-md-1 col-lg-4 offset-lg-0">
				<div class="sidebar">
					<!-- User Widget -->
					<div class="widget user-dashboard-profile">
						<!-- User Image -->
						<div class="profile-thumb">
							<img src="images/user/user-thumb.jpg" alt="" class="rounded-circle">
						</div>
						<!-- User Name -->
						<h5 class="text-center">user 001</h5>
						<p>Joined February 06, 2017</p>
						<p>Edit Profile</p>
					</div>
								</div>
				
				<div class="widget user-dashboard-profile">
					
					<a> 结账</a>
					
					</div>
			</div>
			<div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<h3 class="widget-header">购物车</h3>
					<table class="table table-responsive product-dashboard-table">
						<thead>
							<tr>
								<th>图片</th>
								<th>描述</th>
								<th>价格</th>
								<th>选项</th>	
								<th>勾选</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								<td class="product-thumb">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title">斗罗大陆</h3>
									<span class="add-id"><strong>Book ID:</strong> ISBN-9603</span>
									<span><strong>Posted on: </strong> 2019.12.1 </span>
									<span class="status active"><strong>Status</strong>Active</span>
									<span class="location"><strong>Location</strong>广州,上海</span>
								</td>
								<td class="product-category"><span class="categories">Laptops</span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
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
								<td class="product-category"><input name="checkbox_1" type="checkbox" checked="value"></td>
								
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
								<td class="product-category"><span class="categories">Laptops</span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
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
								<td class="product-category"><span class="categories">Laptops</span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
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
								<td class="product-category"><span class="categories">Laptops</span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
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
								<td class="product-category"><span class="categories">Laptops</span></td>
								<td class="action" data-title="Action">
									<div class="">
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a data-toggle="tooltip" data-placement="top" title="Tooltip on top" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>		
											</li>
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
            <p>制作团队：</p>
          </div>
        </div>
        <div class="col-sm-6 col-12">
          <!-- Social Icons -->
          <ul class="social-media-icons text-right">
              <li></li>
              <li></li>
              <li></li>
              <li></li>
            </ul>
        </div>
      </div>
    </div>
  
</footer>

 
</body>

</html>