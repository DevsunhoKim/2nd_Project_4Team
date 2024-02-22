<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 목록</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/setting.css">
<link rel="stylesheet" href="../recruitment/css/plugin.css">
<link rel="stylesheet" href="../recruitment/css/template.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="../js/setting.js"></script>
<script src="../js/plugin.js"></script>
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../recruitment/js/setting.js"></script>
<script src="../recruitment/js/plugin.js"></script>
<script src="../recruitment/js/template.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> <!-- axios : 전송 객체 => 데이터 입·출력 시 사용 -->
</head>
<body>
  <section id="recruitmentList" class="sub">
    <!-- [S]opilsol-N19 -->
    <div class="opilsol-N19" data-bid="ZbLsbkw4hY">
      <div class="content-container" id="recruitmentListApp">
        <div class="container-md">
          <div class="contents-top">

            <!-- [S]glamping-N40 -->
            <div class="inputset inputset-border-bottom">
              <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
              <input type="text" class="inputset-input form-control" placeholder="검색어를 입력하세요." aria-label="내용">
            </div>

          </div>
          <div class="filter">
            <div class="filter-wrapper">
              <div class="filter-area">
                <button type="button" id="filterAreaBtn" class="filter-btn">근무 지역</button>
                <ul id="filterAreaList" class="filter-list">
                  <li>전체</li>
                  <li>서울</li>
                  <li>경기</li>
                  <li>인천</li>
                  <li>강원</li>
                  <li>충북</li>
                  <li>충남</li>
                  <li>세종</li>
                  <li>대전</li>
                  <li>전북</li>
                  <li>전남</li>
                  <li>광주</li>
                  <li>경북</li>
                  <li>경남</li>
                  <li>대구</li>
                  <li>울산</li>
                  <li>부산</li>
                  <li>제주</li>
                </ul>
              </div>
              <div class="filter-career">
                <button type="button" id="filterCareerBtn" class="filter-btn">경력 조건</button>
                <ul id="filterCareerList" class="filter-list">
                  <li>전체</li>
                  <li>신입</li>
                  <li>1년 미만</li>
                  <li>1년</li>
                  <li>2년</li>
                  <li>3년</li>
                  <li>4년</li>
                  <li>5년</li>
                  <li>6년</li>
                  <li>7년</li>
                  <li>8년</li>
                  <li>9년</li>
                  <li>10년</li>
                  <li>10년 이상</li>
                  <li>15년 이상</li>
                  <li>20년 이상</li>
                </ul>
              </div>
              <div class="filter-stack">
                <button type="button" id="filterStackBtn" class="filter-btn">기술 스택</button>
                <ul id="filterStackList" class="filter-list">
                  <li>Java</li>
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
                  <li>Python</li>
                  <li>C / C++</li>
                  <li>C++</li>
                  <li>Linux</li>
                  <li>Docker</li>
                  <li>Kotlin</li>
                  <li>Swift</li>
                  <li>PHP</li>
                </ul>
              </div>
            </div>
            <ul class="sort-order">
              <li class="selected">최신순</li>
              <li>인기순</li>
              <li>마감일순</li>
            </ul>
          </div>

          <div class="col-group">
            <div class="item cardset cardset-border" v-for="rvo in recruit_list">
              <a :href="'recruit_detail.do?rno='+rvo.rno+'&cno='+rvo.cno" class="company-info">
                <figure class="company-logo">
                  <img class="width-100" :src="rvo.cvo.logo" alt="기업 로고">
                </figure>
                <h4 class="company-name">{{rvo.cvo.name}}</h4>
                <div class="recruit-info">
                  <h3 class="recruit-tit">{{rvo.title}}</h3>
                  <span class="recruit-area">{{rvo.cvo.area}}</span>
                  <span class="recruit-career">{{rvo.career}}</span>
                  <ul class="recruit-stack">
                    <li>Java</li>
                    <li>Spring Boot</li>
                    <li>React</li>
                  </ul>
                  <span class="recruit-date">~ {{rvo.end_date}}</span>
                </div>
              </a>
              <button type="button" class="recruit-btn recruit-like-btn">
                <figure class="recruit-icon">
                  <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4847/4847183.png" alt="관심 공고 추가">
                </figure>
              </button>
            </div>
          </div>

          <nav class="pagiset pagiset-circ">
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div> -->
            <div class="pagiset-ctrl" v-if="startPage>1">
              <a class="pagiset-link pagiset-prev" @click="prev()">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list" v-for="i in range(startPage, endPage)">
              <a :class="'pagiset-link ' + (i==curpage?'active-fill':'')" @click="pageChange(i)">{{i}}</a>
            </div>
            <div class="pagiset-ctrl" v-if="endPage<totalpage">
              <a class="pagiset-link pagiset-next" @click="next()">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div> -->
          </nav>
        </div>
      </div>
    </div>
    <!-- [E]opilsol-N19 -->
  </section>
  
 <script>
let recruitmentListApp=Vue.createApp({
	// 멤버 변수
	data(){
		return{
			recruit_list:[],
			area:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		}
	},
	mounted(){
		this.dataRecv()
	},
	updated(){
		
	},
	methods:{
		dataRecv(){
			axios.get('../recruitment/recruit_list_vue.do', {
				params:{
					page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.recruit_list=response.data
				this.area = response.data
			})
			
			// 페이지
			axios.get('../recruitment/recruit_page_vue.do', {
				params:{
					page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.curpage=response.data.curpage
				this.totalpage=response.data.totalpage
				this.startPage=response.data.startPage
				this.endPage=response.data.endPage
			})
			/* axios.get('../recruitment/recruit_cookie_vue.do').then(response=>{
				console.log(response.data)
				this.cookie_list=response.data
			}) */
		},
		range(start, end){
			let arr=[]
			let leng=end-start
			for(let i=0; i<=leng; i++){
				arr[i]=start
				start++
			}
			return arr
		},
		prev(){
			this.curpage=this.endPage-1
			this.dataRecv()
		},
		next(){
			this.curpage=this.endPage+1
			this.dataRecv()
		},
		pageChange(page){
			this.curpage=page
			this.dataRecv()
		}
	}
}).mount('#recruitmentListApp')
 </script>
</body>
</html>