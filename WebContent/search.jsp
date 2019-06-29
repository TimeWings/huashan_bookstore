<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="org.huashan.database.DataBase"%>
<%@ page import="org.huashan.entity.Commodity"%>
<%@ page import="org.huashan.entity.User"%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>搜索结果</title>
  
  
  <!-- Bootstrap -->
  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  
  <link href="css/style.css" rel="stylesheet">

</head>

<%	
	String keyword = request.getParameter("keyword");
	DataBase dataBase = DataBase.getInstance(); 
	List<Commodity> data = dataBase.getCommoditiesByTitle(keyword);
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
				
						<ul class="navbar-nav ml-auto mt-10">
							<a  href="index.jsp" style="background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;"  >返回</a>
						
						
						</ul>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="page-search">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Advance Search -->
				<div class="advance-search">
					<form method = "post" action = "SearchBook.do" accept-charset="UTF-8">
						<div class="form-row">
							
							<div class="">
								<input type="text" class="form-control" name = "keyword" id="search_single" placeholder="请输入关键字">
							</div>
							
							<div class=" col-md-2">
								
								<button type="submit" class="btn btn-primary">搜索</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
	

	
	 
<section class="popular-deals section bg-gray"  >
		
	<div id="div1" style="display: block">
	<div  class="container"  >
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
				  <h2>搜索'<%=keyword%>'的结果</h2>
				</div>
			</div>
		</div>
		
		<div class="row" >
			<%
			for (int i = 0; i < data.size(); i++) {
		%>
			<div class="col-sm-12 col-lg-4">
				<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<!-- <div class="price">$200</div> -->
			<a href="onebook.jsp?id=<%=data.get(i).id%>">
				<img class="card-img-top img-fluid" src="images/commodity/<%=data.get(i).id %>.jpg" alt="Card image cap">
			</a>
		</div>

		<div class="card-body">
			
		  <h4 class="card-title"><a><%=data.get(i).name%></a></h4>
		  <ul class="list-inline product-meta">
		    <li class="list-inline-item"> <a><em class="fa fa-id-card "></em> <%=data.get(i).ISBN%></a> </li>
		    <li class="list-inline-item"> <a><em class="fa fa-calendar"></em> <%=data.get(i).author%></a> </li>
		  </ul>
		    <p class="card-text"><%String description = data.get(i).description; %>
			<%=description.length()>80?description.substring(0, 80)+"..." :description%></p>			
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
			<p>￥：<%=data.get(i).price%>元 </p>
		</div>
				
		
	</div>
</div>
</div>
		   
		
	 <%
						}
				%>
  </div>
 
		</div>
		</div>

		
		
		
		
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		<div class="pagination justify-content-center ">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item">
								<a class="page-link"  aria-label="Previous" id="up" href="#">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
							<li class="page-item active" id="oneli"><a  id="one"  class="page-link " href="#">1</a></li>
							<li class="page-item">
								<a class="page-link" aria-label="Next" id="down" href="#">
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
</section>
	
<footer class="footer-bottom" >
   
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-12">
          
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
	
	window.onload=function(){
	
	var oneli  = document.getElementById("oneli");
	var twoli  =document.getElementById("twoli");
	var threeli  =document.getElementById("threeli");
	var div_1  = document.getElementById("div1");
	var div_2  =document.getElementById("div2");
	var div_3  = document.getElementById("div3");	
	document.getElementById("one").onclick=function(){
		
		
		div_1.style.display="block";
		div_2.style.display="none";
		div_3.style.display="none";
		
		oneli.className="page-item active";
		twoli.className="page-item";
		threeli.className="page-item";
	}
	
	document.getElementById("two").onclick=function(){
		
		oneli.className="page-item";
		twoli.className="page-item active";
		threeli.className="page-item";
		div_1.style.display="none";
		div_2.style.display="block";
		div_3.style.display="none";
		
	}
	
	document.getElementById("three").onclick=function(){
	
		oneli.className="page-item";
		twoli.className="page-item";
		threeli.className="page-item active";
		div_1.style.display="none";
		div_2.style.display="none";
		div_3.style.display="block";
		
	}

	document.getElementById("down").onclick=function(){
		
		if(oneli.className=="page-item active")
			{
				oneli.className="page-item";
		twoli.className="page-item active";
		threeli.className="page-item";
		div_1.style.display="none";
		div_2.style.display="block";
		div_3.style.display="none";
			}
		else if(twoli.className=="page-item active"){
			oneli.className="page-item";
		twoli.className="page-item";
		threeli.className="page-item active";
		div_1.style.display="none";
		div_2.style.display="none";
		div_3.style.display="block";
		}
		else if(threeli.className=="page-item active"){
				div_1.style.display="block";
		div_2.style.display="none";
		div_3.style.display="none";
		
		oneli.className="page-item active";
		twoli.className="page-item";
		threeli.className="page-item";
		}
	}
	document.getElementById("up").onclick=function(){
		
		if(oneli.className=="page-item active")
			{
				oneli.className="page-item";
		twoli.className="page-item";
		threeli.className="page-item active";
		div_1.style.display="none";
		div_2.style.display="none";
		div_3.style.display="block";
				
			}
		else if(twoli.className=="page-item active"){
				div_1.style.display="block";
		div_2.style.display="none";
		div_3.style.display="none";
		
		oneli.className="page-item active";
		twoli.className="page-item";
		threeli.className="page-item";
		}
		else if(threeli.className=="page-item active"){
			oneli.className="page-item";
		twoli.className="page-item active";
		threeli.className="page-item";
		div_1.style.display="none";
		div_2.style.display="block";
		div_3.style.display="none";
		}
		
	}
		
	}
	</script>


</body>

</html>