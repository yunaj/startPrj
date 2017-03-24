<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src='/resources/fullcalendar-3.1.0/lib/jquery.min.js'></script>
</head>
<body>
<h3>Reply REST + Ajax Test</h3>

<div>
	<div>
		작성자 : <input type="text" name="replyer" id="replyer"/>
	</div>
	<div>
		내용   : <input type="text" name="replyContent" id="replyContent" />
	</div>
	<div>
		<button id="writeBtn">작성</button>
	</div>
</div>

<h4>댓글리스트</h4>
<ul id="reply"></ul>
<div id="listPage"></div>

<script type="text/javascript">
var bid = 4;
//replyList();
getPageNum(1);

function getPageNum(page){
	$.getJSON("/replies/" + bid + "/" + page, function(data){
		console.log("댓글페이지: "+ data.list.length);
		
		var str = "";
		$(data.list).each(function(){
			
			str += "<li data-rebid='" + this.rebid + "' class='list'>"
			 + this.rebid + " | " + this.replyContent
			 + "&nbsp&nbsp<button>수정</button>" 
			 + "<button onclick='javascript:deleteReply(" + this.rebid +  ")'>삭제</button>"
			 + "</li>";
		});
		
		
		$("#reply").html(str);
		
		showPageNum(data.pagingMaker);
	});
}

function showPageNum(pagingMaker){
	var str = "";
	console.log(pagingMaker)
	if(pagingMaker.prev){
		str += "<li><a href='" + (pagingMaker.startPage-1) + "'>◀</a></li>" ;
	}
	
	for(var i=pagingMaker.startPage, end=pagingMaker.endPage; i<=end; i++){
		str += "<a href='javascript:getPageNum(" + i + ")'><button>"+ i + "</button></a>";
	}
	
	if(pagingMaker.next){
		str += "<li><a href='" + (pagingMaker.endPage+1) + "'>▶</a></li>" ;
	}
	
	$("#listPage").html(str);
}

$("#writeBtn").on("click", function(){
	var replyer = $("#replyer").val();
	var replyContent = $("#replyContent").val();
	
	$.ajax({
		type : 'post',
		url : '/replies',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"  //web.xml에 필터 설정 해줘야 함. get/post만 인식하는 경우가 있어서 사용
		},
		dataType : 'text',
		data : JSON.stringify({
			bid : bid,
			replyer : replyer,
			replyContent : replyContent
		}),
		success : function(result){
			if(result == 'Success'){
				replyList();
			}
		}
	});
});

$("#reply").on("click", ".list button", function(){  //ajax로 댓글 리스트를 뿌리기 전까진 해당 버튼이 없어서 선택자를 버튼으로 했을 경우 동작 안함.
	var rebid = $(this).parent().attr("data-rebid");
	var replyContent = $("#replyContent").val();
	$.ajax({
		type : 'put',
		url : '/replies/'+rebid,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"  //web.xml에 필터 설정 해줘야 함. get/post만 인식하는 경우가 있어서 사용
		},
		dataType : 'text',
		data : JSON.stringify({
			rebid : rebid,
			replyContent : replyContent
		}),
		success : function(result){
			if(result == 'Success'){
				replyList();
			}
		}
	});
	
});

function deleteReply(rebid){
	$.ajax({
		type:'delete',
		url : '/replies/'+rebid,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"  //web.xml에 필터 설정 해줘야 함. get/post만 인식하는 경우가 있어서 사용
		},
		dataType : 'text',
		success : function(result){
			console.log(result);
			if(result == 'Success'){
				alert("삭제성공");
				replyList();
			}
		}
	})
}

function replyList(){
	$.getJSON("/replies/list/"+ bid, function(data){
		var str = "";
		$(data).each(function(){
			
			str += "<li data-rebid='" + this.rebid + "' class='list'>"
			 + this.rebid + " | " + this.replyContent
			 + "&nbsp&nbsp<button>수정</button>" 
			 + "<button onclick='javascript:deleteReply(" + this.rebid +  ")'>삭제</button>"
			 + "</li>";
		});
		
		
		$("#reply").html(str);
	});
}

</script>
</body>
</html>