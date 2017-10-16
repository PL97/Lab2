<%@ page language="java" import = "hit.lab2.action.*, java.util.List" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

  <meta charset="UTF-8">

  <title>searchBook</title>
  <style type="text/css">
	.page{           
		text-align: center;            
		margin-top: 50px; 
	}
	
	.page a, .page span{            
		text-decoration: none;                        
		padding: 5px 7px;            
		color: #767675;            
		cursor: pointer;   
	}
	
	.page a:hover,.page span:hover{
		color: red; 
	}
	
	#text_area{
		width:60%;
		margin:20px;
	}
	
	.attribute{
		position:relative;
		right:30px;
	}
	
	.modal-body{
		height:75%;
	}
	
	#picarea{
		position: absolute;
		left:430px;
		bottom:60px;
		width: 250px;
		height:300px;
		background-size:cover;
      	background-repeat: no-repeat;
	}
	
	#profile{
		width:100%;
		width:100%;
	}
	
	.modal-content{
		width:700px;
		left:0%;
	}
	
  </style>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">

</head>

<body>
<!--information-->
<div class="modal fade" id="Information" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
            	<div id = "picarea">
					<img id = "profile"/>
				</div>
            	<div id = "text_area">
            		<table class="table table-responsive table-hover">
						<thead>
						<div class = "row">
							<tr class = "bookInformation">
							<div class = "col-xs-5">
								<th>Attribute</th>
							</div>
							<div class = "col-xs-5">
								<th>value</th>
							</div>
							</tr>
						</div>
						</thead>
						<tbody>
						<tr>
						<div class ="row">
							<div class = "col-xs-5">
							<td>
								<p class="attribute"><abbr title="国际标准书号">ISBN</abbr></p>
								<p class="attribute"><strong><abbr title="作者ID号">AuthorID</abbr></p>
								<p class="attribute"><abbr title="出版商">Publisher</abbr></p>
								<p class="attribute"><abbr title="出版日期">PublishDate</abbr></p>
								<p class="attribute"><abbr title="标价">Price</abbr></p>
								<p class="attribute"><abbr title="作者">Author</abbr></p>
								<p class="attribute"><abbr title="作者年龄">Age</abbr></p>
								<p class="attribute"><abbr title="作者国籍">Country</abbr></p>
							</td>
							<div class = "col-xs-5">
								<td>
									<p class="text-info" id = "infor-ISBN"></p>
									<p class="text-info" id = "infor-AuthorID"></p>
									<p class="text-info" id = "infor-Publisher"></p>
									<p class="text-info" id = "infor-PublishDate"></p>
									<p class="text-info" id = "infor-Price"></p>
									<p class="text-info" id = "infor-Author"></p>
									<p class="text-info" id = "infor-Age"></p>
									<p class="text-info" id = "infor-Country"></p>
								</td>
							</div>
							</div>
							</div>
						</tr>
						</tbody>
					</table>
				</div>
				</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--modify book information-->
<div class="modal fade" id="updateInfor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="bookname"></h4>
            </div>
			<form action = "modify" method = "post">
            <div class="modal-body">
            		<input type = "hidden" id = "ISBN_modify" name = "ISBN"></input>
            		<input type = "hidden" id = "Title_modify" name = "title"></input>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">AuthorID</span>
						<input id = "modify_AuthorID" name = "authorid" type = "number" class = "form-control input-group-lg" style = "width:420px" required="required"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon " style = "width:120px">Publisher</span>
						<input id = "modify_Publisher" name = "publisher" type = "text" class = "form-control input-group-lg" style = "width:420px" required="required"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">PublishDate</span>
						<input id = "modify_PublishDate" name = "publishdate" type = "date" class = "form-control input-group-lg" style = "width:420px" required="required"></input>
					</div>
					<br>
					<div class = "input-group">
						<span class = "input-group-addon" style = "width:120px">Price</span>
						<input id = "modify_Price" name = "price" type = "text" class = "form-control input-group-lg" style = "width:420px" required="required" onkeyup='clearNoNum(this)'></input>
					</div>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary">提交更改</button>
            </div>
			</form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="header">
  <h1>Qualified Books</h1>
  <a class="logo" href="index.jsp"><img src="images/logo.png" alt="return" class = "logo"></a>
  <div class = "chooseBtn">
	  <button class="select mybtn" id = "selectAll">&nbsp;</button>
	  <button class="send mybtn" id = "count" data-counter="0">&#10004;</button><br/>
	<form id = "removeBook" action = "delete" method = "post">
		<input type = "hidden" id = "countBook" name = "countBook"></input>
		<button type="button" id = "confirm" class = "mybtn asidebtn">delete</button>
	</form>
  </div>
</div>

<div style="text-align:center;clear:both" class = "content">
	<div class = "bookshelf">
	<%List<Book> tempList = (List<Book>)session.getAttribute("books");
	if(tempList != null){
		for(Book aBook : tempList){
			System.out.println(aBook.getTitle());
			String[] tempString = new String[1];
			tempString[0] = aBook.getAuthorID();
			List<Author> tempListAuthor = mainFrame.selectAuthor("AuthorID", tempString);
			if(!tempListAuthor.isEmpty()){
				Author tempAuthor = tempListAuthor.get(0);
			%>
			<div class = 'mydiv book' value = "<%=aBook.getISBN()%>">
				<p type = "hidden" id = "ISBN" value = "<%=aBook.getISBN() %>"></p>
				<p type = "hidden" id = "Title" value = "<%=aBook.getTitle() %>"></p>
				<p type = "hidden" id = "AuthorID" value = "<%=aBook.getAuthorID() %>"></p>
				<p type = "hidden" id = "Publisher" value = "<%=aBook.getPublisher() %>"></p>
				<p type = "hidden" id = "PublishDate" value = "<%=aBook.getPublishDate() %>"></p>
				<p type = "hidden" id = "Price" value = "<%=aBook.getPrice() %>"></p>
				<!--p type = "hidden" id = "AuthorID" value = "<%=tempAuthor.getAuthorID() %>"></p-->
				<p type = "hidden" id = "Name" value = "<%=tempAuthor.getName() %>"></p>
				<p type = "hidden" id = "Age" value = "<%=tempAuthor.getAge() %>"></p>
				<p type = "hidden" id = "Country" value = "<%=tempAuthor.getCountry() %>"></p>
				<img alt = '<%=aBook.getTitle()%>' class='img-responsive' id = 'bookpic' src = "images/bookimage/<%=aBook.getISBN()%>.jpg"/>
				<button class='mybtn detail' data-toggle='modal' data-target='#Information'>detail</button>
			</div>		
			<%
		}
		}
	}%>
	
	</div>
</div>

<div class = "aside">
	<div class="row">
		<div class="span2">
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#" id = "return">Navigation</a></li>
				<li><a href="#" id = "delete" >delete</a></li>
				<li><a href="#" id = "modify">modify</a></li>
			</ul>
		</div>
	</div>
</div>

<div class = "footer">
	<nav aria-label="Page navigation">
  <ul class="pagination">
    <li id = "previousPages">
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li>
    <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
    </a>
    </li>
  </ul>
</nav>
</div>
	<script src='js/jquery.min.js'></script>
	<script src="js/select.js"></script>
	<script src = "js/bootstrap.min.js"></script>
  

	<script>
		$(document).ready(function(){
			//$("li").attr('id','book');
			
		});
	</script>
	
	<script>
		
		var count = 0;
		//产生对应块和页码
		$(document).ready(function(){
			/* $.session.set('countDelete', count);
			alert($.session.get('countDelete')); */
			//隐藏部分元素
			$("#selectAll").hide();
			$("#count").hide();
			$("#confirm").hide();
			var $div = $(".book");
			var contentH =  $(".content").height();
			var contentW = $(".content").width();
			var picH  = contentH/2.5;
			var picW = (contentH)/2.5;
			$div.css("height", picH);
			$div.css("width", picW);
			for(j = 1;j<2;j++){
				var $li = $("<li></li>");
				var $a = $("<a href = '#'></a>");
				$a.text(j);
				$li.append($a);
				$("#previousPages").after($li);
			}
		});
		
		window.onresize = function(){
			var $div = $(".book");
			var contentH =  $(".content").height();
			var contentW = $(".content").width();
			var picH  = contentH/2.5;
			var picW = (contentH)/2.5;
			$div.css("height", picH);
			$div.css("width", picW);
			//update pages
		}
		
		$("#delete").click(function(){
			$("#modify").text("modify");
			if($(".mydiv").hasClass("modify")){
				$(".mydiv").removeClass("modify");
			}
			$("#selectAll").toggle();
			$("#count").toggle();
			$("#confirm").toggle();
			$(".mydiv").toggleClass("waitForDelete");
			//$("li").attr("id", "waitForDelete");
			if($("#delete").text() == "delete"){
				$("#delete").text("cancel");
				$(".detail").hide();
			}
			else{
				$("#delete").text("delete");
				$(".book").removeClass("selected");
				$("input").remove(".submitInfor");
				$(".detail").show();
			}
		});
	
		//删除
		$("#confirm").click(function(){
			$("div.selected").addClass("animated hinge");
			$("div.selected").addClass("animated fadeOut");
			$("div.selected").fadeOut(2000, function(){
				$("div.selected").remove(); counter();
				$("#removeBook").submit();
			});
		});
		
		$("#modify").click(function(){
			$("input").remove(".submitInfor");
			$("#delete").text("delete");
			$("#count").hide();
			$("#confirm").hide();
			$("#selectAll").hide();
			$(".mydiv").removeClass("selected");
			counter();
			if($(".mydiv").hasClass("waitForDelete")){
				$(".mydiv").removeClass("waitForDelete");
			}
			$(".mydiv").toggleClass("modify");
			if($(".mydiv").hasClass("modify")){
				$(this).text("cancel");
				$(".detail").hide();
			}
			else{
				$(this).text("modify");
				$(".detail").show();
			}
		});
		
		$("#return").click(function(){
			$("input").remove(".submitInfor");
			$("#modify").text("modify");
			$("#delete").text("delete");
			$(".mydiv").removeClass("waitForDelete");
			$(".mydiv").removeClass("modify");
			$(".detail").show();
			$("#count").hide();
			$("#confirm").hide();
			$("#selectAll").hide();
		});
		
		$(".content").on("click",".modify" ,function(){
			$("#updateInfor").modal();
			$("#ISBN_modify").val($(this).attr("value"))
			$("#Title_modify").val($(this).children("#Title").attr("value"));
			$("#bookname").text($(this).children("#Title").attr("value"));
			$("#modify_AuthorID").val($(this).children("#AuthorID").attr("value"));
			$("#modify_Price").val($(this).children("#Price").attr("value"));
			$("#modify_Publisher").val($(this).children("#Publisher").attr("value"));
			$("#modify_PublishDate").val($(this).children("#PublishDate").attr("value"));
			//alert(($("#ISBN_modify").attr("value")));
			//alert($(this).children("#Title").attr("value"));
		});	
	
		$(".content").on("click",".mydiv" ,function(){
			if($(this).hasClass("selected")){
				var $input = $("<input type = 'hidden' class = 'submitInfor'></input>");
				$input.val($(this).attr("value"));
				$("#removeBook").append($input);
				$input.attr("name", ++count);
				$("#countBook").val(count);
				//$.session.set('countDelete', count);
				//alert($input.attr("name"));
				/* var count = $.session.get("countDelete") + 1;
				$.session.set('countDelete', count);
				alert(count);
				$input.attr("name", count); */
			}
		});
		
		//展示详细信息
		$(".detail").click(function(){
			$("#profile").attr("src", $(this).prev().attr("src"));
			//alert($(this).prev()[0].src);
			var $ISBN = $(this).siblings("#ISBN").attr("value");
			var $Title = $(this).siblings("#Title").attr("value");
			var $AuthorID = $(this).siblings("#AuthorID").attr("value");
			var $Publisher = $(this).siblings("#Publisher").attr("value");
			var $PublishDate = $(this).siblings("#PublishDate").attr("value");
			var $Price = $(this).siblings("#Price").attr("value");
			var $Name = $(this).siblings("#Name").attr("value");
			var $Age = $(this).siblings("#Age").attr("value");
			var $Country = $(this).siblings("#Country").attr("value");
			//alert($ISBN + $Title + $AuthorID + $Publisher + $PublishDate + $Price + $Name + $Age +$Country);
			$("#infor-ISBN").text($ISBN);
			$("#infor-AuthorID").text($AuthorID);
			$("#infor-Publisher").text($Publisher);
			$("#infor-PublishDate").text($PublishDate);
			$("#infor-Price").text($Price);
			$("#infor-Author").text($Name);
			$("#infor-Age").text($Age);
			$("#infor-Country").text($Country);
			$("#myModalLabel").text($Title);
			
			/* <p class="text-info" id = "infor-ISBN"></p>
			<p class="text-info" id = "infor-AuthorID"></p>
			<p class="text-info" id = "infor-Publisher"></p>
			<p class="text-info" id = "infor-PublishDate"></p>
			<p class="text-info" id = "infor-Price"></p>
			<p class="text-info" id = "infor-Author"></p>
			<p class="text-info" id = "infor-Age"></p>
			<p class="text-info" id = "infor-Country"></p> */
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