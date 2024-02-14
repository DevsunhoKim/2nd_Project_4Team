<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="title" content="웹사이트">
<meta name="description" content="웹사이트입니다.">
<meta name="keywords" content="키워드,키워드,키워드">
<meta property="og:title" content="웹사이트">
<meta property="og:description" content="웹사이트입니다">
<meta property="og:image" content="https://웹사이트/images/opengraph.png">
<meta property="og:url" content="https://웹사이트">
<title>Insert title here</title>
<link rel="stylesheet" href="../studyRoom/css/setting.css">
  <link rel="stylesheet" href="../studyRoom/css/plugin.css">
  <!-- <link rel="stylesheet" href="../studyRoom/css/template.css"> -->
  <link rel="stylesheet" href="../studyRoom/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../studyRoom/js/setting.js"></script>
  <script src="../studyRoom/js/template.js"></script>
  <script src="../studyRoom/js/common.js"></script>
  <script src="../studyRoom/js/script.js"></script>
</head>
<body id="studyRoom_detail">
  <!-- [E]hooms-N55 -->
  <main class="th-layout-main ">
    <!-- [S]hooms-N40 -->
    <div class="hooms-N40" data-bid="utLsKCE9C5">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-left">
            <div class="contents-thumbnail">
              <img :src="detail_list.poster" alt="썸네일이미지">
            </div>
            <ul class="contents-thumblist">
              <li class="contents-thumbitem">
                <img :src="detail_list.poster" alt="썸네일이미지">
              </li>
              <li class="contents-thumbitem" v-for="images in detail_list.dimage">
                <img :src="images" alt="썸네일이미지">
              </li>
              
            </ul>
          </div>
          <div class="contents-right">
            <div class="textset textset-h2">
              <span class="textset-name">{{detail_list.ename}}</span>
              <h2 class="textset-tit">{{detail_list.name}}</h2>
            </div>
            <!-- <p class="contents-desc"> 개성 있는 텍스처감의 패브릭과 헤드보드 양 사이드에 배치된 원목의 조화가 돋보이는 침구 세트 </p> -->
            
            <div class="contents-sum">공간 면적<span>{{detail_list.area}}</span>
            </div>
            <div class="contents-sum">이용 요금<span class="price">￦{{price}}<span>/시간</span></span>
            </div>
            
            <div class="contents-btn buy_jjim">
              <button class="btnset" href="javascript:void(0)">담아두기</button>
              <a class="btnset" href="javascript:void(0)">구매하기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N40 -->
    <!-- [S]hooms-N58 -->
    <div class="hooms-N58" data-bid="LnlskCE9IL">
      <div class="contents-container container-md">
        <div class="tabset tabset-solid">
          <ul class="tabset-list tabset-sm">
            <li class="tabset-item">
              <a class="tabset-link active" href="javascript:void(0)">
                <span>INFO</span>
              </a>
            </li>
            <li class="tabset-item">
              <a class="tabset-link" href="javascript:void(0)">
                <span>BRAND STORY</span>
              </a>
            </li>
            <li class="tabset-item">
              <a class="tabset-link" href="javascript:void(0)">
                <span>OUR PHILOSOPHY</span>
              </a>
            </li>
            <!-- <li class="tabset-item">
              <a class="tabset-link" href="javascript:void(0)">
                <span>HERITAGE</span>
              </a>
            </li> -->
          </ul>
        </div>
      </div>
    </div>
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N42 -->
		<div class="hooms-N42" data-bid="MRLSkcE9m6">
			<div class="contents-inner">
				<div class="contents-container container-md">
				<div class="detail-info">
							<!-- 상세 이미지 -->
							
					<!-- 테이블 -->
					<h2 class="info-title">이용 가능 장비/시설</h2>
					<div class="detail-table">
					   <div class="detail-infodata">
						  <h1 class="info-th">로비(공용)</h1>
						  <p class="info-td">{{detail_list.lobby}}</p>
					   </div>
					   <div class="detail-infodata"> 
						  <h1 class="info-th">세미나룸</h1>
						  <p class="info-td">{{detail_list.conve}}</p>
					   </div>
					</div>
					<h2 class="info-title">PREVIEW</h2>
					<div class="deimage-wrapper">
								<figure v-for="dimg in detail_list.dimage" class="dimage-fig">
										<img class="deimage" :src="dimg" alt="상세 이미지">
								</figure>
					</div>
				</div>
			</div>
		 </div>
		</div>
		<!-- [E]hooms-N42 -->
    <!-- [S]hooms-N36 -->
    <div class="hooms-N36" data-bid="rxlskcGXa1">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">CONTACT US</h2>
          </div>
          <div class="tabset tabset-brick">
            <ul class="tabset-list tabset-sm tabset-fill">
              <li class="tabset-item">
                <a class="tabset-link active" href="javascript:void(0)">
                  <span>Q&amp;A</span>
                </a>
              </li>
              <li class="tabset-item">
                <a class="tabset-link" href="javascript:void(0)">
                  <span>자주 묻는 질문</span>
                </a>
              </li>
              <li class="tabset-item">
                <a class="tabset-link" href="javascript:void(0)">
                  <span>1:1 문의</span>
                </a>
              </li>
            </ul>
          </div>
          <div class="contents-search">
            <p class="contents-result"> 전체<span> 24</span>개 </p>
            <div class="contents-form">
              <div class="selectset selectset-lg">
                <button class="selectset-toggle btn" type="button">
                  <span>전체</span>
                </button>
                <ul class="selectset-list">
                  <li class="selectset-item">
                    <button class="selectset-link btn" type="button" data-value="전체">
                      <span>전체</span>
                    </button>
                  </li>
                </ul>
              </div>
              <div class="inputset inputset-lg">
                <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
              </div>
            </div>
          </div>
          <div class="tableset">
            <table class="tableset-table table">
              <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
              </colgroup>
              <thead class="thead-light thead-border-top">
                <tr>
                  <th scope="col">No.</th>
                  <th scope="col">구분</th>
                  <th scope="col">제목</th>
                  <th scope="col">등록일</th>
                  <th scope="col">등록자</th>
                  <th scope="col">답변</th>
                  <th scope="col">조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="tableset-mobile">24</td>
                  <td class="tableset-category tableset-order03">가구 상담</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset">대기</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">23</td>
                  <td class="tableset-category tableset-order03">인테리어 상담</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset badgeset-active">답변완료</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">22</td>
                  <td class="tableset-category tableset-order03">A/S 신청</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset">대기</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">21</td>
                  <td class="tableset-category tableset-order03">기타</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset badgeset-active">답변완료</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">20</td>
                  <td class="tableset-category tableset-order03">가구 상담</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset badgeset-active">답변완료</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">19</td>
                  <td class="tableset-category tableset-order03">기타</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset badgeset-active">답변완료</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
                <tr>
                  <td class="tableset-mobile">18</td>
                  <td class="tableset-category tableset-order03">기타</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                      <span>안녕하세요. 문의드립니다.</span>
                    </a>
                  </td>
                  <td class="tableset-order05">2023.01.01</td>
                  <td class="tableset-order04">홍**</td>
                  <td class="tableset-order01">
                    <div class="badgeset badgeset-active">답변완료</div>
                  </td>
                  <td class="tableset-mobile">166</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="contents-btn">
            <a class="btnset modalset-btn" href="javascript:void(0)">상담 문의</a>
          </div>
          <nav class="pagiset pagiset-line">
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-prev" href="javascript:void(0)">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list">
              <a class="pagiset-link active-fill" href="javascript:void(0)">1</a>
              <a class="pagiset-link" href="javascript:void(0)">2</a>
              <a class="pagiset-link" href="javascript:void(0)">3</a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-next" href="javascript:void(0)">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div>
          </nav>
        </div>
      </div>
      <div id="modalSet1" class="modalset">
        <div class="modal-header">
          <h6 class="modal-title">1:1 문의</h6>
        </div>
        <div class="modal-body">
          <p> 로그인이 필요한 서비스입니다. <br> 로그인하시겠습니까? </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btnset btnset-ghost modal-close">취소</button>
          <a href="javascript:void(0)" class="btnset btnset-confirm">확인</a>
        </div>
      </div>
      <div class="modalset-dim"></div>
    </div>
    <!-- [E]hooms-N36 -->
    <!-- [S]hooms-N48 -->
    <div class="hooms-N48" data-bid="JylskcmnJ9" id="">
    </div>
    <!-- [E]hooms-N48 -->
    <!-- [S]hooms-N35 -->
    <div class="hooms-N35" data-bid="MPlskCn4J5">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">CUSTOMER SERVICE</h2>
          </div>
          <h3 class="contents-subtit">오프라인 매장으로 오시는 길을 안내해드립니다.</h3>
          <!-- * 카카오맵 - 지도퍼가기 -->
          <!-- 1. 지도 노드 -->
          <div id="daumRoughmapContainer1688712963834" class="root_daum_roughmap root_daum_roughmap_landing"></div>
          <!--
        2. 설치 스크립트
        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
      -->
          <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
          <!-- 3. 실행 스크립트 -->
          <script charset="UTF-8">
            new daum.roughmap.Lander({
              "timestamp": "1688712963834",
              "key": "2ffv9",
            }).render();
          </script>
          <ul class="contents-info-list">
            <li class="contents-info-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_location_black.svg" alt="아이콘이미지">
                </figure> Address
              </div>
              <p class="contents-desc"> 서울특별시 영등포구 선유로70 우리벤처타운2 705호(문래동3가 82-29) <br> Woori Venture Town 705, 70, Seonyu-ro, Yeongdeungpo-gu, Seoul, Republic of Korea </p>
            </li>
            <li class="contents-info-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_mail_black.svg" alt="아이콘이미지">
                </figure> Email
              </div>
              <p class="contents-desc"> help@openfield.co.kr </p>
            </li>
            <li class="contents-info-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_tel_black.svg" alt="아이콘이미지">
                </figure> Tel
              </div>
              <p class="contents-desc"> 070. 8872. 8874 </p>
            </li>
          </ul>
          <ul class="contents-traffic-list">
            <li class="contents-traffic-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_subway_black.svg" alt="아이콘이미지">
                </figure> 지하철 2호선
              </div>
              <p class="contents-desc"> 문래역(김안과병원) 3번출구, 6625번 버스 환승 문래힐스테이트아파트 정류장 하차 </p>
            </li>
            <li class="contents-traffic-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_subway_black.svg" alt="아이콘이미지">
                </figure> 지하철 9호선
              </div>
              <p class="contents-desc"> 당산역 11번출구, 영등포02 환승 GS홈쇼핑앞 정류장 하차 </p>
            </li>
            <li class="contents-traffic-item">
              <div class="contents-ico">
                <figure class="contents-figure">
                  <img src="../resources/icons/ico_bus_black.svg" alt="아이콘이미지">
                </figure> 버스
              </div>
              <p class="contents-desc"> 6625번, 641번 문래힐스테이트아파트 정류장 하차 / 영등포02 GS홈쇼핑앞 정류장 하차 </p>
            </li>
          </ul>
          <div class="contents-btn">
            <a class="btnset" href="javascript:void(0)">상담 문의</a>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script>
  let rapp=Vue.createApp({
	  data(){
		  return {
			  detail_list:{},
			  no:${no},
			  price:0
		  }
	  },
	  mounted(){
		  this.dataRecv();
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../studyRoom/detail_vue.do',{
				  params:{
					  no:this.no
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.detail_list=response.data
				  this.price=response.data.price.toLocaleString()
			  })
		  }
	  }
  }).mount('#studyRoom_detail')
  </script>
</body>
</html>