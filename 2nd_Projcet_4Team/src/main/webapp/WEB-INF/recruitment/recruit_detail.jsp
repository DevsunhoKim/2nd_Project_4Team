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
</head>
<body>
  <section id="recruitmentDetail" class="sub">
    <div class="content-container" id="recruitmentDetailApp">
      <div class="container-md">
        <div class="content-desc">
          <div class="recruit-top">
            <div class="recruit-info">
              <a :href="'company_detail.do?no='+ no+'&cno='+ cno" class="company-info">
                <figure class="company-logo">
                  <img class="width-100" :src="company_detail.logo" alt="기업 로고">
                </figure>
                <h3 class="company-name">{{company_detail.name}}</h3>
              </a>
              <h2 class="recruit-tit">{{recruit_detail.title}}</h2>
            </div>
            <button type="button" id="recruitApplyBtnTop" class="recruit-btn recruit-apply-btn">지원하기</button>
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
            <button type="button" id="recruitShareBtn" class="recruit-btn">
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
            <a :href="'company_detail.do?no='+ no+'&cno='+ cno" class="company-info">
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
        <button type="button" id="recruitApplyBtnBottom" class="recruit-btn recruit-apply-btn">지원하기</button>
      </div>
    </div>
  </section>
<script>
let recruitmentDetailApp=Vue.createApp({
	data(){
		return{
			recruit_detail:[],
			company_detail:[],
			no:${no},
			cno:${cno}
		}
	},
	mounted(){
		axios.get('../recruitment/recruit_detail_vue.do', {
			params:{
				no:this.no,
				cno:this.cno
			}
		}).then(response=>{
			console.log(response.data)
			this.recruit_detail=response.data.rvo
			this.company_detail=response.data.cvo
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
	  		            content: '<div style="width:150px; text-align:center; padding:6px 0;">'+$("#name").text()+'</div>'
	  		        });
	  		        infowindow.open(map, marker);
	
	  		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	  		        map.setCenter(coords);
				} 
			});    
		},
		goback(){
        	location.href="../recruitment/reruit_list_vue.do"
        }
	}
}).mount('#recruitmentDetailApp')
</script>
</body>
</html>