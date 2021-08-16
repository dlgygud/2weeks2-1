<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="${path }/resources/css/chat/chatting.css?after=" rel="stylesheet" />
<c:set var="curCnt" value="${curCnt} " />

<section class="container">
	<h3>오픈채팅</h3>
	<div id="addGroupBtn">
		<a id="addRoomBtn" onclick="open('${path}/addChatRoom ', '_blank', 'width=400, height=550, resizable=no')">채팅방 만들기</a>
	</div>
	<div id="chatContainer">
		<c:forEach var="l" items="${list }" varStatus="status">
			<div id="chatRoomOne">
				<div id="chatIcon">
					<img src="${path }/resources/images/icons/chat.png" alt="chatIcon"/>
				</div>
				<div id="entry" >					
					<a id="entry_a" onclick="open('${path}/chatting?no=${l.groupNo} ', '_blank', 'width=400, height=600, resizable=no')">
						${l.title }
					</a>					
					<div id="cntLimit">${curCnt } / ${l.cnt }명</div>
					<div id="chatContent">${l.content }</div>
				</div>
			</div>
			<hr>	
		</c:forEach>
	</div>
</section>

<script>
	let rootPath="${pageContext.request.contextPath}";
		
	const check="${check}";	
	if(check){
		alert(check);
		console.log(check);
	}		
</script>

<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>