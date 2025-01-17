<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value="지식인질문수정페이지"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<style>

.question{
/* border: 1px solid blue; */
background-color: white;
}

.answer{
/* border: 1px solid blue; */
position: relative;
top: 10px;
}
#Qsearch{
width:100px;
height:40px;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;
position: relative;

left:-16px;

}
#Qcheck{
width:100px;
height:40px;
border :0px;
background:#8181F7;
outline:none;
float:right;
color:#ffffff;
position: relative;
top:-130px;
left:-170px;

}
#searchBar{
height:38px;
width:322px;
border : 1px solid #19ce60;
background :#ffffff;
float: left;
position: relative;
right:-1050px;
}
.naver{
font-size :16px;
width:250px;
padding:10px;
border:0px;
outline:none;
float:left;
} 
#searchkn{

width:50px;
height:100%;
border :0px;
background:#19ce60;
outline:none;
float:right;
color:#ffffff;

}

#no{
position: relative;
top:50px;


}
.QA{

font-family: pretendard;
font-size: 50px;
color:#19ce60;
}

.title{
font-family: pretendard;
font-size:30px;
position: relative;
right:-40px;
}

.title2{
font-family: pretendard;
font-size:30px;
position: relative;
right:-60px;
}
.point{
font-family: pretendard;
font-size:20px;
background-color: #BDBDBD;
color :white;
position: relative;
right:-40px;

}
.knowmenu {
    list-style: none;
    position: relative;
    right :-1100px;
    top :-70px;
} 

.knowmenu2 {
    list-style: none;
    position: relative;
    right :-1200px;
   top:-10px;
} 
.knowmenu li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -10px;

}

.knowmenu2 li{

float:left;
margin-left:10px;
font-size:13px;
position: relative;
top: -10px;

}

.rolldate{
    color: #8c8c8c;
     position: relative;
right:-15px;
}

.view{
    color: #8c8c8c;
     position: relative;
right:-15px;

}
.qcount{

    color: #8c8c8c;
     position: relative;
right:-15px;
}
.user{
font-family: pretendard;


}



.userInfo{

position: relative;
top : -50px;
right:-1200px;
font-size: 13px;
}

.content{
position: relative;
right: -50px;
/* border: 1px solid red; */


}
#red{

  color: red;
    background-color: transparent !important;
    outline :0;
    border : 0;
    position: relative;
    right: -1800px;
    font-family: pretendard;
    font-weight: bold;
    font-size: 15px;
}

#update{
   background-color: transparent !important;
    outline :0;
    border : 0;

}
#delete {
   background-color: transparent !important;
    outline :0;
    border : 0;
}

#qanswer{
   background-color: transparent !important;
    outline :0;
    border : 0;

}
.qbutton{
   position: relative;
   right: -1700px;

}
.Adoption_completed{
 color: red;
     position: relative;
    right: -80px;
      bottom : -10px;
      font-family: pretendard;
}
.warning{
font-family: pretendard;
font-size:12px;
position:relative;
right: -100px;
}
.warning span{
color:red;
}

.warning p{
color: #A4A4A4;

}

.noresize {
	width:1300px; 
	height:500px; 
    resize:none;/* 크기고정 */ 
	position: relative;

}
.bottom{
position: relative;
right:-50px;

}
::placeholder {
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
}

::-ms-input-placeholder { /* Microsoft Edge */
  color: #BDBDBD;
  font-size: 12px;
  font-weight: 400;
  opacity: 1; /* Firefox */
}
.a{
	font-size:30px;
	position: relative;
	font-family: pretendard;
	font-weight: bold;
}
.knowmenu li:hover {
		
		color: orange;
		cursor:pointer;
	}
	
	input:focus {outline:1px solid #19ce60;}
</style>


<section class="container">
<form name="KinFrm" action="${path }/KnowledgeIn/update" method="post" enctype="multipart/form-data" onsubmit="return _onSubmit();" >
      
	<div class="question">
			<span class="a">수정</span>
<!-- 			<div id="searchBar"><input class="naver" type="text" placeholder="검색어 입력">
					<button id="searchkn">검색</button>
			</div>
 -->			<!-- <button id="Qsearch" >질문하기</button> --><img src="" alt=""> <hr width = "100%" color = "#F2F2F2">
			<input type="hidden" name="kin_Sq" id="no" value="${knowledgeIn.kin_Sq}">  
					<div>	<span class="QA">Q</span> 
<input type="text"  maxlength='20' style="width:1000px;font-size:30px; border:1px solid #19ce60" placeholder="제목 작성란 입니다 20자 미만으로 입력해주세요."
				 value ="${knowledgeIn.kin_Title}" name="kin_Title" required>
			
			
			<input type="text" name="kin_Writer" class="form-control" value="${knowledgeIn.kin_Writer}"  readonly="readonly" >
			
			
			<ul class="knowmenu"> 
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>	
			</ul>

 			<select class="knowmenu2" id="category" name="category" >
             	
	                <option value="코로나19"      ${knowledgeIn.category eq '코로나19'? 'selected' :''}>코로나19</option>
	                <option value="백신"     		${knowledgeIn.category eq '백신'? 'selected' :''}>백신</option> 
	                <option value="확진"         ${knowledgeIn.category eq '확진'? 'selected' :''}>확진</option>
	                <option value="해외"         ${knowledgeIn.category eq '해외'? 'selected' :''}>해외</option>
	                <option value="방역수칙"      ${knowledgeIn.category eq '방역수칙'? 'selected' :''}>방역수칙</option>
	                <option value="건강"         ${knowledgeIn.category eq '건강'? 'selected' :''}>건강</option>
	                <option value="기타"         ${knowledgeIn.category eq '기타'? 'selected' :''}>기타</option>
	 
          </select>
			
					</div>
			
			<div class="content">
			
			  <textarea class="noresize" placeholder="답변이 있을 시, 해당 내용은 수정,삭제가 불가능 합니다.질문 내용에 개인정보(실명,전화번호,메신저아이디)가 포함되지 않게 해주세요."name="kin_Content" required>${knowledgeIn.kin_Content }</textarea>
		
				
			</div>
 					
 					
			 					
<br>
			
		<div class="bottom">
		 <label for="gdsImg">첨부파일</label>
		<input type="file" name="file" id="attach" accept="image/gif, image/jpeg, image/png">
	<!-- 	<label class="custom-file-label" for="upFile1">파일을 선택하세요</label> -->

 <div class="select_img"><img src="" />
                 
                
		
		<br>
					 					
 			<hr style="border: solid 1px #F2F2F2;">
		<label>아이디 공개<input type="radio" name="open_Yn" value="Y">${KnowledgeIn.open_Yn}</label>
		<label>비공개<input type="radio" name="open_Yn" value="N">${KnowledgeIn.open_Yn}</label>
			<hr style="border: solid 1px #F2F2F2;">
		<span>포인트 설정 </span>
		<label><input type="radio" name="point" value="50" ><input type="hidden" name="radio" value="50"><span class="c">50</span></label>
		<label><input type="radio" name="point" value="100" ><input type="hidden" name="radio" value="100"><span class="c">100</span></label>
		<label><input type="radio" name="point" value="150" ><input type="hidden" name="radio" value="150"><span class="c">150</span></label>
		<label><input type="radio" name="point" value="200" ><input type="hidden" name="radio" value="200"><span class="c">200</span></label>
		<label><input type="radio" name="point" value="250" ><input type="hidden" name="radio" value="250"><span class="c">250</span></label>
		<label><input type="radio" name="point" value="300" ><input type="hidden" name="radio" value="300"><span class="c">300</span></label>

		</div>	
					 					
 			<hr style="border: solid 1px #F2F2F2;">	
 			
 	        <!--     <input type="submit" class="btn btn-outline-success" value="질문등록" >	 -->
		<button id="Qcheck" type="submit">완료</button>
		</div>


			

			
			
	</form>		

			
			
</section>
<script>
var onoff =${KnowledgeIn.open_Yn}



		$(function(){
			$("[type=file]").on("change",e=>{
				const fileName=$(e.target).prop("files")[0].name;
				$(e.target).next('.custom-file-label').html(fileName);
			});
		}) 
		
		
/* 		$("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  }); */
		
		
		
		function _onSubmit(){

			if(!confirm("수정하시겠습니까?")){
			return false;
			}
			}
		
	$(function () {
		$("#attach").on("change",fileCheck);
	});

	$(function () {
		$("#btn-upload").click(function(e){
			e.preventDefault();
			$("#attach").click();
		});
	});

		
		
	</script>	
	<jsp:include page="/WEB-INF/views/common/pagescroll.jsp"/>	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
