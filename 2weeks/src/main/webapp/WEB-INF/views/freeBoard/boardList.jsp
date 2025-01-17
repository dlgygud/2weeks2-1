<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="자유게시판"/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
 .category{
 	font-size:12px;
 }
.container {
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: 20%;
  margin-top:5%;
}
.profile{
	width:24px;
	height:24px;
}
.heart {
width:13px;
height:13px;
}
.eye{
width:13px;
height:13px;
}
.comment{
width:13px;
height:13px;
}
.icon{
font-size: 8px;
}
a{
text-decoration: none;
}

</style>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<section id="content">
	<div class="container">
		<div class="form-group row justify-content-center">
			<form  action="${path }/freeboard/searchBoard.do" method="get">
				<div class="input-group mb-3">
						<select name="searchType" class="form-control" id="searchType">
							<option value="POST_TITLE" ${FreeBoard.searchType eq POST_TITLE ? 'selected' : '' }>제목</option>
							<option value="post_Content" ${FreeBoard.searchType eq 'post_Content' ? 'selected' : '' }>본문</option>
							<option value="user_Id" ${FreeBoard.searchType eq 'user_Id' ? 'selected' : '' }>작성자</option>
							<option value="tc" ${fb.searchType eq 'tc' ? 'selected' : '' }>제목/내용</option>
							<option value="tw" ${fb.searchType eq 'tw' ? 'selected' : '' }>제목/작성자</option>
							<option value="cw" ${fb.searchType eq 'cw' ? 'selected' : '' }>내용/작성자</option>
							<option value="tcw" ${fb.searchType eq 'tcw' ? 'selected' : '' }>전체</option>
						</select>
						<input type="text" class="form-control" placeholder="Search" name="keyword" value="${fb.keyword }" >
					<div class="input-group-append">
						<button class="btn btn-success" type="submit">Go</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row" >
		<c:forEach var="b" items="${list }">
				<div class="card col-md-3 m-2">
					<div class="card-header m-3">
						<a href="${path }/freeboard/readView?no=${b.post_Sq }"><img
							src="${path }/resources/images/freeboardPic/default.png"
							class="card-img-top row" alt="이미지"></a>
					</div>
					<div class="card-body">
						<p class="card-text category">${b.category } &nbsp; &nbsp; [${b.post_Dt }]</p>
						<h4 class="card-title"><a href="${path }/freeboard/readView?no=${b.post_Sq }"><c:out value="${b.post_Title }"/></a></h4>
						<p class="card-text">${b.post_Content }</p>
						<p class="card-text"><img src="${path}/resources/images/icons/profile.svg" class="profile " alt="프로필사진"> ${b.user_Id }</p>
						<div class="row">
						<div class='col-4'>
							<img alt="좋아요" src="${path }/resources/images/icons/heart.svg" class="heart">&nbsp;<p class="icon">${b.post_Like_Cnt }</p>
						</div>
						<div class="col-4">
							<img alt="조회수" src="${path }/resources/images/icons/eye-6.svg" class="eye">&nbsp;<p class="icon">${b.post_Cnt }</p>
						</div>
						</div>
					</div>
				</div>
			</c:forEach>
						<div class="col-4">
							<img alt="댓글수" src="${path }/resources/images/icons/comment.svg" class="comment">&nbsp;<p class="icon"></p>
						</div>
			</div>
			<div>
			
				<button id="btn-add" class="btn btn-outline-success" onclick="location.assign('${path}/freeboard/write.do')">
								글쓰기
		</button>
			</div>
		</div>
		<div id="pagebar-container" class="m-5">${pageBar }</div>


</section>
<script>

</script>  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
