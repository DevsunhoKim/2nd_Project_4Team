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
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="glamping-N44" data-bid="oFlSD6Ca9n" th-id="lsd6ca9m" th-index="0" th-relative="true" id="loginApp">
  <div class="contents-inner" draggable="true" th-dragitem="true">
    <div class="contents-container" draggable="false">
      <div class="textset" draggable="false">
        <h2 class="textset-tit" draggable="false">LOGIN</h2>
        <p class="textset-desc" draggable="false">CODEV에 오신것을 진심으로 환영합니다</p>
      </div>
      <div class="contents-form" draggable="false">
        <div class="inputset inputset-round" draggable="false">
          <input type="text" class="inputset-input form-control" ref="id" v-model="id" placeholder="아이디를 입력해주세요" required="" draggable="false">
        </div>
        <div class="inputset inputset-round" draggable="false">
          <input type="password" class="inputset-input form-control" ref="pwd" v-model="pwd" placeholder="비밀번호를 입력해주세요" required="" draggable="false">
        </div>
        <div class="contents-util" draggable="false">
          <div class="checkset" draggable="false">
            <input id="checkset-a-1-1" class="checkset-input input-round" type="checkbox" value="" checked="" draggable="false" ref="ck" v-model="ck">
            <label class="checkset-label" for="checkset-a-1-1" draggable="false"></label>
            <span class="checkset-text" draggable="false">자동로그인</span>
          </div>
          <div class="contents-find" draggable="false">
            <a href="javascript:void(0);" draggable="false">아이디 찾기</a>
            <a href="javascript:void(0);" draggable="false">비밀번호 찾기</a>
          </div>
        </div>
        <div class="contents-btnset" draggable="false">
          <input type=button value="로그인" class="btnset btnset-round" @click="login()" draggable="false">
          <!-- <a href="javascript:void(0);" class="btnset btnset-round" draggable="false">로그인</a> -->
          <a href="../member/join.do" class="btnset btnset-round btnset-line" draggable="false">회원가입</a>
        </div>
      </div>
      <div class="contents-start" draggable="false">
        <span class="contents-or" draggable="false">
          <span class="contents-ortext" draggable="false">SNS 계정으로 간편 로그인</span>
        </span>
        <ul class="contents-list" draggable="false">
          <li class="contents-item" draggable="false">
            <a href="javascript:void(0);" draggable="false">
              <figure class="contents-figure ico-kakao" draggable="false">
                <img class="contents-icon" src="../member/icons/ico_kakao.svg" alt="카카오톡 아이콘" draggable="false">
              </figure>
              <span class="content-sns" draggable="false">카카오톡</span>
            </a>
          </li>
          <li class="contents-item" draggable="false">
            <a href="javascript:void(0);" draggable="false">
              <figure class="contents-figure ico-naver" draggable="false">
                <img class="contents-icon" src="../member/icons/ico_naver.svg" alt="네이버 아이콘" draggable="false">
              </figure>
              <span class="content-sns" draggable="false">네이버</span>
            </a>
          </li>
          <li class="contents-item" draggable="false">
            <a href="javascript:void(0);" draggable="false">
              <figure class="contents-figure ico-apple" draggable="false">
                <img class="contents-icon" src="../member/icons/ico_apple.svg" alt="애플 아이콘" draggable="false">
              </figure>
              <span class="content-sns" draggable="false">Apple</span>
            </a>
          </li>
        </ul>
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