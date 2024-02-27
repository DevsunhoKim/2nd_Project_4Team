<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style type="text/css">

.SelectedLanguage_selectedWrapper__3dpZm {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    grid-gap: 30px;
    gap: 30px;
}

.SelectedLanguage_selectedLanguages__3r4F4 {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    grid-gap: 10px;
    gap: 10px;
}

.SelectedLanguage_languageName__3dwln {
    color: #313131;
    font-size: 13px;
    font-weight: 500;
}

.SelectedLanguage_selectedLanguage__pTAd8 {
    display: flex;
    grid-gap: 10px;
    gap: 10px;
    background: #f2f2f2;
    padding: 5px 10px;
    border-radius: 10px;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all .1s ease-in;
}

.SelectedLanguage_initializeIcon__2Jhi6 {
    display: block;
    width: 12px;
    height: 12px;
}

.SelectedLanguage_selectedLanguage__pTAd8:hover {
    -webkit-transform: scale(1.02);
    transform: scale(1.02);
}

.SelectedLanguage_resetContainer__2LBQJ {
    display: flex;
    grid-gap: 5px;
    gap: 5px;
    align-items: center;
}

.SelectedLanguage_resetFilter__2zzNa {
    color: #777;
    font-size: 14px;
    font-style: normal;
    font-weight: 500;
    line-height: 100%;
    letter-spacing: -.42px;
    cursor: pointer;
}

.LanguageBar_languages__243rH {
    width: 70%;
    display: flex;
    flex-wrap: wrap;
    grid-gap: 10px;
    gap: 10px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    justify-content: center;
    align-items: center;
}

.LanguageBar_languages__243rH .active {
    -webkit-transform: scale(1.05);
    transform: scale(1.05);
    background-color: #7918F2;
    border: 1px solid #7918F2;
}

.LanguageBar_languages__243rH .active span {
    color: white;
}

.LanguageBar_languageIcon__2PTl1 {
    display: flex;
    grid-gap: 6px;
    gap: 6px;
    align-items: center;
    border: 1px solid #d0d0d0;
    border-radius: 100px;
    padding: 6px 12px 6px 7px;
    transition: all .1s ease-in;
    cursor: pointer;
}

.LanguageBar_logo__rGfFz {
    width: 32px;
    height: 32px;
}

.LanguageBar_languageName__2dSeC {
    color: #333;
    font-size: 14px;
}

.LanguageBar_languageIcon__2PTl1:hover {
    -webkit-transform: scale(1.05);
    transform: scale(1.05);
}

.LanguageBar_full__2eorP {
    opacity: 1;
    -webkit-transform: scale(1.02);
    transform: scale(1.02);
}

.LanguageBar_transparent__1Texo {
    opacity: .3;
}
</style>
</head>
<body>
  <main class="th-layout-main ">
    <!-- [S]basic-N39 Main Visual -->
    <div class="basic-N39" data-bid="SnLsb2H56a">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-visual">
            <h2 class="textset-tit"> 개발자를 위한 <br> 통합 웹 사이트 </h2>
            <p class="textset-desc"> 당사의 제품은 100% 품질 보장이며, 만족도를 최우선으로 생각하며, <br> 고객 만족을 위해 항상 최선을 다하겠습니다. 문의사항이 있으시면 언제든지 연락주세요! </p>
          </div>
          <!-- <a class="btnset btnset-line btnset-round" href="javascript:void(0)">자세히보기</a> -->

          <!-- <div class="contents-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <img class="contents-backimg img-pc" src="../images/img_mainvisual_03.png" alt="PC 비주얼 이미지">
                <img class="contents-backimg img-mobile" src="../images/img_mainvisual_mobile_03.png" alt="모바일 비주얼 이미지">
                <div class="contents-slide-group">
                </div>
              </div>
              <div class="swiper-slide">
                <img class="contents-backimg img-pc" src="../images/img_mainvisual_03.png" alt="PC 비주얼 이미지">
                <img class="contents-backimg img-mobile" src="../images/img_mainvisual_mobile_03.png" alt="모바일 비주얼 이미지">
                <div class="contents-slide-group">
                  <div class="textset textset-visual">
                    <h2 class="textset-tit"> Temha Mall <br> Home Essentials </h2>
                    <p class="textset-desc"> 당사의 제품은 100% 품질 보장이며, 만족도를 최우선으로 생각하며, <br> 고객 만족을 위해 항상 최선을 다하겠습니다. 문의사항이 있으시면 언제든지 연락주세요! </p>
                  </div>
                  <a class="btnset btnset-line btnset-round" href="javascript:void(0)">자세히보기</a>
                </div>
              </div>
              <div class="swiper-slide">
                <img class="contents-backimg img-pc" src="../images/img_mainvisual_03.png" alt="PC 비주얼 이미지">
                <img class="contents-backimg img-mobile" src="../images/img_mainvisual_mobile_03.png" alt="모바일 비주얼 이미지">
                <div class="contents-slide-group">
                  <div class="textset textset-visual">
                    <h2 class="textset-tit"> Temha Mall <br> Home Essentials </h2>
                    <p class="textset-desc"> 당사의 제품은 100% 품질 보장이며, 만족도를 최우선으로 생각하며, <br> 고객 만족을 위해 항상 최선을 다하겠습니다. 문의사항이 있으시면 언제든지 연락주세요! </p>
                  </div>
                  <a class="btnset btnset-line btnset-round" href="javascript:void(0)">자세히보기</a>
                </div>
              </div>
            </div>
            <div class="contents-control">
              <div class="swiper-button-prev"></div>
              <div class="swiper-pagination"></div>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-pause">
                <img src="../icons/ico_pause_white.svg" alt="스와이퍼 멈춤버튼">
              </div>
              <div class="swiper-button-play">
                <img src="../icons/ico_play_white.svg" alt="스와이퍼 재생버튼">
              </div>
            </div>
          </div> -->
        </div>
      </div>
    </div>
    <!-- [E]basic-N39 -->
	
		  <!-- 기술스택 -->
    <div class="row-tech" id="techApp">
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
                <ul class="LanguageBar_languages__243rH">
                    <li v-for="(tech, index) in tech_list"
                        class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP" :key="index"
                        :class="{'active': index == selectedTech}" v-on:click="selectTech(index)">
                        <img class="LanguageBar_logo__rGfFz"
                             :src="'${pageContext.request.contextPath}/images/tech/'+ tech.toLowerCase() +'.svg'"
                             alt="tech">
                        <span class="LanguageBar_languageName__2dSeC">{{tech}}</span>
                    </li>
                </ul>
                <div class="SelectedLanguage_selectedWrapper__3dpZm">
                    <ul class="SelectedLanguage_selectedLanguages__3r4F4"></ul>
                </div>
            </div>
        </div>
	
    <!-- [S]opilsol-N8 -->
    <div class="opilsol-N8" data-bid="mVLSbF3W3W">
      <div class="contents-inner">
        <div class="container-lg">
          <div class="content-container container-md">
            <div class="left">
              <div class="textset">
                <h2 class="textset-tit h1 ff-po">Mentoring Program</h2>
                <p class="textset-desc">CODEV만의 멘토링 프로그램</p>
                <div class="swiper-control">
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
                <div class="btnset-position">
                  <a class="btnset btnset-icon btnset-lg icon-right btnset-dark justify-content-between" href="javascript:void(0)">자세히 보기</a>
                </div>
              </div>
            </div>
            <div class="right">
              <div class="slide-container">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-1.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링1</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-2.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링2</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-3.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링3</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-1.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링4</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-2.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링5</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a class="link-slide" href="javascript:void(0);">
                      <div class="cardset cardset-border">
                        <figure class="cardset-figure">
                          <img class="cardset-img" src="../images/m-sec3-img-3.jpg" alt="이미지">
                        </figure>
                        <div class="cardset-body">
                          <h4 class="cardset-tit">멘토링6</h4>
                          <p class="cardset-txt">2000-01-01</p>
                        </div>
                      </div>
                    </a>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]opilsol-N8 -->
    
    <!-- [S]basic-N26 -->
    <div class="basic-N26" data-bid="cllSBf0XQr">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">Study Room</h2>
            <p class="textset-desc studyRoomMain-info" style="margin-top:0;">열정적인 개발자들을 위한 자유로운 학습 공간으로서<br>커뮤니티와 연결된 특별한 공간으로 개발자 여정의 시작 및 성장과 협업을 지원합니다.<a class="btnset btnset-ghost btnset-icon ico-arrow icon-right" href="../studyRoom/room_main.do">자세히보기</a>
            </p>
          </div>
          <div class="contents-group">
          <c:forEach var="rvo" items="${roomList }" >
            <div class="cardset cardset-inner">
              <figure class="cardset-figure">
                <img class="cardset-img" src="${rvo.poster }" alt="카드 이미지">
              </figure>
              <div class="cardset-body cardset-arrow">
                <h4 class="cardset-tit">${rvo.name }</h4>
                <p class="cardset-desc" style="margin-top: 0px;">최대 ${rvo.inwon}명까지 수용이 가능하며, 예약 후 이용 가능합니다.<a class="btnset btnset-icon ico-arrow" href="../studyRoom/room_detail.do?no=${rvo.no }"></a>
                </p>
              </div>
            </div>
           </c:forEach>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]basic-N26 -->

    <!-- [S]basic-N42 -->
    <div class="basic-N42" data-bid="lllsB2fhUy">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit">Bookstore</h2>
            <p class="textset-desc">베스트 상품을 지금 바로 만나보세요!</p>
          </div>
          <div class="swiper contents-swiper">
            <div class="swiper-wrapper">
              <c:forEach var="vo" items="${booksList }" >
              <div class="swiper-slide">
                
                <a href="../books/detail.do?no=${ vo.no}" class="cardset cardset-shopping">
                  <figure class="cardset-figure">
                    <img class="cardset-img" src="${vo.poster }" alt="스와이퍼 이미지">
                  </figure>
                  <div class="cardset-body">
                    <span class="cardset-name">${vo.genre }</span>
                    <h4 class="cardset-tit"> ${vo.title } </h4>
                    <p class="cardset-desc"><small><fmt:formatNumber type="number" value="${vo.price}" pattern="#,###"/>원</small></p>
                    </p>
                  </div>
                </a>               
              </div>
               </c:forEach>
            </div>
          </div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </div>
    <!-- [E]basic-N42 -->

    <!-- [S]recruitment -->
    <div class="recruitment">
      <div class="contents-inner">
        <div class="content-container container-md">
          <div class="textset">
            <h2 class="textset-tit">Recruitment</h2>
            <p class="textset-desc">오늘 마감하는 기업의 공고를 확인해 보세요!</p>
          </div>
          <div class="contents-group">
            <div class="calendar"> 
              <table>달력</table>
            </div>
            <ul class="recruit-list">
              <li>
                <a href="#" class="company-info">
                  <figure class="company-logo">
                    <img class="width-100" src="../images/company_logo_1.png" alt="기업 로고">
                  </figure>
                  <h5 class="company-name">㈜우아한형제들</h5>
                </a>
                <div class="recruit-info">
                  <h4 class="recruit-tit">각 부문별 경력/신입 인재영입</h4>
                  <span class="recruit-career">신입·경력</span>
                </div>
              </li>

              <li>
                <a href="#" class="company-info">
                  <figure class="company-logo">
                    <img class="width-100" src="../images/company_logo_1.png" alt="기업 로고">
                  </figure>
                  <h5 class="company-name">㈜우아한형제들</h5>
                </a>
                <div class="recruit-info">
                  <h4 class="recruit-tit">각 부문별 경력/신입 인재영입</h4>
                  <span class="recruit-career">신입·경력</span>
                </div>
              </li>

              <li>
                <a href="#" class="company-info">
                  <figure class="company-logo">
                    <img class="width-100" src="../images/company_logo_1.png" alt="기업 로고">
                  </figure>
                  <h5 class="company-name">㈜우아한형제들</h5>
                </a>
                <div class="recruit-info">
                  <h4 class="recruit-tit">각 부문별 경력/신입 인재영입</h4>
                  <span class="recruit-career">신입·경력</span>
                </div>
              </li>
              
              <li>
                <a href="#" class="company-info">
                  <figure class="company-logo">
                    <img class="width-100" src="../images/company_logo_1.png" alt="기업 로고">
                  </figure>
                  <h5 class="company-name">㈜우아한형제들</h5>
                </a>
                <div class="recruit-info">
                  <h4 class="recruit-tit">각 부문별 경력/신입 인재영입</h4>
                  <span class="recruit-career">신입·경력</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]recruitment -->
  </main>
</body>
<script type>
let techApp = Vue.createApp({
    data() {
        return {
            tech_list: ['JavaScript', 'TypeScript', 'React', 'Vue', 'Svelte', 
            	'Nextjs', 'Nodejs', 'Java', 'Spring', 'Nestjs', 'Kotlin', 
            	'Express', 'MySQL', 'MongoDB', 'Python', 'Django', 'php', 'GraphQL', 
            	'Firebase', 'Flutter', 'Swift', 'ReactNative', 'Unity', 'AWS', 
            	'Kubernetes', 'Docker', 'Git', 'Figma', 'Zeplin', 'Jest'] ,
            selectedTech: -1,
            selectedTechName: ''
        }
    },methods:{
        selectTech(index) {
            if (this.selectedTech === index) {
                this.selectedTech = -1;
            } else {
                this.selectedTech = index;
                this.selectedTechName = this.tech_list[index];
            }
           location.href = "../main/searchTech.do?engTech="+this.selectedTechName;
        }	
    }
}).mount('#techApp')

</script>
</html>