<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <title>Contact_ContactUs_Q | 프로젝트</title>
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
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
  <main class="th-layout-main" id="ask_detail">
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N37 -->
    <div class="hooms-N37" data-bid="NiLT00VHDB">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">Q&amp;A</h2>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
              <span>{{ask_detail.subject}}</span>
            </h5>
            <span class="contents-date">
              <i>{{ask_detail.name}}</i>&nbsp;{{ask_detail.dbday}}&nbsp;</span>
          </div>
          <div class="contents-group">
            <div class="contents-group-top">        
              <div class="contents-file" v-if="ask_detail.filename!==null" v-for="file in filename">
                <span class="contents-file-txt">첨부파일</span>
                <a class="contents-file-link" :href="'../studyRoom/download.do?fn='+file">{{file}}</a>
              </div>
              <p class="contents-ask">{{ask_detail.content}}</p>
            </div>
            <div class="contents-group-bottom">
              <div class="contents-date">
                <span class="badgeset badgeset-active ask-return">답변</span> 2023.01.01
              </div>
              <p class="contents-answer"> 안녕하세요. 회원님 <br> HOOMS 담당자입니다. <br>
                <br> 웹 페이지 산출물이 나오는 과정은 3명의 전문가들의 각각의 시간을 할애하여 생산하는 부분을 템플릿 하우스를 사용하면 1사람이 <br> 원 클릭과 드래그앤 드랍 방식을 통해 웹 페이지를 10분 만에 생성하고 코드 편집과 코드 산출물 다운로드 기능을 통해 더 자유롭게 개발할 수 있습니다. <br>
                <br> 더 궁금하신 사항은 아래 전화번호 메일을 통해 연락주시길 바랍니다. <br> 감사합니다. <br>
                <br> 문의사항 : 02-123-4567 / openfield@openfield.co.kr
              </p>
            </div>
          </div>
          <div class="contents-btn">
            <a class="btnset" :href="'../studyRoom/ask_update.do?ano='+ask_detail.ano">수정하기</a>
            <a class="btnset" :href="'../studyRoom/ask_delete.do?ano='+ask_detail.ano">삭제하기</a>
            <a class="btnset" :href="'../studyRoom/room_detail.do?askShow=true&no='+ask_detail.sno">목록으로</a>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script type="text/javascript">
  let askDetailApp=Vue.createApp({
	  data(){
		  return{
			  ano:${ano},
		      ask_detail:{},
		      filename:{}
		  }
	  },
	  mounted(){
		  axios.get('../studyRoom/ask_detail_vue.do',{
			  params:{
				  ano:this.ano
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.ask_detail=response.data
			  let filenames = response.data.filename.split(',');
			  this.filename=filenames;
			  console.log(this.filename)
			  
		  })
	  }
  }).mount('#ask_detail')
  </script>
</body>
</html>