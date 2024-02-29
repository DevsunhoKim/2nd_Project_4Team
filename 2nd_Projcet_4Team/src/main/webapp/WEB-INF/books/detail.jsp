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
  width: 30px;
  height:33px;
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
  width: 100px;
  -moz-appearance: textfield;
  border-top: 1px solid black;
  border-bottom: 1px solid black;
  text-align: center;
}

.number-left:hover::before,
.number-right:hover::after {
  background-color: #666666;
  height: 33px;
}

.hooms-N40 .contents-thumbnail { width: 125%; height: 64rem; }

.rating {
    direction: rtl; /* 별점을 오른쪽에서 왼쪽으로 표시 */
    display: inline-flex;
}

.rating > input {
    display: none; /* 라디오 버튼 숨기기 */
}

.rating > label {
    cursor: pointer;
    font-size: 2em;
    color: grey; /* 기본 색상을 회색으로 설정 */
    margin: 0;
}

/* 마우스 호버 시 해당 별과 그 이전의 모든 별의 색상 변경 */
.rating > label:hover,
.rating > label:hover ~ label {
    color: gold; 
}

/* 선택된 별점 이후의 별들은 회색으로 표시 */
.rating > input:checked ~ label {
    color: grey;
}

/* 선택된 별점과 그 이전의 별들은 금색으로 표시 */
.rating > input:checked + label:hover,
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label,
.rating > input:checked ~ label:hover ~ label {
    color: gold;
}

.rating > input:checked ~ label {
  color: gold; /* 클릭된 별점과 그 이전의 별점들을 금색으로 표시 */
  
  .rating > input:checked ~ label {
  color: gold; /* 클릭된 별점과 그 이전의 별점들을 금색으로 표시 */
}

/* 클릭된 별점 이후의 별들은 회색으로 표시 (별점이 오른쪽에서 왼쪽으로 표시되기 때문에 이전의 별들을 의미함) */
.rating > input:checked ~ label {
  color: grey;
}

textarea {
    width: 1280px; /* 너비 설정 */
    height: 240px; /* 높이 설정 */
    resize: none; /* 크기 조정 비활성화 */
    border-radius: 5px;
    border-width: 3px;
}









}
  </style>
</head>
<body>
  <div id="books_detail" >
  <!-- [S]hooms-N40 -->
    <div class="hooms-N40" data-bid="oylSl2orEZ">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-left">
            <div style="margin-left: 3rem" class="contents-thumbnail">
            
              <img :src="detail_data.poster" alt="썸네일이미지" style="width:60rem;height: 80rem">
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
            <!-- 평점과 별 표시, 컴포넌트를 사용하지 않음 -->

<!-- 평점과 별 표시, 컴포넌트 없이 -->
<p class="contents-desc" id="ratingSection">
  평점: 
  <!-- 유효한 숫자인지 확인하고, 평균 점수에 따라 별을 표시 -->
  <template v-if="Number.isFinite(parseFloat(detail_data.avgScore)) && parseFloat(detail_data.avgScore) >= 0">
    <!-- 실제 별 표시 -->
    <label v-for="(n, index) in Math.min(Math.round(parseFloat(detail_data.avgScore)), 5)" :key="'filled-' + index" class="star" id="realStar-{{ index }}">⭐&nbsp;</label>
    <!-- 빈 별 표시 부분을 제거 -->
  </template>
 ( {{ detail_data.avgScore }} )
</p>





            
            <div class="contents-sum">
  				가격
           <span>{{ formattedPrice }} 원</span>
			</div>
			
			
			
			<br>
			<br>
			 <span class="contents-desc" style="display: flex">
              수량
            </span>
			<div class="form-group">
       		
           <div class="number-control">
			  <div class="number-left" @click="decreaseQuantity" data-content="-"></div>
			  <input type="number" name="number" class="number-quantity" v-model.number="quantity">
			  <div class="number-right" @click="increaseQuantity" data-content="+"></div>
		   </div>
		<div class="contents-sum">
    				총 가격
    	<span>{{ totalPrice.toLocaleString('ko-KR') }} 원</span>
		</div>


       
    		</div>
           <div class="contents-btn">
			  <a class="btnset" href="javascript:void(0)" @click="purchase">구매하기</a>
			</div>
            <div class="contents-btn">
                <a href="javascript:void(0)" class="btnset" @click="addToCart">장바구니 담기</a>
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
   <!-- [S]hooms-N41 수정된 부분 -->
<div class="hooms-N41" data-bid="IYlsL2pcgs" style="margin-bottom: 6rem">
  <div class="contents-inner">
  
    <div class="contents-container container-md">
    
      <div class="contents-group">
      <h2 style="font-size: 25px;margin-bottom: 25px;">리뷰 내역</h2>
      
        <div class="contents-cardlist contents-cardlist-active" v-for="review in reviews" :key="review.rno">
         
            <div class="cardset-body">
          <!-- 리뷰 내용 및 저자 정보 -->
<div class="contents-info">
  <div class="contents-name" style="float: right;margin-top:25px">
    
    작성자 : {{ review.userId }}
    <span class="contents-date">{{ review.dbday }}</span>
  </div>
  <p>
  <p>
  
</div>



			            
			 <ul class="contents-ico-list" :id="'review-stars-' + review.rno" style="float:right">
    <li v-for="star in (review.score)" :key="star" style="color:gold"> ★</li>
  </ul>
  <p>
  <p>
  
              <!-- 리뷰 내용 표시 -->
              <div v-if="editReview.rno !== review.rno" >
                <p class="cardset-desc">{{ review.cont }}</p>
              </div>
              <!-- 리뷰 수정 입력 필드 -->
              <div v-if="editReview.rno === review.rno" class="edit-section" >
                              <div class="rating" style="font-size: 10px">
  <!-- 5번째 별점 -->
  <input type="radio" id="star5" value="5" v-model="editReview.score">
  <label for="star5"></label>
  <!-- 4번째 별점 -->
  <input type="radio" id="star4" value="4" v-model="editReview.score">
  <label for="star4"></label>
  <!-- 3번째 별점 -->
  <input type="radio" id="star3" value="3" v-model="editReview.score">
  <label for="star3"></label>
  <!-- 2번째 별점 -->
  <input type="radio" id="star2" value="2" v-model="editReview.score">
  <label for="star2"></label>
  <!-- 1번째 별점 -->
  <input type="radio" id="star1" value="1" v-model="editReview.score">
  <label for="star1"></label>
</div>
                <textarea v-model="editReview.cont" class="inputset-textarea" style="width:1280px;height: 240px"></textarea>
 
              </div>
            </div>
            <!-- 수정 및 삭제 버튼 -->
            <div v-if="sessionId === review.userId" class="review-actions" style="text-align: right;margin-bottom: 2rem" >
              <a href="javascript:void(0)" class="btnset btnset-sm" @click="selectForEdit(review)">수정</a>
              <a href="javascript:void(0)" class="btnset btnset-sm" @click="deleteReview(review.rno)">삭제</a>
              <button v-if="editReview.rno === review.rno" @click="updateReview" class="btnset btnset-sm">저장</button>
            </div>
         
        </div>
      </div>
    </div>
  </div>
</div>
<!-- [E]hooms-N41 -->
   
            
         
    <!-- [S]hooms-N41 -->
<div class="hooms-N41" data-bid="IYlsL2pcgs">
    <div class="inputset inputset-lg inputset-label" style="width: 1280px;height: 450px; margin: 0px auto;">
        <label style="margin-bottom: 3rem">
            <h6 class="inputset-tit">리뷰 남기기</h6>
          
            
        <div class="rating" style="font-size: 10px">
  <!-- 5번째 별점 -->
  <input type="radio" id="star5" value="5" v-model="newReview.score">
  <label for="star5"></label>
  <!-- 4번째 별점 -->
  <input type="radio" id="star4" value="4" v-model="newReview.score">
  <label for="star4"></label>
  <!-- 3번째 별점 -->
  <input type="radio" id="star3" value="3" v-model="newReview.score">
  <label for="star3"></label>
  <!-- 2번째 별점 -->
  <input type="radio" id="star2" value="2" v-model="newReview.score">
  <label for="star2"></label>
  <!-- 1번째 별점 -->
  <input type="radio" id="star1" value="1" v-model="newReview.score">
  <label for="star1"></label>
</div>


            <textarea class="inputset-textarea" v-model="newReview.cont" placeholder="리뷰 내용을 입력해 주세요." required="" name="reviewContent" id="reviewContent" ></textarea>
            <div class="inputset-langth">
                <span class="inputset-count">{{ newReview.cont.length }}</span>
                <span class="inputset-total">/4000</span>
            </div>
        </label>
       
    </div>
    

   
</div>

 <a href="javascript:void(0)" class="btnset btnset-sm" style="margin-bottom: 6rem;margin-left: 136rem" @click="addReview(no)">작성하기</a>
 </div>
 
<script>
let booksDapp = Vue.createApp({
  data() {
    return {
      sessionId: '',
      no: ${no}, // 서버 측에서 주입해야 하는 'no' 값
      cateno: 1, // cateno 값을 1로 고정
      detail_data: {}, // 책 상세 정보를 저장할 객체
      reviews: [], // 리뷰 목록을 저장할 배열
      quantity: 1, // 수량을 저장하는 변수
      totalPrice: 0, // 총 가격을 저장하는 변수
      newReview: { // 새 리뷰를 위한 객체
        cont: '',
        score: 0 ,// 점수는 문자열에서 숫자로 변환될 것임
        cateno:1
      },
      editReview: { // 수정할 리뷰를 위한 객체
        rno: null,
        cont: '',
        score: 0
       
      }
    };
  },
  mounted() {
    this.fetchBookDetail();
  },
  methods: {
    // 책 상세 정보 및 리뷰 데이터를 가져오는 메소드
    fetchBookDetail() {
      axios.get('../books/detail_vue.do', {
        params: {
          no: this.no,
          sessionId: this.sessionId,
          cateno:this.cateno
        }
      }).then(response => {
        this.detail_data = response.data.bookDetail; // 책 상세 정보 저장
        this.reviews = response.data.reviews; // 리뷰 목록 데이터 저장
        this.sessionId = response.data.sessionId; // 응답에서 sessionId 저장
        this.detail_data.avgScore = response.data.avgScore.toFixed(1); // 소수점 첫째 자리까지 반올림하여 저장
        this.calculateTotalPrice();
      }).catch(error => {
        console.error("책 상세 정보 및 리뷰 목록 가져오기 실패:", error);
      });
    },
    addToCart() {
        if (!this.sessionId) {
          alert("로그인이 필요합니다.");
          return;
        }

        const cartItem = {
          userId: this.sessionId, // 로그인한 사용자의 ID
          no: this.detail_data.no, // 책 번호
          quantity: this.quantity, // 선택한 수량
          totalPrice: this.totalPrice, // 계산된 총 가격
          addr: "기본 주소", // 배송지 주소, 사용자로부터 입력받거나 기본값 사용
          title: this.detail_data.title, // 책 제목
          poster: this.detail_data.poster // 책 표지 이미지 URL
        };

        axios.post('../books/cart_ok.do', cartItem)
        .then(response => {
            // 장바구니 담기 성공 메시지
            const moveToCart = confirm("장바구니에 추가되었습니다. 장바구니 페이지로 이동하시겠습니까?");
            if (moveToCart) {
              // '예'를 선택한 경우, 장바구니 페이지로 리다이렉트
              window.location.href = '../mypage/books_cart.do'; // 장바구니 페이지의 URL로 변경해주세요
            }
            // '아니오'를 선택한 경우, 현재 페이지에 머무름
          })
          .catch(error => {
            console.error("장바구니 추가 실패:", error);
            alert("장바구니 추가에 실패했습니다.");
          });
      },

    purchase() {
        if (!this.sessionId) {
          alert("로그인이 필요한 메뉴입니다.");
          window.location.href = '../member/login.do'; // 로그인 페이지로 리다이렉트
        } else {
        	window.location.href = '../books/payment.do?no=' + this.detail_data.no;
        }
      },
    // 수량 증가 메소드
    increaseQuantity() {
      this.quantity++;
      this.calculateTotalPrice();
    },
    // 수량 감소 메소드
    decreaseQuantity() {
      if (this.quantity > 1) {
        this.quantity--;
        this.calculateTotalPrice();
      }
    },
    // 총 가격 계산 메소드
    calculateTotalPrice() {
      this.totalPrice = this.quantity * this.detail_data.price;
    },
    // 새 리뷰 추가 메소드
    addReview() {
  // 로그인 상태 확인
  if (!this.sessionId) {
    // 로그인 상태가 아니면 알림 창을 표시하고 로그인 페이지로 이동
    alert("로그인이 필요한 메뉴입니다.");
    window.location.href = '../member/login.do'; // 로그인 페이지 경로로 이동
    return; // 메소드 실행 중단
  }

  // 로그인 상태일 경우 리뷰 추가 로직 수행
  axios.post('../books/review_insert_vue.do', null, {
    params: {
      no: this.no,
      userId: this.sessionId, // 현재 로그인한 사용자 ID
      cont: this.newReview.cont,
      score: parseInt(this.newReview.score), // 점수를 문자열에서 숫자로 변환
      cateno:1
    }
  }).then(() => {
    alert("리뷰가 성공적으로 추가되었습니다.");
    this.fetchBookDetail(); // 리뷰 추가 후 목록 새로고침
    this.newReview.cont = ''; // 입력 필드 초기화
    this.newReview.score = 0; // 별점 초기화
  }).catch(error => {
    console.error("리뷰 추가 실패:", error);
  });
},

    // 리뷰 수정 메소드
    updateReview() {
      axios.post('../books/review_update_vue.do', null, {
        params: {
          rno: this.editReview.rno,
          cont: this.editReview.cont,
          score: parseInt(this.editReview.score), // 점수를 문자열에서 숫자로 변환
          cateno:this.cateno
        }
      }).then(() => {
        alert("리뷰가 성공적으로 수정되었습니다.");
        this.fetchBookDetail(); // 리뷰 수정 후 목록 새로고침
        this.editReview = { rno: null, cont: '', score: 0 }; // editReview 객체 초기화
      }).catch(error => {
        console.error("리뷰 수정 실패:", error);
      });
    },
    // 리뷰 삭제 메소드
    deleteReview(rno) {
      axios.get('../books/review_delete_vue.do', {
        params: {
          rno: rno,
          cateno:this.cateno
        }
      })
      .then(response => {
        alert("리뷰가 성공적으로 삭제되었습니다.");
        this.fetchBookDetail(); // 리뷰 삭제 후 목록 새로고침
      })
      .catch(error => {
        console.error("리뷰 삭제 실패:", error);
      });
    },
    // 수정할 리뷰를 선택하는 메소드
    selectForEdit(review) {
      this.editReview = Object.assign({}, review); // 선택된 리뷰 객체를 복사하여 editReview 객체
    },
    setRating(rating) {
        this.newReview.score = rating;
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