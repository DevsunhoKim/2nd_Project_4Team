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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
    //$('td').has('.day').addClass('day_td');

});
/* $(document).on('click', '.day_td', function() {
    alert('마! 이벤트리스너다!');
}); */
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
													<p class="content-text" v-if="day.toString().length !== 1">2024-0{{month}}-{{day}}</p>
													<p class="content-text" v-if="day.toString().length === 1">2024-0{{ month }}-0{{ day }}</p>
													
												</div>
												
												<div class="contents-item content-mobile-group">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/ico_adult_black.svg"
																alt="성인 아이콘">
														</figure>
														<span class="info-subtitle">예약 인원</span>
													</div>
													<p class="content-text">{{inwon}}명</p>
												</div>
												<div class="contents-item">
													<div class="contents-group">
														<figure class="contents-icon">
															<img src="../studyRoom/icons/time_icon.png"
																alt="펫 아이콘" style="width: 28px;height: 28px;margin-right: 0.2rem;">
														</figure>
														<span class="info-subtitle">총 예약 시간</span>
													</div>
													<p class="content-text">{{ selectedTimes.length }}시간</p>
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
							        <span class="room-title">예약 시간</span>
							        <span style="width: 70%;text-align: right;">
							        <span class="t" v-for="(times,index) in selectedTimes">{{times}}<template v-if="index !== selectedTimes.length - 1">, </template></span>
							        </span>
							</div>
							<div class="contents-bottom title">
							        <span class="room-title">총 결제 금액</span>
							        <span>
							         <span class="p">{{ totalPrice }}</span>
							         <span style="font-size: 3rem;">원</span>
							        </span>
							</div>
						</div>
			      </div>
			      <div class="content-bottoms">
					<div class="contents-bottom inwon">
						<h2 class="contents-tit">인원선택</h2>
						<ul class="contents-list">
							<li class="contents-item">
								<div class="contents-amount">
									<button class="contents-btn btn-minus" type="button" @click="minus()">
										<img src="../studyRoom/icons/ico_minus_black.svg"
											alt="마이너스 아이콘">
									</button>
									<p class="contents-amount-num">
										<span class="inwon_count">{{ inwon }}</span>명
									</p>
									<button class="contents-btn btn-plus" type="button" @click="plus()">
										<img src="../studyRoom/icons/ico_plus_black.svg" alt="플러스 아이콘">
									</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="contents-bottom range">
						<h2 class="contents-tit">기간 선택</h2>
						<section>
					        <div class="tile" v-for="(time, index) in time_data" :key="index">
					            <input type="checkbox" name="sports" :id="'time_' + index" :value="time" v-model="selectedTimes">
					            <label :for="'time_' + index">
					                <h6>{{time}}</h6>
					            </label>
					        </div>
					        <!-- <p>Selected times: {{ selectedTimes }}</p> -->
					    </section>
					    
					    <!-- <div class="contents-bottom range">
						<h2 class="contents-tit">기간 선택</h2>
                           <div class="select_time">
					        <div v-for="(time, index) in time_data" :key="index" class="time_check">
						        <input type="checkbox" :id="'time_' + index" :value="time" v-model="selectedTimes" class="time_checkbox">
						        <label :for="'time_' + index">{{ time }}</label>
						    </div>
						   </div>
						    <p>Selected times: {{ selectedTimes }}</p>
					    </div> -->
					</div>
					<div class="contents-bottom" style="border-top: 1px solid var(--border-color);">
					    <h2 class="contents-tit">개인정보 수집 동의</h2>
					    <div class="checkset checkset-sm">
					        <input id="chk-1-1" class="checkset-input input-round" type="checkbox" value="" @change="checkAll">
					        <label class="checkset-label" for="chk-1-1"></label>
					        <span class="checkset-text">전체동의</span>
					    </div>
					    <div class="checkset checkset-sm">
					        <input id="chk-1-2" class="checkset-input input-round necessary-checkbox" type="checkbox" value="">
					        <label class="checkset-label" for="chk-1-2"></label>
					        <span class="checkset-text">(필수) 개인정보 수집항목 및 이용 동의</span>
					    </div>
					    <div class="checkset checkset-sm">
					        <input id="chk-1-3" class="checkset-input input-round necessary-checkbox" type="checkbox" value="">
					        <label class="checkset-label" for="chk-1-3"></label>
					        <span class="checkset-text">(필수) 예약변경 및 취소 규정 동의</span>
					    </div>
					</div>

					</div>
					<div class="order">
					<button class="btnset btnset-round" type="button"
						@click="order()">결제하기</button>
				    </div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
  let rapp=Vue.createApp({
	  data() {
	        // 오늘 날짜를 가져오기 위해 JavaScript의 Date 객체 사용
	        let today = new Date();
	        
	        // 오늘 날짜의 월과 일을 구해서 데이터로 반환
	        return {
	            no: ${no},
	            reserve_data: {},
	            time_data: {},
	            day: today.getDate(), // 오늘의 일
	            month: today.getMonth() + 1, // 오늘의 월. getMonth()는 0부터 시작하므로 +1을 해줍니다.
	            inwon:2,
	            max_inwon:32,
	            selectedTimes:[],
	            price:0
	        }
	  },
	  mounted(){
		  this.dataRecv();
		  //this.inwon = parseInt($('.inwon_count').text());
		  IMP.init("imp80485780");
		  
	  },
	  computed: {
		    totalPrice() {
		      // 선택된 시간의 길이와 가격을 곱하여 총 결제 금액을 계산합니다.
		      return this.selectedTimes.length * this.price;
		    }
	  },
	  methods:{
		  dataRecv() {
			    /* let startMonth=$('.start-day').text().substring(6,7);
				let startday=$('.start-day').text().substring(8);
				this.month=parseInt(startMonth); // 정수로 변환합니다.
				this.day=parseInt(startday); */
			    axios.get('../studyRoom/room_reserve_vue.do', {
			        params: {
			            no: this.no
			        }
			    }).then(response => {
					console.log(response.data)
					this.reserve_data=response.data
					this.max_inwon=response.data.inwon
					this.price=response.data.price
					
					//this.date_click();
			        /* this.$nextTick(function() {
					    $('.day_td').on('click', function() {
					        alert('마! 이벤트리스너다!');
					        this.date_click();
					    }.bind(this));
					}); */
			        axios.get('../studyRoom/date_vue.do', {
			            params: {
			                month: this.month,
			                day: this.day,
			                sno: this.no
			            }
			        }).then(response => {
			            console.log(response.data);
			            this.time_data = response.data;
			            
			            // 동적으로 생성된 요소에 대한 이벤트 핸들러 등록
			            
			        });
			    });
			},
		  date_click(){	
			  this.inwon=2
			  this.selectedTimes=[]
			  let Month=$('.start-day').text().substring(6,7);
			  let Day=$('.start-day').text().substring(8);
			  axios.get('../studyRoom/date_vue.do',{
				  params:{
					  month:Month,
					  day:Day,
					  sno:this.no
				  }
			  }).then(response=>{
				  console.log(response.data)		  
				  this.time_data=response.data
				  this.month=parseInt(Month); // 정수로 변환합니다.
				  this.day=parseInt(Day); // 정수로 변환합니다.
				  console.log(this.day)
				  //this.inwon = parseInt($('.inwon_count').text());
				  
				  console.log(this.inwon)
				  console.log(this.selectedTimes)
			  })
		  },/* ,
		  handleClick(event){
			  const target = event.target;
		      if (target.classList.contains('day_td')) {
		        // 클릭된 요소가 특정 클래스를 가지고 있는 경우에만 처리
		        alert('마! 이벤트리스너다!');
		        this.date_click();
		      }
		  } */
		  minus(){
			  if(this.inwon>1)
		      {
				  this.inwon--;
		      }
		  },
		  plus(){
			  if(this.inwon<this.max_inwon)
		      {
				  this.inwon++;
		      }
		  },
		  checkAll(event) {
		        const isChecked = event.target.checked;
		        const necessaryCheckboxes = document.querySelectorAll('.necessary-checkbox');
		        necessaryCheckboxes.forEach((checkbox) => {
		            checkbox.checked = isChecked;
		        });
		   },
		   order() {
			    let Times=this.selectedTimes;
			    console.log(Times)
		        let chk1_2Checkbox = document.getElementById('chk-1-2');
		        let chk1_3Checkbox = document.getElementById('chk-1-3');
		        if(this.selectedTimes.length==0)
		        {
		        	alert('예약시간을 선택해주세요.');
		        }
		        else if (!chk1_2Checkbox.checked) {
		            alert('(필수) 개인정보 수집항목 및 이용 동의에 동의해주세요.');
		        }
		        else if (!chk1_3Checkbox.checked) {
		            alert('(필수) 예약변경 및 취소 규정 동의에 동의해주세요.');
		        }else{
		        	this.requestPay();
		        }
		   },
		   requestPay() {
	            let vm = this; // Vue 인스턴스를 변수에 저장하여 함수 내에서 사용
	            IMP.request_pay({
	                pg: 'html5_inicis',
	                pay_method: 'card',
	                merchant_uid: 'merchant_' + new Date().getTime(),
	                name: this.reserve_data.name,
	                amount: this.totalPrice,
	                buyer_email: 'iamport@siot.do',
	                buyer_name: '구매자이름',
	                buyer_tel: '010-1234-5678',
	                buyer_addr: '서울특별시 강남구 삼성동',
	                buyer_postcode: '123-456',
	                app_scheme: 'iamporttest'
	            }, function (rsp) {
	                if (rsp.success) {
	                    var msg = '결제가 완료되었습니다.';
	                    msg += '고유ID : ' + rsp.imp_uid;
	                    msg += '상점 거래ID : ' + rsp.merchant_uid;
	                    msg += '결제 금액 : ' + rsp.paid_amount;
	                    msg += '카드 승인번호 : ' + rsp.apply_num;
	                } else {
	                    var msg = '결제에 실패하였습니다.';
	                    msg += '에러내용 : ' + rsp.error_msg;
	                    console.log("성공")
	                    vm.reserve();
	                }
	            })
	        },
	        reserve(){
	        	let times = this.selectedTimes;
                axios.post('../studyRoom/reserve_ok_vue.do',null,{
                	params:{
                		sno:this.no,
                		times: times.join(","),
                		price:this.totalPrice,
                		month:this.month,
                		day:this.day
                	}
                }).then(response=>{
                	if(response.data=='OK')
                	{
                		location.href="../mypage/myRoom_reserve.do"
                	}
                }).catch(error => {
                    console.error('Error occurred:', error);
                });
	        }
		   
	  }
  }).mount('.room_reserve')
  </script>
</body>
</html>
