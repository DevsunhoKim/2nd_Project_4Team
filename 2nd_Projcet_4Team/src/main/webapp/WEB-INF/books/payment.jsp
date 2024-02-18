<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.hooms-N43 .contents-inner { padding: 10rem 2.4rem; }
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
.hooms-N45 .contents-inner { padding: 10rem 2.4rem; }
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
}

  </style>
</head>

<body>
  <main class="th-layout-main ">
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
                  <th scope="col">상품금액</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="tableset-figure td-border-bottom">
                    <figure>
                      <img src="/api/t-a/56/1708048800/resources/images/img_checkout_01_1.png" alt="이미지">
                    </figure>
                    <div class="tableset-group">
                      <h5 class="p1">
                        Beautyrest Collection
                        <br>
                        Zalmon &amp; Derfel
                      </h5>
                    </div>
                  </td>
                  <td>
                    <strong>단가</strong>
                    2,010,000 원
                  </td>
                  <td class="td-border-bottom">
                    <strong>수량</strong>
                    1
                  </td>
                  <td class="tableset-dark">
                    <strong>상품금액</strong>
                    2,010,000 원
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="contents-bottom">
            <p class="contents-price" style="text-align:right;">총 구매가 <span>2,010,000 원</span>
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
                  <input type="text" class="inputset-input form-control" placeholder="우편번호 검색" aria-label="내용" required="" disabled="">
                  <button class="btnset btnset-line btnset-lg fileset-btn-upload">주소 검색</button>
                </div>
              </label>
              <label>
                <input type="text" class="inputset-input form-control" aria-label="내용" required="" disabled="">
                <input type="text" class="inputset-input form-control" placeholder="상세주소를 입력해주세요." aria-label="내용" required="">
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
            총 결제 금액 <span>2,010,000 원</span>
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
                <li class="tabset-item">
                  <a class="tabset-link" href="javascript:void(0)">
                    <span>무통장 입금</span>
                  </a>
                </li>
                <li class="tabset-item">
                  <a class="tabset-link" href="javascript:void(0)">
                    <span>카카오페이</span>
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
            </div>
            <div class="checkset">
              <input id="checkset-a-1-1" class="checkset-input input-fill" type="checkbox" value="">
              <label class="checkset-label" for="checkset-a-1-1"></label>
              <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. (필수)</span>
            </div>
          </div>
          <div class="contents-btn">
            <a href="javascript:void(0)" class="btnset btnset-lg">결제하기</a>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N45 -->
  </main>
  <script src="../books/js/setting.js"></script>
  <script src="../books/js/plugin.js"></script>
  <script src="../books/js/template.js"></script>
  <script src="../books/js/common.js"></script>
  <script src="../books/js/script.js"></script>
</body>

</html>