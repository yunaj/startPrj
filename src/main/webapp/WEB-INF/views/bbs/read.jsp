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
						<input type="hidden" name="bid" value="${bbsVO.bid}" />
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
					<input type="hidden" name="bid" value="${bbsVO.bid}" />
					<input type="hidden" name="page" value="${pageCriteria.page}" />
					<input type="hidden" name="numPerPage" value="${pageCriteria.numPerPage}" />
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
							self.location = "/bbs/list?page=${pageCriteria.page}&numPerPage=${pageCriteria.numPerPage}";
						});						
					});
				</script>
			</div>
			<!-- col-lg-12-->
		</div>
		<!-- /row -->

	</section>
	<! --/wrapper -->
</section>
<!-- /MAIN CONTENT -->

<!--main content end-->
<%@ include file="../include/footer.jsp"%>
