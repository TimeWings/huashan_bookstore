<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>


  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
					<a class="navbar-brand" href="index.html">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
					
						<ul class="navbar-nav ml-auto mt-10">
							<a  href="主页.html" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;"  >返回</a>
							</div>	
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
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
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
								<a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Product Details</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Specifications</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Reviews</a>
							</li>
						</ul>
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
								<h3 class="tab-title">Product Description</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia laudantium beatae quod perspiciatis, neque dolores eos rerum, ipsa iste cum culpa numquam amet provident eveniet pariatur, sunt repellendus quas voluptate dolor cumque autem molestias. Ab quod quaerat molestias culpa eius, perferendis facere vitae commodi maxime qui numquam ex voluptatem voluptate, fuga sequi, quasi! Accusantium eligendi vitae unde iure officia amet molestiae velit assumenda, quidem beatae explicabo dolore laboriosam mollitia quod eos, eaque voluptas enim fuga laborum, error provident labore nesciunt ad. Libero reiciendis necessitatibus voluptates ab excepturi rem non, nostrum aut aperiam? Itaque, aut. Quas nulla perferendis neque eveniet ullam?</p>

						
</div>
							<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
								<h3 class="tab-title">Product Specifications</h3>
								<table class="table table-bordered product-table">
								  <tbody>
								    <tr>
								      <td>Seller Price</td>
								      <td>$450</td>
								    </tr>
								    <tr>
								      <td>Added</td>
								      <td>26th December</td>
								    </tr>
								    <tr>
								      <td>State</td>
								      <td>Dhaka</td>
								    </tr>
								    <tr>
								      <td>Brand</td>
								      <td>Apple</td>
								    </tr>
								    <tr>
								      <td>Condition</td>
								      <td>Used</td>
								    </tr>
								    <tr>
								      <td>Model</td>
								      <td>2017</td>
								    </tr>
								    <tr>
								      <td>State</td>
								      <td>Dhaka</td>
								    </tr>
								    <tr>
								      <td>Battery Life</td>
								      <td>23</td>
								    </tr>
								  </tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
								<h3 class="tab-title">Product Review</h3>
								<div class="product-review">
							  		<div class="media">
							  			<!-- Avater -->
							  			<img src="images/user/user-thumb.jpg" alt="avater">
							  			<div class="media-body">
							  				<!-- Ratings -->
							  				<div class="ratings">
							  					<ul class="list-inline">
							  						<li class="list-inline-item">
							  							<i class="fa fa-star"></i>
							  						</li>
							  						<li class="list-inline-item">
							  							<i class="fa fa-star"></i>
							  						</li>
							  						<li class="list-inline-item">
							  							<i class="fa fa-star"></i>
							  						</li>
							  						<li class="list-inline-item">
							  							<i class="fa fa-star"></i>
							  						</li>
							  						<li class="list-inline-item">
							  							<i class="fa fa-star"></i>
							  						</li>
							  					</ul>
							  				</div>
							  				<div class="name">
							  					<h5>Jessica Brown</h5>
							  				</div>
							  				<div class="date">
							  					<p>Mar 20, 2018</p>
							  				</div>
							  				<div class="review-comment">
							  					<p>
							  						Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremqe laudant tota rem ape riamipsa eaque.
							  					</p>
							  				</div>
							  			</div>
							  		</div>
							  		<div class="review-submission">
							  			<h3 class="tab-title">Submit your review</h3>
						  				<!-- Rate -->
						  				<div class="rate">
						  					<div class="starrr"></div>
						  				</div>
						  				<div class="review-submit">
						  					<form action="#" class="row">
						  						<div class="col-lg-6">
						  							<input type="text" name="name" id="name" class="form-control" placeholder="Name">
						  						</div>
						  						<div class="col-lg-6">
						  							<input type="email" name="email" id="email" class="form-control" placeholder="Email">
						  						</div>
						  						<div class="col-12">
						  							<textarea name="review" id="review" rows="10" class="form-control" placeholder="Message"></textarea>
						  						</div>
						  						<div class="col-12">
						  							<button type="submit" class="btn btn-main">Sumbit</button>
						  						</div>
						  					</form>
						  				</div>
							  		</div>
							  	</div>
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
<h4><a href="">Jonathon Andrew</a></h4>
						<p class="member-time">Member Since Jun 27, 2017</p>
						<a href="">See all ads</a>
						<ul class="list-inline mt-20">
							<li class="list-inline-item"><a href="" class="btn btn-contact">Contact</a></li>
							<li class="list-inline-item"><a href="" class="btn btn-offer">Make an offer</a></li>
						</ul>
					</div>
					<!-- Map Widget -->
					<!-- Rate Widget -->
					<div class="widget rate">
						<!-- Heading -->
						<h5 class="widget-header text-center">What would you rate
						<br>
						this product</h5>
						<!-- Rate -->
						<div class="starrr"></div>
					</div>
					<!-- Safety tips widget -->
					<div class="widget disclaimer">
						<h5 class="widget-header">Safety Tips</h5>
						<ul>
							<li>Meet seller at a public place</li>
							<li>Check the item before you buy</li>
							<li>Pay only after collecting the item</li>
							<li>Pay only after collecting the item</li>
						</ul>
					</div>
					<!-- Coupon Widget -->
					<div class="widget coupon text-center">
						<!-- Coupon description -->
						<p>是否购买？
						</p>
						<!-- Submii button -->
						<a href="" class="btn btn-transparent-white">加入购物车</a>
					</div>
					
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