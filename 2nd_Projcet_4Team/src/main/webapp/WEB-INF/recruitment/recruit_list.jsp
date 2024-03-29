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
  <section id="recruitmentList" class="sub">
    <!-- [S]opilsol-N19 -->
    <div class="opilsol-N19" data-bid="ZbLsbkw4hY">
      <div class="content-container" id="recruitmentListApp">
        <div class="container-md">
          <div class="textset">
            <h2 class="textset-tit">CODEV 채용 공고</h2>
            <!-- <p class="textset-desc">CODEV가 소개하는 채용 공고를 만나보세요.</p> -->
          </div>
        
          <div class="contents-top">

            <!-- [S]glamping-N40 -->
            <div class="inputset inputset-border-bottom">
              <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘" @click="search"></button>
              <input type="text" class="inputset-input form-control" placeholder="검색어를 입력하세요." aria-label="내용" v-model="word" @keyup.enter="search">
            </div>

            <div class="tabset tabset-text">
            <ul class="tabset-list">
              <li class="selected tabset-item">
                  <span class="tabset-link active" @click="changeSort('rno')">최신순</span>
              </li>
              <li class="tabset-item">
                  <span class="tabset-link" @click="changeSort('like_count')">인기순</span>
              </li>
              <!-- <li class="tabset-item">
                  <span class="tabset-link" @click="changeSort('end_date')">마감일순</span>
              </li> -->
            </ul>
          </div>
          <div class="filter">
            <!-- <div class="filter-wrapper">
              <div class="filter-area">
                <button type="button" id="filterAreaBtn" class="filter-btn">근무 지역</button>
                <ul id="filterAreaList" class="filter-list">
                  <li>전체</li>
                  <li>서울
                    <ul>
                      <li>강남구</li>
                      <li>강동구</li>
                      <li>강북구</li>
                      <li>강서구</li>
                      <li>관악구</li>
                      <li>광진구</li>
                      <li>구로구</li>
                      <li>금천구</li>
                      <li>노원구</li>
                      <li>도봉구</li>
                      <li>동대문구</li>
                      <li>동작구</li>
                      <li>마포구</li>
                      <li>서대문구</li>
                      <li>서초구</li>
                      <li>성동구</li>
                      <li>성북구</li>
                      <li>송파구</li>
                      <li>양천구</li>
                      <li>영등포구</li>
                      <li>용산구</li>
                      <li>은평구</li>
                      <li>종로구</li>
                      <li>중구</li>
                      <li>중랑구</li>
                    </ul>
                  </li>
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
            </div> -->

            </div>
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
                  <span class="recruit-area">{{getAddressPart(rvo.cvo.address)}}</span>
                  <span class="recruit-career">{{rvo.career}}</span>
                  <ul class="recruit-stack">
                    <li v-for="(stackText, index) in rvo.stack_txt.split('|')" :key="index">{{stackText}}</li>
                  </ul>
                  <span class="recruit-date">~ {{rvo.end_date}}</span>
                </div>
              </a>
              <button v-if="rvo.likeState" type="button" class="recruit-btn recruit-like-btn" @click="likeDelete(rvo.cno)">
                <figure class="recruit-icon">
                  <img class="width-100" src="https://cdn-icons-png.flaticon.com/128/10925/10925481.png" alt="관심 공고 취소">
                </figure>
              </button>
              <button v-else type="button" class="recruit-btn recruit-like-btn" @click="like(rvo.cno)" @click="like(rvo.cno)">
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
			recruit_list:[], // 채용 공고 목록
			word:'', // 검색어
			curpage:1, // 현재 페이지
			totalpage:0, // 총 페이지
			startPage:0, // 페이지네이션 시작
			endPage:0, // 페이지네이션 끝
			sortBy: 'rno',
			rowSize: 12,
			cateno:4,
			userId:'${sessionScope.userId}'
		}
	},
	mounted(){
		this.dataRecv()
	},
	updated(){	
	},
	methods:{
		// 데이터 불러오기
		dataRecv(){
			const calculatedStart = (this.rowSize * this.curpage) - (this.rowSize - 1);
	    const calculatedEnd = this.rowSize * this.curpage;
			
			axios.get('../recruitment/recruit_list_vue.do', {
				params:{
					word:this.word,
					page:this.curpage,
					start: calculatedStart,
          end: calculatedEnd,
          sortBy: this.sortBy,
				}
			}).then(response=>{
				console.log(response.data)
				this.recruit_list=response.data
			})
			
			// 페이지
			axios.get('../recruitment/recruit_page_vue.do', {
				params:{
					word:this.word,
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
		
		// 검색
		search(){
			axios.get('../recruitment/recruit_find_vue.do', {
				params:{
					word:this.word,
					page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.recruit_list=response.data
			})
			
			// 페이지
			axios.get('../recruitment/recruit_page_vue.do', {
	      params: {
	        word:this.word,
	        page:this.curpage
	      }
	    }).then(response => {
	      console.log(response.data)
	      this.curpage = response.data.curpage
	      this.totalpage = response.data.totalpage
	      this.startPage = response.data.startPage
	      this.endPage = response.data.endPage
	    })
		},
		
		// 정렬
		changeSort(sortBy) {
      this.sortBy=sortBy;
      this.dataRecv();
    },
		
		// 근무 지역 출력
		getAddressPart(address) {
	    // 주소를 두 번째 공백을 기준으로 분할
	    const addressParts=address.split(' ')
	    // 두 번째 공백 이후의 부분을 지우고 첫 번째 부분만 반환
      const area=addressParts.slice(0, 2).join(' ')
	    return area
	  },
	  
	  // 페이지네이션
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
			this.curpage=this.startPage-1
			this.dataRecv()
		},
		next(){
			this.curpage=this.endPage+1
			this.dataRecv()
		},
		pageChange(page){
			this.curpage=page
			this.dataRecv()
		},
		like(no){
			if(this.userId==null || this.userId=='')
      	    {
      	        alert("로그인 후 가능합니다.");  
      	        location.href="../member/login.do"
      	    }
        	 else{
        		 axios.get('../jjim/jjim_ok.do',{
     		    	params:{
     		    		userId:this.userId,
     	    			no:no,
     	    			cateno:this.cateno
     		    	}
     		    }).then(response=>{
     		    	if(response.data>0)
     		    	{
     		    		alert('관심기업으로 등록되었습니다.') 
     		    		this.dataRecv();
     		    	}
     		    })
        	 }
		},
		likeDelete(no){
			axios.get('../jjim/jjim_delete.do',{
		    	params:{
		    		userId:this.userId,
	    			no:no,
	    			cateno:this.cateno
		    	}
		    }).then(response=>{
		    	if(response.data==0)
		    	{
		    		alert('관심기업 등록이 취소되었습니다.')
		    		this.dataRecv();
		    	}
		    })
		}
	}
}).mount('#recruitmentListApp')
 </script>
</body>
</html>