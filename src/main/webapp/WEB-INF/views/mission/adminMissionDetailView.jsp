<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 MISSION 관리 상세</title>
<title>전체 회원 MISSION 목록</title>
<link href="resources/css/mission/adminMissionDetailView.css" rel="stylesheet">
<link href="resources/css/common/common.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var c_from_uno = ${talkMission.c_from_uno};
var c_to_uno = ${talkMission.c_to_uno};
var m_no = ${talkMission.m_no}

//관리자 성공/실패 클릭 처리
function mstaFun(e){
	var btnVal = e.value;	
	/* alert("btnVal : "+btnVal+ ", c_from_uno : "+ c_from_uno +", c_to_uno : "+c_to_uno ); */
	//alert("btnVal : "+btnVal+ ", m_no : "+ m_no ); 
	$.ajax({
		url: "mstaUpdate.do",
		data: {m_no : m_no, btnVal : btnVal},
		type:"post",
		success: function(data){
			/* alert("값돌아옴 data : "+ data); */
			if(data == "1") {
				//alert("data : " +  data);
				$("#msta_span").html("상태 : 성공");
				$("#successBun").addClass("result");
				$("#failBun").removeClass("result");
		/* 		$("#msta_span").html("상태 : 성공");
 				$("#successBun").css("background","#fff");
				$("#successBun").css("color","rgb(230, 76, 117");
				$("#failBun").css("background","#888;");
				$("#failBun").css("color","#fff");  */
			} else if (data == "2"){
				$("#msta_span").html("상태 : 실패");
				$("#failBun").addClass("result");
				$("#successBun").removeClass("result");
			} else {
				alert("error : 미션 처리가 되지 않았습니다. 잠시후 다시 시도해주십시오.");
			}
		
		},
        error : function(request, status, errorData){
            console.log("error code : " + request.status 
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
        }  
	});
	
}
</script>
</head>
<body>
<c:import url="../admin/adminHeader.jsp"/>
<div id="mDetail_top">
<div id="addminMissionDetailView">
<div id="mDetail_title">
<span>미션 관리</span>
</div>
<hr>
<div id="missionDetail">
<!-- 미션박스 안 제목 -->
<div id="mission_title">
<span class="mtitl1">미션</span>
<span class="mtitl2">${talkMission.c_mission}</span>
<span class="mtitl3">회원</span>
<span class="mtitl2">${talkMission.m_name}, ${talkMission.p_name}</span>
</div>
<hr>
<!-- 미션박스 안 내용 -->
<div id="mission_content">
<div id="mission_statediv">
<span id ="msta_span">상태 : ${talkMission.m_sta}</span>
</div>
<div id="mission_imgdiv">
<img alt="" src="resources/images/mission/${talkMission.m_con}">
</div>
<div id="mission_buttondiv">
<button id="failBun" value="2" onclick="mstaFun(this);">실패</button>
<button id="successBun" value="1" onclick="mstaFun(this);">성공</button>
</div>

</div> <!-- mission_content div -->

</div> <!-- missionDetail box 끝-->

</div><!-- addminMissionDetailView div 끝 -->
</div><!-- mDetail_top div 끝 -->
<c:import url="../common/footer.jsp"/>
</body>
</html>