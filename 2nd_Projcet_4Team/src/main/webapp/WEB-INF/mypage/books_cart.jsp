<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../books/css/setting.css">
<link rel="stylesheet" href="../books/css/plugin.css">
<link rel="stylesheet" href="../books/css/template.css">
<link rel="stylesheet" href="../mypage/css/style.css">
<link rel="stylesheet" href="../books/css/setting1.css">
<link rel="stylesheet" href="../books/css/plugin1.css">
<link rel="stylesheet" href="../books/css/template1.css">
<link rel="stylesheet" href="../books/css/style1.css">
<link rel="stylesheet" href="../css/template1.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
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
  width: 60px;
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
</style>
</head>
<body>
<div id="cartApp"  >
    <div class="hooms-N43" >
        <div class="contents-inner" style="margin-top: -17rem" >
            <div class="contents-container container-md" style="width: 100rem">
                <h2 style="font-size:40px;text-align: center;margin-bottom:45px;font-weight: 600;margin-top:20px">장바구니</h2>
                <div class="tableset tableset-receipt tableset-text-top" >
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
                            <tr v-for="item in cartItems" :key="item.rno">
                                <td class="tableset-figure td-border-bottom">
                                    <figure style="max-width: 100%; max-height: 100%; display: flex;">
                                        <img :src="item.poster" alt="이미지" style="max-width: 100%; max-height: 100%;">
                                    </figure>
                                    <div class="tableset-group" style="text-align: center">
                                        <h5 class="p1">
                                            <br>
                                            <a :href="'../books/detail.do?no=' + item.no">
                                            {{ item.title }}
                                            </a>
                                            <br>
                                            <br>
                                            <br>
                                            <a :href="'../books/detail.do?no=' + item.no" class="btnset btnset-sm" style="float:left;margin-top:50px">둘러보기</a>

                                        </h5>
                                    </div>
                                </td>
                                <td>
								    <strong>{{ item.bookPrice }} 원</strong>
								</td>
							
                             <td>
                             <br>
                             <br>
                             <br>
                             <br>
<div class="number-control" style="margin-top:50px">
    <div class="number-left" data-content="-" @click="decreaseQuantity(item)"></div>
    <input type="text" :value="item.quantity" class="number-quantity" readonly>
    <div class="number-right" data-content="+" @click="increaseQuantity(item)"></div>
</div>

    <br>
                                            <br>
                                            <br>
</td>
                                                     <td class="tableset-dark">
                                    {{ item.totalPrice }} 원
<a @click="deleteCartItem(item.rno)" class="btnset btnset-sm" style="float:left;margin-top:50px">삭제하기</a>
                    <br>
<a @click="processPayment(item.no)" class="btnset btnset-sm" style="float:left;margin-top:50px">구매하기</a>

 
                                   
                                </td>
                                <td>
                                
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
const cartApp = Vue.createApp({
    data() {
        return {
            cartItems: [], // 장바구니 아이템을 저장할 배열
            sessionId: '', // 사용자 세션 ID
            addr: '', // 주소
            totalPrice: 0, // 총 가격
            
        };
    },
    mounted() {
        this.fetchCartItems();
        IMP.init("imp41460687"); // Iamport 결제 모듈 초기화
    },
    methods: {
        // 장바구니 목록 가져오기
        fetchCartItems() {
            
        	axios.get('books_cart_list.do')
              
            .then(response => {
                    this.cartItems = response.data.list; // 서버로부터 받은 장바구니 목록 저장
                    this.updateTotalPrice(); // 총 가격 업데이트
                    
                })
                .catch(error => {
                    console.error('장바구니 목록 가져오기 오류:', error);
                });
        },

        // 장바구니 아이템 삭제
        deleteCartItem(rno) {
            axios.get(`books_cart_delete.do?rno=${rno}`)
                .then(() => {
                    alert('장바구니 항목이 삭제되었습니다.');
                    this.fetchCartItems(); // 장바구니 목록 다시 불러오기
                })
                .catch(error => {
                    console.error('장바구니 항목 삭제 오류:', error);
                    alert('장바구니 항목 삭제 중 오류가 발생했습니다.');
                });
        },

        // 결제 진행
        processPayment(no) {
        	 
    const IMP = window.IMP; // Iamport 객체 추출
    IMP.init('imp41460687'); // Iamport 가맹점 식별코드

    // 결제 데이터 설정
    const paymentData = {
        pg: 'html5_inicis', // PG사
        pay_method: 'card', // 결제 방법
        merchant_uid: 'merchant_' + new Date().getTime(), // 주문 번호
        name: '장바구니 결제', // 주문명
        amount: this.totalPrice, // 결제 금액
        buyer_email: 'iamport@siot.do',
        buyer_name: '구매자 이름',
        buyer_tel: '010-1234-5678',
        buyer_addr: this.addr, // 구매자 주소
        buyer_postcode: '123-456' // 우편번호
    };

    // Iamport 결제 요청
    IMP.request_pay(paymentData, (response) => {
        if (response.success) {
            alert('결제가 성공적으로 완료되었습니다.');
            // 결제 성공 후 처리 로직
            // 여기서 'no' 파라미터와 함께 결제 성공 페이지로 리다이렉션
             window.location.href = `../web/books/payment.do?item.no`; // 결제 성공 시 리다이렉션 URL

        } else {
        	 window.location.href = '../books/payment.do?no='+no // 결제 성공 시 리다이렉션 URL

        }
    });
},

        // 총 가격 업데이트
        updateTotalPrice() {
            this.totalPrice = this.cartItems.reduce((total, item) => total + item.totalPrice, 0);
        }
    },
}).mount('#cartApp');
</script>

<!-- HTML 파일의 <head> 태그 내에 추가 -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</body>
</html>
