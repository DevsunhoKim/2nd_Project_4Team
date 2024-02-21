<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../member/css/setting.css">
<link rel="stylesheet" href="../member/css/plugin.css">
<link rel="stylesheet" href="../member/css/template.css"> 
<link rel="stylesheet" href="../mentoring/css/style.css">
<link rel="stylesheet" href="../css/common.css">
<style type="text/css">
.contents-top a{
    position: absolute;
    top: 0;
    right: 0;
    display: block;
    margin: 0 auto;
    padding: 1rem;
    border-radius: 1rem;
    border: none;
    background-color: #7918F2;
    color: #fff;
    font-weight: 500;
    text-align: center;
}


.SelectedLanguage_selectedWrapper__3dpZm {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    grid-gap: 30px;
    gap: 30px
}

.SelectedLanguage_selectedLanguages__3r4F4 {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    grid-gap: 10px;
    gap: 10px
}

.SelectedLanguage_languageName__3dwln {
    color: #313131;
    font-size: 13px;
    font-weight: 500
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
    transition: all .1s ease-in
}

.SelectedLanguage_initializeIcon__2Jhi6 {
    display: block;
    width: 12px;
    height: 12px
}

.SelectedLanguage_selectedLanguage__pTAd8:hover {
    -webkit-transform: scale(1.02);
    transform: scale(1.02)
}

.SelectedLanguage_resetContainer__2LBQJ {
    display: flex;
    grid-gap: 5px;
    gap: 5px;
    align-items: center
}

.SelectedLanguage_resetFilter__2zzNa {
    color: #777;
    font-size: 14px;
    font-style: normal;
    font-weight: 500;
    line-height: 100%;
    letter-spacing: -.42px;
    cursor: pointer
}

.LanguageBar_languages__243rH {
    display: flex;
    flex-wrap: wrap;
    grid-gap: 10px;
    gap: 10px;
    margin-bottom: 50px
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
    cursor: pointer
}

.LanguageBar_logo__rGfFz {
    width: 32px;
    height: 32px
}

.LanguageBar_languageName__2dSeC {
    color: #333;
    font-size: 14px
}

.LanguageBar_languageIcon__2PTl1:hover {
    -webkit-transform: scale(1.05);
    transform: scale(1.05)
}

.LanguageBar_full__2eorP {
    opacity: 1;
    -webkit-transform: scale(1.02);
    transform: scale(1.02)
}

.LanguageBar_transparent__1Texo {
    opacity: .3
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="glamping-N9" data-bid="AqLsk0m3p5" id="mentorList">
  <div class="contents-inner">
    <div class="contents-container container-md">
	    <div class="contents-top">
	      <div class="textset">
	        <h2 class="textset-tit">CODEV만의 멘토진</h2>
	        <p class="textset-desc">실력과 경험을 모두 갖춘 CODEV의 멘토를 만나보세요.</p>
	      </div>
		  <sec:authorize access="hasRole('ROLE_USER')">
		  	<a href="../mentoring/mentor_enrollment.do" class="cardset-btn">멘토등록하기</a>
		  </sec:authorize>
		  
		  <!-- 검색 -->
		  <div class="inputset inputset-lg">
		      <div class="selectset selectset-round selectset-lg">
		        <button class="selectset-toggle btn" type="button">
		          <span style="color: gray">선택해주세요</span>
		        </button>
		        <ul class="selectset-list">
		          <li class="selectset-item">
		            <button class="selectset-link btn" type="button" data-value="멘토명" v-on:click="ss = 'nickname'">
		              <span>멘토명</span>
		            </button>
		          </li>
		          <li class="selectset-item">
		            <button class="selectset-link btn" type="button" data-value="멘토링 제목" v-on:click="ss = 'title'">
		              <span>멘토링 제목</span>
		            </button>
		          </li>
		        </ul>
		      </div>
		    <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="icon"></button>
		    <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해 주세요." 
			  ref="fd" v-model="fd" @keyup.enter="dataRecv()">
		  </div>
	  </div>
	  <div style="height: 30px"></div>
	  <!-- 기술스택 -->
	  <div class="row-study">
            <div class="css-goiz5j" id="headlessui-popover-panel-3" tabindex="-1" data-headlessui-state="open">
<!--                 <ul class="Category_categories__F4wF5">
                    <li class="Category_categoryItem__CfZqy Category_selectedCategory__3zAia">기술 스택</li>
                </ul> -->
                <ul class="LanguageBar_languages__243rH">
                    <li v-for="(tech, index) in tech_list"
                        class="LanguageBar_languageIcon__2PTl1 LanguageBar_full__2eorP" :key="index"
                        :class="{'active': index == selectedTech}" v-on:click="selectTech(index)">
                        <img class="LanguageBar_logo__rGfFz"
                             :src="'${pageContext.request.contextPath}/images/tech/'+ tech.toLowerCase() +'.svg'"
                             alt="JavaScript">
                        <span class="LanguageBar_languageName__2dSeC">{{tech}}</span>
                    </li>
                </ul>
                <div class="SelectedLanguage_selectedWrapper__3dpZm">
                    <ul class="SelectedLanguage_selectedLanguages__3r4F4"></ul>
                </div>
            </div>
        </div>
	  <!-- 정렬 버튼 -->
	  <div class="tabset tabset-text">
	    <ul class="tabset-list">
	      <li class="tabset-item">
	        <a class="tabset-link active" href="javascript:void(0)">
	          <span>예약많은순</span>
	        </a>
	      </li>
	      <li class="tabset-item">
	        <a class="tabset-link" href="javascript:void(0)">
	          <span>리뷰많은순</span>
	        </a>
	      </li>
	      <li class="tabset-item">
	        <a class="tabset-link" href="javascript:void(0)">
	          <span>팔로워순</span>
	        </a>
	      </li>
	    </ul>
	  </div>
	  
	  <div class="cardset-wrapper">
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>
		
		<div class="cardset cardset-user">
			<a href="../mentoring/detail.do">
		      <figure class="work-logo">
		        <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고">
		      </figure>
		      <figure class="cardset-figure">
		        <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="프로필 이미지">
		      </figure>
		      <div class="cardset-profile">
		      	<h3><span>홍길동</span> 멘토</h3>
		        <h4>Back-End</h4>
		      </div>
		      <p class="cardset-text">네이버웹툰 백엔드 개발자 멘토와 함께 하는 IT/SW 개발과 취준법</p>
		      <ul class="mentor-stack">
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      	<li>Java</li>
		      </ul>
		    </a>
		    <button type="button" class="cardset-btn" value="팔로우">팔로우하기</button>
		</div>

	  </div>
	</div>
        
    <nav class="pagiset pagiset-circ">
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-first" href="javascript:void(0)">
          <span class="visually-hidden">처음</span>
        </a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-prev" href="javascript:void(0)">
          <span class="visually-hidden">이전</span>
        </a>
      </div>
      <div class="pagiset-list">
        <a class="pagiset-link active-fill" href="javascript:void(0)">1</a>
        <a class="pagiset-link" href="javascript:void(0)">2</a>
        <a class="pagiset-link" href="javascript:void(0)">3</a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-next" href="javascript:void(0)">
          <span class="visually-hidden">다음</span>
        </a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-last" href="javascript:void(0)">
          <span class="visually-hidden">마지막</span>
        </a>
      </div>
    </nav>
    
  </div>
</div>
</body>
<script>
let mentorListApp = Vue.createApp({
    data() {
        return {
            tech_list: ['JavaScript', 'TypeScript', 'React', 'Vue', 'Svelte', 
            	'Nextjs', 'Nodejs', 'C', 'Java', 'Spring', 'Go', 'Nestjs', 'Kotlin', 
            	'Express', 'MySQL', 'MongoDB', 'Python', 'Django', 'php', 'GraphQL', 
            	'Firebase', 'Flutter', 'Swift', 'ReactNative', 'Unity', 'AWS', 
            	'Kubernetes', 'Docker', 'Git', 'Figma', 'Zeplin', 'Jest'] ,
            mentor_list: [],
            selectedTech: -1,
            fd: '',
            ss: '',
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            page_list: {}
        };
    },
    mounted() {
        this.dataRecv();
    },
    methods: {
        dataRecv() {
            axios.get('../mentoring/find_view.do', {
                params: {
                    page: this.curpage,
                    ss: this.ss,
                    fd: this.fd.trim(),
                    tech: (this.selectedTech !== -1) ? this.tech_list[this.selectedTech].toLowerCase() : ''
                }
            }).then(response => {
                console.log(response);
                this.mentor_list = response.data;
            });

            axios.get('../mentoring/page_view.do', {
                params: {
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data);
                this.page_list = response.data;
                this.curpage = response.data.curpage;
                this.totalpage = response.data.totalpage;
                this.startPage = response.data.startPage;
                this.endPage = response.data.endPage;
            });
        },
        prev() {
            this.curpage = this.startPage - 1;
            this.dataRecv();
        },
        next() {
            this.curpage = this.endPage + 1;
            this.dataRecv();
        },
        pageChange(page) {
            this.curpage = page;
            this.dataRecv();
        },
        selectTech: function (index) {
            if (this.selectedTech === index) {
                this.selectedTech = -1;
            } else {
                this.selectedTech = index;
            }
            this.curpage = 1;
            this.dataRecv();
        }
    }
}).mount("#mentorList");
</script>
</html>