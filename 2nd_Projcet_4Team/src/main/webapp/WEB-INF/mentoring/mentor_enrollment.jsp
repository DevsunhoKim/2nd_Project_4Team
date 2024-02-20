<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="../member/css/setting.css">
  <link rel="stylesheet" href="../member/css/plugin.css">
  <link rel="stylesheet" href="../member/css/template.css">  
  <link rel="stylesheet" href="../member/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <style type="text/css">
  body {
    margin: 0;
    padding: 0;
  }
  .glamping-N47 {
    padding: 60px 20px 20px; /* 위쪽 패딩을 40px로 조정 */
  }
  .contents-inner {
    margin: 0 auto;
    max-width: 800px; /* Adjust max-width as needed */
  }
  .contents-top {
    margin-bottom: 20px;
  }
  .form-wrap {
    margin-bottom: 20px;
  }
  .form-tit {
    margin-bottom: 10px;
  }
  .contents-btn-group {
    margin-top: 20px;
    text-align: center;
  }
.contents-form-group {
    display: flex;
    align-items: center; 
    width: 100%;
}

.inputset {
    flex: 1;
    margin-right: 10px;
}

.btnset {
    flex: 0; 
}
.contents-mail {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 1rem;
}

.glamping-N47 .radioset{
	display:block;
}

.glamping-N47 div.radioset label.radioset-label {
	display: block;
    margin: 0 auto 0.5rem auto;
}

.glamping-N47 .radioset{
	display:block;
	margin: 10px;
}

.glamping-N47 .radioset img {
	width: 80px;
    height: 80px;
    display: block;
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="glamping-N47" data-bid="iTlmG5UP9e" id="mentor_enrollmentApp">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h1 class="contents-tit">정보입력</h1>
            <span><span style="color: var(--danger)">*</span> 표시는 반드시 입력하셔야 하는 항목입니다</span>
          </div>
          <form method="post" action="../mentoring/mentor_join_submit.do" @submit="submitForm()">
          <div class="contents-group">
	          <div class="form-wrap">
		        <h6 class="form-tit">프로필이미지 <span>*</span>
		        </h6>
			    <div class="radioset-wrap">
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-1" value="../images/mentor1.png" v-model="img" name="img" class="radioset-input input-line" type="radio" checked>
	                  <label class="radioset-label" for="radioset-a-1"></label>
	               	   <img alt="" src="../images/mentor1.png">
	                </div>
	              </div>
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-2" value="../images/mentor2.png" v-model="img" name="img" class="radioset-input input-line" type="radio">
	                  <label class="radioset-label" for="radioset-a-2"></label>
	                  	<img alt="" src="../images/mentor2.png">
	                </div>
	              </div>
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-3" value="mentor3" v-model="img" name="img" class="radioset-input input-line" type="radio">
	                  <label class="radioset-label" for="radioset-a-3"></label>
	                  	<img alt="" src="../images/img_basic_mobile_N33_1.png">
	                </div>
	              </div>
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-4" value="mentor4" v-model="img" name="img" class="radioset-input input-line" type="radio">
	                  <label class="radioset-label" for="radioset-a-4"></label>
	                  	<img alt="" src="../images/img_basic_mobile_N33_1.png">
	                </div>
	              </div>
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-5" value="mentor5" v-model="img" name="img" class="radioset-input input-line" type="radio">
	                  <label class="radioset-label" for="radioset-a-5"></label>
	                  	<img alt="" src="../images/img_basic_mobile_N33_1.png">
	                </div>
	              </div>
	              <div>
	                <div class="radioset">
	                  <input id="radioset-a-6" value="mentor6" v-model="img" name="img" class="radioset-input input-line" type="radio">
	                  <label class="radioset-label" for="radioset-a-6"></label>
	                  	<img alt="" src="../images/img_basic_mobile_N33_1.png">
	                </div>
	              </div>
	            </div>
          		</div>
           <div class="form-wrap">
            <h6 class="form-tit">직군 <span>*</span> </h6>
            <div class="contents-form-group">
                <div class="inputset inputset-round">
                    <div class="contents-mail">
                        <input type="text" class="inputset-input form-control" v-model="selectedJob" name="job" required="">
                    </div>
                </div>
            </div>
            <div class="selectset selectset-round selectset-md">
                <button class="selectset-toggle btn" type="button">
                    <span>선택해주세요</span>
                </button>
                <ul class="selectset-list">
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('')">
                            <span>직접입력</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('Backend')">
                            <span>Backend</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('Frontend')">
                            <span>Frontend</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('Android')">
                            <span>Android</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('iOS')">
                            <span>iOS</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('Data Engineering')">
                            <span>Data Engineering</span>
                        </button>
                    </li>
                    <li class="selectset-item">
                        <button class="selectset-link btn" type="button" @click="selectJob('Devops')">
                            <span>Devops</span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
            <div class="form-wrap">
              <h6 class="form-tit">주요경력 <span>*</span>
              </h6>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" v-model=career name=career ref=career required="">
                </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">부서명 
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" v-model=department name=department ref=department>
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">키워드
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" v-model=keyword name=keyword ref=keyword placeholder="#취업상담 #면접 #이직">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">멘토링 제목 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" v-model=title name=title ref=title required="">
              </div>
            </div>
            <div class="form-wrap">
                <h6 class="form-tit">멘토링 소개 
                </h6>
                <div class="inputset inputset-round">
                  <textarea class="inputset-input form-control" v-model=intro name=intro ref=intro style="height: 150px"></textarea>
                </div>
            </div>
            <div class="form-wrap">
                <h6 class="form-tit">시간당 가격 <span>*</span>
                </h6>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" v-model=pay name=pay ref=pay placeholder="숫자만 입력해주세요" required="">
                </div>
            </div>
          </div>
          <div class="contents-btn-group">
            <a href="javascript:history.back();" class="btnset btnset-line btnset-round">이전단계</a>
            <input type="submit" value="멘토등록" class="btnset btnset-round">
          </div>
         </form>
        </div>
      </div>
    </div>
<script>
  let mentor_enrollmentApp=Vue.createApp({
	  data(){
		  return {
			  img:'',
			  selectedJob: '',
			  career:'',
			  department:'',
			  keyword:'',
			  title:'',
			  intro:'',
			  pay:''
		  }
	  },
	  methods:{
		  // NOT NULL 유효성 검사
		  submitForm(e){
			if(this.selectedJob && this.title && this.pay && this.career ){
				return true
			}
			if(this.selectedJob===''){
				this.$refs.selectedJob.focus()
			}
			else if(this.title===''){
				this.$refs.title.focus()
			}
			else if(this.pay===''){
				this.$refs.pay.focus()
			}
			else if(this.career===''){
				this.$refs.career.focus()
			}
			e.preventDefault()
		  },
		  selectJob(job) {
              this.selectedJob = job; 
          }
	  }
  }).mount("#mentor_enrollmentApp")
</script>
</body>
</html>