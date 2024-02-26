<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상세 정보</title>
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
	<sec:authorize access="isAuthenticated()">
	  <sec:authentication property="principal" var="principal"/>
	</sec:authorize>
  <section id="recruitmentCompany" class="sub">
    <div class="content-container" id="companyDetailApp">
      <div class="container-md">
        <div class="company-top">
          <div class="company-info">
            <figure class="company-logo">
              <img class="width-100" :src="company_detail.logo" alt="기업 로고">
            </figure>
            <h2 class="company-name">{{company_detail.name}}</h2>
          </div>
          <p class="company-type">{{company_detail.type}}</p>
          <div class="company-btn-wrapper">
            <button type="button" id="companyLikeBtn" class="company-btn">
              <span class="company-like-count">{{company_detail.like_count}}</span>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/7794/7794674.png" alt="관심 기업 추가">
              </figure>
            </button>
            <button type="button" id="companyShareBtn" class="company-btn" @click="share()">
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54628.png" alt="기업 정보 공유">
              </figure>
            </button>
          </div>  
        </div>
        <div class="company-detail">
          <ul class="company-detail-box">
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/468/468634.png" alt="업력">
              </figure>
              <span>업력 </span><span class="emph">{{company_detail.year}}년차</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5956/5956860.png" alt="기업 형태">
              </figure>
              <span class="emph">{{company_detail.scale}}</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5957/5957004.png" alt="사원 수">
              </figure>
              <span>사원 </span><span class="emph">{{company_detail.worker}}명</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4549/4549418.png" alt="매출액">
              </figure>
              <span>매출 </span><span class="emph">{{company_detail.sales}}억</span>
            </li>
          </ul>
          <ul class="company-detail-info">
            <li>
              <span>주소</span>
              <span class="emph">{{company_detail.address}}</span>
            </li>
            <!-- <li>
              <span>홈페이지</span>
              <span class="emph">http://www.woowahan.com</span>
            </li> -->
            <li>
              <span>전화번호</span>
              <span class="emph">{{company_detail.phone}}</span>
            </li>
            <!-- <li>
              <span>이메일</span>
              <span class="emph">woowahan.com</span>
            </li> -->
          </ul>
          <div class="company-detail-intro">
            <h3>기업 소개</h3>
            <div>
	            <figure class="company-img">
	              <img class="width-100" :src="company_detail.img" alt="기업 이미지">
	            </figure>
	            <pre class="company-content">{{company_detail.content}}</pre>
            </div>
          </div>
        </div>
      </div>
      <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="UzLsBKVg3P">
      <div class="content-container">
        <div class="container-md">
          <div class="contents-top">
            <h3 class="contents-tit">채용 공고</h3>
            <button type="button" id="recruitInsertBtn" class="review-btn" value="작성하기" @click="insert()">작성하기</button>
            <!-- <p class="contents-text">총 <span class="emph">11</span>건</p> -->
          </div>
          <div class="tableset">
            <div class="tableset-inner">
              <table class="tableset-table table">
                <!-- <colgroup>
                  <col>
                  <col>
                  <col>
                </colgroup> -->
                <!-- <thead class="thead-border-top">
                  <tr>
                    <th class="number" scope="col">NO</th>
                    <th scope="col">제목</th>
                    <th class="last-child" scope="col">채용 기간</th>
                  </tr>
                </thead> -->
                <tbody>
                  <tr v-for="rvo in recruit_list">
                    <td class="recruit-tit">
                      <a :href="'recruit_detail.do?rno='+rvo.rno+'&cno='+rvo.cno">{{rvo.title}}</a>
                    </td>
                    <!-- <td class="recruit-area">{{rvo.address}}</td> -->
                    <td class="recruit-career">{{rvo.career}}</td>
                    <td class="recruit-academic">{{rvo.education}}</td>
                    <td class="recruit-date">{{rvo.end_date}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- <nav class="pagiset pagiset-circ">
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div>
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
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div>
          </nav> -->
        </div>
      </div>
    </div>
    <!-- [E]opilsol-N24 -->

    <!-- [S]glamping-N40 -->
    <div class="glamping-N40" data-bid="UDlsBl0l6L">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h3 class="contents-tit">면접 후기</h3>
            <button type="button" id="interviewInsertBtn" class="interview-btn" value="작성하기" @click="InterviewInsert()" v-if="sessionId">작성하기</button>
            <!-- <p class="contents-text">총 <span class="emph">13</span>건</p> -->
          </div>
          
          <div id="interviewForm">
            <form method="" action="">
              <ul class="interview-input">
                <li>
	                <label for="title">제목</label>
	                <input type="text" id="title" name="title" ref="title" v-model="title" placeholder="제목을 입력해 주세요.">
	              </li>
                <li class="interview-info">
                  <div>
	                  <label for="career">경력</label>
	                  <select id="career" name="career" ref="career" v-model="career">
	                    <option value="신입">신입</option>
		                  <option value="1년 미만">1년 미만</option>
		                  <option value="1년">1년</option>
		                  <option value="2년">2년</option>
		                  <option value="3년">3년</option>
		                  <option value="4년">4년</option>
		                  <option value="5년">5년</option>
		                  <option value="6년">6년</option>
		                  <option value="7년">7년</option>
		                  <option value="8년">8년</option>
		                  <option value="9년">9년</option>
		                  <option value="10년">10년</option>
		                  <option value="10년 이상">10년 이상</option>
		                  <option value="15년 이상">15년 이상</option>
		                  <option value="20년 이상">20년 이상</option>
	                  </select>
	                 </div>
                  <div>
                    <label for="score">만족도</label>
                    <select id="score" name="score" ref="score" v-model="score">
                      <option value="매우불만족">매우 불만족</option>
                      <option value="약간불만족">약간 불만족</option>
                      <option value="보통">보통</option>
                      <option value="약간만족">약간 만족</option>
                      <option value="매우만족">매우 만족</option>
                    </select>
                  </div>
                  <div>
                    <label for="ilevel">난이도</label>
                    <select id="ilevel" name="ilevel" ref="ilevel" v-model="ilevel">
                      <option value="매우 쉬움">매우 쉬움</option>
                      <option value="약간 쉬움">약간 쉬움</option>
                      <option value="보통">보통</option>
                      <option value="약간 어려움">약간 어려움</option>
                      <option value="매우 어려움">매우 어려움</option>
                    </select>
                  </div>
                  <div>
                    <label for="result">결과</label>
                    <select id="result" name="result" ref="result" v-model="result">
                      <option value="합격">합격</option>
                      <option value="불합격">불합격</option>
                      <option value="대기중">대기중</option>
                    </select>
                  </div>
                </li>
                <li class="interview-content">
                  <label for="content">후기 내용</label>
                  <textarea id="content" ref="content" v-model="content" placeholder="면접 후기 내용을 입력해 주세요.">{{content}}</textarea>
                </li>
              </ul>
              
              <div class="interview-btn-wrapper">
	              <button type="submit" id="inerviewSubmitBtn" class="interview-btn" value="확인" @click="InterviewSubmitBtn()">확인</button>
	              <button type="button" id="inerviewCancelBtn" class="interview-btn" value="취소">취소</button>
	            </div>
            </form>
          </div>
          
          <div class="accordset accordset-plus">
            <div class="accordset-item" v-for="ivo in interview_list">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="interview-tit" ref="ivo.title" v-model="ivo.title">{{ivo.title}}<br>
                  <span class="interview-date" >{{ivo.regdate}}</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="interview-icon-wrapper">
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">{{ivo.career}}</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">{ivo.score}}</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">{{ivo.ilevel}}</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">{{ivo.result}}</span>
                    </li>
                  </ul>
                  <p class="interview-content">{{ivo.content}}</p>
                </div>
              </div>
            </div>

            <div class="accordset-item">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="interview-tit">면접 후기 제목1<br>
                    <span class="interview-date">2024-02-14</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="interview-icon-wrapper">
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">신입</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">긍정적</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">보통</span>
                    </li>
                    <li>
                      <figure class="interview-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">합격</span>
                    </li>
                  </ul>
                  <p class="interview-content">지원자와 2명과 면접관 2명이 면접을 진행합니다. 각 면접관 님이 간단한 아이스브레이킹을 시작으로 인성과 직무경험을 순서대로 질문하시며, 지원자 역시 각자의 정해진 순서대로 답변을 진행합니다. 편안한 분위기에서 면접자가 자유롭게 본인의 생각을 말할 수 있게 해주십니다. 최대한 긴장하지 않고 질문 의도를 잘 파악하여 답변하시고, 답변에 대한 확실한 근거(본인의 경험, 이론적 지식 등)를 말해주시면 좋을 거 같습니다.</p>
                </div>
              </div>
            </div>
          </div>
          <nav class="pagiset pagiset-circ">
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div> -->
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-prev" href="javascript:void(0)">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list">
              <a class="pagiset-link active-fill" href="javascript:void(0)">1</a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-next" href="javascript:void(0)">
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
    <!-- [E]glamping-N40 -->
    </div>
  </section>
<script>
$(document).ready(function() {
  // 초기에 모든 아코디언 아이템의 내용을 숨김
  $('.accordset-body').hide();

  // 아코디언 헤더 클릭 시 토글 동작
  $('.accordset-header').click(function() {
    // 클릭한 아코디언 아이템의 바로 아래에 있는 .accordset-body를 토글
    $(this).next('.accordset-body').slideToggle();
    
    // 헤더에 'active' 클래스를 토글하여 스타일 변경
    $(this).toggleClass('active');
  });
});

$(function(){
  $("#interviewInsertBtn").click(function() {
    $("#interviewForm").show();
  });
  
  $("#inerviewCancelBtn").click(function() {
    $("#interviewForm").hide();
  });
})

let companyDetailApp=Vue.createApp({
  data(){
    return{
    	cno:${cno},
    	company_detail:{},
      recruit_list:[],
      interview_list:[],
      sessionId:'${principal.username}',
      title: '',
      career: '',
      score: '',
      ilevel: '',
      result: '',
      content: ''
    }
  },
  mounted(){
    this.dataRecv()
    
    axios.get('../recruitment/company_detail_vue.do', {
      params:{
        cno:this.cno
      }
    }).then(response=>{
      console.log(response.data)
      this.company_detail=response.data.cvo
      this.recruit_list=response.data.recruit_list
      this.interview_list=response.data.interview_list     
    })
  },
  methods:{
    dataRecv(){
      axios.get('../recruitment/recruit_list_vue.do', {
        params: {
          cno:this.cno
        }
      }).then(response=>{
        console.log(response.data);
        this.recruit_list=response.data.recruit_list;
      });

      axios.get('../recruitment/interview_list_vue.do', {
        params: {
          cno:this.cno
        }
      }).then(response=>{
        console.log(response.data);
        this.interview_list=response.data.interview_list;
      });
      
	    /* axios.get('../recruitment/recruit_cookie_vue.do').then(response=>{
	      console.log(response.data)
	      this.cookie_list=response.data
	    }) */
    },
    share(){
      const shareLink=window.location.href;

      // 클립보드에 복사
      const textarea=document.createElement('textarea');
      textarea.value=shareLink;
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand('copy');
      document.body.removeChild(textarea);

      alert('링크가 복사되었습니다!');
    },
    insert(){
      location.href="../recruitment/recruit_insert.do?cno="+this.cno;
    },
    InterviewSubmitBtn(){
      if(this.title==="") {
        this.$refs.title.focus()
        return
      }
      if(this.career==="") {
        this.$refs.career.focus()
        return
      }
      if(this.score==="") {
        this.$refs.score.focus()
        return
      }
      if(this.ilevel==="") {
        this.$refs.ilevel.focus()
        return
      }
      if(this.result==="") {
        this.$refs.result.focus()
        return
      }
      if(this.content==="") {
        this.$refs.content.focus()
        return
      }
      axios.post('../recruitment/interview_insert_vue.do', null, {
        params:{
        	cno:this.cno,
          title:this.title,
          career:this.career,
          score:this.score,
          ilevel:this.ilevel,
          result:this.result,
          content:this.content
        }
      }).then(response=>{
        this.interview_list=response.data
        this.title=''
        this.career=''
        this.score=''
        this.ilevel=''
        this.result=''
        this.content=''
      })
    }
  }
}).mount('#companyDetailApp')
</script>
</body>
</html>