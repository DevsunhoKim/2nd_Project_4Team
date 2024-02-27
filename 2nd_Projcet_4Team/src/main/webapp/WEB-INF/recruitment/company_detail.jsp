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
  <section id="recruitmentCompany" class="sub">
    <div class="content-container" id="companyDetailApp">
      <div class="container-md">
        <div class="company-top">
          <div class="company-info">
            <figure class="company-logo">
              <img class="width-100" :src="company_detail.logo" :title="company_detail.name">
            </figure>
            <h2 class="company-name">{{company_detail.name}}</h2>
          </div>
          <p class="company-type">{{company_detail.type}}</p>
          <!-- <div class="recruit-btn-wrapper">
            <button type="button" id="recruitUpdateBtn" class="recruit-btn" value="수정" @click="update(rno)">수정</button>
            <button type="button" id="recruitDeleteBtn" class="recruit-btn" value="삭제" @click="delete(rno)">삭제</button>
          </div> -->
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
            <!-- <button type="button" id="recruitInsertBtn" class="review-btn" value="작성하기" @click="insert()">작성하기</button> -->
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
            <button type="button" id="interviewInsertBtn" class="interview-btn" value="작성하기" @click="interviewInsert">작성하기</button>
            <!-- <p class="contents-text">총 <span class="emph">13</span>건</p> -->
          </div>
          
          <div id="interviewForm">
            <form>
              <ul class="interview-input">
                <li>
	                <label for="title">제목</label>
	                <input type="text" id="title" name="title" ref="title" v-model="title" placeholder="제목을 입력해 주세요.">
	              </li>
                <li class="interview-info">
                  <div>
	                  <label for="career">경력</label>
	                  <select id="career" name="career" ref="career" v-model="career">
	                    <option value="신입" selected>신입</option>
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
                      <option value="보통" selected>보통</option>
                      <option value="약간만족">약간 만족</option>
                      <option value="매우만족">매우 만족</option>
                    </select>
                  </div>
                  <div>
                    <label for="ilevel">난이도</label>
                    <select id="ilevel" name="ilevel" ref="ilevel" v-model="ilevel">
                      <option value="매우 쉬움">매우 쉬움</option>
                      <option value="약간 쉬움">약간 쉬움</option>
                      <option value="보통" selected>보통</option>
                      <option value="약간 어려움">약간 어려움</option>
                      <option value="매우 어려움">매우 어려움</option>
                    </select>
                  </div>
                  <div>
                    <label for="result">결과</label>
                    <select id="result" name="result" ref="result" v-model="result">
                      <option value="합격" selected>합격</option>
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
	              <button type="submit" id="interviewSubmitBtn" class="interview-btn" value="확인" @click="InterviewSubmit(ino)">확인</button>
	              <button type="button" id="interviewCancelBtn" class="interview-btn" value="취소">취소</button>
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
                      <span>만족도 </span><span class="emph">{{ivo.score}}</span>
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
                  <div class="interview-detail-btn-wrapper">
	                  <button type="button" id="interviewUpdateBtn" class="interview-detail-btn" value="수정" @click="update(ino)">수정</button>
	                  <button type="button" id="interviewDeleteBtn" class="interview-detail-btn" value="삭제" @click="delete(ino)">삭제</button>
	                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]glamping-N40 -->
    </div>
  </section>
<script>
// 면접 후기 작성 폼 출력/숨김
$(function(){
  $("#interviewInsertBtn").click(function() {
    $("#interviewForm").show();
  });
  
  $("#interviewCancelBtn").click(function() {
    $("#interviewForm").hide();
  });
  
  
  // 아코디언 헤더 클릭 시 토글 동작
  $('.accordset-item').click(function() {
    // 클릭한 아코디언 아이템의 바로 아래에 있는 .accordset-body를 토글
    $('.accordset-body').slideToggle();
    // 헤더에 'active' 클래스를 토글하여 스타일 변경
    $('.accordset-header, .accordset-body').toggleClass('active');
  });
})

let companyDetailApp=Vue.createApp({
  data(){
    return{
    	company_detail:{}, // 기업 상세 정보
      recruit_list:[], // 채용 공고 목록
      interview_list:[], // 면접 후기 목록
    	cno:${cno},
      sessionId:'',
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
  },
  methods:{
    dataRecv(){
    	axios.get('../recruitment/company_detail_vue.do', {
        params:{
          cno:this.cno
        }
      }).then(response=>{
        console.log(response.data)
        this.company_detail=response.data.cvo
        this.member_detail=response.data.mvo
        this.recruit_list=response.data.recruit_list
        this.interview_list=response.data.interview_list     
      })
      
	    /* axios.get('../recruitment/recruit_cookie_vue.do').then(response=>{
	      console.log(response.data)
	      this.cookie_list=response.data
	    }) */
    },
    // 링크 공유
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
/*     insert(){
      location.href="../recruitment/recruit_insert.do?cno="+this.cno;
    }, */
    
/*     // 지원창
    interviewInsert() {
      // 사용자의 인증 상태 확인
      if (this.principal) {
        // 사용자가 로그인한 경우, '지원하기' 창을 띄우기
        $("#interviewForm").show();
      } else {
        // 사용자가 로그인하지 않은 경우, 로그인 알림 창을 띄우고 확인을 누르면 로그인 페이지로 이동
        if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
          // 로그인 페이지로 이동하는 로직
          window.location.href = "../member/login.do";
        }
      }
    }, */
    
    InterviewSubmit(ino){
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
        	ino:this.ino,
        	cno:this.cno,
        	userId: this.sessionId,
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