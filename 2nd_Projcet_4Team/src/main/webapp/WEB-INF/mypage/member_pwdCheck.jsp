<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
  <link rel="stylesheet" href="../member/css/setting.css">
  <link rel="stylesheet" href="../member/css/plugin.css">
  <link rel="stylesheet" href="../member/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
<style type="text/css">
.inputset {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px; 
}

.inputset-input {
    flex: 1;
    margin-right: 10px; 
}
.glamping-N44 .contents-inner {
    padding: 2rem 2.4rem;
}
.contents-container > .textset-desc {
    font-size: larger;
    line-height: var(--lh-p3);
    color: var(--text-color3);
    text-align: center;
}
 .basic-N50 .textset {
    display: block;
    align-items: center;
    justify-content: space-between;
   
}
.contents-inner{
margin-top: 5rem;
}

</style>
</head>
<body>
 <div class="contents-right" id="memberPwdCkApp">
        <div class="contents-sort">
        </div>
<div class="glamping-N44" data-bid="oFlSD6Ca9n" th-id="lsd6ca9m" th-index="0" th-relative="true">
  <div class="contents-inner" draggable="true" th-dragitem="true">
    <div class="contents-container" draggable="false">
      <div class="textset" draggable="false">
        <h2 class="textset-tit" draggable="false">비밀번호 확인</h2>
      </div>
      <p class="textset-desc" draggable="false">비밀번호 확인 후 정보조회가 가능합니다.</p>
      <div class="contents-form" draggable="false">
        <div class="inputset inputset-round" draggable="false">
          <input type="password" class="inputset-input form-control" ref="pwd" v-model="pwd" required="" draggable="false">
        </div>
        <div class="contents-btnset" draggable="false">
        <button class="btnset btnset-round" type="button" @click="ckPwd()">비밀번호확인</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
 <script>
let memberPwdCkApp=Vue.createApp({
	  data(){
		  return {
			  pwd:''
		  }
	  },
	  methods:{
		  ckPwd(){
			  if(this.pwd==='')
			  {
				  alert("비밀번호를 입력하세요.")
				  this.$refs.pwd.focus()
				  return
			  }
			  axios.post('../mypage/ckpwd_vue.do',null,{
				  params:{
					  pwd:this.pwd
				  }
			  }).then(response=>{
				  // NOPWD, YES
				  if(response.data==='NOPWD'){
					  alert("비밀번호가 틀립니다.")
					  this.pwd=''
					  this.$refs.pwd.focus()
				  }
				  else{
					  location.href='../mypage/main.do'
			      }
			  })
		  }
	  }
  }).mount("#memberPwdCkApp")
 </script>
</body>
</html>