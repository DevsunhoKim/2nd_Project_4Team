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
  @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
  .hooms-N40 .contents-thumbnail img { width: 70%; height: 120%; object-fit: cover; }
  #cont
  {
     text-align: center;
  }
  
  

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: right;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

.number-control {
  display: flex;
  align-items: center;
}

.number-left::before,
.number-right::after {
  content: attr(data-content);
  background-color: #333333;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid black;
  width: 20px;
  color: white;
  transition: background-color 0.3s;
  cursor: pointer;
}

.number-left::before {
  content: "-";
}

.number-right::after {
  content: "+";
}

.number-quantity {
  padding: 0.25rem;
  border: 0;
  width: 50px;
  -moz-appearance: textfield;
  border-top: 1px solid black;
  border-bottom: 1px solid black;
}

.number-left:hover::before,
.number-right:hover::after {
  background-color: #666666;
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
			 <p class="contents-desc" style="display: inline">
              수량 : 
            </p>
			<div class="form-group">
       		
            <div class="number-control">
			  <div class="number-left"></div>
			  <input type="number" name="number" class="number-quantity">
			  <div class="number-right"></div>
			</div>
       
    </div>
            <div class="contents-btn">
              <a class="btnset" href="../books/payment.do?no=1" >구매하기</a>
            </div>
            <div class="contents-btn">
              <a class="btnset" href="javascript:void(0)">장바구니 담기</a>
            </div>
          </div>
        </div>
         <h3 class="h3">상세보기</h3>
      </div>
      
       <div class="contents-inner" id="cont">
  <img v-if="detail_data.content !== '이미지 정보가 없습니다.'" :src="detail_data.content" style="max-width: 1220px;">
  <img v-else src="../books/images/noImg.png" style="max-width: 1220px;">
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
              <a  href="javascript:void(0)" class="cardset cardset-hor">
                 <!-- SessionScope 적용 예정 -->
                 <a href="javascript:void(0)" class="btnset btnset-sm" style="float: right;margin-left: 10px;margin-top: 15">수정</a>
                 <a href="javascript:void(0)" class="btnset btnset-sm" style="float: right;margin-top: 25">삭제</a>
                <div class="cardset-body">
                  <div class="contents-info">
                    <ul class="contents-ico-list">
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                      <li class="contents-ico-item ico-item-active"></li>
                    </ul>
                    <div class="contents-name" style="float: right">
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
            <h6 class="inputset-tit">리뷰 남기기</h6>
         <fieldset class="rating" style="display: inline-flex;">
    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class="full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class="full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class="full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class="full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star5" name="rating" value="5" /><label class="full" for="star5" title="Awesome - 5 stars"></label>
</fieldset>

            <textarea class="inputset-textarea" placeholder="문의 내용을 입력해주세요." required=""></textarea>
            <div class="inputset-langth">
              <span class="inputset-count">0</span>
              <span class="inputset-total">/4000</span>
            </div>
          </label>
          
           
        </div>
       		
      
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
      detail_data: {},
      reviews: [], // 리뷰 목록을 저장할 배열
      newReview: { // 새로운 리뷰를 추가하기 위한 객체
        id: '', // 사용자 ID
        score: 0, // 리뷰 점수
        cont: '' // 리뷰 내용
      },
      selectedReview: null, // 수정 또는 삭제할 리뷰를 선택하기 위한 객체
    };
  },
  mounted() {
    this.dataRecv();
    this.loadReviews();
  },
  methods: {
    dataRecv() {
      axios.get('../books/detail_vue.do', {
        params: {
          no: this.no
        }
      }).then(response => {
        console.log(response.data);
        this.detail_data = response.data; // 응답 받은 데이터를 detail_data에 저장
      });
    },
    loadReviews() {
      axios.get('../books/review_list.do')
      .then(response => {
        this.reviews = response.data; // 응답 받은 리뷰 목록을 reviews에 저장
      })
      .catch(error => {
        console.error('리뷰 목록 불러오기 오류: ', error);
      });
    },
    addReview() {
      axios.post('../books/review_insert.do', this.newReview)
      .then(response => {
        if(response.data.result === 'OK') {
          this.loadReviews(); // 리뷰 목록 다시 불러오기
        }
      })
      .catch(error => {
        console.error('리뷰 추가 오류: ', error);
      });
    },
    updateReview() {
      axios.post('../books/review_update.do', this.selectedReview)
      .then(response => {
        if(response.data.result === 'OK') {
          this.loadReviews(); // 리뷰 목록 다시 불러오기
        }
      })
      .catch(error => {
        console.error('리뷰 수정 오류: ', error);
      });
    },
    deleteReview(rno) {
      axios.get('../books/review_delete.do', { params: { rno: rno } })
      .then(response => {
        if(response.data.result === 'OK') {
          this.loadReviews(); // 리뷰 목록 다시 불러오기
        }
      })
      .catch(error => {
        console.error('리뷰 삭제 오류: ', error);
      });
    }
  },
  computed: {
    formattedPrice() {
      return this.detail_data.price ? this.detail_data.price.toLocaleString('ko-KR') : '';
    }
  }
}).mount('#books_detail');
</script>
    
    </body>
</html>