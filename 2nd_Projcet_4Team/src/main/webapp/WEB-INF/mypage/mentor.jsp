<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../mypage/css/myStyle.css">
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.form-wrap form-wrap-horizontal-horizontal {
    display: flex;
    align-items: center;
}

.form-wrap form-wrap-horizontal-horizontal .form-tit {
    margin-right: 10px;
}

.form-wrap form-wrap-horizontal-horizontal .inputset {
    flex: 1;
}
.form-tit {
    width: 80px; 
    white-space: nowrap; 
}
.form-tit > span {
    color: var(--danger);
}
</style>

</head>
<body>
      <div class="contents-right" id="mypageMemberApp">
        <div class="contents-sort">
          <p class="contents-sort-total">
            <span style="color: var(--danger)">{{Ok}}</span>
          </p>
        </div>
        <div class="contents-list">
        <div class="glamping-N47" data-bid="iTlmG5UP9e">
      <form method="post" action="../mypage/update.do" @submit="update()">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <span><span style="color: var(--danger)">*</span> 표시는 반드시 입력하셔야 하는 항목입니다</span>
          </div>
          <div class="contents-group">
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">아이디
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" v-model="userId" name="userId" readonly="">
                </div>
              </div>
            </div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">비밀번호 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" class="inputset-input form-control" ref=userPwd v-model="userPwd" name="userPwd" required=""
                @keyup="pwdValidate()">
              </div>
            </div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">비밀번호 확인 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="password" class="inputset-input form-control"  ref=userPwd1 v-model="userPwd1" required=""
                @keyup="pwdValidate2()">
              </div>
            </div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">이름 
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" ref=userName v-model="userName" name="userName" readonly="">
              </div>
            </div>
			<div class="form-wrap form-wrap-horizontal" style="display: flex; align-items: center;">
			    <h6 class="form-tit" style="margin-right: 10px;">닉네임 <span>*</span></h6>
			    <div class="inputset inputset-round" style="flex: 1;">
			        <input type="text" class="inputset-input form-control" ref="nickname" v-model="nickname" name="nickname" required="">
			    </div>
			    <button class="btnset btnset-round" type="button" @click="nicknameCheck">중복확인</button>
			</div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">생년월일 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="date" ref=birthday size="30" v-model="birthday" required="" name="birthday">
              </div>
            </div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">이메일 <span>*</span>
              </h6>
              <div class="contents-form-group">
                <div class="inputset inputset-round">
                  <div class="contents-mail">
                    <input type="text" class="inputset-input form-control" ref=email v-model="email" required="" name="email">
                  </div>
                </div>
              </div>
            </div>
		      <div class="form-wrap form-wrap-horizontal">
		        <h6 class="form-tit">성별 <span>*</span>
		        </h6>
		        <div class="radioset-wrap">
		          <div class="radioset">
		            <input id="radioset-a-1" value="남자" v-model=gender class="radioset-input input-line" type="radio" name=gender>
		            <label class="radioset-label" for="radioset-a-1"></label>
		            <span class="radioset-text">남자</span>
		          </div>
		          <div class="radioset">
		            <input id="radioset-a-2" value="여자" v-model=gender class="radioset-input input-line" type="radio" name=gender>
		            <label class="radioset-label" for="radioset-a-2"></label>
		            <span class="radioset-text">여자</span>
		          </div>
		        </div>
		      </div>            
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">연락처 <span>*</span>
              </h6>
              <div class="inputset inputset-round">
                <input type="text" class="inputset-input form-control" v-model=phone ref=phone name=phone placeholder="-없이 번호를 입력해주세요" required="">
              </div>
            </div>
            <div class="form-wrap form-wrap-horizontal">
              <h6 class="form-tit">주소 <span>*</span></h6> 
              <div class="contents-address">
                <div class="contents-form-group">
                  <div class="inputset inputset-round">
                    <input type="text" class="inputset-input form-control" v-model="post" name=post>
                  </div>
                  <button class="btnset btnset-round btnset-line" type="buton" @click="postFind()">우편번호 검색</button>
                </div>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" v-model=addr ref=addr required="" name=addr >
                </div>
                <div class="inputset inputset-round">
                  <input type="text" class="inputset-input form-control" v-model=detail_addr  name="detail_addr" ref="detail_addr" placeholder="상세주소를 입력하세요">
                </div>
              </div>
            </div>
			<div class="form-wrap form-wrap-horizontal">
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
            <input type="submit" value="수정하기" class="btnset btnset-round">
          </div>
        </div>
      </div>
      </form>
    </div>
    </div>
  </div>
<script>
let mypageMemberApp = Vue.createApp({
    data() {
        return {
            userId: '',
            userName: '',
            userPwd: '',
            userPwd1: '',
            post: '',
            addr: '',
            detail_addr: '',
            nickname: '',
            phone: '',
            email: '',
            birthday: '',
            gender: '',
            selectedJob: '',
            Ok: ''
        }
    },
    mounted() {
        this.initData();
    },
    methods: {
        initData() {
            axios.get('../mypage/init_vue.do')
                .then(response => {
                    const data = response.data;
                    this.userId = data.userId;
                    this.userName = data.userName;
                    this.post = data.post;
                    this.addr = data.addr;
                    this.detail_addr = data.detail_addr;
                    this.nickname = data.nickname;
                    this.phone = data.phone;
                    this.email = data.email;
                    this.birthday = data.birthday;
                    this.gender = data.gender;
                    this.selectedJob = data.selectedJob;
                })
                .catch(error => {
                    console.error(error);
                });
        },
        update(e) {
        	if(this.userId && this.userName && this.userPwd && this.gender && this.userPwd1
     			   && this.birthday && this.email && this.post && this.addr && this.hope_job 
     			   && this.phone && this.Ok!='' && this.detail_addr && this.nickname
     			){
     				return true
     			}
        	e.preventDefault()
        },
        nicknameCheck() {
            if (this.nickname === '') {
                this.$refs.nickname.focus();
                return;
            }
            axios.get('../member/nicknamecheck_vue.do', {
                params: {
                    nickname: this.nickname
                }
            }).then(response => {
                if (response.data === "0") {
                    this.Ok = '';
                    this.isReadOnly = true;
                } else {
                    this.Ok = '이미 사용중인 닉네임입니다';
                }
            })
        },
        postFind() {
            let _this = this;
            new daum.Postcode({
                oncomplete: function(data) {
                    _this.post = data.zonecode;
                    _this.addr = data.address;
                }
            }).open();
        },
        pwdValidate() {
            let pwd = String(this.userPwd);
            let num = pwd.search(/[0-9]/g);
            let eng = pwd.search(/[a-z]/ig);
            if (pwd === '') {
                this.Ok = '';
                return;
            }
            if (pwd.length < 8 || pwd.length > 20) {
                this.Ok = '비밀번호를 8자리~20자리 이내로 입력하세요';
                return;
            } else if (pwd.search(/\s/) !== -1) {
                this.Ok = '비밀번호를 공백없이 입력하세요';
                return;
            } else if (num < 0 || eng > 0) {
                this.Ok = "비밀번호를 영문,숫자를 혼합해서 입력하세요";
                return;
            } else {
                this.Ok = '';
                return;
            }
        },
        pwdValidate2() {
            if (this.userPwd !== this.userPwd1) {
                this.Ok = "비밀번호가 일치하지 않습니다";
            } else {
                this.Ok = '';
            }
        },
        selectJob(job) {
            this.selectedJob = job;
        }
    }
}).mount("#mypageMemberApp");

</script>
</body>
</html>