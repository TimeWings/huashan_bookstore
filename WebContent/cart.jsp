<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.huashan.database.DataBase"%>
<%@ page import="org.huashan.entity.Commodity"%>
<%@ page import="org.huashan.entity.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
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
	  .bbbtn{
		  background-color: lightskyblue; 
		  border: none;  
		  color: white;  
		  padding: 15px 32px; 
		  text-align: center; 
		  text-decoration: none; 
		  display: inline-block;  
		  font-size: 16px;
		  border-radius: 15px;
	  }
	  	  </style>
	
		
</head>

	<%
		User u = (User) session.getAttribute("user");
		if(u == null)
		{
			response.sendRedirect("loginAndregister.jsp");
			return;
		}
		DataBase database = DataBase.getInstance();
		List<Commodity> mycart = database.getUserCart(u.getUsername());
	%>


<body class="body-wrapper">

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg  navigation">
					<a class="navbar-brand" href="index.jsp">
						<img src="images/logo.png" alt=""  width="200" height="50">
					</a>
					
				  <div class="collapse navbar-collapse" id="navbarSupportedContent">
						
						<ul class="navbar-nav ml-auto mt-10">
							
								<a href="#" onClick="javascript :history.back(-1);" class="bbbtn"  >返回</a>
							
							
							     &nbsp;
					  
								<a href="MyOrder.jsp" class="bbbtn" >我的订单</a>
							
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
					<h3 class="widget-header">用户<%=u.getUsername()%>的购物车</h3>
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
					<%
					for (int i = 0; i < mycart.size(); i++) 
					{
						Commodity c = mycart.get(i);
					%>
							<tr>
								<td>
									<div class="gw_num text-center">
									<a class="jian" href="javascript:void(0)"  onClick="show('sub','price_1','num_1')">-</a> 
									<span id="num_1">1</span> 
									<a class="add" href="javascript:void(0)" onClick="show('sum','price_1','num_1')">+</a></div>									
								</td>
								<td class="product-details text-center">
									<img width="80px" height="auto" src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h3 class="title"><%=c.name%></h3>
									<span class="add-id"> <%=c.ISBN%> </span>
									<span> <%=c.type%> </span>
									<span class="status active"><%=c.author%></span>
									<span class="location"><%=c.publisher%></span>
								</td>
								<td><span class="categories"><a>￥：</a><b id="price_1"><%=c.price%></b><c> 元</c></span></td>
								<td class="action" data-title="Action">
									
										<ul class="list-inline justify-content-center">
											<li class="list-inline-item">
												<a class="delete" href="">
													<i class="fa fa-trash"></i>
												</a>
											</li>
								        </ul>
								</td>
								<td class="counts text-center"><button class="bbbtn" id="checkbox1" onClick="check('checkbox1' ,'price_1')"  >选中</button></td>
								
							</tr>
							<%
								}
							%>
							
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
		<!-- Row End -->
	</div>
	
	
	<div class="topD">
						<div class="topf text-center">
							
							<p style="font-size:20px"><a>合计:<b id="allprice" >			
									<%double sum = 0.0; 
									for(int j=0;j<mycart.size();j++)
									{
										sum+=mycart.get(j).price*mycart.get(j).count;
									}
									%>
								<%=String.format("%.2f", sum)%></b>元</a></p>
							<p id = "ppp" hidden="hidden"> 0  </p>
							</div>
						<hr>
						<div class="topg text-center" >
							<a href="我的订单.html" style="background-color: darkseagreen; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;" >结账</a>
							</div>
						
						
						
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
<script type="text/javascript">
			
		
	  function check(state1,state2){
		  
		var checkbox = document.getElementById(state1);
		
		var price = document.getElementById(state2);
		
		var allpri  = document.getElementById("allprice");
			
		var sumpri = parseFloat(allpri.innerHTML);
		  
			
		var p = parseFloat(price.innerHTML);
		
		if(checkbox.innerHTML=="取消")
		{
			
			//点击选中，加钱；
			sumpri += p;
			allpri.innerHTML=sumpri.toString();
			checkbox.innerHTML="选中";
		}
		else
		{
			//取消选中，减钱；
			sumpri -= p;
			allpri.innerHTML=sumpri.toString();
			checkbox.innerHTML="取消";
		}
		
	}
			function show(state1,state2,state3){
				
				var count = document.getElementById(state3);
				
				var x = parseInt(count.innerHTML);
				
				var pri = document.getElementById(state2);
				
				var allpri  = document.getElementById("allprice");
				
				var sumpri = parseFloat(allpri.innerHTML);
				
				var p  = document.getElementById("ppp");
				
				p.innerHTML = sumpri.toString();
				
			
				if(x>0)
				var p = parseFloat(pri.innerHTML)/x;
				
				
				if(state1=="sub"){
					if(x<=0){
						count.innerHTML="0";
						pri.innerHTML="0";
					}else{
						sumpri -= p;
						x--;
						count.innerHTML = x;
						p=p*x;
						pri.innerHTML=p.toString();						
						allpri.innerHTML=sumpri.toString();
					}
				}
				
				else if(state1=="sum"){
					if(x==0)
						{
						  count.innerHTML="1";
						  pri.innerHTML="26";					 
						  sumpri= sumpri+parseFloat(pri.innerHTML);
						 allpri.innerHTML=sumpri.toString();
						}
					else{
					sumpri= sumpri+p;
					x++;
					count.innerHTML=x;
					p=p*x;
					pri.innerHTML=p.toString();					
						allpri.innerHTML=sumpri.toString();
					}
				}	
			}
		</script>
 
</body>

</html>