<%@page import="org.huashan.entity.Order.Status"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="org.huashan.database.*, org.huashan.entity.*,java.util.List,java.util.ArrayList"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>管理员后台</title>

<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/amazeui.min.css" />
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet"
	href="plugins/font-awesome/css/font-awesome.min.css">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<style type="text/css">
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 20px 20px 12px 0px;
	z-index: 100;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.table-scroll {
	height: 500px;
	overflow: auto;
	margin-top: 20px;
	width: 90%;
	margin-left: 50px;
	z-index: 1;
}

/*以下为图片传输CSS*/
.float {
	float: left;
	width: 200px;
	height: 200px;
	overflow: hidden;
	border: 1px solid #CCCCCC;
	border-radius: 10px;
	padding: 5px;
	margin: 5px;
}

img {
	position: relative;
}

.result {
	width: 200px;
	height: 200px;
	text-align: center;
	box-sizing: border-box;
}

#file_input {
	display: none;
}

.delete {
	width: 200px;
	height: 200px;
	position: absolute;
	text-align: center;
	line-height: 200px;
	z-index: 10;
	font-size: 30px;
	background-color: rgba(255, 255, 255, 0.8);
	color: #777;
	opacity: 0;
	transition-duration: 0.7s;
	-webkit-transition-duration: 0.7s;
}

.delete:hover {
	cursor: pointer;
	opacity: 1;
}
</style>
</head>
<body>

	<header class="am-topbar admin-header">
		<div class="am-topbar-brand">
			<strong>华山 书店</strong> <small>后台管理员界面</small>
		</div>


		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		</div>
	</header>
<%
			Object userObj = session.getAttribute("user");
			DataBase dataBase = DataBase.getInstance();
			List<Order> orders = new ArrayList<Order>();
			List<Order> successOrders = new ArrayList<Order>();
			List<User> users = new ArrayList<User>();
			List<Commodity> commodities = new ArrayList<Commodity>();
			if (userObj == null) 
			{
				response.sendRedirect("loginAndregister.jsp");
			} 
			else 
			{
				User user = (User) userObj;
				if (user.is_admin == false)
					response.sendRedirect("loginAndregister.jsp");
				
				orders = dataBase.getAllOrders();
				for(int i=0;i<orders.size();i++)
				{
					if(orders.get(i).status == Status.交易完成)
						successOrders.add(orders.get(i));
				}
				users = dataBase.getAllUser();
				commodities = dataBase.getAllCommodities();
			}
%>
	<div class="am-cf admin-main"
		style="background: url(images//background/glyback.jpg); background-size: contain;">
		<!-- sidebar start -->
		<div class="admin-sidebar" style="opacity: 0.95">
			<ul class="am-list admin-sidebar-list">
				<li><a href="index.jsp"><span class="am-icon-home"></span>
						首页</a></li>
				<li><a href="#" id="shangjia"><span
						class="am-icon-pencil-square-o"></span> 上架</a></li>
				<li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
			</ul>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-tag"></span> 交易总额
					</p>
					<p><%
					double price = 0;
					for(int i=0;i<successOrders.size();i++)
					{
						List<Commodity> commodities3 = orders.get(i).commodities;
						for(int j = 0;j<commodities3.size();j++)
							price += commodities3.get(j).price * commodities3.get(j).count;
						
					}
					out.print(Math.floor(price));
								%>
								</p>
				</div>
			</div>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-bookmark"></span> 公告
					</p>
					<p>时光静好，与君语；细水流年，与君同。—— Amaze</p>
				</div>
			</div>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-bell"></span> 管理员
					</p>
					<p>· 郭榕</p>
					<p>· 梁卓越</p>
				</div>
			</div>

			<div class="am-panel am-panel-default admin-sidebar-panel">
				<div class="am-panel-bd">
					<p>
						<span class="am-icon-adn"></span> 管理员
					</p>
					<p>· 邓家豪</p>
					<p>· 何俊霖</p>
				</div>
			</div>


		</div>
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content" style="display: block; opacity: 0.95">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">管理员视图</strong> / <small>一些常用模块</small>
				</div>
			</div>

			<ul
				class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
				<li id="bt1"><a href="#" class="am-text-success"><span
						class="am-icon-btn am-icon-file-text"></span><br />订单总数<br /><%= orders.size() %></a></li>
				<li id="bt2"><a href="#" class="am-text-warning"><span
						class="am-icon-btn am-icon-briefcase"></span><br />成交订单<br /><%= successOrders.size() %></a></li>
				<li id="bt3"><a href="#" class="am-text-danger"><span
						class="am-icon-btn am-icon-recycle"></span><br />用户数量<br /><%= users.size() %></a></li>
				<li id="bt4"><a href="#" class="am-text-secondary"><span
						class="am-icon-btn am-icon-user-md"></span><br />商品列表<br /><%= commodities.size() %></a></li>
			</ul>

			<!--订单总数-->
			<div id="thediv1" style="display: none">
				<div class="table-scroll">
					<table
						class="am-table am-table-bd am-table-striped admin-content-table">
						<thead>
							<tr>
								<th>订单号</th>
								<th>收货地址</th>
								<th>下单时间</th>
								<th>订单状态</th>
								<th>管理</th>
							</tr>
						</thead>
						<tbody>
<% for(int i=0;i<orders.size();i++)
{
	Order o = orders.get(i);
	%>

							<tr>
								<td><%= o.id%></td>
								<td><%= o.u_address %></td>
								<td><%=o.buy_date%></td>
								<td><span class="am-badge am-badge-success"><%= o.status%></span></td>

								<td>
									<div class="dropdown">
										<button class="am-btn am-btn-default am-btn-xs  ">
											<span class="am-icon-cog"></span> <span
												class="am-icon-caret-down"></span>
										</button>
										<ul class="dropdown-content">
											<li style="list-style-type: none"><a href="#"> 发货</a></li>
											<hr>
											<li style="list-style-type: none"><a href="#"> 确收</a></li>
										</ul>
									</div>
								</td>
							</tr>

<% } %>

							<tr>
								<td><input></td>
								<td><input></td>
								<td><a href="#"> <input>
								</a></td>
								<td><input></td>
								<td>
									<button
										class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
										data-am-dropdown-toggle>查询</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<!--成交订单-->
			<div id="thediv2" style="display: none">

				<div class="table-scroll">
					<table
						class="am-table am-table-bd am-table-striped admin-content-table">
						<thead>
							<tr>
								<th>订单号</th>
								<th>发货日期</th>
								<th>收货日期</th>
								<th>交易价格</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<% for(int i=0;i<successOrders.size();i++)
{
	Order o = successOrders.get(i);
	%>

								<td><%= o.id%></td>
								<td><%= o.ship_date %></td>
								<td><%= o.receipt_date %></td>
								<td><span class="am-badge am-badge-success"><%
								List<Commodity> commodities2 = o.commodities;
								price = 0;
								for(int j = 0;j<commodities2.size();j++)
									price += commodities2.get(j).price * commodities2.get(j).count;
								out.print(Math.floor(price));
								%></span></td>
<%} %>
							

							<tr>
								<td><input></td>
								<td><input></td>

								<td><a href="#"> <input>
								</a></td>

								<td><input></td>
								<td>
									<button
										class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
										data-am-dropdown-toggle>查询</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>


			<!--用户数量-->
			<div id="thediv3" style="display: none">

				<div class="table-scroll">
					<table
						class="am-table am-table-bd am-table-striped admin-content-table">
						<thead>
							<tr>
								<th>用户ID</th>
								<th>用户名</th>
								<th>联系方式</th>
								<th>交易的订单数</th>
							</tr>
						</thead>
						<tbody>
						<% for(int i=0;i<users.size();i++)
							{
								User u = users.get(i);
								List<Order> ordersFromUser = dataBase.getOrdersFromUser(u.getUsername());  %>
							<tr>
								<td><%=u.getUsername() %></td>
								<td><%=u.name%></td>
								<td><%=u.phone %></td>
								<td><span class="am-badge am-badge-success"><%=ordersFromUser.size() %></span></td>

							</tr>
<%} %>
							<tr>
								<td><input></td>
								<td><input></td>

								<td><a href="#"> <input>
								</a></td>

								<td><input></td>
								<td>
									<button
										class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
										data-am-dropdown-toggle>查询</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

			<!--库存总量-->
			<div id="thediv4" style="display: none">
				<div class="table-scroll">
					<table
						class="am-table am-table-bd am-table-striped admin-content-table">
						<thead>
							<tr>
								<th>ISBN</th>
								<th>书名</th>
								<th>作者</th>
								<th>剩余库存</th>
								<th>管理</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<% for(int i=0;i<commodities.size();i++)
								{
								Commodity c = commodities.get(i); %>
								<td><%= c.ISBN %></td>
								<td><%= c.name%></td>
								<td><%= c.author %></td>
								<td><span class="am-badge am-badge-success"><%= c.stock %></span></td>
								<td>
									<div class="dropdown">
										<button class="am-btn am-btn-default am-btn-xs  ">
											<span class="am-icon-cog"></span> <span
												class="am-icon-caret-down"></span>
										</button>
										<ul class="dropdown-content">
											<li style="list-style-type: none"><a href="onebook.jsp?id=<%= c.id %>"> 查看商品</a></li>
											<li style="list-style-type: none"><a href="ChangeCommodity.do?id=<%= c.id %>"> 修改商品</a></li>
											<li style="list-style-type: none"><a href="DeleteCommodity.do?id=<%= c.id %>"> 下架商品</a></li>
										</ul>
									</div>
								</td>
							</tr>
<%} %>

							<tr>
								<td><input></td>
								<td><input></td>

								<td><a href="#"> <input>
								</a></td>

								<td><input></td>
								<td>
									<button
										class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
										data-am-dropdown-toggle>查询</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<!-- 上架商品 -->
			<div id="shangjia_div" style="display: none">
			<form method="post" action="AddCommodity.do" enctype="multipart/form-data">
				<div class="am-text-center">
					<b style="cursor: pointer">ISBN : <input name="ISBN"/></b> 
					<b style="cursor: pointer">库存 : <input name="stock"/></b>
				</div>
				<hr>
				<div class="am-text-center">
					<b style="cursor: pointer">书名 : <input name="name"/></b> <b
						style="cursor: pointer">作者 : <input name="author"/></b>
				</div>
				<hr>
				<div class="am-text-center">
					<b style="cursor: pointer">价格 : <input name="price"/></b> <b
						style="cursor: pointer">出版社 : <input name="publisher"/></b>
				</div>

				<br>
				

				<hr>
				<br>
				<div class="am-text-center">
					<b>商品标题 :
					<textarea cols="60" rows="1" name="title"></textarea>
					</b>
				</div>
				<hr>
				<div class="am-text-center">
				<b>
					详细信息 :
					<textarea cols="60" rows="8" name="description"></textarea>
				</b>
				</div>
				
				<div align="center">
					<b>商品图片：</b>
					<input type="file" style="display: block" name="uploadFile"
						onchange="filechange(event)" /> 
						<img src="" width="600px" height="600px" id="img-change"
						style="text-align: center">

				</div>
				<div class="am-text-center">
				<input type="submit" value="提交" class="btn btn-success"/>
				<input type="reset" value="重置" class="btn btn-default"/>
				</div>
			</form>
			</div>
			
		</div>
		
		<!-- content end -->



	</div>

	<!--<footer class="footer-bottom" style="background-color:dimgrey">
    
    <div class="container">
      <div class="row">
		  
        <div class="col-sm-6 col-12">
        
          <div class="copyright">
            <p>制作团队： 郭榕 邓家豪 何俊霖 梁卓越</p>
          </div>
        </div>
		  
        <div class="col-sm-6 col-12">
         
          <ul class="social-media-icons text-right" style="list-style: none;margin:0;">
			  
              <li><a class="fa fa-apple"></a></li>
              <li><a class="fa fa-wechat"></a></li>
              <li><a class="fa fa-qq"></a></li>
              <li><a class="fa fa-weibo"></a></li>
			  
			  
            </ul>
        </div>
      </div>
    </div>

</footer> 
	-->


	<script type="text/javascript">
	
window.onload=function(){
    var obt1=document.getElementById("bt1");
	var obt2=document.getElementById("bt2");
	var obt3=document.getElementById("bt3");
	var obt4=document.getElementById("bt4");
     //管理员视图的四个按钮点击显示表格。
    var odiv1=document.getElementById("thediv1");
	var odiv2=document.getElementById("thediv2");
	var odiv3=document.getElementById("thediv3");
	var odiv4=document.getElementById("thediv4");
	
	
	var sj=document.getElementById("shangjia");
	var sj_div = document.getElementById("shangjia_div");
	
	
	sj.onclick=function(){
		
		if(sj_div.style.display=="none"){
			
			sj_div.style.display="block";
			odiv1.style.display="none";
			odiv2.style.display="none";
		    odiv3.style.display="none";
		    odiv4.style.display="none";
		}
		else
			sj_div.style.display="none";
		    gly_div.style.display="block";
	}
	
	//订单总数
  obt1.onclick=function(){
    if(odiv1.style.display=="none"){
      odiv1.style.display="block";
        sj_div.style.display="none";
	    odiv2.style.display="none";
		odiv3.style.display="none";
		odiv4.style.display="none";
		     
    }
    else{
      odiv1.style.display="none";

    }
  }
   //成交订单
  obt2.onclick=function(){
    if(odiv2.style.display=="none"){
        odiv2.style.display="block";
        sj_div.style.display="none";
	    odiv1.style.display="none";
		odiv3.style.display="none";
		odiv4.style.display="none";
		
    }
    else{
      odiv2.style.display="none";

    }
  }
  //用户数量
  obt3.onclick=function(){
    if(odiv3.style.display=="none"){
      odiv3.style.display="block";
        sj_div.style.display="none";
	    odiv2.style.display="none";
		odiv1.style.display="none";
		odiv4.style.display="none";
		
    }
    else{
      odiv3.style.display="none";

    }
  }
  //库存总量
  obt4.onclick=function(){
    if(odiv4.style.display=="none"){
      odiv4.style.display="block";
        sj_div.style.display="none";
	    odiv2.style.display="none";
		odiv3.style.display="none";
		odiv1.style.display="none";
		
    }
    else{
      odiv4.style.display="none";

    }
  }




//以下是图片上传的script    

    
    var input = document.getElementById("file_input");    
    var result;    
    var dataArr = []; // 储存所选图片的结果(文件名和base64数据)  
    var fd;  //FormData方式发送请求    
    var oSelect = document.getElementById("select");  
    var oAdd = document.getElementById("add");  
    var oSubmit = document.getElementById("submit");  
    var oInput = document.getElementById("file_input");  

  

    if(typeof FileReader==='undefined'){    

        alert("抱歉，你的浏览器不支持 FileReader");    

        input.setAttribute('disabled','disabled');    

    }else{    

        input.addEventListener('change',readFile,false);    

    }　　　　　//handler    

    
    function readFile(){   

        fd = new FormData();    

        var iLen = this.files.length;  

        for(var i=0;i<iLen;i++){  

            if (!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)){　　//判断上传文件格式    

                return alert("上传的图片格式不正确，请重新选择");    

            }  

            var reader = new FileReader();  

            fd.append(i,this.files[i]);  

            reader.readAsDataURL(this.files[i]);  //转成base64    

            reader.fileName = this.files[i].name;  

  

            reader.onload = function(e){   
                var imgMsg = {    
                    name : this.fileName,//获取文件名    
                    base64 : this.result   //reader.readAsDataURL方法执行完后，base64数据储存在reader.result里    
				}   
                dataArr.push(imgMsg);    
                result = '<div class="delete">delete</div><div class="result"><img class="subPic" src="'+this.result+'" alt="'+this.fileName+'"/></div>';   
                var div = document.createElement('div');  
                div.innerHTML = result;    
                div['className'] = 'float';  
                document.getElementsByTagName('body')[0].appendChild(div);  　　//插入dom树    
                var img = div.getElementsByTagName('img')[0];  
                img.onload = function(){    
                    var nowHeight = ReSizePic(this); //设置图片大小    
                    this.parentNode.style.display = 'block';    
                    var oParent = this.parentNode;    
                    if(nowHeight){    
                        oParent.style.paddingTop = (oParent.offsetHeight - nowHeight)/2 + 'px';    
                    }    
                }   
                div.onclick = function(){  
                    $(this).remove();                  // 在页面中删除该图片元素  
                }  
            }    
        }    
    }    
  
    oSelect.onclick=function(){   
        oInput.value = "";   // 先将oInput值清空，否则选择图片与上次相同时change事件不会触发  
        //清空已选图片  
        $('.float').remove();        
        oInput.click();   
    }   



    oAdd.onclick=function(){  
        oInput.value = "";   // 先将oInput值清空，否则选择图片与上次相同时change事件不会触发  
        oInput.click();   
    }   



    oSubmit.onclick=function(){    
        if(!dataArr.length){    
            return alert('请先选择文件');    
		}    
    }    
}
   
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
