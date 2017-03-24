<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ include file="../include/header.jsp"%>
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> Board Read Page
		</h3>

		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> Form Elements
					</h4>
					<form class="form-horizontal style-form" method="post">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="subject"
									value="${bbsVO.subject}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="content" readonly="readonly">${bbsVO.content}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">작성자</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="writer"
									value="${bbsVO.writer}" readonly="readonly">
							</div>
						</div>
					</form>
				</div>
				<div class="form-group">
					<div class="col-sm-12" align="center">
						<button type="submit" class="btn btn-success">수정</button>
						&nbsp;&nbsp;
						<button type="submit" class="btn btn-warning">삭제</button>
						&nbsp;&nbsp;
						<button type="submit" class="btn btn-info">목록</button>
					</div>
				</div>
				<!-- role속성 : HTML5에 새로 추가된 속성으로, 시각장애인이 리더기를 사용해 웹페이지를 읽을 때 안내 -->
				<form role="form">
					<input type="hidden" name="bid" id="bid" value="${bbsVO.bid}" />
					<input type="hidden" name="page" value="${pageCriteria.page}" />
					<input type="hidden" name="numPerPage" value="${pageCriteria.numPerPage}" />
					<input type="hidden" name="searchType" value="${pageCriteria.searchType}" />
					<input type="hidden" name="keyword" value="${pageCriteria.keyword}" />
				</form>
				<script>
					$(document).ready(function(){
						var form = $("form[role='form']");
						$(".btn-success").on("click", function(){
							form.attr("action", "/bbs/modify");
							form.attr("method", "get");
							form.submit();
						});
						$(".btn-warning").on("click", function(){
							form.attr("action", "/bbs/delete");
							form.attr("method", "post");
							form.submit();
						});
						$(".btn-info").on("click", function(){
							form.attr("action", "/bbs/list");
							form.attr("method", "get");
							form.submit();
						});						
					});
				</script>
			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->
		
		<div class="row-mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> Reply
					</h4>
					<form class="form-horizontal style-form">
						<div class="form-group">
							<label class="col-sm-1 col-sm-1 control-label">댓글</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="replyContent" id="replyContent">
							</div>
							<div class="col-sm-1">
								<button id="writeBtn" class="btn btn-theme02">작성</button>
							</div>
						</div>
					</form>
					<ul id="reply"></ul>
					<div id="listPage"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var bid = $("#bid").val();
			var replyer = "REST테스트";
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
							getPageNum(1);
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
	</section>
	<!--/wrapper -->
</section>
<!-- /MAIN CONTENT -->

<!--main content end-->
<%@ include file="../include/footer.jsp"%>
