<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
#main{ width:1000px; float:inherit; padding:5px 0; }
	

</style>
	
</head>

<body class="body-wrapper">

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="主页.html">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
				
     <div class="topC">		 
				
   <div class="dropdown dg" > 	   
  <div  style="cursor:pointer" class="text-center" >教&nbsp;&nbsp;育</div>
  <div class="dropdown-content text-center">
    <p><a href="单个分类.html">历史类速度速 </a></p>
	  <p><a href="#">计算机类</a></p>
  </div>
	  
</div>
	 
   <div class="dropdown dg" >
  <div style="cursor:pointer" class="text-center">小&nbsp;&nbsp;说</div>
  <div class="dropdown-content text-center">
    <p><a href="#">科 幻</a></p>
    <p><a href="#">悬 疑</a></p>
  </div>
			 
</div>
					
   <div class="dropdown dg" >
  <div style="cursor:pointer" class="text-center">日常生活</div>
  <div class="dropdown-content text-center">
   <p><a href="#">Hello World!</a></p>
    <p><a href="#">Hello World!</a></p>
  </div>
			
</div>
				
   <div class="dropdown dg" >
  <div style="cursor:pointer" class="text-center">人物传记</div>
  <div class="dropdown-content text-center">
    <p><a href="#">20世纪80年代</a></p>
    <p><a href="#">20世纪60年代</a></p>
  </div>
	  
</div>
		
		<div class="dropdown dg" >
  <div style="cursor:pointer" class="text-center">饮食文化</div>
  <div class="dropdown-content text-center">
    <p><a href="#">20世纪80年代</a></p>
    <p><a href="#">20世纪60年代</a></p>
  </div>
	  
</div>			
	</div>
	
					<div class="topD">					
                  <ul class="navbar-nav ml-auto mt-10">
				
	             <li class="nav-item">
				  <a class="nav-link login-button" href="登录界面.html"  target="_blank">登录</a>
			  </li>
					  <li class="nav-item">
				  <a class="nav-link login-button" href="我的订单.html"  target="_blank">我的订单</a>
			  </li>
					  
					  <li class="nav-item ">
								<a class="nav-link add-button" href="购物车.html" target="_blank">购物车 </a> <b class="nav-link add-button">1</b> &nbsp;&nbsp;
							</li>
	
					  </ul>
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
					<p>卖书</p>
					<div class="short-popular-category-list text-center">
						<h2>卖</h2>
					</div>
					
				</div>
				<!-- Advance Search -->
				<div class="advance-search">
					<form action="#">
					  <div class="row" id="main" >
						<!-- Store Search -->
							
						<div class="ctbox" >								
								<div class="block d-flex"  style=" vertical-align:middel;">
								  <input type="text"  class="form-control mb-2 mr-sm-2 mb-sm-0" id="search" placeholder="请输入关键字">
									
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

<section class="popular-deals section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
				  <h2>新书介绍</h2>
				  <p>1111111</p>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- offer 01 -->
			<div class="col-sm-12 col-lg-4">
				<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<!-- <div class="price">$200</div> -->
			<a href="单个商品.html">
				<img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap">
			</a>
		</div>
		
		
		<div class="card-body">
			
		  <h4 class="card-title"><a>斗罗大陆</a></h4>
		  <ul class="list-inline product-meta">
		    <li class="list-inline-item"> <a><em class="fa fa-id-card "></em> ISBN-9603</a> </li>
		    <li class="list-inline-item"> <a><em class="fa fa-calendar"></em> 2019.12.1</a> </li>
		  </ul>
		    <p class="card-text">说明： 打怪升级修炼小说！！！</p>			
		    <div class="product-ratings">
		    	<ul class="list-inline">
					<li class="list-inline-item selected"><a >评价：</a></li>
		    		<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
		    		<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
		    		<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
		    		<li class="list-inline-item selected"><i class="fa fa-star"></i></li>
		    		<li class="list-inline-item"><i class="fa fa-star"></i></li>
		    	</ul>
		    </div>
			<p>￥：28.6元 </p>
		</div>
		
		
	</div>
</div>



			</div>
		  <div class="col-sm-12 col-lg-4">
			  <!-- product card -->
			  <div class="product-item bg-light">
			    <div class="card">
			      <div class="thumb-content">
			        <!-- <div class="price">$200</div> -->
			        <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"> </a> </div>
			      <div class="card-body">
			        <h4 class="card-title"><a>11</a></h4>
			        <ul class="list-inline product-meta">
			          <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
			          <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
		            </ul>
			        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
			        <div class="product-ratings">
			          <ul class="list-inline">
			        
		              </ul>
		            </div>
		          </div>
		        </div>
		      </div>
		  </div>
		  <div class="col-sm-12 col-lg-4">
			  <!-- product card -->
			  <div class="product-item bg-light">
			    <div class="card">
			      <div class="thumb-content">
			        <!-- <div class="price">$200</div> -->
			        <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"></a></div>
			      <div class="card-body">
			        <h4 class="card-title"><a>11</a></h4>
			        <ul class="list-inline product-meta">
			          <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
			          <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
		            </ul>
			        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
			        <div class="product-ratings">
			          <ul class="list-inline">
			           
		              </ul>
		            </div>
		          </div>
		        </div>
		      </div>
		  </div>
			<div class="col-sm-12 col-lg-4">
			  <!-- product card -->
			  <div class="product-item bg-light">
			    <div class="card">
			      <div class="thumb-content">
			        <!-- <div class="price">$200</div> -->
			        <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"></a></div>
			      <div class="card-body">
			        <h4 class="card-title"><a>11</a></h4>
			        <ul class="list-inline product-meta">
			          <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
			          <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
		            </ul>
			        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
			        <div class="product-ratings">
			          <ul class="list-inline">
			           
		              </ul>
		            </div>
		          </div>
		        </div>
		      </div>
		  </div>
			<div class="col-sm-12 col-lg-4">
				<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<!-- <div class="price">$200</div> -->
			<a href="">
				<img class="card-img-top img-fluid" src="images/products/products-2.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		  <h4 class="card-title"><a>22</a></h4>
		  <ul class="list-inline product-meta">
		    	<li class="list-inline-item">
		    		<a href=""><i class="fa fa-folder-open-o"></i>Furnitures</a>
		    	</li>
		    	<li class="list-inline-item">
		    		<a href=""><i class="fa fa-calendar"></i>26th December</a>
		    	</li>
		    </ul>
		    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
		    <div class="product-ratings">
		    	<ul class="list-inline">
		    	
		    	</ul>
		    </div>
		</div>
	</div>
</div>



			</div><div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
			<div class="col-sm-12 col-lg-4">
				<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<!-- <div class="price">$200</div> -->
			<a href="">
				<img class="card-img-top img-fluid" src="images/products/products-3.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		  <h4 class="card-title"><a>33</a></h4>
		  <ul class="list-inline product-meta">
		    	<li class="list-inline-item">
		    		<a href=""><i class="fa fa-folder-open-o"></i>Electronics</a>
		    	</li>
		    	<li class="list-inline-item">
		    		<a href=""><i class="fa fa-calendar"></i>26th December</a>
		    	</li>
		    </ul>
		    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
		    <div class="product-ratings">
		    	<ul class="list-inline">
		    		
		    	</ul>
		    </div>
		</div>
	</div>
</div>



			</div>
			
			
		</div>
	</div>
</section>
<section class="popular-deals section bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="section-title">
          <h2>新书介绍</h2>
          <p>1111111</p>
        </div>
      </div>
    </div>
    <div class="row">
      <!-- offer 01 -->
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"> </a> </div>
            <div class="card-body">
              <h4 class="card-title"><a>11</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
                <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"></a></div>
            <div class="card-body">
              <h4 class="card-title"><a>11</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
                <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"></a></div>
            <div class="card-body">
              <h4 class="card-title"><a>11</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
                <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-1.jpg" alt="Card image cap"></a></div>
            <div class="card-body">
              <h4 class="card-title"><a>11</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a><em class="fa fa-folder-open-o"></em>Electronics</a></li>
                <li class="list-inline-item"> <a><em class="fa fa-calendar"></em>26th December</a></li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-2.jpg" alt="Card image cap"> </a> </div>
            <div class="card-body">
              <h4 class="card-title"><a>22</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a href=""><i class="fa fa-folder-open-o"></i>Furnitures</a> </li>
                <li class="list-inline-item"> <a href=""><i class="fa fa-calendar"></i>26th December</a> </li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
      <div class="col-sm-12 col-lg-4">
        <!-- product card -->
        <div class="product-item bg-light">
          <div class="card">
            <div class="thumb-content">
              <!-- <div class="price">$200</div> -->
              <a href=""> <img class="card-img-top img-fluid" src="images/products/products-3.jpg" alt="Card image cap"> </a> </div>
            <div class="card-body">
              <h4 class="card-title"><a>33</a></h4>
              <ul class="list-inline product-meta">
                <li class="list-inline-item"> <a href=""><i class="fa fa-folder-open-o"></i>Electronics</a> </li>
                <li class="list-inline-item"> <a href=""><i class="fa fa-calendar"></i>26th December</a> </li>
              </ul>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, aliquam!</p>
              <div class="product-ratings">
                <ul class="list-inline">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section title -->
				<div class="section-title">
				  <h2>热卖图书</h2>
				  <p>1111</p>
				</div>
				<div class="row">
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-laptop icon-bg-1"></i> 
								<h4>电子类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Laptops <span>93</span></a></li>
								<li><a href="category.html">Iphone <span>233</span></a></li>
								<li><a href="category.html">Microsoft  <span>183</span></a></li>
								<li><a href="category.html">Monitors <span>343</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-apple icon-bg-2"></i> 
								<h4>水果类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Cafe <span>393</span></a></li>
								<li><a href="category.html">Fast food <span>23</span></a></li>
								<li><a href="category.html">Restaurants  <span>13</span></a></li>
								<li><a href="category.html">Food Track<span>43</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-home icon-bg-3"></i> 
								<h4>生活类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Farms <span>93</span></a></li>
								<li><a href="category.html">Gym <span>23</span></a></li>
								<li><a href="category.html">Hospitals  <span>83</span></a></li>
								<li><a href="category.html">Parolurs <span>33</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-shopping-basket icon-bg-4"></i> 
								<h4>购物类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Mens Wears <span>53</span></a></li>
								<li><a href="category.html">Accessories <span>212</span></a></li>
								<li><a href="category.html">Kids Wears <span>133</span></a></li>
								<li><a href="category.html">It & Software <span>143</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-briefcase icon-bg-5"></i> 
								<h4>事业类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">It Jobs <span>93</span></a></li>
								<li><a href="category.html">Cleaning & Washing <span>233</span></a></li>
								<li><a href="category.html">Management  <span>183</span></a></li>
								<li><a href="category.html">Voluntary Works <span>343</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-car icon-bg-6"></i> 
								<h4>车辆类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Bus <span>193</span></a></li>
								<li><a href="category.html">Cars <span>23</span></a></li>
								<li><a href="category.html">Motobike  <span>33</span></a></li>
								<li><a href="category.html">Rent a car <span>73</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-paw icon-bg-7"></i> 
								<h4>宠物类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Cats <span>65</span></a></li>
								<li><a href="category.html">Dogs <span>23</span></a></li>
								<li><a href="category.html">Birds  <span>113</span></a></li>
								<li><a href="category.html">Others <span>43</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					<!-- Category list -->
					<div class="col-lg-3 offset-lg-0 col-md-5 offset-md-1 col-sm-6 col-6">
						<div class="category-block">
							<div class="header">
								<i class="fa fa-laptop icon-bg-8"></i> 
								<h4>文学类</h4>
							</div>
							<ul class="category-list" >
								<li><a href="category.html">Cleaning <span>93</span></a></li>
								<li><a href="category.html">Car Washing <span>233</span></a></li>
								<li><a href="category.html">Clothing  <span>183</span></a></li>
								<li><a href="category.html">Business <span>343</span></a></li>
							</ul>
						</div>
					</div> <!-- /Category List -->
					
					
				</div>
			</div>
		</div>
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



