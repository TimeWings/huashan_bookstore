<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>订单详情</title>
  
  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
	
		
	<style type="text/css">
		.btnexit{
			background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
		}
		.btnqueren{
			background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
		}
		
	</style>
</head>

<body class="body-wrapper">
	
	<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index3.jsp">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
				
					
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						<ul class="navbar-nav ml-auto mt-10">
							<a  href="MyOrder.jsp" class="btnexit" >返回</a>					
						</ul>
						</div>
					</nav>
					</div>	
		</div>	
	</div>		
</section>


<section class="dashboard section">
	
	<div class="container">
		<h2 align="center">订单详情  </h2>		
			 <br>
			 <hr>
			 <h6 >订单编号:  &nbsp; 6003254646</h6>
		     <hr>  
		     <h6 >快递单号:  &nbsp; 8888854646  </h6>
	     	 <hr>  
			 <h6 >订单状态:  &nbsp;  运送中    &nbsp;&nbsp;<a  href="#" class="btnqueren" > 确认收货 </a> </h6>			  
		     <hr>
			 <h6 >下单日期:  &nbsp; 2019/6/25   </h6>
		     <hr>
			 <h6 >订单商品详情 </h6>
		     <br>
			 <table class="table table-responsive product-dashboard-table" >
						<thead>
							<tr>
								<th>图片</th>
								<th>信息</th>
								<th>价钱</th>
								<th>数量</th>
							    <th class="text-right">选项</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								<td class="product-thumb"><br>
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h6 class="title">第一本书111111</h6><hr>
									<a class="add-id">ISBN: 5599-4467-BBB</a>
									<a>日期: 2017/7/27 </a>
								</td>
								<td class="product-category" align="center"><br><span class="categories">￥：52</span></td>
								<td class="product-category" align="center"><br><span class="categories">2</span></td>
							  <td class="action" data-title="Action"><br>
									<div class="text-right">							
												<a data-toggle="tooltip" data-placement="top" title="进入该书" class="view" href="">
													<i class="fa fa-eye"></i>
												</a>				
									</div>
								</td>
							</tr>
		</table>
	     	<hr>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
					
			
		
	
	</div>
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
