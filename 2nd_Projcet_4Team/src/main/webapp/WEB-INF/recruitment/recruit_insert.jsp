<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 작성</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="../js/setting.js"></script>
<script src="../js/plugin.js"></script>
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="../recruitment/js/template.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> <!-- axios : 전송 객체 => 데이터 입·출력 시 사용 -->
</head>
<body>
  <section id="recruitmentDetail" class="th-layout-sub insert">
    <div class="content-container" id="recruitmentInsertApp">
      <div class="container-md">
        <form method="" action="">
          <div class="content-desc">
            <div class="recruit-top">
              <ul class="recruit-info">
                <li>
                  <label for="company-logo">기업 로고</label>
                  <input type="file" name="company-logo" id="company-logo" class="recruit-input">
                </li>
                <li>
                  <label for="company-name">기업명</label>
                  <input type="text" name="company-name" id="company-name" class="recruit-input" placeholder="기업명을 입력해 주세요.">
                </li>
                <li>
                  <label for="recruit-tit">채용 공고 제목</label>
                  <input type="text" name="recruit-tit" id="recruit-tit" class="recruit-input" placeholder="채용 공고의 제목을 입력해 주세요.">
                </li>
              </ul>
            </div>
          </div>

          <div class="recruit-detail">
            <ul class="recruit-detail-card">
              <li>
                <label for="recruit-area">근무 지역</label>
                <select name="area" id="recruit-area">
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
                <select name="career" id="recruit-career">
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
                <select name="education" id="recruit-education">
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
                <li><input type="checkbox" name="recruit-stack" id="SpringFramework" value="Spring Framework" class="recruit-check"><label for="SpringFramework">Spring Framework</label></li>
                <li><input type="checkbox" name="recruit-stack" id="AWS" value="AWS" class="recruit-check"><label for="AWS">AWS</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Git" value="Git" class="recruit-check"><label for="Git">Git</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Github" value="Github" class="recruit-check"><label for="Github">Github</label></li>
                <li><input type="checkbox" name="recruit-stack" id="SQL" value="SQL" class="recruit-check"><label for="SQL">SQL</label></li>
                <li><input type="checkbox" name="recruit-stack" id="MySQL" value="MySQL" class="recruit-check"><label for="MySQL">MySQL</label></li>
                <li><input type="checkbox" name="recruit-stack" id="HTML" value="HTML" class="recruit-check"><label for="HTML">HTML</label></li>
                <li><input type="checkbox" name="recruit-stack" id="JavaScript" value="JavaScript" class="recruit-check"><label for="JavaScript">JavaScript</label></li>
                <li><input type="checkbox" name="recruit-stack" id="React" value="React" class="recruit-check"><label for="React">React</label></li>
                <li><input type="checkbox" name="recruit-stack" id="JPA" value="JPA" class="recruit-check"><label for="JPA">JPA</label></li>
                <li><input type="checkbox" name="recruit-stack" id="Linux" value="Linux" class="recruit-check"><label for="Linux">Linux</label></li>
              </ul>
            </div>
            <div class="recruit-detail-info">
              <label for="recruit-content">채용 상세 설명</label>
              <textarea id="recruit-content" class="recruit-textarea" placeholder="채용 공고의 상세 정보를 입력해 주세요."></textarea>
              <!-- <pre>
              </pre> -->
              <div class="recruit-date">
                <label for="recruit-dete">마감일</label>
                <input type="date" id="recruit-date">
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
                <input type="text" name="company-homepage" id="company-homepage" class="recruit-input" placeholder="홈페이지 주소를 입력해 주세요.">
              </li>
              <li>
                <label for="company-phone">전화번호</label>
                <input type="text" name="company-phone" id="company-phone" class="recruit-input" placeholder="전화번호를 입력해 주세요.">
              </li>
              <li>
                <label for="company-email">이메일</label>
                <input type="text" name="company-email" id="company-email" class="recruit-input" placeholder="이메일을 입력해 주세요.">
              </li>
            </ul>
          </div>
          <div class="company-map">
            <!-- * 카카오맵 - 지도퍼가기 -->
            <!-- 1. 지도 노드 -->
            <div id="daumRoughmapContainer1707734014642" class="root_daum_roughmap root_daum_roughmap_landing"></div>

            <!--
              2. 설치 스크립트
              * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
            -->
            <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

            <!-- 3. 실행 스크립트 -->
            <script charset="UTF-8">
              new daum.roughmap.Lander({
                "timestamp" : "1707734014642",
                "key" : "2i3th",
                "mapWidth" : "640",
                "mapHeight" : "360"
              }).render();
            </script>
            <div class="company-address">
              <label for="company-address">주소</label>
              <input type="text" name="company-address" id="company-address" class="recruit-input" placeholder="주소를 입력해 주세요.">
            </div>
          </div>
          <button type="submit" id="recruitInsertBtn" class="recruit-btn">작성하기</button>
          <button type="submit" id="recruitCancelBtn" class="recruit-btn">취소</button>
        </form>
      </div>
    </div>
  </section>
<script>
let recruitmentInsertApp=Vue.createApp({
  data(){
    return {
      name:'',
      subject:'',
      content:'',
      pwd:''
    }
  },
  methods:{
    write(){
      if(this.name==="")
      {
        this.$refs.name.focus()
        return
      }
      if(this.subject==="")
      {
        this.$refs.subject.focus()
        return
      }
      if(this.content==="")
      {
        this.$refs.content.focus()
        return
      }
      if(this.pwd==="")
      {
        this.$refs.pwd.focus()
        return
      }
      
      axios.post('../freeboard/insert_vue.do',null,{
        params:{
          name:this.name,
          subject:this.subject,
          content:this.content,
          pwd:this.pwd
        }
      }).then(response=>{
        if(response.data==="yes")
        {
           location.href="../freeboard/list.do";  
        }
        else
        {
          alert(response.data)
        }
      })
    }
  }
}).mount("#recruitmentInsertApp")
</script>
</body>
</html>