<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>예약하기_기간선택 | 글램핑</title>
  <link rel="stylesheet" href="../studyRoom/css/setting.css">
  <link rel="stylesheet" href="../studyRoom/css/plugin.css">
  <link rel="stylesheet" href="../studyRoom/css/common.css">
  <link rel="stylesheet" href="../studyRoom/css/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../studyRoom/js/setting.js"></script>
  <script src="../studyRoom/js/plugin.js"></script>
  <script src="../studyRoom/js/template.js"></script>
  <script src="../studyRoom/js/common.js"></script>
  <script src="../studyRoom/js/script.js"></script>
</head>
<body id="room_reserve">
  <main class="th-layout-main room_reserve">
    <!-- [E]glamping-N10 -->
    <!-- [S]glamping-N32 -->
    <div class="glamping-N32" data-bid="LyLsREXLUm">
      <div class="contents-inner">
        <div class="contents-container container-md contents-bottom">
          <div class="textset">
            <h2 class="textset-tit">Reservation</h2>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]glamping-N32 -->
    <!-- [S]glamping-N33 -->
    <div class="glamping-N33" data-bid="DSLSRExLY4">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <div class="contents-date"></div>
          </div>
          <div class="contents-bottom">
            <h2 class="contents-tit">인원선택</h2>
            <ul class="contents-list">
              <li class="contents-item">
                <p class="contents-label">성인</p>
                <div class="contents-amount">
                  <button class="contents-btn btn-minus" type="button">
                    <img src="../studyRoom/icons/ico_minus_black.svg" alt="마이너스 아이콘">
                  </button>
                  <p class="contents-amount-num">
                    <span>2</span>명
                  </p>
                  <button class="contents-btn btn-plus" type="button">
                    <img src="../studyRoom/icons/ico_plus_black.svg" alt="플러스 아이콘">
                  </button>
                </div>
              </li>
              
              <li class="contents-item">
                <p class="contents-label">시간 선택</p>
                <div class="selectset selectset-round selectset-md">
                  <button class="selectset-toggle btn" type="button">
                    <span>동행</span>
                  </button>
                  <ul class="selectset-list">
                    <li class="selectset-item">
                      <button class="selectset-link btn" type="button" data-value="동행">
                        <span>동행</span>
                      </button>
                    </li>
                    <li class="selectset-item">
                      <button class="selectset-link btn" type="button" data-value="미동행">
                        <span>미동행</span>
                      </button>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
          <button class="btnset btnset-round" type="button" @click="date_click()">결제하기</button>
        </div>
      </div>
    </div>
  </main>
  <script type="text/javascript">
  let rapp=Vue.createApp({
	  data(){
		  return {
			  
		  }
	  },
	  mounted(){
		  
	  },
	  methods:{
		  date_click(){
			  let date=$('.first-date-selected').text();
			  alert(date)
		  }
	  }
  }).mount('.room_reserve')
  </script>
</body>
</html>