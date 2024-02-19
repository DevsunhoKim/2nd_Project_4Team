<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 제목</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="../js/setting.js"></script>
<script src="../js/plugin.js"></script>s
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="../recruitment/js/template.js"></script>
</head>
<body>
  <section id="recruitmentDetail" class="th-layout-sub">
    <div class="content-container">
      <div class="container-md">
        <div class="content-desc">
          <div class="recruit-top">
            <div class="recruit-info">
              <a href="#" class="company-info">
                <figure class="company-logo">
                  <img class="width-100" src="../resources/images/company_logo_1.png" alt="기업 로고">
                </figure>
                <h3 class="company-name">㈜우아한형제들</h3>
              </a>
              <h2 class="recruit-tit">각 부문별 경력/신입 인재영입</h2>
            </div>
            <button type="button" id="recruitApplyBtnTop" class="recruit-btn recruit-apply-btn">지원하기</button>
          </div>
        </div>

        <div class="recruit-detail">
          <div class="recruit-btn-wrapper">
            <button type="button" id="recruitLikeBtn" class="recruit-btn">
              <span class="recruit-like-count">1024</span>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4847/4847183.png" alt="관심 공고 추가">
              </figure>
            </button>
            <button type="button" id="recruitShareBtn" class="recruit-btn">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54628.png" alt="채용 공고 공유">
              </figure>
            </button>
          </div>
          <ul class="recruit-detail-card">
            <li>
              <h4>근무 지역</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5355/5355077.png" alt="근무 지역">
              </figure>
              <span class="emph">근무 지역</span>
            </li>
            <li>
            <h4>경력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력 조건">
              </figure>
              <span class="emph">경력 조건</span>
            </li>
            <li>
              <h4>학력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/763/763279.png" alt="학력 조건">
              </figure>
              <span class="emph">학력 조건</span>
            </li>
          </ul>
          <div class="recruit-stack">
            <h4>기술 스택</h4>
            <ul class="recruit-stack-list">
              <li>
                <figure class="recruit-stack-icon">
                  <img class="width-100" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTct3fXZn_pSGHjK920D2Jt_b0DTiJsxdr-2hMe4vnVMpcXxKJr0UOOeN2ziQSoKF3V0y8&usqp=CAU" alt="Java">
                </figure>
                <span class="emph">Java</span>
              </li>
              <li>Spring Framework</li>
              <li>AWS</li>
              <li>Git</li>
              <li>Github</li>
              <li>SQL</li>
              <li>MySQL</li>
              <li>HTML</li>
              <li>JavaScript</li>
              <li>React</li>
              <li>JPA</li>
              <li>Linux</li>
            </ul>
          </div>
          <div class="recruit-detail-info">
            <h5>혜택 및 복지</h5>
            <pre>
              [이렇게 일해요]
              • 자율과 책임의 문화: 토스는 Manager가 아닌 Maker들로 구성된 조직으로, 투명한 정보 공유와 수평적인 문화 속에서 구성원 업무에 대한 위임과 신뢰를 바탕으로 세상을 변화 시켜 나가고자 합니다.
              • 효율적인 업무방식: 가장 중요하고, 큰 영향을 미칠 수 있는 일에 집중합니다. 획일적인 업무 프로세스보다는 데이터 기반의 사고로 적극적으로 토론하며, 가장 효율적인 문제 해결을 위해 협업하고 실행합니다.
              • 훌륭한 팀과 동료: 각 분야 최고 수준의 역량을 갖춘 인재들이 자율과 책임의 원칙 아래 뛰어난 역량을 발휘하고 있습니다.

              [이런 지원을 받아요]
              1. 자율과 효율의 근무 환경을 제공합니다.
              • 자율 출퇴근 제도
              • 자율 휴가 / 재택근무
              • Early Friday & OFF Week

              2. 업무와 성장에 몰두할 수 있게끔 지원합니다.
              • 비포괄임금제 운영
              • 업무 관련 비용 100% 지원
              • 최고급 장비 및 소프트웨어 제공
              • 반기별 성과급 지급
              • 매월 통신비 및 체력단련비 지원
              • 명절 상여금 및 생일축하비
              • 직장단체보험비(가족 포함) 및 경조사비
              • 인재추천비 500만원

              3. 먹고 마시는 것까지 회사가 책임집니다.
              • 법인카드 전원 지급 (점심/저녁 식사비용, 야간교통비 등 100% 지원)
              • 사내카페 커피 Silo 무료 이용
              • 사내 편의점, 헤어살롱 등 복지시설 무료 이용
            </pre>
            <div class="recruit-date">
              <h5>마감일</h5>
              <p>
                <span class="recruit-icon">
                  <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/8895/8895471.png" alt="마감일">
                </span>
                2024-02-29
              </p>
            </div>
          </div>
        </div>
        <div class="company-detail">
          <div class="company-detail-info">
            <a href="#" class="company-info">
              <figure class="company-logo">
                <img class="width-100" src="../resources/images/company_logo_1.png" alt="기업 로고">
              </figure>
              <h4 class="company-name">㈜우아한형제들</h4>
            </a>
            <button type="button" id="companyLikeBtn" class="recruit-btn">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/7794/7794674.png" alt="관심 기업 추가">
              </figure>
            </button>
          </div>
          <ul class="company-contact">
            <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5410/5410449.png" alt="홈페이지">
              </figure>
              <span class="company-homepage">http://www.woowahan.com</span>
            </li>
            <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/107/107778.png" alt="전화번호">
              </figure>
              <span class="company-phone">02-1234-5678</span>
            </li>
            <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54290.png" alt="이메일">
              </figure>
              <span class="company-email">woowahan.com</span>
            </li>
          </ul>
        </div>
        <div class="company-map">
          <!-- * 카카오맵 - 지도퍼가기 -->
          <!-- 1. 지도 노드 -->
          <div id="daumRoughmapContainer1707734014642" class="root_daum_roughmap root_daum_roughmap_landing"></div>

          <!--
            2. 설치 스크립트
            * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
          -->
          <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

          <!-- 3. 실행 스크립트 -->
          <script charset="UTF-8">
            new daum.roughmap.Lander({
              "timestamp" : "1707734014642",
              "key" : "2i3th",
              "mapWidth" : "640",
              "mapHeight" : "360"
            }).render();
          </script>
          <p class="company-address">
            <span class="recruit-icon">
              <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/2948/2948111.png" alt="기업 주소">
            </span>
            서울 송파구 위례성대로 2 (방이동) 우아한형제들
          </p>
        </div>
        <button type="button" id="recruitApplyBtnBottom" class="recruit-btn recruit-apply-btn">지원하기</button>
      </div>
    </div>
  </section>
</body>
</html>