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
  .glamping-N47 .contents-inner {
    margin: 0 auto;
    max-width: 800px; /* Adjust max-width as needed */
  }
  .glamping-N47 .contents-top {
    margin-bottom: 20px;
  }
  .glamping-N47 .form-wrap {
    margin-bottom: 20px;
  }
  .glamping-N47 .form-tit {
    margin-bottom: 10px;
  }
  .glamping-N47 .contents-btn-group {
    margin-top: 20px;
    text-align: center;
  }
  .glamping-N47 .contents-form-group {
    display: flex;
    align-items: center; 
    width: 100%;
}

  .glamping-N47 .inputset {
    flex: 1;
    margin-right: 10px;
}

  .glamping-N47 .btnset {
    flex: 0; 
}
  .glamping-N47 .contents-mail {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 1rem;
}
</style>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="glamping-N47" data-bid="iTlmG5UP9e" id="memberApp">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h1 class="contents-tit">정보입력</h1>
            <span><span style="color: var(--danger)">*</span> 표시는 반드시 입력하셔야 하는 항목입니다</span>
          	<div><span style="color: var(--danger)">{{Ok}}</span></div>
          </div>
          <form method="post" action="../member/join_submit.do" @submit="submitForm()">
          <div class="contents-group">
            <div class="form-wrap">
              <h6 class="form-tit">아이디 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control"  ref=userId v-model="userId" v-bind:readonly="isReadOnly" name="userId" required="">
                </div>
                <button class="btnset btnset-round" type="button" @click="idCheck">중복확인</button>
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">비밀번호 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" class="inputset-input form-control" ref=userPwd v-model="userPwd" name="userPwd" required=""
                @keyup="pwdValidate()">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">비밀번호 확인 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" class="inputset-input form-control"  ref=userPwd1 v-model="userPwd1" name="userPwd1" required=""
                @keyup="pwdValidate2()">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">이름 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" ref=userName v-model="userName" name="userName" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">닉네임 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" ref=nickname v-model="nickname" name="nickname" required="">
              </div>
              <button class="btnset btnset-round" type="buton" @click="nicknameCheck">중복확인</button>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">생년월일 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="date" ref=birthday size="30" v-model="birthday" name="birthday">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">이메일 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <div class="contents-mail">
                    <input type="text" class="inputset-input form-control" ref=email v-model="email" name="email" required="">
                  </div>
                </div>
              </div>
            </div>
		      <div class="form-wrap">
		        <h6 class="form-tit">성별 <span>*</span>
		        </h6>
		        <div class="radioset-wrap">
		          <div class="radioset">
		            <input id="radioset-a-1" value="남자" v-model=gender name=gender class="radioset-input input-line" type="radio" checked="">
		            <label class="radioset-label" for="radioset-a-1"></label>
		            <span class="radioset-text">남자</span>
		          </div>
		          <div class="radioset">
		            <input id="radioset-a-2" value="여자" v-model=gender name=gender class="radioset-input input-line" type="radio">
		            <label class="radioset-label" for="radioset-a-2"></label>
		            <span class="radioset-text">여자</span>
		          </div>
		        </div>
		      </div>            
            <div class="form-wrap">
              <h6 class="form-tit">연락처 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" v-model=phone ref=phone name=phone aria-label="내용" placeholder="-없이 번호를 입력해주세요" required="">
              </div>
            </div>
            <div class="form-wrap">
              <h6 class="form-tit">주소 <span>*</span></h6> 
              <div class="contents-address">
                <div class="contents-form-group">
                  <div class="inputset inputset-round">
                    <input type="text" class="inputset-input form-control" v-model="post" name=post>
                  </div>
                  <button class="btnset btnset-round btnset-line" type="buton" @click="postFind()">우편번호 검색</button>
                </div>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" name=addr v-model=addr ref=addr required="">
                </div>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" name=detail_addr v-model=detail_addr ref=detail_addr placeholder="상세주소를 입력하세요" required="">
                </div>
              </div>
            </div>
			<div class="form-wrap">
			    <h6 class="form-tit">희망직군</h6>
			    <div class="contents-form-group">
			        <div class="inputset inputset-round">
			            <div class="contents-mail">
			                <input type="text" class="inputset-input form-control" v-model="selectedJob" name="hope_job" required="">
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
          </div>
          <div class="contents-btn-group">
            <a href="javascript:history.back();" class="btnset btnset-line btnset-round">이전단계</a>
            <input type="submit" value="회원가입" class="btnset btnset-round">
          </div>
          </form>
        </div>
      </div>
    </div>
<script>
  let memberApp=Vue.createApp({
	  data(){
		  return {
			  post:'',
			  addr:'',
			  detail_addr:'',
			  userPwd:'',
			  userPwd1:'',
			  userName:'',
			  nickname:'',
			  phone:'',
			  email:'',
			  birthday:'',
			  userId:'',
			  Ok:'',
			  isReadOnly:false,
			  gender:'',
			  selectedJob: ''
		  }
	  },
	  methods:{
		  submitForm(e){
			if(this.userId && this.userName && this.userPwd && this.gender && this.userPwd1
			   && this.birthday && this.email && this.post && this.addr && this.hope_job 
			   && this.phone && this.Ok!='' && this.detail_addr && this.nickname
			){
				return true
			}
			
			if(this.userId===''){
				this.$refs.userId.focus()
			}
			else if(this.userName===''){
				this.$refs.userName.focus()
			}
			else if(this.userPwd===''){
				this.$refs.userPwd.focus()
				
			}
			else if(this.userPwd1===''){
				this.$refs.userPwd1.focus()
				
			}
			else if(this.userPwd!=this.userPwd1){
				this.userPwd1='';
				this.userPwd2=''
				
			}
			else if(this.nickname===''){
				this.$refs.nickname.focus()
			}
			else if(this.phone==''){
				this.$refs.phone.focus()
				
			}
			else if(this.email==''){
				this.$refs.email.focus()
				
			}
			e.preventDefault()
		  },
		  idCheck(){
			  if(this.userId===''){
				  this.$refs.userId.focus()
				  return
			  }
			  axios.get('../member/idcheck_vue.do',{
				  params:{
					  userId:this.userId
				  }
			  }).then(response=>{
				 if(response.data=="0"){
					 this.Ok=''
					 this.isReadOnly=true
			     }
				 else{
					 this.Ok='이미 사용중인 아이디입니다' 
				 }
			  })
		  },
		  nicknameCheck(){
			  if(this.nickname===''){
				  this.$refs.nickname.focus()
				  return
			  }
			  axios.get('../member/nicknamecheck_vue.do',{
				  params:{
					  nickname:this.nickname
				  }
			  }).then(response=>{
				 if(response.data=="0"){
					 this.Ok=''
					 this.isReadOnly=true
			     }
				 else{
					 this.Ok='이미 사용중인 닉네임입니다' 
				 }
			  })
		  },
		  postFind(){
			  let _this=this
			  //Vue
			  new daum.Postcode({
				 oncomplete:function(data){
					 _this.post=data.zonecode;
					 _this.addr=data.address;
				 }
			  }).open()
		  },
		  pwdValidate(){
			  let pwd=String(this.userPwd)
			  let num=pwd.search(/[0-9]/g)
			  let eng=pwd.search(/[a-z]/ig)
			  // 알파벳 / 숫자가 존재 
			  // 8자리 이상  20이하 
			  if(pwd==='')
			  {
				  this.Ok='';
				  return
			  }
			  if(pwd.length<8 || pwd.length>20)
			  {
				  this.Ok='비밀번호를  8자리~20자리 이내로 입력하세요'
				  return
			  }
			  else if(pwd.search(/\s/)!=-1)
			  {
				  // \s => 공백 
				  this.Ok='비밀번호를 공백없이 입력하세요'
				  return
			  }
			  else if(num<0 || eng>0)
			  {
				  this.Ok="비밀번호를 영문,숫자를 혼합해서 입력히세요"
				  return
			  }
			  else
			  {
				  this.Ok=''
				  return
			  }
			  
		  },
		  pwdValidate2(){
			  if(this.userPwd!==this.userPwd1)
			  {
				  this.Ok="비밀번호가 일치하지 않습니다!"
			  }
			  else
			  {
				  this.Ok=''
			  }
		  },
		  selectJob(job) {
              this.selectedJob = job; 
          }
	  }
  }).mount("#memberApp")
</script>
</body>
</html>