<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="org.huashan.database.*, org.huashan.entity.*" %>
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
	<%
	String o_id = request.getParameter("o_id");
	if(o_id==null)
	{
		response.sendRedirect("loginAndregister.jsp");
		return;
	}
	User user = (User)session.getAttribute("user");
	if(user == null)
	{
		response.sendRedirect("loginAndregister.jsp");
		return;
	}
	DataBase dataBase = DataBase.getInstance();
	Order order = dataBase.getOneOrder(o_id);
	%>
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
			 <h6 >订单编号:  &nbsp; <%=order.id %></h6>
		     <hr>  
		     <h6 >快递单号:  &nbsp; <%=order.id %>  </h6>
	     	 <hr>  
			 <h6 >订单状态:  &nbsp;  <%=order.status.toString() %>    &nbsp;&nbsp;
			 <a  href="Receipt.do?o_id=<%=order.id %>" class="btnqueren" > 确认收货 </a> 
			 <a  href="UserCancel.do?o_id=<%=order.id %>" class="btnqueren" > 取消订单 </a> 
			 </h6>			  
		     <hr>
			 <h6 >下单日期:  &nbsp; <%=order.buy_date %>   </h6>
		     <hr>
			 <h6 >订单商品详情 </h6>
		     <br>
			 <table class="table table-responsive product-dashboard-table" >
						<thead>
							<tr>
								<th class="text-center">图片</th>
								<th class="text-center">信息</th>
								<th class="text-center">单价</th>
								<th class="text-center">数量</th>
								<th class="text-center">总价</th>
							    <th class="text-right">选项</th>
							</tr>
						</thead>
						<tbody>
						<%for(int i=0;i<order.commodities.size();i++)
							{
							Commodity c = order.commodities.get(i);
							%>
							<tr>
								
								<td class="product-thumb"><br>
									<a href="onebook.jsp?id=<%= c.id %>">
									<img  width="250px" height="auto" src="images/commodity/<%=c.id %>.jpg" alt="image description">
									</a>
									</td>
								<td class="product-details">
									<h6 class="title"><% 
								if(c.title.length() > 30)
									out.print(c.title.substring(0,30)+"..."); 
								else
									out.print(c.title); 
								%></h6><hr>
									
									<h6>作者：<%=c.author %> </h6><hr>
									<h6 class="add-id">ISBN：<%=c.ISBN %></h6>
								</td>
								<td class="product-category" align="center"><br><span class="categories"><%=Format.formatDouble(c.price) %></span></td>
								<td class="product-category" align="center"><br><span class="categories"><%=c.count %></span></td>
								<td class="product-category" align="center"><br><span class="categories"><%=Format.formatDouble(c.price*c.count) %></span></td>
							  <td class="action" data-title="Action"><br>
									<div class="text-right">							
												<a data-toggle="tooltip" data-placement="top" title="进入该书" class="view" href="onebook.jsp?id=<%= c.id %>">
													<i class="fa fa-eye"></i>
												</a>				
									</div>
								</td>
							</tr>
							<%} %>
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
