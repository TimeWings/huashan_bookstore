<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>单个商品</title>
  

  
  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

  <link href="css/style.css" rel="stylesheet">

  <link href="img/favicon.png" rel="shortcut icon">
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
							<a  href="主页.html" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;"  >返回</a>
							
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>
<!--===================================
=            Store Section            =
====================================-->
<section class="section bg-gray">
	
	<div class="container">
		<div class="row">
			
			<div class="col-md-8">
				<div class="product-details">
					<h1 class="product-title">斗罗大陆</h1>
					<div class="product-meta">
						<ul class="list-inline">
							<li class="list-inline-item"><i class="fa fa-user-o"></i> 作者 <a href="">唐家三少</a></li>
							<li class="list-inline-item"><i class="fa fa-folder-open-o"></i> 类型 <a href="">玄幻小说</a></li>
							<li class="list-inline-item"><i class="fa fa-location-arrow"></i> 出版社 <a href="">湖南图书出版社</a></li>
						</ul>
					</div>
					<div id="carouselExampleIndicators" class="product-slider carousel slide" data-ride="carousel">
						
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="images/products/products-1.jpg" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/products/products-2.jpg" alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="images/products/products-3.jpg" alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<div class="content">
						<ul class="nav nav-pills  justify-content-center" id="pills-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">商品细节</a>
							</li>
							
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
								<h3 class="tab-title">商品描述</h3>
								<p>唐门外门弟子唐三，因偷学内门绝学为唐门所不容，跳崖明志时却发现没有死，反而以另外一个身份来到了另一个世界，一个属于武魂的世界，名叫斗罗大陆。这里没有魔法，没有斗气，没有武术，却有神奇的武魂。这里的每个人，在自己六岁的时候，都会在武魂殿中令武魂觉醒。武魂有动物，有植物，有器物，武魂可以辅助人们的日常生活。而其中一些特别出色的武魂却可以用来修炼并进行战斗，这个职业，是斗罗大陆上最为强大也是最荣耀的职业“魂师”。
小小的唐三在圣魂村开始了他的魂师修炼之路，并萌生了振兴唐门的梦想。当唐门暗器来到斗罗大陆，当唐三武魂觉醒，他能否在这片武魂的世界再铸唐门的辉煌？</p>

						
</div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="sidebar">
					<div class="widget price text-center">
						<h4>Price</h4>
						<p>$230</p>
					</div>
					<!-- User Profile widget -->
					<div class="widget user">
                       <h4><a href="">书本参数:</a></h4>
						<br>
						<p class="member-time">书名：</p>
						<hr><br>
						<p class="member-time">作者：</p>
						<hr><br>
						<p class="member-time">类型：</p>
						<hr><br>
						<p class="member-time">ISBN：</p>
						<hr><br>
						<p class="member-time">出版社：</p>
						
						
					</div>
				
					<div class="widget coupon text-center">
						
						<a href="" class="btn btn-transparent-white">加入购物车</a>
					</div>
					
				</div>
			</div>
			
		</div>
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

</body>

</html>