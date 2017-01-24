<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="../include/header.jsp" %>

 <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Board</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> List</h4>
                          <section id="unseen">
                          	<form class="form-inline">
                          		<div class="form-group">
		                          	<select class="form-control" name="searchType" id="searchType">
		                          		<option value="N" ${pageCriteria.searchType == null ? 'selected' : ''}>선택</option>
		                          		<option value="S" ${pageCriteria.searchType == 'S' ? 'selected' : ''}>제목</option>
		                          		<option value="C" ${pageCriteria.searchType == 'C' ? 'selected' : ''}>내용</option>
		                          		<option value="W" ${pageCriteria.searchType == 'W' ? 'selected' : ''}>작성자</option>
		                          		<option value="SC" ${pageCriteria.searchType == 'SC' ? 'selected' : ''}>제목+내용</option>
		                          		<option value="CW" ${pageCriteria.searchType == 'CW' ? 'selected' : ''}>내용+작성자</option>
		                          		<option value="SCW" ${pageCriteria.searchType == 'SCW' ? 'selected' : ''}>제목+내용+작성자</option>
		                          	</select>
	                          	</div>
	                          	<div class="form-group">
	                          		<input type="text" name="keyword" id="keyword" value="${pageCriteria.keyword}" class="form-control"/>
	                          	</div>
	                          	<div class="form-group">
	                          		<button id="searchBtn" class="btn btn-theme">검색</button>
	                          	</div>	                          	                          	
                          	</form><br>
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>No</th>
                                  <th>Subject</th>
                                  <th>Writer</th>
                                  <th>regDate</th>
                                  <th class="numeric">Hit</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${list}" var="bvo">
	                             <tr>
	                                 <td>${bvo.bid}</td>
	                                 <td><a href="/bbs/read${pagingMaker.makeURI(pagingMaker.pageCriteria.page)}&bid=${bvo.bid}">${bvo.subject}</a></td>
	                                 <td>${bvo.writer}</td>
	                                 <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bvo.regdate}"></fmt:formatDate></td>
	                                 <td class="numeric">${bvo.hit}</td>
	                             </tr>
                              </c:forEach>
                              </tbody>
                          </table>
					</section>
					
				</div><!-- /content-panel -->

				<div class="showback" align="center">
					<div class="btn-group">
						<c:if test="${pagingMaker.prev}">
							<a href="list${pagingMaker.makeURI(pagingMaker.startPage-1)}">
								<button type="button" class="btn btn-theme03">◁</button>
							</a>
						</c:if>
						<c:forEach begin="${pagingMaker.startPage}"
							end="${pagingMaker.endPage}" var="pNum">
							<a href="list${pagingMaker.makeURI(pNum)}">
								<button type="button"
									class="${pagingMaker.pageCriteria.page == pNum? 'btn btn-theme' : 'btn btn-default'}">${pNum}</button>
							</a>
						</c:forEach>
						<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
							<a href="list${pagingMaker.makeURI(pagingMaker.endPage+1)}">
								<button type="button" class="btn btn-theme03">▷</button>
							</a>
						</c:if>
					</div>
				</div>
			</div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		  	
		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->
      <!--main content end-->
      
      <script type="text/javascript">
		var result = '${result}';
		
		if(result=='success'){
			alert("처리 완료");
		}
		
		/* $(document).ready(function(){
			$("#searchBtn").on("click", function(){
				self.location = "/bbs/list${pagingMaker.makeURI(1)}";
			});
		}); */
	  </script>
      
<%@ include file="../include/footer.jsp" %>
