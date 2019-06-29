<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.huashan.database.DataBase"%>
<%@ page import="org.huashan.entity.User"%>
<%@ page import="org.huashan.entity.Commodity"%>
<%@ page import="org.huashan.entity.Order"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>我的订单</title>
  

  <link href="plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
	
	<style type="text/css">
		
		.btnexit{
			background-color: lightskyblue; border: none;  color: white;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
			
		}
		.btnaaa{
			background-color: dodgerblue; border: none;  color: snow;  padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;  font-size: 16px; border-radius: 15px;
			
		}
		</style>
	

</head>

			<%String c_id = request.getParameter("id"); 
			DataBase dataBase = DataBase.getInstance(); 
			Commodity commodity = dataBase.getOneCommodity(c_id);
			%>
	
<body>
	
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
							<a href="manager.jsp" class="btnexit"  >返回</a>
							     &nbsp;
							
						</ul>
						</div>
					</nav>
					</div>	
		</div>	
	</div>
</section>
	
<section class="dashboard section">	
	<div class="container">
		<h2 align="center">修改书本信息  </h2>		
			 <br>
			 <hr>
		     <form method = "post" action = "ChangeCommodity.do" accept-charset="UTF-8">
				 <input name = "id"  hidden="true" value=<%=commodity.id %>>
				 <input name = "sales"  hidden="true" value=<%=commodity.sales %>>
			<h6> 价格:  &nbsp;  <input name = "new_price" value=<%=commodity.price %>></h6>
		     <hr>  	 
			 <h6> ISBN:  &nbsp;  <input name = "new_ISBN" value=<%=commodity.ISBN %>></h6>
		     <hr>  
		     <h6> 书    名:  &nbsp;  <input name = "new_name" value=<%=commodity.name %>>      </h6> 
	     	 <hr>  
			 <h6> 作    者:  &nbsp;  <input name = "new_author" value=<%=commodity.author %>>      </h6> 
	     	 <hr> 
			 <h6> 类    别:  &nbsp;  <input name = "new_type" value=<%=commodity.type %>> </h6>
		     <hr>
		     <h6> 标    题:  &nbsp;  <input name = "new_title" value=<%=commodity.title %>> </h6>
		     <hr>
			 <h6> 库    存:  &nbsp;  <input name = "new_stock" value=<%=commodity.stock %>>       </h6> 
		     <hr>
			 <h6>出版社:  &nbsp;  <input name = "new_publisher" value=<%=commodity.publisher %>>       </h6> 
		     <hr>
		     <h6 align="left">简    介:  &nbsp;   </h6>
			 <textarea name="new_description" style="width: 800px; height: 80px" ><%=commodity.description %></textarea>    
		     <hr>
			 <h6 align="left">
				  图    片:
			 <input type="file" id="file" onchange="filechange(event)">

             <img src="images/commodity/<%=commodity.id %>.jpg" width="200px" height="200px" id="img-change" style="text-align: center">				  
			
		     </h6>
			 <button type="submit" class="btnaaa"> 提 交 </button>
			 </form>
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
	  	<script type="text/javascript">
	
	//以下是图片上传的script   
   
		$("#img-change").click(function () {
    $("#file").click();
})
	var filechange=function(event){
    var files = event.target.files, file;
    if (files && files.length > 0) {
        // 获取目前上传的文件
        file = files[0];// 文件大小校验的动作
        if(file.size > 1024 * 1024 * 2) {
            alert('图片大小不能超过 2MB!');
            return false;
        }
        // 获取 window 的 URL 工具
        var URL = window.URL || window.webkitURL;
        // 通过 file 生成目标 url
        var imgURL = URL.createObjectURL(file);
        //用attr将img的src属性改成获得的url
        $("#img-change").attr("src",imgURL);
        // 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
        // URL.revokeObjectURL(imgURL);
    }
};


	</script>
</body>
</html>
