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
	                                 <td><a href="/bbs/read?bid=${bvo.bid}">${bvo.subject}</a></td>
	                                 <td>${bvo.writer}</td>
	                                 <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${bvo.regdate}"></fmt:formatDate></td>
	                                 <td class="numeric">${bvo.hit}</td>
	                             </tr>
                              </c:forEach>
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		  	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      <!--main content end-->
      
      <script type="text/javascript">
		var result = '${result}';
		
		if(result=='success'){
			alert("처리 완료");
		}
	  </script>
      
<%@ include file="../include/footer.jsp" %>