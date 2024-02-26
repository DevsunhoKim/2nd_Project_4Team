<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="imagetoolbar" content="no">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="title" content="웹사이트">
  <meta name="description" content="웹사이트입니다.">
  <meta name="keywords" content="키워드,키워드,키워드">
  <meta property="og:title" content="웹사이트">
  <meta property="og:description" content="웹사이트입니다">
  <meta property="og:image" content="https://웹사이트/images/opengraph.png">
  <meta property="og:url" content="https://웹사이트">
  <title>Contact_ContactUs_1 | 프로젝트</title>
  <link rel="stylesheet" href="../studyRoom/css/setting.css">
  <link rel="stylesheet" href="../studyRoom/css/plugin.css">
  <link rel="stylesheet" href="../studyRoom/css/template.css">
  <link rel="stylesheet" href="../studyRoom/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../studyRoom/js/setting.js"></script>
  <script src="../studyRoom/js/template.js"></script>
  <script src="../studyRoom/js/common.js"></script>
  <script src="../studyRoom/js/script.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0
$(function(){
	$('#addBtn').click(function(){
		$('#fileinsert .fileset-body').append(
		  '<div id="m'+(fileIndex)+'" class="fileset-group">'
		 +'<p class="filestyle">파일 '+(fileIndex+1)+'</p>'
		 +'<div><input type=file name=files['+(fileIndex)+'] class="fileset-input"></div>'
		 +'</div>'
		)
		fileIndex=fileIndex+1
	})
	
	$('#removeBtn').click(function(){
		if(fileIndex>0)
		{
		  $('#m'+(fileIndex-1)).remove();
		  fileIndex=fileIndex-1;
		}
	})
	
	const fileCheckbox = document.getElementById('yes');
    const addBtn = document.getElementById('addBtn');
    const removeBtn = document.getElementById('removeBtn');
    // 체크박스의 변경 이벤트를 감지하고 처리합니다.
    fileCheckbox.addEventListener('change', function() {
        // 체크박스가 체크되었는지 확인합니다.
        if (fileCheckbox.checked) {
            // 체크되었을 때 버튼을 숨깁니다.
            removeBtn.style.display = 'none';
            addBtn.style.display = 'none';
        } else {
            // 체크되지 않았을 때 버튼을 보여줍니다.
            removeBtn.style.display = 'inline-flex';
            addBtn.style.display = 'inline-flex';
        }
    });
})
</script>
</head>
<body>
  <!-- [E]hooms-N54 -->
  <main class="th-layout-main studyRoomAsk_update" id="studyRoomAsk">
    <!-- [S]hooms-N2 -->
    <div class="hooms-N2" data-bid="jSLsKcjLZN" id="">
    </div>
    <!-- [E]hooms-N2 -->
    <!-- [S]hooms-N58 -->
    <div class="hooms-N58" data-bid="eXlsKCjm7V" id="">
      <div class="contents-container container-md">
        <div class="tabset tabset-solid">
        </div>
      </div>
    </div>
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N39 -->
    <div class="hooms-N39" data-bid="fMlskcJMaO" id="studyRoom-ask" class="ask_update">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2 ask-tit">
            <h2 class="textset-tit ask-title">1:1 문의하기</h2>
          </div>
       <form method="post" action="../studyRoom/ask_update_ok.do" enctype="multipart/form-data">
         <input id="ano" name="ano" type="hidden" value="${vo.ano }">
          <div class="contents-form">
            <div class="contents-form-top">
              <label class="labelset">
                <h6 class="labelset-tit">문의 유형<span style="color: #dc0000;">*</span>
                </h6>
                <strong class="labelset-vital">
                  <span style="color:#dc0000">*</span>필수입력 </strong>
              </label>
              <div class="contents-radioset">
                <div class="radioset">
                  <input id="radioset-a-1-1" name="cate" class="radioset-input input-line" type="radio" value="시설 문의" ${vo.cate == '시설 문의' ? 'checked' : ''}>
                  <label class="radioset-label" for="radioset-a-1-1"></label>
                  <span class="radioset-text">시설 문의</span>
                </div>
                <div class="radioset">
                  <input id="radioset-a-1-2" name="cate" class="radioset-input input-line" type="radio" value="가격 문의" ${vo.cate == '가격 문의' ? 'checked' : ''}>
                  <label class="radioset-label" for="radioset-a-1-2"></label>
                  <span class="radioset-text">가격 문의</span>
                </div>
                <div class="radioset">
                  <input id="radioset-a-1-3" name="cate" class="radioset-input input-line" type="radio" value="취소 문의" ${vo.cate == '취소 문의' ? 'checked' : ''}>
                  <label class="radioset-label" for="radioset-a-1-3"></label>
                  <span class="radioset-text">취소 문의</span>
                </div>
                <div class="radioset">
                  <input id="radioset-a-1-4" name="cate" class="radioset-input input-line" type="radio" value="기타 문의" ${vo.cate == '기타 문의' ? 'checked' : ''}>
                  <label class="radioset-label" for="radioset-a-1-4"></label>
                  <span class="radioset-text">기타 문의(문의내용에 입력해주세요.)</span>
                </div>
              </div>
            </div>
            <div class="contents-form-middle">
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 고객 성함<span>*</span>
                  </h6>
                  <input type="text" class="inputset-input form-control" placeholder="성함을 입력해주세요." name="name" required value="${vo.name }">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 제목<span>*</span>
                  </h6>
                  <input type="text" class="inputset-input form-control" placeholder="제목을 입력해주세요." name="subject" value="${vo.subject }" required="">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                 <label>
                  <h6 class="inputset-tit"> 스터디룸명<span>*</span>
                  </h6>
                  <select name="sno" id="selectset">
                    <template v-for="vo in list" :key="vo.no">
					    <option :value="vo.no" v-if="vo.no === sno">{{ vo.name }}</option>
					</template>
					<template v-for="vo in list" :key="vo.no">
					    <option :value="vo.no" v-if="vo.no !== sno">{{ vo.name }}</option>
					</template>
				  </select>
                </label>
                <label>
                  <h6 class="inputset-tit"> 이메일<span>*</span>
                  </h6>
                  <input type="text" class="inputset-input form-control" placeholder="이메일을 입력해주세요." name="email" value="${vo.email }" required="">
                </label>
              </div>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit"> 문의내용<span>*</span>
                  </h6>
                  <textarea class="inputset-textarea" placeholder="문의 내용을 입력해주세요." name="content" required="">${vo.content }</textarea>
                  <div class="inputset-langth">
                    <span class="inputset-count">0</span>
                    <span class="inputset-total">/4000</span>
                  </div>
                </label>
              </div>
              <div class="fileset fileset-lg fileset-label" id="fileinsert">
                <label>
                 <div id="filetitle">
                 <div class="fileset1">
                  <h6 class="fileset-tit" style="margin-bottom: 0;"> 첨부파일<span>(선택사항)</span></h6>
                  <div>
                  <input type="checkbox" style="margin-left: 1rem;" value="yes" name="check" id="yes">기존 파일 유지
                  </div>
                 </div>
                  <div id="btntotal">
                  <input type=button value="추가"
                    class="btnset btnadd" id="addBtn">
                  <input type=button value="취소"
                      class="btnset btnadd" id="removeBtn">
                  </div>    
                  </div>  
                  <div class="fileset-body">
                    <!-- <div class="fileset-group">
                      <input type="file" class="fileset-input">
                      <button class="fileset-cancel"></button>
                    </div>
                    <span class="btnset btnset-line btnset-lg fileset-upload">파일 첨부하기</span> -->
                  </div>
                </label>
              </div>
            </div>
            <div class="contents-form-bottom">
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit">개인정보수집 및 이용동의</h6>
                  <div class="inputset-board"> - 수집하는 개인정보 항목 : 이메일 주소 <br>
                    <br> 작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다. 이용자는 본 동의를 거부할 수 있으나, 미동의시 문의 접수가 불가능합니다.
                  </div>
                </label>
              </div>
              <div class="checkset">
                <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox">
                <label class="checkset-label" for="checkset-a-1-1"></label>
                <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (선택)</span>
              </div>
            </div>
            <div class="contents-sign">
             <%-- <input type="hidden" value="${vo.ano }" name="ano"> --%>
             <!--  <button class="btnset modalset-btn">수정하기</button> -->
              <input type="submit" value="수정하기" class="btnset modalset-btn">
            </div>
          </div>
          </form>
        </div>
      </div>
      <div id="modalSet1" class="modalset">
        <div class="modal-header">
          <h6 class="modal-title">문의사항 등록</h6>
        </div>
        <div class="modal-body">
          <p> 입력하신 내용으로 문의사항을 등록합니다. <br> 계속 진행하시겠습니까? </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnset btnset-ghost modal-close">취소</button>
          <button type="button" class="btnset btnset-confirm">확인</button>
        </div>
      </div>
      <div id="modalSet2" class="modalset modalset2">
        <div class="modal-header">
          <h6 class="modal-title">등록 완료</h6>
        </div>
        <div class="modal-body">
          <p> 성공적으로 문의사항을 등록했습니다. <br> 빠른시간내로 답변을 드리도록 하겠습니다. </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnset btnset-confirm">확인</button>
        </div>
      </div>
      <div class="modalset-dim"></div>
    </div>
    <!-- [E]hooms-N39 -->
  </main>
  <script>
  let askApp=Vue.createApp({
	  data(){
		  return{
			  sno:${vo.sno},
			  list:{}
		  }
	  },
	  mounted(){
		  axios.get('../studyRoom/list_vue.do').then(response=>{
			  console.log(response.data)
			  this.list=response.data
		  })
	  },
	  methods:{
		  
	  }
  }).mount('#studyRoomAsk')
  </script>
</body>
</html>