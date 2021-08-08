<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="2weeks"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<style>
.container {
  padding-right: 30px;
  padding-left: 30px;
  margin-right: auto;
  margin-left: 20%;
  margin-top:5%;
}
h4 > span{
    display: block;
    margin-bottom: 4px;
    color: #ff5722;
    font-weight: bold;
    font-size: 12px;
}
a{
text-decoration:none;
color: #000;
}
.wrapper > .row{
margin-top:5%;
}
.divi{
font-size : 12px;
}
.col-sm-12{
  float: left;
}
.outer {
  text-align: center;
}

.inner {
  display: inline-block;
  margin-top: 200px;
  margin-left: -700px;
}

</style>
<section class="content">
	<div class="container">
		<div class="wrapper">
			<div class="row ">
				<h4>
					<span title="category">${list.category }</span> <a class=""
						href="${path }/freeboard/readView?no=${list.post_Sq }">${list.post_Title}</a>
				</h4>
			</div>
			<div class="row" style="border: solid blue 10px; margin-top: 5px;">
				<img src="">
				<div class="divider "></div>
				<span class="divi">조회 수 <b>${list.post_Cnt }</b></span>
				<div class="divider "></div>
				<span class="divi">추천 수 <b>${list.post_Like_Cnt }</b></span>
				<div class="divider "></div>
				<span class="divi">댓글 <b></b></span>
				<div class="divider"></div>
				<span class="divi">${list.post_Dt }</span>
			</div>
		</div>
		<div class="col-md-12 "
			style="border: solid black 1px; margin-top: 50px; margin-right: 500px;">
			<p>
				<span style="font-size: 16px;">${list.post_Content }</span>
			</p>
		</div>
		<div class="row text-center" style="width: 100%">
			<div style="width: 100%; float: none; margin: 0 auto;">
				<button class="btn btn btn-danger btn-round"
					style="width: 100px; margin-top: 300px;">추천 수</button>
				<div>
					${list.attachments }
					<c:if test="${!empty list.attachments }">
						<button type="button">버튼</button>
						<c:forEach var="a" items="${list.attachments }" varStatus="vs">
							<button type="button" class="btn btn-outline-success"
								onclick="location.replace('${path}/freeboard/fileDownload.do?=${a.atch_Ori }&rename=${a.atch_New }')">
								첨부파일 ${vs.count } - ${a.atch_Ori }</button>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<div class="outer" style="margin-left:670px; margin-bottom:100px;">
			<div class="inner">
				<span class="absolute">
					<button type="submit" class="update_btn btn btn btn-danger btn-round">수정</button> 
					<input type="button"  class=" btn btn-danger btn-round" value="삭제" onclick="del(${list.post_Sq})" style="width: 60px;">
					<button type="submit" class="list_btn btn btn-danger btn-round">목록</button>
				</span>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header with-border">
					<h3 class="card-title">댓글 작성</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group col-sm-8">
							<input class="form-control input-sm" id="newReplyText"
								type="text" placeholder="댓글 입력...">
						</div>
						<div class="form-group col-sm-2">
							<input class="form-control input-sm" id="newReplyWriter"
								type="text" placeholder="작성자">
						</div>
						<div class="form-group col-sm-2">
							<button type="button"
								class="btn btn-primary btn-sm btn-block replyAddBtn">
								<i class="fa fa-save"></i> 저장
							</button>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<ul id="replies">
					</ul>
				</div>
				<div class="card-footer">
					<nav aria-label="Contacts Page Navigation">
						<ul
							class="pagination pagination-sm no-margin justify-content-center m-0">
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="modal fade" id="modifyModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">댓글 수정창</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="reply_Sq">댓글 번호</label> <input class="form-control"
								id="reply_Sq" name="reply_Sq" readonly>
						</div>
						<div class="form-group">
							<label for="reply_Content">댓글 내용</label> <input class="form-control"
								id="reply_Content" name="reply_Content" placeholder="댓글 내용을 입력해주세요">
						</div>
						<div class="form-group">
							<label for="user_Id">댓글 작성자</label> <input
								class="form-control" id="user_Id" name="user_Id"  readonly>
								
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-success modalModBtn">수정</button>
						<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
					
					</div>
				</div>
			</div>
		</div>
	</div>





</section>

<script>
$(document).ready(function(){

var post_Sq = 4;

getReplies();

//댓글 등록
$(".replyAddBtn").on("click", function(){
		//화면으로부터 입력 받은 변수값 처리
		
		let reply_text = $("#newReplyText");  //댓글 내용
		let reply_writer=$("#newReplyWriter"); //댓글 작성자
		
		let reply_textVal = reply_text.val();
		let reply_writerVal = reply_writer.val();
		
		console.log(reply_textVal);
		console.log(reply_writerVal);
		$.ajax({
			type: "POST",
			url:"${path}/reply/insert/",
			headers:{
				"Content-type" : "application/json", 
				"X-HTTP-Method-Override" : "POST"

				
			},
			dataType : "text",
			data: JSON.stringify({
				post_Sq : ${list.post_Sq},
				reply_Content : reply_textVal, 
				user_Id : reply_writerVal
			}),
			
			success : function(result) {
				if(result == "regSuccess"){
					alert("댓글 등록 완료데쓰네!");
				}else{
					alert('없는 아이디입니다. 로그인 후 시도해주세요.');
				}
				getReplies(); // 댓글 목록 출력 함수 호출
				reply_text.val("") // 댓글 내용 초기화
				reply_writer.val("") //댓글 작성자 초기화
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
});






function getReplies(){
	console.log(${list.post_Sq})
	$.getJSON("${path}/replies/all/"+ ${list.post_Sq}, function(data){
		console.log(data);
	var str="";
	
	$(data).each(function(){
		str +="<li data-reply_Sq='"+ this.reply_Sq + "' class='replyLi'>"
	+ "<p class='reply_Content'>"+this.reply_Content + "</p>"
	+ "<p class='user_Id'>" + 'user01' +"</p>"
	+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	+"</li>"
	+"<hr/>";
		
	});
	
	$("#replies").html(str);
	});
}

$("#replies").on("click", ".replyLi button", function(){
	var reply =$(this).parent();
	
	var reply_Sq = reply.attr("data-reply_Sq");
	var reply_Content = reply.find(".reply_Content").text();
	var user_Id = reply.find(".user_Id").text();
	
	$("#reply_Sq").val(reply_Sq);
	$("#reply_Content").val(reply_Content);
	$("#user_Id").val(user_Id);
});


$(".modalDelBtn").on("click", function(){
	//댓글번호
	
	var reply_Sq = $(this).parent().parent().find("#reply_Sq").val();
	
	//ajax
	$.ajax({
		type : "delete",
		url : "${path}/reply/delete/"+ reply_Sq,
		header: {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : "text",
		success : function(result) {
			console.log("result : " + result);
			if(result == "delSuccess"){
				alert("댓글 삭제 완료!");
				$("#modifyModal").modal("hide"); //modal 닫기
				getReplies(); //댓글 목록 갱신
			}
		}
	});
});

$(".modalModBtn").on("click", function(){
	
	//댓글 선택자
	var reply = $(this).parent().parent();  //여기에 번호 / 작성자 / 내용을 가져올 수 있당
	//댓글 번호
	var reply_Sq = $("#reply_Sq").val();
	var reply_Content = $("#reply_Content").val();
	
	$.ajax({
		type:"put",
		url : "${path}/reply/" + reply_Sq,
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT" 
		},
		data : JSON.stringify(
			{reply_Content : reply_Content}	
		),
		 dataType : "text",
		 success : function(result){
			 console.log("result : "+result);
			 if(result == 'modSuccess'){
				 alert("댓글 수정 완료!");
				 $("#modifyModal").modal('hide'); //모달 닫기
				 getReplies(); //댓글 목록 갱신
			 }
		 }
	});
});



	function backList(){
	window.history.back();	
		
	}
	$(".update_btn").on("click",function(){
		location.href="${path}/freeboard/updateBoard.do?no=${list.post_Sq }";
	})
});	

function del(no) {
	console.log('ddddd');
	console.log(no);
	console.log(no);
	let chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href="${path}/freeboard/delete.do?no="+no;
	}
}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>