<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 추가</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/template.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="https://unpkg.com/vue@3"></script>
<!-- axios : JavaScript에서 사용되는 HTTP 클라이언트 라이브러리로, 비동기적으로 서버와 통신하며 데이터 입·출력 시 사용 -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../js/setting.js"></script>
<script src="../js/common.js"></script>
<script src="../js/template.js"></script>
<script src="../js/script.js"></script>
<script src="../recruitment/js/template.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
  <section id="recruitmentCompany" class="th-layout-sub insert">
    <div class="content-container">
      <div class="container-md">
        <form method="" action="">
          <div class="company-top">
            <ul class="company-info">
              <li>
                <label for="company-logo">기업 로고</label>
                <input type="file" name="company-logo" id="company-logo" class="company-input">
              </li>
              <li>
                <label for="company-name">기업명</label>
                <input type="text" name="company-name" id="company-name" class="company-input" placeholder="기업명을 입력해 주세요.">
              </li>
              <li>
                <label for="company-type">업종</label>
                <input type="text" name="company-type" id="company-type" class="company-input" placeholder="업종을 입력해 주세요.">
              </li>
            </ul>
          </div>

          <div class="company-detail">
            <ul class="company-detail-box">
              <li>
                <label for="company-year">업력</label>
                <input type="text" name="company-year" id="company-year" class="company-input" placeholder="업력을 입력해 주세요.">
              </li>
              <li>
                <label for="company-scale">기업 형태</label>
                <input type="text" name="company-scale" id="company-scale" class="company-input" placeholder="기업 형태를 입력해 주세요.">
              </li>
              <li>
                <label for="company-worker">사원 수</label>
                <input type="text" name="company-worker" id="company-worker" class="company-input" placeholder="사원 수를 입력해 주세요.">
              </li>
              <li>
                <label for="company-sales">매출액</label>
                <input type="text" name="company-sales" id="company-sales" class="company-input" placeholder="매출액을 입력해 주세요.">
              </li>
            </ul>
            <ul class="company-detail-info">
              <li>
                <label for="company-address">주소</label>
                <input type="text" name="company-address" id="company-address" class="company-input" placeholder="주소를 입력해 주세요.">
              </li>
              <li>
                <label for="company-homepage">홈페이지</label>
                <input type="text" name="company-homepage" id="company-homepage" class="company-input" placeholder="홈페이지 주소를 입력해 주세요.">
              </li>
              <li>
                <label for="company-phone">전화번호</label>
                <input type="text" name="company-phone" id="company-phone" class="company-input" placeholder="전화번호를 입력해 주세요.">
              </li>
              <li>
                <label for="company-email">이메일</label>
                <input type="text" name="company-email" id="company-email" class="company-input" placeholder="이메일을 입력해 주세요.">
              </li>
            </ul>
            <div class="company-detail-intro">
              <h3>기업 소개</h3>
              <label for="company-img">기업 이미지</label>
              <input type="file" name="company-img" id="company-img" class="company-input">
              <br>
              <label for="company-content">기업 상세 설명</label>
              <textarea id="company-content" class="company-textarea" placeholder="기업의 상세 정보를 입력해 주세요."></textarea>
            </div>
          </div>
          <button type="submit" id="companyInsertBtn" class="company-btn">작성하기</button>
          <button type="submit" id="companyCancelBtn" class="company-btn">취소</button>
        </form>
      </div>
    </div>
  </section>
</body>
</html>