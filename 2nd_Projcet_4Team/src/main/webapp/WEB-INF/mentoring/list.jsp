<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토목록</title>
<link rel="stylesheet" href="../member/css/setting.css">
<link rel="stylesheet" href="../member/css/plugin.css">
<link rel="stylesheet" href="../member/css/template.css"> 
<link rel="stylesheet" href="../mentoring/css/style.css">
<link rel="stylesheet" href="../css/common.css">
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="glamping-N9" data-bid="AqLsk0m3p5" id="mentorList">
  <div class="contents-inner">
    <div class="contents-container container-md">
      <div class="textset">
        <h2 class="textset-tit">CODEV만의 멘토진</h2>
        <!-- <p class="textset-desc">실력과 경험을 모두 갖춘 CODEV의 멘토를 만나보세요.</p> -->
        <c:if test="${sessionScope.mentor == 0}">
	        <a href="../mentoring/mentor_enrollment.do" class="cardset-btn">멘토 등록</a>
	      </c:if>
	    </div>
		  <div class="contents-top">
	    <!-- 검색 -->
        <div class="inputset inputset-lg">
          <div class="selectset selectset-round selectset-lg">
            <button class="selectset-toggle btn" type="button">
              <span style="color: gray">선택해주세요</span>
            </button>
            <ul class="selectset-list">
              <li class="selectset-item">
                <button class="selectset-link btn" type="button" data-value="멘토명" v-on:click="selectedVal = 'nickname'">
                  <span>멘토명</span>
                </button>
              </li>
              <li class="selectset-item">
                <button class="selectset-link btn" type="button" data-value="멘토링 제목" v-on:click="selectedVal = 'title'">
                  <span>멘토링 제목</span>
                </button>
              </li>
            </ul>
          </div>
        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="icon" @click="setupSearch()"></button>
        <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해 주세요." 
        ref="searchWord" v-model="searchWord" @keyup.enter="setupSearch()">
      </div>
      
      <!-- 정렬 버튼 -->
        <div class="tabset tabset-text">
	        <ul class="tabset-list">
	          <li class="tabset-item">
	            <a class="tabset-link active" @click="applyFilter('rev_cnt')">
	              <span>예약많은순</span>
	            </a>
	          </li>
	          <li class="tabset-item">
	            <a class="tabset-link" @click="applyFilter('score_avg')">
	              <span>평점높은순</span>
	            </a>
	          </li>
	          <li class="tabset-item">
	            <a class="tabset-link" @click="applyFilter('follower')">
	              <span>팔로워순</span>
	            </a>
	          </li>
	        </ul>
	      </div>
		 </div>
	  
	  <!-- 기술스택 -->
      <div class="tabset tabset-brick">
        <ul class="tabset-list tabset-sm tabset-fill">
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('')">
              <span>전체</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('Backend')">
              <span>Backend</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('Frontend')">
              <span>Frontend</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('Android')">
              <span>Android</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('iOS')">
              <span>iOS</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('Data Engineering')">
              <span>Data Engineering</span>
            </a>
          </li>
          <li class="tabset-item">
            <a class="tabset-link" @click="selectedJob('Devops')">
              <span>Devops</span>
            </a>
          </li>
          </ul>
        </div>
	  
	  <div class="cardset-wrapper">
			<div class="cardset cardset-user" v-for="vo in mentor_list">
				<a :href="'../mentoring/detail.do?mno='+vo.mno">
			      <figure class="work-logo">
			        <!--  <img class="width-100" src="../images/img_logo_black.png" alt="전·현직장 로고"> -->
			         <span class="width-100 bold-and-large">{{vo.career}}</span>
			      </figure>
			      <figure class="cardset-figure">
			        <img class="cardset-img" :src="'../images/'+vo.img+'.png'" alt="프로필 이미지">
			      </figure>
			      <div class="cardset-profile">
			      	<h3><span>{{vo.mvo.nickname}}</span> 멘토</h3>
			        <h4>{{vo.job}}</h4>
			      </div>
			      <p class="cardset-text">{{vo.title.length > 25 ? vo.title.substring(0, 25) + '...' : vo.title}}</p>
			      <ul class="mentor-stack">
			      	<li v-for="kwd in vo.keywords.slice(1, 8)">{{kwd}}</li>
			      </ul>
			    </a>
			    <button type="button" class="cardset-btn" value="팔로우" v-if="vo.followstate" id="followDelete" @click="followDelete(vo.mno)">팔로우 취소</button>
			    <button type="button" class="cardset-btn" value="팔로우" v-else @click="follow(vo.mno)">팔로우 하기</button>
			</div>
	  </div>
	</div>
        
    <nav class="pagiset pagiset-line" style="margin-bottom: 4rem">
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-first" @click="pageChange(1)">
          <span class="visually-hidden">처음</span>
        </a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-prev" v-if="curpage > 1" @click="pageChange(curpage - 1)">
          <span class="visually-hidden">이전</span>
        </a>
      </div>
      <div class="pagiset-list">
        <a class="pagiset-link" :class="{'active-fill': curpage === i}" v-for="i in range(startPage, endPage)" :key="i" @click="pageChange(i)">
          {{ i }}
        </a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-next" v-if="curpage < totalpage" @click="pageChange(curpage + 1)">
          <span class="visually-hidden">다음</span>
        </a>
      </div>
      <div class="pagiset-ctrl">
        <a class="pagiset-link pagiset-last" @click="pageChange(totalpage)">
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
            mentor_list: [],
            selectedTech: -1,
            job:'',
            selectedVal: '',
            searchWord: '',
            filter:'',
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            page_list: {},
            cateno:1,
            userId:'${sessionScope.userId}'
        };
    },
    mounted() {
        this.setupSearch();
    },
    methods: {
        setupSearch() {
            axios.get('../mentoring/list_vue.do', {
                params: {
                    page: this.curpage,
                    selectedVal: this.selectedVal,
                    searchWord: this.searchWord.trim(),
                    job: this.job,
                    filter: this.filter
                }
            }).then(response => {
                console.log(response.data);
                this.mentor_list = response.data;
            })

            axios.get('../mentoring/page_vue.do', {
                params: {
                    page: this.curpage,
                    selectedVal: this.selectedVal,
                    searchWord: this.searchWord.trim(),
                    job: this.job
                }
            }).then(response => {
                console.log(response.data);
                this.page_list = response.data;
                this.curpage = response.data.curpage;
                this.totalpage = response.data.totalpage;
                this.startPage = response.data.startPage;
                this.endPage = response.data.endPage;
            }).catch(error => {
                console.log(error.response)
            })
        },
        prev() {
            if (this.curpage === 1) {
                return;
            }
            this.curpage = this.startPage - 1;
            this.setupSearch();
        },
        next() {
            if (this.curpage === this.totalpage) {
                return;
            }
            this.curpage = this.endPage + 1;
            this.setupSearch();
        },
        pageChange(page) {
            if (page === this.curpage) {
                return;
            }
            this.curpage = page;
            this.setupSearch();
        },
        range(start, end) {
            let arr = [];
            for (let i = start; i <= end; i++) {
              arr.push(i);
            }
            return arr;
        },
        selectedJob(job){
            this.job = job
            this.setupSearch()
        },
        applyFilter(filter) {
            this.filter = filter;
            this.setupSearch()
        },
        follow(no){
        	 if(this.userId==null || this.userId=='')
      	    {
      	        alert("로그인 후 팔로우가 가능합니다.");  
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
     		    		alert('팔로우가 완료되었습니다.') 
     		    		this.setupSearch();
     		    	}
     		    })
        	 }
        	
        },
        followDelete(no){
        	axios.get('../jjim/jjim_delete.do',{
		    	params:{
		    		userId:this.userId,
	    			no:no,
	    			cateno:this.cateno
		    	}
		    }).then(response=>{
		    	if(response.data==0)
		    	{
		    		alert('팔로우가 취소되었습니다.')
		    		this.setupSearch();
		    	}
		    })
        }
    }
}).mount("#mentorList");
</script>
</html>