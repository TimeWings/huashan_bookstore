<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="org.huashan.database.DataBase"%>
<%@ page import="org.huashan.entity.Commodity"%>
<%@ page import="org.huashan.entity.User"%>
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
	<%
		DataBase database = DataBase.getInstance();

	%>

	<%
			List<Commodity> commodities = database.getAllCommodities();
			List<Commodity> commoditiesOrderBySales = database.getAllCommoditiesOrderBySales();
			//request.getRequestDispatcher("index.jsp").forward(request, response);
	%>

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
										<a href="classification.jsp?type=计算机">计算机类 </a>
									</p>
									<p>
										<a href="classification.jsp?type=数学">数学类</a>
									</p>
									<p>
										<a href="classification.jsp?type=英语">英语类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">文&nbsp;&nbsp;化</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="classification.jsp?type=哲学">哲学类</a>
									</p>
									<p>
										<a href="classification.jsp?type=历史">历史类</a>
									</p>
									<p>
										<a href="classification.jsp?type=宗教">宗教类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">日常生活</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="classification.jsp?type=旅游">旅游类</a>
									</p>
									<p>
										<a href="classification.jsp?type=美食">美食类</a>
									</p>
									<p>
										<a href="classification.jsp?type=运动">运动类</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">文&nbsp;&nbsp;艺</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="classification.jsp?type=传记">传记类</a>
									</p>
									<p>
										<a href="classification.jsp?type=小说">小说类</a>
									</p>
									<p>
										<a href="classification.jsp?type=青春文学">青春文学</a>
									</p>
								</div>

							</div>

							<div class="dropdown dg">
								<div style="cursor: pointer" class="text-center">科&nbsp;&nbsp;学</div>
								<div class="dropdown-content text-center">
									<p>
										<a href="classification.jsp?type=航空航天">航空航天</a>
									</p>
									<p>
										<a href="classification.jsp?type=自然科学">自然科学</a>
									</p>
									<p>
										<a href="classification.jsp?type=海底世界">海底世界</a>
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
  		欢迎你：${user.username } <br>
  		<%
			User u = (User) session.getAttribute("user");
  		if(u.is_admin == false)
  		{
  	  	%>
  		<a href="LoginOut.do">注销</a>
  		<%
  		}
  		else
  		{
  		%>
  		<a href="manager.jsp">管理员后台</a>
  		<%
  		}
  		%>
  		</c:if>

							</div>

							<div class="topg text-center">
								<a href="MyOrder.jsp" style="background-color: lightskyblue; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 15px; border-radius: 15px;">订单</a>
							</div>

							<div class="toph text-center">


								<a href="cart.jsp" style="background-color: burlywood; border: none; color: white; padding: 4px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 15px; border-radius: 15px;">
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
						<form method = "post" action = "SearchBook.do" accept-charset="UTF-8">
							<div class="row" id="main">
								<!-- Store Search -->

								<div class="ctbox">
									<div class="block d-flex" style="vertical-align: middel">
										<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" name = "keyword" id="search" placeholder="请输入关键字">

										<button type = "submit" class="btn btn-main">搜索</button>
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
					for (int i = commodities.size()-1; i >=commodities.size()-6; i--) {
				%>
				<!-- offer 01 -->
				<div class="col-sm-12 col-lg-4">

					<div class="product-item bg-light">
						<div class="card">
							<div class="thumb-content">

								<a href="onebook.jsp?id=<%=commodities.get(i).id%>">
									<img class="card-img-top img-fluid" src="images/commodity/<%=commodities.get(i).id %>.jpg" alt="Card image cap">
								</a>
							</div>


							<div class="card-body">

								<h4 class="card-title">
									<a><%String name = commodities.get(i).name; %>
								<%=name.length()>15?name.substring(0, 15)+"..." :name%></a>
								</h4>
								<ul class="list-inline product-meta">
									<li class="list-inline-item">
										<a>
											<em class="fa fa-id-card "></em>
											<%=commodities.get(i).ISBN%>
										</a>
									</li>
									<li class="list-inline-item">
										<a>
											<em class="fa fa-calendar"></em>
											<%=commodities.get(i).publisher%>
										</a>
									</li>
								</ul>
								<p class="card-text"><%String description = commodities.get(i).description; %>
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
								<p>￥：<%=commodities.get(i).price%>元</p>
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
					for (int i = 0; i < 6; i++) {
				%>
				<!-- offer 01 -->
				<div class="col-sm-12 col-lg-4">

					<div class="product-item bg-light">
						<div class="card">
							<div class="thumb-content">

								<a href="onebook.jsp?id=<%=commoditiesOrderBySales.get(i).id%>">
									<img class="card-img-top img-fluid" src="images/commodity/<%=commoditiesOrderBySales.get(i).id %>.jpg" alt="Card image cap">
								</a>
							</div>


							<div class="card-body">

								<h4 class="card-title">
									<a><%String name = commoditiesOrderBySales.get(i).name; %>
								<%=name.length()>15?name.substring(0, 15)+"..." :name%></a>
								</h4>
								<ul class="list-inline product-meta">
									<li class="list-inline-item">
										<a>
											<em class="fa fa-id-card "></em>
											<%=commoditiesOrderBySales.get(i).ISBN%>
										</a>
									</li>
									<li class="list-inline-item">
										<a>
											<em class="fa fa-calendar"></em>
											<%=commoditiesOrderBySales.get(i).publisher%>
										</a>
									</li>
								</ul>
								<p class="card-text"><%String description = commoditiesOrderBySales.get(i).description; %>
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
								<p>￥：<%=commoditiesOrderBySales.get(i).price%>元</p>
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
								<%
									List<Commodity> data3 = database.getCommoditiesByTypeInRange("计算机");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("自然科学");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("青春文学");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("美食");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("历史");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("航空航天");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("运动");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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
								<%
									data3 = database.getCommoditiesByTypeInRange("数学");
								%>
								<ul class="category-list">
								<%
								for(int i=0;i<data3.size();i++)
								{
									if(i>=4) break;
								%>
									<li>
										<a href="onebook.jsp?id=<%=data3.get(i).id%>">
											<%String name = data3.get(i).name; %>
								<%=name.length()>12?name.substring(0, 12)+"..." :name%>
											<span><%=data3.get(i).sales%></span>
										</a>
									</li>
								<%
								}
								%>
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



