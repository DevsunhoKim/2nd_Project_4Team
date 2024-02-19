<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--vue를 이용한 댓글 추가 -->
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../books/css/setting.css">
 <link rel="stylesheet" href="../books/css/plugin.css">
 <link rel="stylesheet" href="../books/css/template.css">
  <link rel="stylesheet" href="../books/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <style>
  .hooms-N40 .contents-thumbnail img { width: 70%; height: 120%; object-fit: cover; }
  #cont
  {
     text-align: center;
  }
  </style>
</head>
<body>
  <!-- [S]hooms-N40 -->
    <div class="hooms-N40" data-bid="oylSl2orEZ" id="books_detail">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-left">
            <div class="contents-thumbnail">
            
              <img :src="detail_data.poster" alt="썸네일이미지">
            </div>
           
          </div>
          <div class="contents-right">
            <div class="textset textset-h2">
              <span class="textset-name">{{detail_data.publ}}</span>
              <h4 class="textset-tit">
                {{detail_data.title}}
              </h4>
            </div>

             <p class="contents-desc">
              저자 : {{detail_data.author}}
            </p>
             <p class="contents-desc">
			  구분 : {{detail_data.genre}}
            </p>
             <p class="contents-desc">
              출간일 : {{detail_data.b_date}}
            </p>
             <p class="contents-desc">
              평점 : {{detail_data.score}}
            </p>
            
            <div class="contents-sum">
  				가격
           <span>{{ formattedPrice }} 원</span>
			</div>
            <div class="contents-btn">
              <a class="btnset" href="javascript:void(0)">구매하기</a>
            </div>
            <div class="contents-btn">
              <a class="btnset" href="javascript:void(0)">장바구니 담기</a>
            </div>
          </div>
        </div>
         <h3 class="h3">상세보기</h3>
      </div>
      
        <div class="contents-inner" id="cont">
        
     <img :src="detail_data.content"  style="max-width: 1220px;">
    </div>
    </div>
    <!-- [E]hooms-N40 -->
     <!-- [S]hooms-N41 -->
    <div class="hooms-N41" data-bid="IYlsL2pcgs">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-search">
            <p class="contents-result">
              전체<span> 5</span>개
            </p>
            <div class="selectset selectset-lg">
              <button class="selectset-toggle btn" type="button">
                <span>최근 등록순</span>
              </button>
              <ul class="selectset-list">
                <li class="selectset-item">
                  <button class="selectset-link btn" type="button" data-value="최근 등록순">
                    <span>최근 등록순</span>
                  </button>
                </li>
                <li class="selectset-item">
                  <button class="selectset-link btn" type="button" data-value="평점 높은 순">
                    <span>평점 높은 순</span>
                  </button>
                </li>
                <li class="selectset-item">
                  <button class="selectset-link btn" type="button" data-value="평점 낮은 순">
                    <span>평점 낮은 순</span>
                  </button>
                </li>
              </ul>
            </div>
          </div>
          <div class="contents-group">
            <div class="contents-cardlist contents-cardlist-active">
              <a href="javascript:void(0)" class="cardset cardset-hor">
               
                <div class="cardset-body">
                  <div class="contents-info">
                    <ul class="contents-ico-list">
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                    </ul>
                    <div class="contents-name">
                      홍길동
                      <span class="contents-date">2023.01.01</span>
                    </div>
                  </div>
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      만족스러워요.
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    아무래도 덩치가 커서 혹시나 불편하지 않을까 걱정도 했는데 책상뒤로 쭉밀어 고정시키면 일반 슈퍼싱글이랑 똑같기에 괜한 걱정이었고 공간활용면에서 이 제품만한 것이 없네요.
                  </p>
                </div>
              </a>
            </div>
          </div>
           <div class="inputset inputset-lg inputset-label">
          <label>
            <h6 class="inputset-tit">Label</h6>
            <textarea class="inputset-textarea" placeholder="문의 내용을 입력해주세요." required=""></textarea>
            <div class="inputset-langth">
              <span class="inputset-count">0</span>
              <span class="inputset-total">/4000</span>
            </div>
          </label>
          
           
        </div>
       		
       		 <img class="icon-sm" src="../resources/icons/ico_star.svg" alt="아이콘">
        </div>
         <a href="javascript:void(0)" class="btnset btnset-lg" style="float: right">작성</a>
      </div>
    </div>
    <!-- [E]hooms-N41 -->
    <script>
    let booksDapp = Vue.createApp({
    	  data() {
    	    return {
    	      no: ${no}, // 서버 사이드에서 no 값을 주입해야 합니다.
    	      detail_data: {}
    	    }
    	  },
    	  mounted() {
    	    this.dataRecv();
    	  },
    	  methods: {
    	    dataRecv() {
    	      axios.get('../books/detail_vue.do', {
    	        params: {
    	          no: this.no
    	        }
    	      }).then(response => {
    	        console.log(response.data);
    	        this.detail_data = response.data;
    	      });
    	    }
    	  },
    	  computed: {
    	    formattedPrice() {
    	      // detail_data.price가 존재하면 숫자 포맷을 적용하고, 그렇지 않으면 빈 문자열을 반환합니다.
    	      return this.detail_data.price ? this.detail_data.price.toLocaleString('ko-KR') : '';
    	    }
    	  }
    	}).mount('#books_detail');

    </script>
    </body>
</html>