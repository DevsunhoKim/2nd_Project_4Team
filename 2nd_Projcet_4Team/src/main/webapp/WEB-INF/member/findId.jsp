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
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.inputset {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px; /* Adjust as needed */
}

.inputset-input {
    flex: 1;
    margin-right: 10px; /* Adjust as needed */
}
</style>
</head>
<body>
<div class="glamping-N44" data-bid="oFlSD6Ca9n" th-id="lsd6ca9m" th-index="0" th-relative="true" id="loginApp">
  <div class="contents-inner" draggable="true" th-dragitem="true">
    <div class="contents-container" draggable="false">
      <div class="textset" draggable="false">
        <h2 class="textset-tit" draggable="false">아이디 찾기</h2>
        <p class="textset-desc" draggable="false">아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
      </div>
      <div class="contents-form" draggable="false">
      	이메일 입력
        <div class="inputset inputset-round" draggable="false">
          <input type="text" class="inputset-input form-control" ref="email" v-model="email" placeholder="이메일를 입력해주세요" required="" draggable="false">
          <button class="btnset btnset-round" type="button" @click="">인증번호전송</button>
        </div>
        인증번호 입력
        <div class="inputset inputset-round" draggable="false">
          <input type="text" class="inputset-input form-control" ref="verification" v-model="verification" placeholder="인증번호를 입력해주세요" required="" draggable="false">
          <button class="btnset btnset-round" type="button" @click="">확인</button>
        </div>
        <div class="contents-btnset" draggable="false">
          <!-- <a href="javascript:void(0);" class="btnset btnset-round" draggable="false">로그인</a> -->
          <!-- <a href="#" class="btnset btnset-round btnset-line" draggable="false">아이디찾기</a> -->
        </div>
      </div>
    </div>
  </div>
</div>
 <script>
  let loginApp=Vue.createApp({
	  data(){
		  return {
			  id:'${userId}',
			  pwd:'',
			  ck:true  
		  }
	  },
	  methods:{
		  login(){
			  if(this.id==='')
			  {
				  alert("ID를 입력하세요!!")
				  this.$refs.id.focus()
				  return
			  }
			  if(this.pwd==='')
			  {
				  alert("비밀번호를 입력하세요!!")
				  this.$refs.pwd.focus()
				  return
			  }
			  if (!this.ck) {
			        this.ck = false;
			    }
			  axios.get('../member/login_ok_vue.do',{
				  params:{
					  userId:this.id,
					  userPwd:this.pwd,
					  ck:this.ck
				  }
			  }).then(response=>{
				  // NOID , NOPWD , OK 
				  if(response.data==='NOID')
				  {
					  alert("ID가 존재하지 않습니다")
					  this.id=''
					  this.pwd=''
					  this.ck=false
					  this.$refs.id.focus()
				  }
				  else if(response.data==='NOPWD')
				  {
					  alert("비밀번호가 틀립니다!!")
					  this.pwd=''
					  this.$refs.pwd.focus()
				  }
				  else
			      {
					  location.href='../main/main.do'
			      }
			  })
		  }
	  }
  }).mount("#loginApp")
 </script>
</body>
</html>