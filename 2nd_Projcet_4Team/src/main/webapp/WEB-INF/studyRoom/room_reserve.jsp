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
<title>예약하기_기간선택 | 글램핑</title>
<link rel="stylesheet" href="../studyRoom/css/setting.css">
<link rel="stylesheet" href="../studyRoom/css/plugin.css">
<link rel="stylesheet" href="../studyRoom/css/common.css">
<link rel="stylesheet" href="../studyRoom/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../studyRoom/js/setting.js"></script>
<script src="../studyRoom/js/plugin.js"></script>
<script src="../studyRoom/js/template.js"></script>
<script src="../studyRoom/js/common.js"></script>
<script src="../studyRoom/js/script.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 페이지 로드 시, real-today 클래스를 가진 요소에 first-date-selected 클래스 추가
    $('.real-today').addClass('first-date-selected checked');
    
});

  </script>
</head>
<body id="room_reserve">
	<main class="th-layout-main room_reserve">
		<!-- [E]glamping-N10 -->
		<!-- [S]glamping-N32 -->
		<div class="glamping-N32" data-bid="LyLsREXLUm">
			<div class="contents-inner">
				<div class="contents-container container-md contents-bottom">
					<div class="textset">
						<h2 class="textset-tit">{{reserve_data.name}}</h2><span class="ye">&nbsp;예약</span>
					</div>
				</div>
			</div>
		</div>
		<!-- [E]glamping-N32 -->
		<!-- [S]glamping-N33 -->
		<div class="glamping-N33" data-bid="DSLSRExLY4">
			<div class="contents-inner">
				<div class="contents-container container-md">
				  <div class="content-main">
					<div class="contents-top">
						<div class="contents-date"></div>
					</div>
					<div class="order-info">
							<div class="glamping-N35" data-bid="ctlSrewKEE">
							  <div class="order-info-title">예약 정보</div>
								<div class="contents-inner">
								    <div class="reserve-poster">
								      <img :src="reserve_data.poster" class="reserve_poster">
								    </div>
									<div class="" style="width: 100%;">
										<div class="">
											<div class="contents-list info-list">
												<div class="contents-item">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/ico_calendar_black.svg"
																alt="달력 아이콘">
														</figure>
														<span class="info-subtitle">예약 날짜</span>
													</div>
													<p class="content-text">2023.01.09</p>
												</div>
												
												<div class="contents-item content-mobile-group">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/ico_adult_black.svg"
																alt="성인 아이콘">
														</figure>
														<span class="info-subtitle">예약 인원</span>
													</div>
													<p class="content-text">3명</p>
												</div>
												<div class="contents-item">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/ico_pet_black.svg"
																alt="펫 아이콘">
														</figure>
														<span class="info-subtitle">예약 시간</span>
													</div>
													<p class="content-text">동행</p>
												</div>
												<!-- <div class="contents-item">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/ico_pet_black.svg"
																alt="펫 아이콘">
														</figure>
														<span>가격</span>
													</div>
													<p class="content-text">50,000</p>
												</div> -->
											</div>
											
										</div>
										
									</div>
								</div>
							</div>
							<div class="contents-bottom title">
							        <span class="room-title">총 결제 금액</span>
							        <span><span class="p">100,000</span><span style="font-size: 3rem;">원</span></span>
							</div>
						</div>
			      </div>
			      <div class="content-bottoms">
					<div class="contents-bottom inwon">
						<h2 class="contents-tit">인원선택</h2>
						<ul class="contents-list">
							<li class="contents-item">
								<p class="contents-label">성인</p>
								<div class="contents-amount">
									<button class="contents-btn btn-minus" type="button">
										<img src="../studyRoom/icons/ico_minus_black.svg"
											alt="마이너스 아이콘">
									</button>
									<p class="contents-amount-num">
										<span>2</span>명
									</p>
									<button class="contents-btn btn-plus" type="button">
										<img src="../studyRoom/icons/ico_plus_black.svg" alt="플러스 아이콘">
									</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="contents-bottom range">
						<h2 class="contents-tit">기간 선택</h2>
						<section>
					        <div class="tile">
					            <input type="checkbox" name="sports" id="sport1">
					            <label for="sport1">
					                
					                <h6>Basketball</h6>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="sports" id="sport2">
					            <label for="sport2">
					                
					                <h6>Swimming</h6>
					            </label>
					        </div>
					        <div class="tile">
					            <input type="checkbox" name="sports" id="sport3">
					            <label for="sport3">
					                
					                <h6>Quidditch</h6>
					            </label>
					        </div>
					    </section>
					</div>
					<div class="contents-bottom">
					            <h2 class="contents-tit">개인정보 수집 동의</h2>
					            <div class="checkset checkset-sm">
					              <input id="chk-1-1" class="checkset-input input-round" type="checkbox" value="">
					              <label class="checkset-label" for="chk-1-1"></label>
					              <span class="checkset-text">전체동의</span>
					            </div>
					            <div class="checkset checkset-sm">
					              <input id="chk-1-2" class="checkset-input input-round" type="checkbox" value="">
					              <label class="checkset-label" for="chk-1-2"></label>
					              <span class="checkset-text">(필수) 개인정보 수집항목 및 이용 동의</span>
					            </div>
					            <div class="checkset checkset-sm">
					              <input id="chk-1-3" class="checkset-input input-round" type="checkbox" value="">
					              <label class="checkset-label" for="chk-1-3"></label>
					              <span class="checkset-text">(필수) 예약변경 및 취소 규정 동의</span>
					            </div>
					          </div>
					</div>
					<div class="order">
					<button class="btnset btnset-round" type="button"
						@click="date_click()">결제하기</button>
				    </div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
  let rapp=Vue.createApp({
	  data(){
		  return {
			  no:${no},
			  reserve_data:{},
			  time_data:{},
			  month:2,
			  day:0
		  }
	  },
	  mounted(){
		  axios.get('../studyRoom/room_reserve_vue.do',{
			  params:{
				  no:this.no
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.reserve_data=response.data.reserve_data
			  this.time_data=response.data.list
			  let date=$('.first-date-selected').text();
			  this.day=date
		  })
	  },
	  methods:{
		  date_click(){
			  let date=$('.first-date-selected').text();
			  alert(this.day)
		  }
	  }
  }).mount('.room_reserve')
  </script>
</body>
</html>