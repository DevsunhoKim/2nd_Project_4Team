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
  <main class="th-layout-main ">
    <!-- [S]hooms-N49 -->
    <div class="hooms-N49" data-bid="IMlT00KK2L">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-ico">
            
              <img class="cardset-img" src="../books/images/check.png" alt="체크아이콘" style="width:120px;height: 120px">
            
            <p>
            <h3>주문/결제가 완료되었습니다.</h3>
          </div>
          <div class="textset">
            <p class="textset-tit">주문정보</p>
          </div>
          <div class="tableset tableset-receipt tableset-text-top">
            <table class="tableset-table table">
              <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
              </colgroup>
              <thead class="thead-light thead-border-top">
                <tr>
                  <th scope="col">주문번호</th>
                  <th scope="col">주문일자</th>
                  <th scope="col">주문자</th>
                  <th scope="col">주문처리상태</th>
                  <th scope="col">추가정보</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="tableset-dark">
                    <strong>주문번호</strong>
                    20230401-0123456
                  </td>
                  <td class="tableset-dark td-border-bottom">
                    <strong>주문일자</strong>
                    2023-04-01
                    <br class="tableset-mobile"> 09:00:00
                  </td>
                  <td class="tableset-dark">
                    <strong>주문자</strong>
                    홍길동
                  </td>
                  <td class="tableset-dark">
                    <strong>주문처리상태</strong>
                    상품준비중
                  </td>
                  <td>
                    <strong>추가정보</strong>
                    해당없음
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="contents-bottom">
            <p class="contents-desc">* 택배/시공 상품이 별도 배송될 수 있습니다.</p>
            <p class="contents-price">총 구매가 <span>2,010,000 원</span>
            </p>
          </div>
          <div class="contents-btn">
            <a href="javascript:void(0)" class="btnset btnset-lg">돌아가기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N49 -->
  </main>
 
 <script src="../books/js/setting.js"></script>
  <script src="../books/js/template.js"></script>
  <script src="../books/js/common.js"></script>
  <script src="../books/js/script.js"></script>
  <script>
Vue.createApp({
    data() {
        return {
            // 필요한 데이터 변수들 정의
        };
    },
    methods: {
        completePurchase() {
            // B_CartVO 객체에 해당하는 데이터를 정의합니다.
            // 예시에서는 간단히 몇 가지 필드만 사용하고 있으나, 실제 필요한 모든 필드를 포함시켜야 합니다.
            const purchaseData = {
                // 예: itemId: this.selectedItemId, quantity: this.quantity 등
            };

            // Axios를 사용하여 서버에 POST 요청을 보냅니다.
            axios.post('/pay_ok.do', purchaseData, {
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8'
                }
            })
            .then(response => {
                // 서버로부터 응답을 정상적으로 받았을 때의 처리
                if(response.data.status === 'success') {
                    alert('주문/결제가 성공적으로 완료되었습니다.');
                    // 성공 처리 로직, 예: 주문 완료 페이지로 리다이렉션
                } else {
                    // 서버에서 에러 응답을 받았을 때의 처리
                    alert('주문/결제 처리 중 문제가 발생했습니다.');
                }
            })
            .catch(error => {
                // 요청 자체가 실패했을 때의 처리
                console.error('주문/결제 요청 실패:', error);
                alert('주문/결제 요청 중 문제가 발생했습니다.');
            });
        }
    }
}).mount('#app');
</script>
  
</body>
</html>