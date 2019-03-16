<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>管理员后台</title>
	
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />

  <link rel="stylesheet" href="css/amazeui.min.css"/>
  <link rel="stylesheet" href="css/admin.css">
  <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css"> 
	
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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 20px 80px 12px 16px;
    z-index: 1;
}
.dropdown:hover .dropdown-content {
    display: block;
}

.table-scroll {
  height:500px;
  overflow:auto;  
  margin-top:20px;
	width: 90%;
	margin-left:50px;
	z-index: 1;
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

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
      <li><a href="主页.html"><span class="am-icon-home"></span> 首页</a></li>
      <li><a href="#" id="shangjia"><span class="am-icon-pencil-square-o"></span> 上架</a></li>
		<div id="shangjia_div" style="display:none">
	    <li>编号 :  <input ></li>
		<li>书名 :  <input ></li>
		<li>价格 :  <input ></li>
		<li>图片 :  <input ></li>
		<li class="am-text-center"><button>提交</button></li>
		</div>
      <li><a href="#"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>

	   <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> 交易总额</p>
        <p>300659元</p>
      </div>
    </div>
	  
    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>时光静好，与君语；细水流年，与君同。—— Amaze</p>
      </div>
    </div>

   
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">管理员视图</strong> / <small>一些常用模块</small></div>
    </div>

    <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
      <li id="bt1"><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>订单总数<br/>2300</a></li>
      <li id="bt2"><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>308</a></li>
      <li id="bt3"><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>用户数量<br/>80082</a></li>
      <li id="bt4"><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>库存总量<br/>3000</a></li>
    </ul>
	  
	  <!--订单总数-->
 <div  id="thediv1" style="display:none">  
	  <div  class="table-scroll">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>订单号</th><th>商品编号</th><th>下单时间</th><th>订单商品数</th><th>管理</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>625006324</td><td>9608-0600</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">3</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 查看物流</a></li>
					 <br>
                  <li style="list-style-type:none"><a href="#">2. 删除订单</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
			  
          <tr>
            <td> <input> </td>  <td> <input> </td>
			  
            <td><a href="#"> <input> </a></td>
			  
            <td><input></td>
            <td>       
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle>查询</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div> 
	  </div>
	  
	  
	  <!--成交订单-->
	  <div id= "thediv2" style="display:none">
	  
	   <div  class="table-scroll">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>订单号</th><th>交易用户名</th><th>成交日期</th><th>商品数量</th><th>管理</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					 <br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
			  
          <tr>
            <td> <input> </td>  <td> <input> </td>
			  
            <td><a href="#"> <input> </a></td>
			  
            <td><input></td>
            <td>       
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle>查询</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
		  
	  </div>
	  
	  
	  <!--用户数量-->
	  <div  id= "thediv3" style="display:none">
	  
	   <div  class="table-scroll">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>用户ID</th><th>最近成交时</th><th>注册日期</th><th>交易的订单数</th><th>管理</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					 <br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
			  
          <tr>
            <td> <input> </td>  <td> <input> </td>
			  
            <td><a href="#"> <input> </a></td>
			  
            <td><input></td>
            <td>       
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle>查询</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
		  
	  </div>
	  
	  <!--库存总量-->
    <div  id= "thediv4" style="display:none">
      <div  class="table-scroll">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead>
          <tr>
            <th>ISBN</th><th>书名</th><th>上架日期</th><th>剩余库存</th><th>管理</th>
          </tr>
          </thead>
          <tbody>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					 <br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
          <tr><td>9608-0600</td><td>斗罗大陆</td><td><a href="#">2018.12.10</a></td> <td><span class="am-badge am-badge-success">20</span></td>
            <td>
              <div class="dropdown">
                <button class="am-btn am-btn-default am-btn-xs  "><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                <ul class="dropdown-content">
                  <li style="list-style-type:none"><a href="#">1. 增加库存</a></li>
					<br>
                  <li style="list-style-type:none"><a href="#">2. 下架商品</a></li>
                </ul>
              </div>
            </td>
          </tr>
			  
          <tr>
            <td> <input> </td>  <td> <input> </td>
			  
            <td><a href="#"> <input> </a></td>
			  
            <td><input></td>
            <td>       
                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle>查询</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    
  </div>
  <!-- content end -->

</div>

<footer class="footer-bottom" style="background-color:dimgrey">
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
			
		}
		else
			sj_div.style.display="none";
	}
  obt1.onclick=function(){
    if(odiv1.style.display=="none"){
      odiv1.style.display="block";
      
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
     
	  odiv2.style.display="none";
		odiv3.style.display="none";
		odiv1.style.display="none";
		
    }
    else{
      odiv4.style.display="none";
      
    }
  }
}
</script>


</body>
</html>
