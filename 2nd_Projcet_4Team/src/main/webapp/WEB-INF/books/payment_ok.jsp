<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 완료</title>
    <!-- 스타일시트 링크 -->
</head>
<body>

    <div id="app"> <!-- Vue 앱의 루트 요소 -->
        <main class="th-layout-main" v-if="orderInfo">
            <div class="hooms-N49" data-bid="IMlT00KK2L">
                <div class="contents-inner">
                    <div class="contents-container container-md">
                        <div class="contents-ico">
                            <img class="cardset-img" src="../books/images/check.png" alt="체크아이콘" style="width:120px;height: 120px">
                            <h3>주문/결제가 완료되었습니다.</h3>
                        </div>
                        <div class="tableset tableset-receipt tableset-text-top">
                            <table class="tableset-table table">
                                <thead class="thead-light thead-border-top">
                                    <tr>
                                        <th scope="col">주문번호</th>
                                        <th scope="col">주문일자</th>
                                        <th scope="col">주문자</th>
                                        <th scope="col">주문처리상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>{{ orderInfo.vo.no }}</td> <!-- 주문번호 -->
                                        <td>{{ orderInfo.vo.dbday }}</td> <!-- 주문일자 -->
                                        <td>{{ orderInfo.vo.userId }}</td> <!-- 주문자 -->
                                        <td>{{ orderInfo.vo.status }}</td> <!-- 주문처리상태 -->
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="contents-bottom">
                            <p>* 택배/시공 상품이 별도 배송될 수 있습니다.</p>
                            <p>총 구매가 <span>{{ orderInfo.vo.totalPrice | currency }}</span></p> <!-- 총 구매가 -->
                        </div>
                        <div class="contents-btn">
                            <a href="javascript:void(0)" class="btnset btnset-lg">돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Vue 및 Axios 스크립트 -->


 
 <script src="../books/js/setting.js"></script>
  <script src="../books/js/template.js"></script>
  <script src="../books/js/common.js"></script>
  <script src="../books/js/script.js"></script>

<!-- HTML 내에 숨겨진 input 요소로 rno 값을 저장 -->


<script src="https://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>
Vue.createApp({
    data() {
        return {
            orderInfo: null // 처음에는 orderInfo를 null로 초기화합니다.
        };
    },
    mounted() {
        this.fetchOrderInfo(); // 컴포넌트가 마운트되면 결제 정보를 가져옵니다.
    },
    methods: {
        fetchOrderInfo() {
            // URL에서 rno 파라미터 값을 추출합니다.
            const urlParams = new URLSearchParams(window.location.search);
            const rno = urlParams.get('rno'); // 'rno' 파라미터 값

            if (rno) {
                // rno 값이 있는 경우에만 서버에 요청을 보냅니다.
                axios.get('/pay_info_ok.do', {
                    params: {
                        rno: rno
                    }
                })
                .then(response => {
                    // 서버로부터 응답을 정상적으로 받았을 때의 처리
                    this.orderInfo = response.data; // 응답 데이터를 orderInfo에 저장
                })
                .catch(error => {
                    // 요청 자체가 실패했을 때의 처리
                    console.error('결제 정보 요청 실패:', error);
                });
            }
        }
    }
}).mount('#app');
</script>



  
</body>
</html>