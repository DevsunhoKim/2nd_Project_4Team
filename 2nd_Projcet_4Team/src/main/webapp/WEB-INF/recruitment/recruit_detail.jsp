<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 상세</title>
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
  <section id="recruitmentDetail" class="sub">
    <div class="content-container" id="recruitmentDetailApp">
      <div class="container-md">
        <div class="content-desc">          <div class="recruit-top">
            <div class="recruit-info">
              <a :href="'company_detail.do?rno='+ rno+'&cno='+ cno" class="company-info">
                <figure class="company-logo">
                  <img class="width-100" :src="company_detail.logo" alt="기업 로고">
                </figure>
                <h3 class="company-name">{{company_detail.name}}</h3>
              </a>
              <h2 class="recruit-tit">{{recruit_detail.title}}</h2>
            </div>
            <!-- <button type="button" id="recruitApplyBtnTop" class="recruit-btn recruit-apply-btn" @click="apply(rno)">지원하기</button> -->
            <button type="button" id="recruitUpdateBtn" class="irecruit-btn" value="수정하기" @click="update()">수정하기</button>
          </div>
        </div>

        <div class="recruit-detail">
          <div class="recruit-btn-wrapper">
            <button type="button" id="recruitLikeBtn" class="recruit-btn">
              <span class="recruit-like-count">{{recruit_detail.like_count}}</span>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4847/4847183.png" alt="관심 공고 추가">
              </figure>
            </button>
            <button type="button" id="recruitShareBtn" class="recruit-btn" @click="share()">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54628.png" alt="채용 공고 공유">
              </figure>
            </button>
          </div>
          <ul class="recruit-detail-card">
            <li>
              <h4>근무 지역</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5355/5355077.png" alt="근무 지역">
              </figure>
              <span class="emph">{{company_detail.address}}</span>
            </li>
            <li>
            <h4>경력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력 조건">
              </figure>
              <span class="emph">{{recruit_detail.career}}</span>
            </li>
            <li>
              <h4>학력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/763/763279.png" alt="학력 조건">
              </figure>
              <span class="emph">{{recruit_detail.education}}</span>
            </li>
          </ul>
          <div class="recruit-stack">
            <h4>기술 스택</h4>
            <ul class="recruit-stack-list">
              <li>
                <figure class="recruit-stack-icon">
                  <img class="width-100" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTct3fXZn_pSGHjK920D2Jt_b0DTiJsxdr-2hMe4vnVMpcXxKJr0UOOeN2ziQSoKF3V0y8&usqp=CAU" alt="Java">
                </figure>
                <span class="emph">Java</span>
              </li>
              <li>Spring Framework</li>
              <li>AWS</li>
              <li>Git</li>
              <li>Github</li>
              <li>SQL</li>
              <li>MySQL</li>
              <li>HTML</li>
              <li>JavaScript</li>
              <li>React</li>
              <li>JPA</li>
              <li>Linux</li>
            </ul>
          </div>
          <div class="recruit-detail-info">
          	<ul>
          		<li class="recruit_content_j">
          			<h5>주요 업무</h5>
          			<pre>{{recruit_detail.content_j}}</pre>
          		</li>
          		<li class="recruit_content_q">
          			<h5>자격 요건</h5>
          			<pre>{{recruit_detail.content_q}}</pre>
          		</li>
          		<li class="recruit_content_p">
          			<h5>우대 사항</h5>
          			<pre>{{recruit_detail.content_p}}</pre>
          		</li>
          		<li class="recruit_content_b">
          			<h5>복지 및 혜택</h5>
          			<pre>{{recruit_detail.content_b}}</pre>
          		</li>
          	</ul>
            
            <div class="recruit-date">
              <h6>마감일</h6>
              <p>
                <span class="recruit-icon">
                  <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/8895/8895471.png" alt="마감일">
                </span>
                {{recruit_detail.end_date}}
              </p>
            </div>
          </div>
        </div>
        <div class="company-detail">
          <div class="company-detail-info">
            <a :href="'company_detail.do?rno='+ rno+'&cno='+ cno" class="company-info">
              <figure class="company-logo">
                <img class="width-100" :src="company_detail.logo" alt="기업 로고">
              </figure>
              <h4 class="company-name">{{company_detail.name}}</h4>
            </a>
            <button type="button" id="companyLikeBtn" class="recruit-btn">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/7794/7794674.png" alt="관심 기업 추가">
              </figure>
            </button>
          </div>
          <ul class="company-contact">
          	<li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/107/107778.png" alt="전화번호">
              </figure>
              <span class="company-phone">{{company_detail.phone}}</span>
            </li>
            <!-- <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5410/5410449.png" alt="홈페이지">
              </figure>
              <span class="company-homepage">http://www.woowahan.com</span>
            </li>
            <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54290.png" alt="이메일">
              </figure>
              <span class="company-email">woowahan.com</span>
            </li> -->
          </ul>
        </div>
        <div class="company-map">
          <div id="map" style="width:100%; height:480px;"></div>
          <p class="company-address">
            <span class="recruit-icon">
              <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/2948/2948111.png" alt="기업 주소">
            </span>
            {{company_detail.address}}
          </p>
        </div>
        <button type="button" id="recruitApplyBtnBottom" class="recruit-btn recruit-apply-btn" @click="apply(rno)">지원하기</button>
      </div>
    </div>
    <div id="dialog" title="지원하기 창">
      <apply-data v-bind:apply="apply">
        <!-- <section id="applyForm" class="th-layout-sub">
			    <div class="content-container">
			      <figure class="close-btn">
			        <img class="width-100" src="" alt="닫기">
			      </figure>
			      <h2>지원하기</h2>
			      <form method="" action="">
			        <h3>지원 정보</h3>
			        <ul class="apply-info">
			          <li>
			            <label for="name">이름</label>
			            <span class="user-info">심청이</span>
			            <input type="text" name="name" id="name" class="apply-input" readonly>
			          </li>
			          <li>
			            <label for="age">나이</label>
			            <span class="user-info">27세</span>
			            <input type="text" name="age" id="age" class="apply-input" readonly>
			          </li>
			          <li>
			            <label for="sex">성별</label>
			            <span class="user-info">여성</span>
			            <input type="text" name="sex" id="sex" class="apply-input" readonly>
			          </li>
			          <li>
			            <label for="email">이메일</label>
			            <span class="user-info">shim02@codev.com</span>
			            <input type="text" name="email" id="email" class="apply-input" readonly>
			          </li>
			          <li>
			            <label for="phone">연락처</label>
			            <span class="user-info">010-1234-5678</span>
			            <input type="text" name="phone" id="phone" class="apply-input" readonly>
			          </li>
			        </ul>
			        <div class="apply-file">
			          <h3>지원서 첨부</h3>
			          <input type="file" name="file" id="file" class="apply-input">
			          <span class="apply-alert">제출할 지원서 파일을 업로드 해 주세요.</span>
			        </div>
			        <div class="apply-btn-wrapper">
			          <button type="submit" id="applySubmitBtn" class="apply-btn" value="지원하기">지원하기</button>
			          <button type="button" id="applyCancelBtn" class="apply-btn" value="취소">취소</button>
			        </div>
			      </form>
			    </div>
			  </section> -->
      </apply-data>
    </div>
  </section>
<script>
const apply={
    props:['apply'],
    template:`<section id="applyForm" class="th-layout-sub">
    <div class="content-container">
      <!-- <figure class="close-btn">
        <img class="width-100" src="" alt="닫기">
      </figure> -->
      <h2>지원하기</h2>
      <form method="" action="">
        <h3>지원 정보</h3>
        <ul class="apply-info">
          <li>
            <label for="name">이름</label>
            <span class="user-info">심청이</span>
            <!-- <input type="text" name="name" id="name" class="apply-input" readonly> -->
          </li>
          <li>
            <label for="age">나이</label>
            <span class="user-info">27세</span>
            <!-- <input type="text" name="age" id="age" class="apply-input" readonly> -->
          </li>
          <li>
            <label for="sex">성별</label>
            <span class="user-info">여성</span>
            <!-- <input type="text" name="sex" id="sex" class="apply-input" readonly> -->
          </li>
          <li>
            <label for="email">이메일</label>
            <span class="user-info">shim02@codev.com</span>
            <!-- <input type="text" name="email" id="email" class="apply-input" readonly> -->
          </li>
          <li>
            <label for="phone">연락처</label>
            <span class="user-info">010-1234-5678</span>
            <!-- <input type="text" name="phone" id="phone" class="apply-input" readonly> -->
          </li>
        </ul>
        <div class="apply-file">
          <h3>지원서 첨부</h3>
          <input type="file" name="file" id="file" class="apply-input">
          <span class="apply-alert">제출할 지원서 파일을 업로드 해 주세요.</span>
        </div>
        <div class="apply-btn-wrapper">
          <button type="submit" id="applySubmitBtn" class="apply-btn" value="지원하기">지원하기</button>
          <button type="button" id="applyCancelBtn" class="apply-btn" value="취소">취소</button>
        </div>
      </form>
    </div>
  </section>`
}

let recruitmentDetailApp=Vue.createApp({
	data(){
		return{
			recruit_detail:[],
			company_detail:[],
			rno:${rno},
			cno:${cno},
			isShow:false
		}
	},
	mounted(){
		axios.get('../recruitment/recruit_detail_vue.do', {
			params:{
				rno:this.rno,
				cno:this.cno
			}
		}).then(response=>{
			console.log(response.data)
			this.recruit_detail=response.data.rvo
			this.company_detail=response.data.cvo
			this.addScript();
		})
	},
	methods:{
		addScript(){
			const script=document.createElement("script")
			  
			/*global kakao*/
			script.onload=()=>kakao.maps.load(this.initMap)
			script.src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=74c8ca8100e4e559f7de6e3bf17641b2&libraries=services"
			document.head.appendChild(script)
		},
		initMap(){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  		    mapOption = {
  		    	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  		       	level: 3 // 지도의 확대 레벨
  		    };  

  			// 지도를 생성합니다    
  			var map = new kakao.maps.Map(mapContainer, mapOption); 

  			// 주소-좌표 변환 객체를 생성합니다
  			var geocoder = new kakao.maps.services.Geocoder();

  			// 주소로 좌표를 검색합니다
  			geocoder.addressSearch(this.company_detail.address, function(result, status) {
  		    // 정상적으로 검색이 완료됐으면 
  		    if (status === kakao.maps.services.Status.OK) {
  		    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		        	map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px; text-align:center; padding:6px 0;">'+$(".company-name").text()+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
  		    } 
			});    
		},
		apply(rno) {
			this.isShow=true
			let _this=this
			axios.get('../recruitment/recruit_detail_vue.do', {
				params:{
					rno:this.rno,
					cno:this.cno
				}
			}).then(function(response){
				console.log(response.data)
				_this.apply=response.data
				_this.isShow=true
				$('#dialog').dialog({
					autoOpen:false,
					modal:true
				}).dialog('open')
			})
		},
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
		update(){
	    location.href="../recruitment/recruit_update.do?rno="+this.rno;
	  },
		goback(){
    	location.href="../recruitment/reruit_list_vue.do"
    }
	},
	components:{
    'apply-data':apply
  }
}).mount('#recruitmentDetailApp')
</script>
</body>
</html>