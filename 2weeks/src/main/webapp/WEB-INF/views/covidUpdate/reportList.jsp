<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="covid/reportList"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<section id="content">
	
	<h1>�����ڷ�</h1>
	
	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>���</th>
			<th>�ۼ���</th>
			<th>÷������</th>
		</tr>		
		${elem }	
	</table>
	
	
	
	
	
	
	
	
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>