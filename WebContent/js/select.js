// item selection

$(".content").on("click",".mydiv" ,function(){
	//if($(this).attr("class").toString() == "mydiv book waitForDelete"||$(this).attr("class").toString() == "mydiv book waitForDelete selected"){
	if($(this).hasClass("waitForDelete")){
		$(this).toggleClass('selected');
	}
 
 if ($('div.selected').length == 0)
  
  $('.select').removeClass('selected');
  
else
   
 $('.select').addClass('selected');
 
 counter();
});


// all item selection
$('.select').click(function () 
{
 
 if ($('div.selected').length == 0)
 {
   
 $('div.book').addClass('selected');
 
   $('.select').addClass('selected');
 
 }
  
else {
 
   $('div.book').removeClass('selected');
   
 $('.select').removeClass('selected');
 
 }
  
counter();
});


// number of selected items
function counter() {
 
 if ($('div.selected').length > 0)
   
 $('.send').addClass('selected');
 
 else
   
 $('.send').removeClass('selected');
 
 $('.send').attr('data-counter',$('div.mydiv.selected').length);
}
