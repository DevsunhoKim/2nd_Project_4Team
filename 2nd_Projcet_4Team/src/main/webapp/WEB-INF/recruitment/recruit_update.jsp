<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 수정</title>
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
  <section id="recruitmentDetail" class="sub insert update">
    <div class="content-container" id="recruitmentUpdateApp">
      <div class="container-md">
        <form method="" action="">
          <div class="content-desc">
            <div class="recruit-top">
              <ul class="recruit-info">
                <li>
                  <label for="company-logo">기업 로고</label>
                  <input type="file" name="company-logo" id="company-logo" v-model="cvo.logo" class="recruit-input">
                </li>
                <li>
                  <label for="company-name">기업명</label>
                  <input type="text" name="company-name" id="company-name" v-model="cvo.name" class="recruit-input"  placeholder="기업명을 입력해 주세요.">
                </li>
                <li>
                  <label for="recruit-tit">채용 공고 제목</label>
                  <input type="text" name="recruit-tit" id="recruit-tit" v-model="title" class="recruit-input" placeholder="채용 공고의 제목을 입력해 주세요.">
                </li>
              </ul>
            </div>
          </div>

          <div class="recruit-detail">
            <ul class="recruit-detail-card">
              <li>
                <label for="recruit-area">근무 지역</label>
                <select name="area" id="recruit-area" v-model="cvo.address">
                  <option value="전국">전국</option>
                  <option value="서울특별시">서울특별시</option>
                  <option value="부산광역시">부산광역시</option>
                  <option value="대구광역시">대구광역시</option>
                  <option value="인천광역시">인천광역시</option>
                  <option value="광주광역시">광주광역시</option>
                  <option value="대전광역시">대전광역시</option>
                  <option value="울산광역시">울산광역시</option>
                  <option value="세종특별자치시">세종특별자치시</option>
                  <option value="경기도">경기도</option>
                  <option value="강원특별자치도">강원특별자치도</option>
                  <option value="충청북도">충청북도</option>
                  <option value="충청남도">충청남도</option>
                  <option value="전북특별자치도">전북특별자치도</option>
                  <option value="전라남도">전라남도</option>
                  <option value="경상북도">경상북도</option>
                  <option value="경상남도">경상남도</option>
                  <option value="제주특별자치도">제주특별자치도</option>
                </select>
              </li>

              <li>
                <label for="recruit-career">경력 조건</label>
                <select name="career" id="recruit-career" v-model="career">
                  <option value="경력무관">경력무관</option>
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
              </li>

              <li>
                <label for="recruit-education">학력 조건</label>
                <select name="education" id="recruit-education" v-model="education">
                  <option value="학력무관">학력무관</option>
                  <option value="고등학교 졸업">고등학교 졸업</option>
                  <option value="대학 졸업(2,3년)">대학 졸업(2,3년)</option>
                  <option value="대학교 졸업(4년)">대학 졸업(4년)</option>
                  <option value="대학원 석사 졸업">대학원 석사 졸업</option>
                  <option value="대학원 박사 졸업">대학원 박사 졸업</option>
                </select>
              </li>
            </ul>
            <div class="recruit-stack">
              <label>기술 스택<br><span class="recruit-alert">다중 선택 가능</span></label>
              <ul class="recruit-stack-list">
                <li><input type="checkbox" name="recruit-stack" id="Java" value="Java" class="recruit-check"><label for="Java">Java</label></li>
<!--                 <li><input type="checkbox" name="recruit-stack" id="SpringFramework" value="Spring Framework" class="recruit-check"><label for="SpringFramework">Spring Framework</label></li>
                <li><input type="checkbox" name="recruit-stack" id="AWS" value="AWS" class="recruit-check"><label for="AWS">AWS</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Git" value="Git" class="recruit-check"><label for="Git">Git</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Github" value="Github" class="recruit-check"><label for="Github">Github</label></li>
                <li><input type="checkbox" name="recruit-stack" id="SQL" value="SQL" class="recruit-check"><label for="SQL">SQL</label></li>
                <li><input type="checkbox" name="recruit-stack" id="MySQL" value="MySQL" class="recruit-check"><label for="MySQL">MySQL</label></li>
                <li><input type="checkbox" name="recruit-stack" id="HTML" value="HTML" class="recruit-check"><label for="HTML">HTML</label></li>
                <li><input type="checkbox" name="recruit-stack" id="JavaScript" value="JavaScript" class="recruit-check"><label for="JavaScript">JavaScript</label></li>
                <li><input type="checkbox" name="recruit-stack" id="React" value="React" class="recruit-check"><label for="React">React</label></li>
                <li><input type="checkbox" name="recruit-stack" id="JPA" value="JPA" class="recruit-check"><label for="JPA">JPA</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Linux" value="Linux" class="recruit-check"><label for="Linux">Linux</label></li> -->
              </ul>
            </div>
            <div class="recruit-detail-info">
              <label for="recruit-content_j">주요 업무</label>
              <textarea id="recruit-content_j" class="recruit-textarea" v-model="content_j" placeholder="주요 업무를 작성해 주세요."></textarea>
              
              <label for="recruit-content_j">자격 요건</label>
              <textarea id="recruit-content_q" class="recruit-textarea" v-model="content_q" placeholder="자격 요건을 작성해 주세요."></textarea>
              
              <label for="recruit-content_j">우대 사항</label>
              <textarea id="recruit-content_p" class="recruit-textarea" v-model="content_p" placeholder="우대 사항을 작성해 주세요."></textarea>
              
              <label for="recruit-content_j">복지 및 혜택</label>
              <textarea id="recruit-content_b" class="recruit-textarea" v-model="content_b" placeholder="복지 및 혜택을 작성해 주세요."></textarea>
              <!-- <pre>
              </pre> -->
              <div class="recruit-date">
                <label for="recruit-dete">마감일</label>
                <input type="date" id="recruit-date" v-model="end_date">
              </div>
            </div>
          </div>

          <div class="company-detail">
            <!-- <div class="company-detail-info">
              <ul class="company-info">
                <li>
                  <label for="company-logo">기업 로고</label>
                  <input type="file" name="company-logo" id="company-logo" class="recruit-input">
                </li>
                <li>
                  <label for="company-name">기업명</label>
                  <input type="text" name="company-name" id="company-name" class="recruit-input" placeholder="기업명을 입력해 주세요.">
                </li>
              </ul>
            </div> -->
            <ul class="company-contact">
              <li>
                <label for="company-homepage">홈페이지</label>
                <input type="text" name="company-homepage" id="company-homepage" v-model="cvo.homepage" class="recruit-input" placeholder="홈페이지 주소를 입력해 주세요.">
              </li>
              <li>
                <label for="company-phone">전화번호</label>
                <input type="text" name="company-phone" id="company-phone" v-model="cvo.phone" class="recruit-input" placeholder="전화번호를 입력해 주세요.">
              </li>
              <li>
                <label for="company-email">이메일</label>
                <input type="text" name="company-email" id="company-email" v-model="cvo.email" class="recruit-input" placeholder="이메일을 입력해 주세요.">
              </li>
            </ul>
          </div>
          <div class="company-map">
            <div id="map" style="width:100%; height:480px;"></div>
            <div class="company-address">
              <label for="company-address">주소</label>
              <input type="text" name="company-address" id="company-address" v-model="cvo.address" class="recruit-input" placeholder="주소를 입력해 주세요.">
            </div>
          </div>
          <button type="submit" id="recruitInsertBtn" class="recruit-btn">수정하기</button>
          <button type="submit" id="recruitCancelBtn" class="recruit-btn">취소</button>
        </form>
      </div>
    </div>
  </section>
<script>
let recruitmentUpdateApp=Vue.createApp({
	data(){
		return {
	      rno:${rno},
	      cno:${cno},
	      title:'',
	      stack_txt:'',
	      stack_img:'', 
	      career:'', 
	      education:'', 
	      content_j:'', 
	      content_q:'', 
	      content_p:'', 
	      content_b:'', 
	      end_date:'',
	      cvo: {
	        cno: ${cvo.cno},
	        logo: '',
	        name: '',
	        address: '',
	        phone: '',
	        homepage: '',
	        email: ''
	      }
	    }
	},
  mounted(){
    axios.get('../recruitment/recruit_update_vue.do', {
      params:{
      	cno:this.cno,
        rno:this.rno
      }
    }).then(response=>{
      console.log(response.data)
      this.title:response.data.title,
      this.stack_txt:response.data.stack_txt,
      this.stack_img:response.data.stack_img, 
      this.career:response.data.career, 
      this.education:response.data.education, 
      this.content_j:response.data.content_j, 
      this.content_q:response.data.content_q, 
      this.content_p:response.data.content_p, 
      this.content_b:response.data.content_b, 
      this.end_date:response.data.end_date,
      cvo: {
	   	  cno: response.data.cvo.cno,
	   	  logo: response.data.cvo.logo,
	   	  name: response.data.cvo.name,
	   	  address: response.data.cvo.address,
	   	  phone: response.data.cvo.phone,
	   	  homepage: response.data.cvo.homepage,
	   	  email: response.data.cvo.email
      }
    })
	},
	methods:{
		goback(){
			window.history.back()
		},
		update(){
		  if(this.title==="") {
	        this.$refs.title.focus()
	        return
	      } 
	      if(this.stack_txt==="") {
	        this.$refs.stack_txt.focus()
	        return
	      } 
	      if(this.stack_img==="") {
	        this.$refs.stack_img.focus()
	        return
	      } 
	      if(this.career==="") {
	        this.$refs.career.focus()
	        return
	      } 
	      if(this.education==="") {
	        this.$refs.education.focus()
	        return
	      } 
	      if(this.content_j==="") {
	        this.$refs.content_j.focus()
	        return
	      } 
	      if(this.content_q==="") {
	        this.$refs.content_q.focus()
	        return
	      } 
	      if(this.content_p==="") {
	        this.$refs.content_p.focus()
	        return
	      } 
	      if(this.content_b==="") {
	        this.$refs.content_b.focus()
	        return
	      } 
	      if(this.end_date==="") {
	        this.$refs.career.focus()
	        return
	      } 
	      /* if(this.cvo.logo==="") {
	        this.$refs.cvo.logo.focus()
	        return
	      } 
	      if(this.cvo.name==="") {
	        this.$refs.cvo.name.focus()
	        return
	      } */
	      if(this.cvo.address==="") {
	        this.$refs.cvo.address.focus()
	        return
	      }
	      if(this.cvo.phone==="") {
	        this.$refs.cvo.phone.focus()
	        return
	      }
	      if(this.cvo.homepage==="") {
	        this.$refs.cvo.homepage.focus()
	        return
	      }
	      if(this.cvo.email==="") {
	        this.$refs.cvo.email.focus()
	        return
	      }
			
			axios.post('../recruitment/recruit_update_vue.do', null, {
		        params:{
		        	rno:this.rno,
					cno:this.cno,
					title:this.title,
					stack_txt:this.stack_txt,
					stack_img:this.stack_img, 
					career:this.career, 
					education:this.education, 
					content_j:this.content_j, 
					content_q:this.content_q, 
					content_p:this.content_p, 
					content_b:this.content_b, 
					end_date:this.end_date,
					cvo: {
						cno: cvo.cno,
					  	logo: cvo.logo,
						name: cvo.name,
						address: cvo.address,
						phone: cvo.phone,
						homepage: cvo.homepage,
						email: cvo.email
				}
	        }
      }).then(response=>{
        if(response.data==="yes") {
        	location.href="../recruitment/recruit_detail.do?rno="+this.rno
        }
        /* else{
          alert("비밀번호가 틀립니다!!")
          this.pwd=""
          this.$refs.pwd.focus()
        } */
      })
		}
		
	}
}).mount('#recruitmentUpdateApp')
</script>
</body>
</html>