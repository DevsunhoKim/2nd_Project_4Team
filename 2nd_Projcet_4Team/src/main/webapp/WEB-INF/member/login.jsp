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
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="")
		{
			$('#id').focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return
		}
		
		$('#frm').submit()
	})
})
</script>
</head>
<body>
<div class="glamping-N44" data-bid="oFlSD6Ca9n" th-id="lsd6ca9m" th-index="0" th-relative="true" id="loginApp">
  <div class="contents-inner" draggable="true" th-dragitem="true">
    <div class="contents-container" draggable="false">
      <div class="textset" draggable="false">
        <h2 class="textset-tit" draggable="false">LOGIN</h2>
        <p class="textset-desc" draggable="false">CODEV에 오신것을 진심으로 환영합니다</p>
      </div>
      <form method="POST" action="../member/login.do" id="frm">
      <div class="contents-form" draggable="false">
        <div class="inputset inputset-round" draggable="false">
        	<div><span style="color: red">${message }</span></div>
          <input type="text" name="userId" id="id" class="inputset-input form-control" placeholder="아이디를 입력해주세요" required="" draggable="false">
        </div>
        <div class="inputset inputset-round" draggable="false">
          <input type="password" name="userPwd" id="pwd" class="inputset-input form-control" placeholder="비밀번호를 입력해주세요" required="" draggable="false">
        </div>
        <div class="contents-util" draggable="false">
          <div class="checkset" draggable="false">
            <input id="checkset-a-1-1" class="checkset-input input-round" type="checkbox" draggable="false" name="remember-me" checked>
            <label class="checkset-label" for="checkset-a-1-1" draggable="false"></label>
            <span class="checkset-text" draggable="false">자동로그인</span>
          </div>
          <div class="contents-find" draggable="false">
            <a href="javascript:void(0);" draggable="false">아이디 찾기</a>
            <a href="javascript:void(0);" draggable="false">비밀번호 찾기</a>
          </div>
        </div>
        <div class="contents-btnset" draggable="false">
          <input type=button value="로그인" class="btnset btnset-round" draggable="false" id="logBtn">
          <a href="../member/join.do" class="btnset btnset-round btnset-line" draggable="false">회원가입</a>
        </div>
      </div>
      </form>
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
<!--  <script>
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
				  alert("ID를 입력하세요.")
				  this.$refs.id.focus()
				  return
			  }
			  if(this.pwd==='')
			  {
				  alert("비밀번호를 입력하세요.")
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
					  alert("ID가 존재하지 않습니다.")
					  this.id=''
					  this.pwd=''
					  this.ck=false
					  this.$refs.id.focus()
				  }
				  else if(response.data==='NOPWD')
				  {
					  alert("비밀번호가 틀립니다. 다시 입력해주세요.")
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
 </script> -->
</body>
</html>