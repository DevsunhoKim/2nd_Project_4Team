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
            <div class="contents-container container-md" style="width: 110rem">
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
                                   <strong>{{ (item.price) }} 원</strong>

                                </td>
                             <td>
    <div class="number-control">
        <div class="number-left" data-content="-" @click="decreaseQuantity(item)"></div>
        <input type="text" class="number-quantity" v-model.number="item.quantity" readonly>
        <div class="number-right" data-content="+" @click="increaseQuantity(item)"></div>
    </div>
</td>
                                                     <td class="tableset-dark">
                                    {{ item.totalPrice }} 원
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
        };
    },
    mounted() {
        this.fetchCartItems();
    },
    methods: {
        fetchCartItems() {
            axios.get('books_cart_list.do')
                .then(response => {
                	console.log(response); // 전체 응답을 콘솔에 출력
                    console.log(response.data); // 응답 데이터만 콘솔에 출력
                    this.cartItems = response.data.list; // 서버로부터 받은 장바구니 목록을 cartItems에 저장
                })
        },
        increaseQuantity(item) {
            item.quantity++;
            // 필요한 경우 서버에 변경사항을 업데이트하는 로직 추가
        },
        decreaseQuantity(item) {
            if (item.quantity > 1) {
                item.quantity--;
                // 필요한 경우 서버에 변경사항을 업데이트하는 로직 추가
            }
        }
    },
}).mount('#cartApp');
</script>
</body>
</html>
