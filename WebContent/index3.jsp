<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="org.huashan.database.DataBase"%>
<%@ page import="org.huashan.entity.Commodity"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>书店</title>


<!-- Bootstrap -->
<link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">

<!-- 导航   -->
<link href="css/dh.css" rel="stylesheet">


<style>
#main {
	width: 1000px;
	float: inherit;
	padding: 5px 0;
}
	
	
	.topdenglu{
		background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
		
	}
	
	.toporder{
		background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
	}
	
	.topcrat{
		background-color: burlywood; border: none;  color: white;  padding: 4px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 15px; border-radius: 15px;
	}
</style>

</head>
<c:if test="${data==null }">
	<%
		DataBase database = DataBase.getInstance();
			List<Commodity> data = database.getAllCommodities();
			List<Commodity> data2 = database.getAllCommoditiesOrderBySales();
			session.setAttribute("data", data);
			session.setAttribute("data2", data2);
			request.getRequestDispatcher("index3.jsp").forward(request, response);
	%>
</c:if>
<body class="body-wrapper">

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg  navigation">
						<a class="navbar-brand" href="index.jsp">
							<img src="images/logo.png" alt="" width="200" height="50">
						</a>

						<div class="topC">

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">教&nbsp;&nbsp;育</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="单个分类.jsp">计算机类 </a>
									</p>
									<p>
										<a href="#">数学类</a>
									</p>
									<p>
										<a href="#">英语类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">文&nbsp;&nbsp;化</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="#">哲学类</a>
									</p>
									<p>
										<a href="#">历史类</a>
									</p>
									<p>
										<a href="#">宗教类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">日常生活</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="#">旅游类</a>
									</p>
									<p>
										<a href="#">美食类</a>
									</p>
									<p>
										<a href="#">运动类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">文&nbsp;&nbsp;艺</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="#">传记类</a>
									</p>
									<p>
										<a href="#">小说类</a>
									</p>
									<p>
										<a href="#">青春文学</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">科&nbsp;&nbsp;学</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="#">航空航天</a>
									</p>
									<p>
										<a href="#">自然科学</a>
									</p>
									<p>
										<a href="#">海底世界</a>
									</p>
								</div>

							</div>
						</div>

						<div class="topD">
							<div class="topf text-center">

								<c:if test="${empty user }">
									<a href="loginAndregister.jsp" target="_parent" class="topdenglu">
										<%="登录"%>
									</a>
								</c:if>
								<c:if test="${not empty user }">
  		欢迎你：${user.username } <a href="LoginOut.do">注销</a>
								</c:if>	

							</div>

							<div class="topg text-center">
								<a href="MyOrder.jsp" class="toporder">订单</a>
							</div>

							<div class="toph text-center">

								<a href="cart.jsp" class="topcrat">
									购物车
								</a>

							</div>

						</div>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<!--===============================
=            Hero Area            =
================================-->

	<section class="hero-area bg-1 text-center overly">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- Header Contetnt -->
					<div class="content-block">
						<h1>华山书店</h1>
						<p>本店隆重开张......一律9.99折</p>
						<div class="short-popular-category-list text-center">
							<h2>致力于超越咸鱼二手市场，英语四级读物5块钱一本！！！</h2>
						</div>

					</div>
					<!-- Advance Search -->
					<div class="advance-search">
						<form action="#">
							<div class="row" id="main">
								<!-- Store Search -->

								<div class="ctbox">
									<div class="block d-flex" style="vertical-align: middel">
										<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="search" placeholder="请输入关键字">

										<button class="btn btn-main">搜索</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Container End -->
	</section>

	<!--===================================
=            Client Slider            =
====================================-->


	<!--===========================================
=            Popular deals section            =
============================================-->
	<section class="popular-deals section bg-gray ">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title">
						<h2>新书介绍</h2>

					</div>
				</div>
			</div>
			<div class="row" style="opacity: 0.8">
				<%
					List<Commodity> d = (List) session.getAttribute("data");
					for (int i = 0; i < 6; i++) {
				%>
				<!-- offer 01 -->
				<div class="col-sm-12 col-lg-4">

					<div class="product-item bg-light">
						<div class="card">
							<div class="thumb-content">

								<a href="onebook.jsp?id=<%=d.get(i).id%>">
									<img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap">
								</a>
							</div>


							<div class="card-body">

								<h4 class="card-title">
									<a><%String name = d.get(i).name; %>
								<%=name.length()>30?name.substring(0, 30)+"..." :name%></a>
								</h4>
								<ul class="list-inline product-meta">
									<li class="list-inline-item">
										<a>
											<em class="fa fa-id-card "></em>
											<%=d.get(i).ISBN%>
										</a>
									</li>
									<li class="list-inline-item">
										<a>
											<em class="fa fa-calendar"></em>
											<%=d.get(i).publisher%>
										</a>
									</li>
								</ul>
								<p class="card-text"><%String description = d.get(i).description; %>
								<%=description.length()>50?description.substring(0, 50)+"..." :description%></p>
								<hr>
								<div class="product-ratings">
									<ul class="list-inline">
										<li class="list-inline-item selected">
											<a>评价：</a>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item">
											<i class="fa fa-star"></i>
										</li>
									</ul>
								</div>
								<p>￥：<%=d.get(i).price%>元</p>
							</div>


						</div>
					</div>



				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<section class="popular-deals section bg-gray ">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title">
						<h2>热卖图书</h2>

					</div>
				</div>
			</div>
			<div class="row" style="opacity: 0.8">
				<%
					List<Commodity> d2 = (List) session.getAttribute("data2");
					for (int i = 0; i < 6; i++) {
				%>
				<!-- offer 01 -->
				<div class="col-sm-12 col-lg-4">

					<div class="product-item bg-light">
						<div class="card">
							<div class="thumb-content">

								<a href="onebook.jsp?id=<%=d2.get(i).id%>">
									<img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap">
								</a>
							</div>


							<div class="card-body">

								<h4 class="card-title">
									<a><%String name = d2.get(i).name; %>
								<%=name.length()>30?name.substring(0, 30)+"..." :name%></a>
								</h4>
								<ul class="list-inline product-meta">
									<li class="list-inline-item">
										<a>
											<em class="fa fa-id-card "></em>
											<%=d2.get(i).ISBN%>
										</a>
									</li>
									<li class="list-inline-item">
										<a>
											<em class="fa fa-calendar"></em>
											<%=d2.get(i).publisher%>
										</a>
									</li>
								</ul>
								<p class="card-text"><%String description = d2.get(i).description; %>
								<%=description.length()>50?description.substring(0, 50)+"..." :description%></p>
								<hr>
								<div class="product-ratings">
									<ul class="list-inline">
										<li class="list-inline-item selected">
											<a>评价：</a>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item selected">
											<i class="fa fa-star"></i>
										</li>
										<li class="list-inline-item">
											<i class="fa fa-star"></i>
										</li>
									</ul>
								</div>
								<p>￥：<%=d2.get(i).price%>元</p>
							</div>


						</div>
					</div>



				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>


	<section class=" section">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section title -->
					<div class="section-title">
						<h2>热门分类</h2>
					</div>
					<div class="row">
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-laptop icon-bg-1"></i>
									<h4>计算机</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											第一本书
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											第二本书
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Microsoft
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Monitors
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-apple icon-bg-2"></i>
									<h4>自然科学</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Cafe
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Fast food
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Restaurants
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Food Track
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-home icon-bg-3"></i>
									<h4>青春文学</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Farms
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Gym
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Hospitals
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Parolurs
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-shopping-basket icon-bg-4"></i>
									<h4>美&nbsp;&nbsp;食</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Mens Wears
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Accessories
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Kids Wears
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											It & Software
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-briefcase icon-bg-5"></i>
									<h4>历&nbsp;&nbsp;史</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											It Jobs
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Cleaning & Washing
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Management
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Voluntary Works
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-car icon-bg-6"></i>
									<h4>航空航天</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Bus
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Cars
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Motobike
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Rent a car
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-paw icon-bg-7"></i>
									<h4>运&nbsp;&nbsp;动</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Cats
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Dogs
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Birds
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Others
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->
						<!-- Category list -->
						<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
							<div class="category-block">
								<div class="header">
									<i class="fa fa-laptop icon-bg-8"></i>
									<h4>数&nbsp;&nbsp;学</h4>
								</div>
								<ul class="category-list">
									<li>
										<a href="category.html">
											Cleaning
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Car Washing
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Clothing
											<span>销量</span>
										</a>
									</li>
									<li>
										<a href="category.html">
											Business
											<span>销量</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /Category List -->


					</div>
				</div>
			</div>
		</div>
		<!-- Container End -->
	</section>


	</div>


	<footer class="footer-bottom">
		<!-- Container Start -->
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-12">
					<!-- Copyright -->
					<div class="copyright">
						<p>制作团队： 郭榕 邓家豪 何俊霖 梁卓越</p>
					</div>
				</div>
				<div class="col-sm-6 col-12">
					<!-- Social Icons -->
					<ul class="social-media-icons text-right">

						<li>
							<a class="fa fa-apple"></a>
						</li>
						<li>
							<a class="fa fa-wechat"></a>
						</li>
						<li>
							<a class="fa fa-qq"></a>
						</li>
						<li>
							<a class="fa fa-weibo"></a>
						</li>


					</ul>
				</div>
			</div>
		</div>

	</footer>
<!--
	<script type="text/javascript">
		var l_c = document.getElementById("login_cancel");
		var user = session.getAttribute("user");

		if (user == null) {
			//window.location = "Login.jsp" 
			l_c.innerHTML = "登录";
		} else {
			//window.location="Index1.jsp";
			l_c.innerHTML = "注销";
		}
	</script>
-->

</body>

</html>



