
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Richard's Book Store</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/font-icon.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
	#dropBox{
		position: absolute;
		left:330px;
		bottom:90px;
		width: 240px;
		height:300px;
		border: solid 2px grey;
		background-size:cover;
		background-image: url("images/welcome.jpg");
      	background-repeat: no-repeat;
	}
	
	#file{
		position: relative;
		bottom:20px;
		left:50px;
	}
	
	#addAuthor{
		width:25%;
		 margin:0 auto;
	}
	
	.author_btn{
		position:relative;
		right:42%;
	}
	
	.addbtn{
		position:relative;
		left:100px;
	}
	#recommend{
		position:relative;
		left:3%;
		top:-50px;
	}
	#works{
		position:relative;
		top:-50px;
	}
	
	#welcome{
		position:relative;
		float:right;
		left:510px;
		top:-50px;
	}
	
	#searchBook{
		position:relative;
		top:12px;
	}
	
</style>
</head>

<body>
<!-- 模态框（Modal） -->
<% 
    String isExist = (String)request.getAttribute("bookexist");
	System.out.println("bbb");
    if(isExist!=null&&isExist.equals("true")) {
    	System.out.println("aaa");
    %>
	<script language="javascript"> //JavaScript脚本标注
	alert("ISBN has been taken, please change another one!");
	</script>
	<% 
}%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					Add new book
				</h4>
			</div>
			<div>
				<form name = "upload_box" action ="uploadBook" method = "post" enctype="multipart/form-data">
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">ISBN</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "书码..." required="required"  name = "ISBN"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">Title</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "书名..." required="required" name = "Title"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">AuthorID</span>
						<input type = "number" class = "form-control input-group-lg" placeholder = "作者ID..." required="required" name = "AuthorID"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon " style = "width:120px">Publisher</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "出版人..." required="required" name = "Publisher"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">PublishDate</span>
						<input type="date" class = "form-control input-group-lg" placeholder = "出版日期..." required="required" name = "PublishDate"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">Price</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "价格（只能输入数字，小数点最多两位）..." required="required" name = "Price" onkeyup='clearNoNum(this)'></input>
					</div>
					<div id = "dropBox" class="text-center">
						 <img id="thumbnail"/>
					</div>
					<!--input id="fileInput" type="file" onchange="processFiles(this.files)"-->
					<div class="modal-footer">
						<button type="button" class="btn btn-default addbtn" data-dismiss="modal">close</button>
						<button type="submit" value = "submit"class="btn btn-primary addbtn"><i class = "fa fa-paper-plane">submit</i></button>
						<label for="myFile">Upload your file</label>
						<input type="file" name="myFile"  title="请选择图片" id="file" multiple="" accept="image/png,image/jpg,image/gif,image/JPEG" onchange="processFiles(this.files)">
					</div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<% String temp = (String)session.getAttribute("UpdateAuthor");
	System.out.print(333);
	if(temp != null && temp.equals("true")){
		System.out.print(444);
		session.putValue("UpdateAuthor", "false");
	%>
<div class="modal fade" id="addAuthor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<span class ="text-primary btn-block"><em>Personal information</em></span>
				</h4>
			</div>
			<div class = "modal-dialog row" id = "AuthorInput">
				<form name = "uploadAuthor_box" action ="uploadAuthor" method = "post" class = "class="modal-content">
					<div class = "input-group col-xs-7">
						<span class = "input-group-addon" style = "width:90px">Name</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "姓名..." required="required" name = "Name"></input>
					</div>
					<br>
					<div class = "input-group col-xs-7">
						<span class = "input-group-addon" style = "width:90px">Age</span>
						<input type = "number" class = "form-control input-group-lg" placeholder = "年龄..." required="required" name = "Age" onafterpaste="this.value=this.value.replace(/\D/g,'')" min="1" max="100"></input>
					</div>
					<br>
					<div class = "input-group col-xs-7">
						<span class = "input-group-addon" style = "width:90px">Country</span>
						<input type = "text" class = "form-control input-group-lg" placeholder = "国家..." required="required" name = "Country"></input>
					</div>
					<!--input id="fileInput" type="file" onchange="processFiles(this.files)"-->
					<div class="modal-footer">
						<!--button type="button" class="btn btn-default author_btn" data-dismiss = "modal">close</button-->
						<button type="submit" value = "submit"class="btn btn-primary author_btn"><i class = "fa fa-paper-plane">submit</i></button>
					</div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<%}%>
<!-- header section -->
<section class="banner" role="banner">
<!--header navigation -->
  <header id="header">
    <div class="header-content clearfix"> <a class="logo" href="index.jsp"><img src="images/logo.png" alt=""></a>
      <nav class="navigation" role="navigation">
        <ul class="primary-nav">
          <li>
			  <div id = "searchBook" class = "row">
			  <form action = "search" method = "post" >
				<div class = "col-xs-6">
					<input type = "text" name = "search_box" placeholder = "search.." class = "form-control" required/>
				</div>
				<div class = "col-xs-3">
					<button type = "submit" value = "submit"class = "btn waves-effect waves-button"><i class = "">Go!</i></button>
				</div>
			  </div>
			  </form>
		  </li>
		   <li><a href="about.jsp">About</a></li>
		   <li>
			<!-- 按钮触发模态框 -->
			<a data-toggle="modal" data-target="#myModal" style="cursor:pointer">Add</a>
		   <li>
        </ul>
      </nav>
      <a href="#" class="nav-toggle">Menu<span></span></a> </div>
      </header>
      <!--header navigation -->
  </section>
  <!-- header section -->
  <!-- text banner section -->
<section id="banner" class="banner no-padding">
  <div class="container-fluid">
    <div class="row no-gutter">
      <div class="flexslider">
        <ul class="slides">
          <li>
            <div class="col-md-12">
              <blockquote class = "row">
				<div class = "col-xs-6">
                <h1>Richard's <i class = "text-primary">Book Store<i></h1>
				</div>
				<div class = "col-xs-8">
                <p id = "welcome" class = ".text-info">nice to see you here</p>
				</div>
              </blockquote>
            </div>
          </li>
        </ul>
      </div>
     </div>
  </div>
</section>
<!-- Text banner section --> 
<!-- portfolio section -->
<h3 id = "recommend">Recommend Books</h3></br>
<section id="works" class="works section no-padding">
  <div class="container-fluid">
    <div class="row no-gutter">
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show1.jpg" class="work-box"> <img src="images/work-1.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show2.jpg" class="work-box"> <img src="images/work-2.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show3.jpg" class="work-box"> <img src="images/work-3.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show4.jpg" class="work-box"> <img src="images/work-4.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show5.jpg" class="work-box"> <img src="images/work-5.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show6.jpg" class="work-box"> <img src="images/work-6.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show7.jpg" class="work-box"> <img src="images/work-7.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
      <div class="col-lg-3 col-md-6 col-sm-6 work"> <a href="images/show8.jpg" class="work-box"> <img src="images/work-8.jpg" alt="">
        <div class="overlay">
          <div class="overlay-caption">
            <h5 class "book">click me</h5>
            <p><i class="fa fa-search-plus fa-2x"></i></p>
          </div>
        </div>
        <!-- overlay --> 
        </a> </div>
    </div>
  </div>
</section>
<!-- portfolio section --> 
  <!-- footer -->
<footer class="section footer">
  <div class="footer-bottom">
    <div class="container">
      <div class="col-md-12">
        <p>© 2017 All rights reserved. All Rights Reserved<br>
          Get contact me, please try   <address>pengle@126.com</address></p>
      </div>
    </div>
  </div>
</footer>
<!-- footer --> 
<!-- JS FILES -->
<script src="js/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flexslider-min.js"></script> 
<script src="js/jquery.fancybox.pack.js"></script> 
<script src="js/jquery.waypoints.min.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/modernizr.js"></script> 
<script src="js/main.js"></script>
<script>
    var dropBox;
 
    window.onload = function() {
      dropBox = document.getElementById("dropBox");
      dropBox.ondragenter = ignoreDrag;
      dropBox.ondragover = ignoreDrag;
      dropBox.ondrop = drop;
    }
 
    function ignoreDrag(e) {
      //因为我们在处理拖放，所以应该确保没有其他元素会取得这个事件
      e.stopPropagation();
      e.preventDefault();
    }
 
    function drop(e) {
      //取消事件传播及默认行为
      e.stopPropagation();
      e.preventDefault();
      
      //取得拖进来的文件
      var data = e.dataTransfer;
      var files = data.files;
      //将其传给真正的处理文件的函数
      processFiles(files);
    }
 
    function processFiles(files) {
      var file = files[0];
      var output = document.getElementById("fileOutput");
      //创建FileReader
      var reader = new FileReader();
      //告诉它在准备好数据之后做什么
      reader.onload = function (e) {
        //使用图像URL来绘制dropBox的背景
        dropBox.style.backgroundImage = "url('" + e.target.result + "')";
		
      };
      //读取图片
      reader.readAsDataURL(file);
    }
 
    function showFileInput() {
      var fileInput = document.getElementById("fileInput");
      fileInput.click();
    }
    
    $(document).ready(function(){
    	$("#addAuthor").modal(); 
    });
    
    
    function clearNoNum(obj) {  
        obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符  
            obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字而不是  
            obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
            obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数  
          
    } 
  </script>
</body>
</html>

