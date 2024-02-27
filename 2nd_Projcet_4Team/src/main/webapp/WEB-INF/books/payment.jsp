<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
  <title>첫페이지</title>
    <link rel="stylesheet" href="../books/css/setting.css">
  <link rel="stylesheet" href="../books/css/plugin.css">
  <link rel="stylesheet" href="../books/css/template.css">
  <link rel="stylesheet" href="../books/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>

.hooms-N44 .contents-inner { padding: 10rem 6.4rem; }
.hooms-N44 .textset-tit { margin-bottom: 2.4rem; text-align: center; }
.hooms-N44 .contents-form-top { position: relative; padding: 4rem 0; border-top: 1px solid var(--line-color4); border-bottom: 1px solid var(--line-color4); }
.hooms-N44 .contents-form-top .inputset+.inputset { margin-top: 4rem; }
.hooms-N44 .contents-form-top .radioset-input+.radioset-label { width: 2.4rem; height: 2.4rem; }
.hooms-N44 .contents-form-top .radioset-input.input-line:checked+.radioset-label::before { font-size: 2.4rem; }
.hooms-N44 .radioset-text { font-size: var(--fs-p1); color: var(--text-color2); }
.hooms-N44 .contents-form-top .contents-form-group+.contents-form-group { padding-top: 4rem; }
.hooms-N44 .contents-address { flex-direction: column; }
.hooms-N44 .contents-address+.contents-address { margin-top: 4rem; }
.hooms-N44 .contents-address label+label { margin-left: 0; margin-top: 0.8rem; }
.hooms-N44 .contents-address-btn { display: flex; justify-content: space-between; }
.hooms-N44 .contents-address .inputset { display: flex; align-items: center; }
.hooms-N44 .contents-address .inputset-input+.inputset-input { margin-top: 0.8rem; }
.hooms-N44 .contents-address ul { margin-bottom: 1.2rem; }
.hooms-N44 .contents-address ul li { font-size: var(--fs-p1); line-height: var(--lh-p1); color: var(--text-color2); }
.hooms-N44 .contents-address .btnset { width: 100%; max-width: 17.6rem; padding: 1.6rem; margin-left: 1.2rem; }
.hooms-N44 .contents-address .inputset-textarea { height: 5.6rem; padding: 1.2rem 1.6rem; resize: none; }
.hooms-N44 .contents-form-bottom { padding: 4rem 0; }
.hooms-N44 .checkset { margin-top: 1.2rem; }
.hooms-N44 .checkset .checkset-input+.checkset-label { width: 2.4rem; height: 2.4rem; border-color: var(--primary); }
.hooms-N44 .checkset .checkset-input.input-fill+.checkset-label::before { font-size: 2.4rem; }
.hooms-N44 .checkset-text { font-size: 1.8rem; }
@media (max-width: 992px) {
 .hooms-N44 .contents-inner { padding: 6rem 2.4rem; }
 .hooms-N44 .textset-tit { margin-bottom: 1.4rem; }
 .hooms-N44 .contents-form-top { padding: 2.4rem 0; }
 .hooms-N44 .contents-form-top .inputset+.inputset { margin-top: 1.2rem; }
 .hooms-N44 .contents-address+.contents-address { margin-top: 2.4rem; }
 .hooms-N44 .contents-address .btnset { max-width: 10rem; margin-left: 0.8rem; }
 .hooms-N44 .contents-address ul { margin-bottom: 0.8rem; }
 .hooms-N44 .contents-address .inputset-textarea { padding: 1.4rem; height: 9rem; }
 .hooms-N44 .contents-form-bottom { padding: 2.4rem 0; }
 .hooms-N44 .checkset .checkset-input+.checkset-label { width: 2rem; height: 2rem; }
 .hooms-N44 .checkset .checkset-input.input-fill+.checkset-label::before { font-size: 2rem; }
 .hooms-N44 .checkset-text { font-size: 1.4rem; }
}

/* hooms-N43 [uKlSO0zbWX] */
.hooms-N43 .contents-inner { padding: 0rem 2.4rem; }
.hooms-N43 .textset.textset-h2 { margin-bottom: 10rem; text-align: center; }
.hooms-N43 .textset.textset-h2 .textset-tit+.textset-desc { margin-top: 2.4rem; font-size: var(--fs-h3); line-height: var(--lh-h3); color: var(--text-color1); font-weight: 500; }
.hooms-N43 .contents-bottom { display: flex; justify-content: space-between; align-items: center; margin-top: 1.6rem; }
.hooms-N43 .contents-desc { font-size: var(--fs-p2); line-height: var(--lh-p2); color: var(--text-color3); }
.hooms-N43 .tableset-figure figure { flex-shrink: 0; }
.hooms-N43 .contents-price { font-size: var(--fs-h3); line-height: var(--lh-h3); font-weight: 500; }
.hooms-N43 .contents-price span { margin-left: 1.6rem; color: var(--secondary); }
@media (max-width: 992px) {
 .hooms-N43 .contents-inner { padding: 6rem 2.4rem; }
 .hooms-N43 .textset.textset-h2 { margin-bottom: 6rem; }
 .hooms-N43 .contents-bottom { flex-direction: column; align-items: flex-start; margin-top: .8rem; }
 .hooms-N43 .contents-price { display: flex; justify-content: space-between; width: 100%; margin-top: 1.6rem; }
 .hooms-N43 .contents-price span { margin-left: 0; }
}

/* hooms-N45 [vfLsO0j77a] */
.hooms-N45 .contents-inner { padding: 5rem 2.4rem; }
.hooms-N45 .textset { margin-top: 0; padding: 0; }
.hooms-N45 .textset-tit { margin-bottom: 2.4rem; text-align: center; }
.hooms-N45 .tabset-item { width: 100%; }
.hooms-N45 .tabset-item { width: 100%; }
.hooms-N45 .contents-price { padding: 4rem 0; font-size: var(--fs-h3); line-height: var(--lh-h3); font-weight: 500; border-top: 1px solid var(--line-color4); border-bottom: 1px solid var(--border-color); }
.hooms-N45 .contents-price span { margin-left: 1.6rem; color: var(--secondary); }
.hooms-N45 .contents-group { padding-top: 4rem; }
.hooms-N45 .contents-name { margin-bottom: 1.2rem; font-size: var(--fs-h6); font-weight: 500; }
.hooms-N45 .contents-board { max-height: 20rem; overflow-y: auto; padding: 1.6rem; font-size: var(--fs-p1); color: var(--text-color3); border: 1px solid var(--border-color); }
.hooms-N45 .checkset { margin-top: 1.2rem; }
.hooms-N45 .checkset-input+.checkset-label { width: 2.4rem; height: 2.4rem; border-color: var(--primary); }
.hooms-N45 .checkset-input.input-fill+.checkset-label::before { font-size: 2.4rem; }
.hooms-N45 .checkset-text { font-size: 1.8rem; }
.hooms-N45 .contents-btn { margin-top: 6rem; text-align: center; }
.hooms-N45 .contents-btn .btnset { width: 100%; max-width: 62rem; }
@media (max-width: 992px) {
 .hooms-N45 .contents-inner { padding: 6rem 2.4rem; }
 .hooms-N45 .textset-tit { margin-bottom: 1.4rem; }
 .hooms-N45 .contents-price { display: flex; align-items: center; justify-content: space-between; padding: 1.6rem 0; }
 .hooms-N45 .contents-price span { margin-left: 0; }
 .hooms-N45 .contents-group { padding-top: 1.6rem; }
 .hooms-N45 .contents-name { margin-bottom: 0.8rem; }
 .hooms-N45 .tabset-list { flex-direction: column; }
 .hooms-N45 .tabset-item { width: 100% !important; }
 .hooms-N45 .contents-board { padding: 1.4rem; }
 .hooms-N45 .checkset-input+.checkset-label { width: 2rem; height: 2rem; }
 .hooms-N45 .checkset-input.input-fill+.checkset-label::before { font-size: 2rem; }
 .hooms-N45 .checkset-text { font-size: 1.4rem; }
 .hooms-N45 .contents-btn { margin-top: 4rem; }
 .hooms-N45 .contents-btn .btnset { max-width: 100%; }
 
 .tableset.tableset-receipt .tableset-table td.tableset-figure figure img { width: 100%; height: 100%; object-fit: scale-down; }


.quantity-control {
    display: flex;
    align-items: center;
    justify-content: center;
}

.button {
    width: 33px; /* 버튼의 가로 너비를 33px로 조정 */
    height: 30px; /* 버튼의 세로 높이를 30px로 조정 */
    background-color: #f2f2f2;
    border: 1px solid #d1d1d1;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    user-select: none;
}

.quantity-input {
    width: 35px; /* 입력 필드의 가로 너비를 40px로 줄임 */
    text-align: center;
    margin: 0 5px; /* 버튼과 입력 필드 사이의 간격을 5px로 줄임 */
    border: 1px solid #d1d1d1;
}





  </style>
</head>

<body>
  <main class="th-layout-main " id="paymentApp">
   <!-- [S]hooms-N43 -->
    <div class="hooms-N43" data-bid="uKlSO0zbWX">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <h2 style="font-size:40px;text-align: center;margin-bottom:45px;font-weight: 600;margin-top:20px">주문 정보</h2>
          <div class="tableset tableset-receipt tableset-text-top">
            <table class="tableset-table table">
              <colgroup>
                <col>
                <col>
                <col>
                <col>
              </colgroup>
              <thead class="thead-light thead-border-top">
                <tr>
                  <th scope="col">상품정보</th>
                  <th scope="col">단가</th>
                  <th scope="col">수량</th>
                  <th scope="col">총 금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="tableset-figure td-border-bottom">
                    <figure  style="max-width: 100%; max-height: 100%; display: flex;" >
                      <img :src="detail_data.poster" alt="이미지"  style="max-width: 100%; max-height: 100%; o ">
                    </figure >
                    <div class="tableset-group" style="text-align: center">
                      <h5 class="p1">
                        <br>
                        {{ detail_data.title }}
                        <br>
                        <br>
                        <br>
                        {{ detail_data.publ }}
                      </h5>
                    </div>
                  </td>
                  <td>
                    <strong>단가</strong>
                    <br>
                    <br>
                    <br>
                    {{detail_data.price}} 원
                  </td>
                  <td class="td-border-bottom">
                  <br>
                  <br>
                  <br>
                    <strong>수량</strong>
                   
               <div id="app" class="quantity-control">
    <button @click="decreaseQuantity" class="button" style="width:33px;height: 30px;background-color: black;color:white">-</button>
    <input type="text" v-model="quantity" class="quantity-input" style="width:45px;height: 30px;text-align: center">
    <button @click="increaseQuantity" class="button" style="width:33px;height: 30px;background-color: black;color:white">+</button>
</div>
                  </td>
                  <td class="tableset-dark">
                     <br>
                     <br>
                     <br>
                    <strong>총 금액</strong>
                    {{ totalPrice.toLocaleString('ko-KR') }} 원
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="contents-bottom">
            <p class="contents-price" style="text-align:right;">총 구매가 <span>{{ totalPrice.toLocaleString('ko-KR') }} 원</span>
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N43 -->
   <div class="hooms-N44" data-bid="cfLSO11v5C">
    <div class="contents-inner">
      <div class="contents-container container-md">
        <div class="textset">
        </div>
        <div class="contents-form">
          <div class="contents-form-top">
            <div class="inputset inputset-lg inputset-label">
              <label>
                <h6 class="inputset-tit">
                  주문자명<span>*</span>
                </h6>
                <input type="text" class="inputset-input form-control" placeholder="주문자명을 입력해주세요." aria-label="내용" required="">
              </label>
              <label>
                <h6 class="inputset-tit">
                  받는 사람<span>(단체일 경우에만 입력)</span>
                </h6>
                <input type="text" class="inputset-input form-control" placeholder="받는 사람을 입력해주세요." aria-label="내용" required="">
              </label>
            </div>
            <div class="inputset inputset-lg inputset-label">
              <label>
                <h6 class="inputset-tit">
                  연락처<span>*</span>
                </h6>
                <input type="tel" class="inputset-input form-control" placeholder="-를 제외한 숫자를 입력해주세요." aria-label="내용" required="">
              </label>
              <label>
                <h6 class="inputset-tit">
                  이메일<span>(단체일 경우에만 입력)</span>
                </h6>
                <input type="email" class="inputset-input form-control" placeholder="이메일 주소를 입력해주세요." aria-label="내용" required="">
              </label>
            </div>
            <div class="inputset inputset-lg inputset-label contents-address">
    <label>
        <h6 class="inputset-tit">
            배송지 정보<span>*</span>
        </h6>
        <div class="contents-address-btn">
            <input type="text" class="inputset-input form-control" v-model="post" placeholder="우편번호" aria-label="우편번호" required="" disabled="">
            <button class="btnset btnset-line btnset-lg fileset-btn-upload" @click="postFind">주소 검색</button>
        </div>
    </label>
    <label>
        <input type="text" class="inputset-input form-control" v-model="addr" placeholder="주소" aria-label="주소" required="" disabled="">
        <input type="text" class="inputset-input form-control" v-model="detail_addr" placeholder="상세주소를 입력해주세요." aria-label="상세주소" required="">
    </label>
</div>
            
            <div class="contents-address">
              <label class="labelset">
                <h6 class="labelset-tit">배송 시 요청사항</h6>
              </label>
              <ul>
                <li>
                  · 배송일은 주문하신 상품과 지역 시공 가능 인력을 고려하여 가장 빠른 날짜로 정해집니다.
                </li>
                <li>
                  · 배정된 배송일은 주문 당일 알림톡으로 발송됩니다.
                </li>
                <li>
                  · 만약 주문일의 익일 15시까지 알림톡을 수신하지 못한 경우, 고객센터(02-123-4567)로 연락해주세요.
                </li>
              </ul>
              <div class="inputset inputset-lg inputset-label">
                <label>
                  <h6 class="inputset-tit">
                    배송지 정보<span>*</span>
                  </h6>
                  <textarea class="inputset-textarea" placeholder="100자 이내로 작성해주세요."></textarea>
                </label>
              </div>
            </div>
          </div>
          <div class="contents-form-bottom">
            <div class="checkset">
              <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" value="">
              <label class="checkset-label" for="checkset-a-1-1"></label>
              <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (필수)</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- [E]hooms-N44 -->
    <!-- [S]hooms-N45 -->
    <div class="hooms-N45" data-bid="vfLsO0j77a">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">결제 정보</h2>
          </div>
          <div class="contents-price">
            총 결제 금액 <span>{{ totalPrice.toLocaleString('ko-KR') }} 원</span>
          </div>
          <div class="contents-group">
            <p class="contents-name">결제수단</p>
            <div class="tabset tabset-brick">
              <ul class="tabset-list tabset-sm tabset-fill">
                <li class="tabset-item">
                  <a class="tabset-link" href="javascript:void(0)">
                    <span>신용카드</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="contents-group">
            <p class="contents-name">결제 전 확인사항</p>
            <div class="contents-board">
              1. 고객의 단순한 변심으로 교환, 반품 및 환불을 요구할 때 수반되는 배송비는 고객님께서 부담하셔야합니다.
              <br>
              2. 상품을 개봉했거나 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한 교환, 반품이 불가능함을 양지해 주시기 바랍니다.
              <br>
            </div>
            <div class="checkset">
              
              
              
            </div>
          </div>
          <div class="contents-btn">
            <a href="javascript:void(0)" class="btnset btnset-lg" @click="requestPay()">결제하기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N45 -->
  </main>

  
    <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
// Vue 애플리케이션 정의
let paymentApp = Vue.createApp({
  data() {
    return {
      no: ${no}, // Vue 인스턴스의 데이터로 책 번호 설정
      detail_data: {}, // 책 상세 정보를 저장할 객체 (빈 객체로 초기화)
      quantity: 1, // 선택한 책의 수량
      totalPrice: 0, // 총 가격
      sessionId: '', // 사용자 세션 ID
      post: '', // 우편번호
      addr: '', // 주소
      detail_addr: '' // 상세주소
    };
  },
  mounted() {
    this.fetchBookDetail(); // 컴포넌트가 마운트되면 책 상세 정보를 가져옵니다.
    IMP.init("imp41460687"); // 아임포트 초기화
    
  },
  methods: {
    // 서버에서 책 상세 정보를 가져오는 메서드
    fetchBookDetail() {
      axios.get('../books/pay_info_vue.do', {
        params: {
          no: this.no // 책 번호를 요청 파라미터로 전달
        }
      })
      .then(response => {
    	  this.detail_data = response.data.detail_data; // 응답 데이터에서 책 상세 정보를 추출하여 저장
    	  console.log("책 상세 정보:", this.detail_data); // 콘솔에 책 상세 정보 출력

    	  this.sessionId = response.data.sessionId; // 응답 데이터에서 사용자 세션 ID를 추출하여 저장
    	  console.log("세션 ID:", this.sessionId); // 콘솔에 세션 ID 출력

    	  this.calculateTotalPrice(); // 책 상세 정보를 바탕으로 총 가격 계산
    	  console.log("총 가격:", this.totalPrice); // 콘솔에 총 가격 출력
      })
      .catch(error => {
        console.error("책 상세 정보 가져오기 실패:", error); // 오류 발생 시 콘솔에 오류 메시지 출력
      });
    },
    // 수량 증가 메서드
    increaseQuantity() {
      this.quantity++; // 수량을 1 증가
      this.calculateTotalPrice(); // 총 가격 다시 계산
    },
    // 수량 감소 메서드
    decreaseQuantity() {
      if (this.quantity > 1) {
        this.quantity--; // 수량이 1보다 클 때만 감소
        this.calculateTotalPrice(); // 총 가격 다시 계산
      }
    },
    // 총 가격 계산 메서드
    calculateTotalPrice() {
      this.totalPrice = this.quantity * this.detail_data.price; // 수량과 단가를 곱하여 총 가격 계산
    },
    postFind() {
        let _this = this;
        // 다음 API를 사용하여 주소 검색 모달 열기
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색 결과를 Vue 애플리케이션의 데이터에 업데이트
                _this.post = data.zonecode;
                _this.addr = data.address;
                _this.detail_addr = ''; // 세부 주소 초기화
            }
        }).open();
    },
    requestPay() {
        let vm = this; // Store the Vue instance in a variable and use it within the function
        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: this.detail_data.title,
            amount: this.totalPrice,
            buyer_email: 'iamport@siot.do',
            buyer_name: 'buyer name',
            buyer_tel: '010-1234-5678',
            buyer_addr: this.addr, // 사용자가 선택한 주소
            buyer_postcode: '', // 사용자가 선택한 우편번호
            app_scheme: 'iamporttest'
        }, function (rsp) {
            // For testing, treat both success and failure as success and execute the success logic.
            vm.completePurchase(); // Execute the purchase completion logic.
            if (rsp.success) {
                alert('결제가 완료되었습니다.');
            } else {
                alert('결제가 취소되었습니다. (테스트 페이지에서는 취소도 성공 로직으로 처리됩니다.)');
            }
            // Redirect to the payment success page for both cases.
            window.location.href = '../books/payment_ok.do';
        });
    },

    completePurchase() {
        // 구매 정보 객체 생성
        const purchaseData = {
        		userId: this.sessionId, // 사용자 세션 ID
                no: this.detail_data.no, // 책 번호
                quantity: this.quantity,
                buy_cnt: this.quantity, // 구매 수량
                totalPrice: this.totalPrice, // 총 가격
                addr: this.addr, // 사용자가 입력한 주소 정보
                poster: this.detail_data.poster, // 책 포스터 이미지
                title: this.detail_data.title // 책 제목
        };
        console.log("구매 정보:", purchaseData);
        console.log("poster:", purchaseData.poster);
        console.log("title:", purchaseData.title);

        // 서버에 구매 정보 전송
        axios.post('../books/pay_ok.do', purchaseData)
        .then(response => {
            if(response.data.status === 'success') {
                // 응답에서 rno 값을 추출
                const rno = response.data.rno;
                // 결제 완료 페이지로 리다이렉트하면서 rno 값을 URL에 포함
                window.location.href = `../books/payment_ok.do?rno=${rno}`;
            } else {
                alert('서버에서 구매 정보 처리에 실패하였습니다.');
            }
        })
        .catch(error => {
            console.error('구매 정보 전송 실패:', error);
            alert('서버와의 통신 중 오류가 발생했습니다.');
        });
    }
  },
  computed: {
    // 책 가격을 형식화하여 반환하는 계산된 속성
    formattedPrice() {
      return new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(this.detail_data.price);
      // 총 가격을 형식화하여 반환하는 계산된 속성도 필요하다면 여기에 구현 추가
    }
  }
}).mount('#paymentApp'); // Vue 애플리케이션을 마운트할 요소의 ID
</script>



  
  <script src="../books/js/setting.js"></script>
  <script src="../books/js/common.js"></script>
  <script src="../books/js/script.js"></script>
</body>

</html>