<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
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
	div#displayBook{
		transform: rotateY(60deg);
		-webkit-transform: rotateY(60deg);
	}
	#synopsis{
		position:relative;
		float:right;
		right:100px;
		top:-100px;
	}
	#webtitle{
		position:relative;
		top:50px;
	}
	#teams{
		
	}
	#bookpic{
		position:relative;
		right:10%;
	}
	
	.bio-content{
		position:relative;
		left:8%;
	}
</style>
</head>

<body>
<!-- header section -->
<section class="banner" role="banner">
<!--header navigation -->
  <header id="header">
    <div class="header-content clearfix"> <a class="logo" href="index.jsp"><img src="images/logo.png" alt=""></a>
      <nav class="navigation" role="navigation">
      </nav>
      <a href="#" class="nav-toggle">Menu<span></span></a> </div>
  </header>
  <!--header navigation -->
</section>
<!-- header section --> 
<!-- title section -->
<section id="banner" class="banner no-padding">
  <div class="container-fluid">
    <div class="row no-gutter">
      <ul class="slides">
        <li>
          <div class="col-md-12">
            <blockquote>
              <h2 class = "text-primary" id = "webtitle">Ricahrd Book store</h2>
              <p id = "synopsis">About the website</p>
              
            </blockquote>
          </div>
        </li>
      </ul>
    </div>
  </div>
</section>
<!-- title section --> 
<!-- About section -->
<section id="teams" class="section teams">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-sm-5">
        <div class="bio" id = "bookpic"> <img src="images/bio-image.jpg" alt="" class="img-responsive"> </div>
      </div>
      <div class="col-md-7 col-sm-7"> 
        <div class="bio">
          <div class="bio-content">
			<div class = "row">
				<div class = "col-xs-3" id = "displayBook"><img src = "images/show1.jpg" class = "img-responsive"/></div>
				<div class = "col-xs-3" id = "displayBook"><img src = "images/show2.jpg" class = "img-responsive"/></div>
				<div class = "col-xs-3" id = "displayBook"><img src = "images/show3.jpg" class = "img-responsive"/></div>
				<div class = "col-xs-3" id = "displayBook"><img src = "images/show4.jpg" class = "img-responsive"/></div>
			  </div>
			<p class = "text-info">English</p>
            <p>The website is designed for book mangement. You can operate it throught the index page and search for the books you want by various means. You can do it by searching author's name. 
            You can also modify or delete a book if you want. The index page provides some books recommend by the designer, click it and check the book. You can operate all the books in the search page.
            By the way, you can return the index frame by clicking the icon display on the upper left. Want more information about the website, please contact me by the information printed blow the page. Thanks!</p>
			<p class = "text-info" id = "hide" style = "color:red" onclick = "myfun()"><u>translate</u></p>
            <p class = "translateInfo" >本站用于管理图书所用。可在首页搜索栏进行相关图书搜索，可针对作者姓名进行检索。可随意增添或修改相关图书信息。首页有基本推荐图书，可点击查看。您可在查询页面对数据库中图书进行操作。值得一提的是，使用左上方图标可快速返回主界面。如有任何相关问题可及时联系我，网页尾部提供相关信息，谢谢！</p>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- About section --> 
<!-- footer -->
<footer class="section footer">
  <div class="footer-bottom">
    <div class="container">
      <div class="col-md-12">
        <p>© 2017 All rights reserved. All Rights Reserved<br>
           Get contact me, try <i class= "text-info icon-envelope">pengle@126.com</i></p>
      </div>
    </div>
  </div>
</footer>
<!-- footer -->
<!-- JS FILES --> 
<script src="js/jquery-3.2.1.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flexslider-min.js"></script> 
<script src="js/jquery.fancybox.pack.js"></script> 
<script src="js/jquery.waypoints.min.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/modernizr.js"></script> 
<script src="js/main.js"></script>
<script>
	function myfun(){
	  $(".translateInfo").fadeToggle(1000);
	  if($("#hide").text() == "translate")
		$("#hide").text("hide");
	  else
		$("#hide").text("translate");
	}
</script>
<script>
	$(document).ready(function(){
		$(".translateInfo").hide();
	});
	$("div#displayBook").mouseover(function(){  
		//$("#displayBook").css({'transform':'rotate(360deg)'});    
			$(this).css({'webkitTransform':'rotateY(0deg)'});
			$(this).css({'transform':'rotateY(0deg)'});
	});
	$("div#displayBook").mouseleave(function(){
		//$("#displayBook").css({'transform':'rotate(60deg)'});  
		$(this).css({'webkitTransform':'rotateY(60deg)'});
		$(this).css({'transform':'rotateY(60deg)'});
	});
</script>
</body>
</html>

