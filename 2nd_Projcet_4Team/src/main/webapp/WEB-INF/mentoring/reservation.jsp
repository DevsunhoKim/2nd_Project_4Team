<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../mentoring/css_reserve/bootstrap.css">
<link rel="stylesheet" href="../mentoring/css_reserve/setting.css">
<link rel="stylesheet" href="../mentoring/css_reserve/plugin.css">
<link rel="stylesheet" href="../mentoring/css_reserve/template.css"> 
<link rel="stylesheet" href="../mentoring/css_reserve/style.css">
<link rel="stylesheet" href="../css/template.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
    .rounded {
        -moz-border-radius: 20px 20px 20px 20px;
        border-radius: 20px 20px 20px 20px;
        border: solid 1px rgb(121, 24, 242);
        background-color: rgb(121, 24, 242);
        padding: 10px;
        color: #ffffff;
    }

    .inputset.inputset-round .inputset-input {
        border-radius: 2.6rem;
        width: 70%;
        padding: 0 2rem;
    }

    .selectedInfo {
        font-size: 18px;
        font-weight: 500;
        color: rgb(121, 24, 242);
        letter-spacing: -0.05em;
    }

    .time_info_box {
        position: relative;
        display: inline-block;
        width: 55px;
        height: 35px;
        background-color: #E6E0FA;
        border: rgb(121, 24, 242);
        font-size: 13px;
        line-height: 33px;
        text-align: center;
        color: #fff;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        cursor: pointer;
        padding: 0px !important;
    }

    .time-select {
        background-color: rgb(121, 24, 242);
        color: white;
    }

    .time-unable {
        background-color: #eaeaea;
        color: white;
        cursor: default;
    }

    .d-none {
        display: none !important
    }

    .reserve_tit {
        font-size: 3.5rem;
        font-weight: 300;
    }

    .textset {
        position: relative;
        margin-top: 4rem;
        margin-bottom: 1rem;
    }

    .btnset {
        display: inline-flex;
        justify-content: center;
        align-items: center;
        min-width: 18rem;
        padding: 0 2rem;
        height: var(--ht-lg);
        font-size: var(--fs-p3);
        color: var(--white);
        background-color: rgb(121, 24, 242);
        border-width: 1px;
        border-style: solid;
        border-color: rgb(121, 24, 242);
        border-radius: 0.6rem;
        font-weight: 500;
        letter-spacing: var(--letter-spacing);
        transition: .3s;
    }

    .btnset.btnset-line.btnset-black {
        border-color: rgb(121, 24, 242);
        color: rgb(121, 24, 242);
    }
</style>
</head>
<body>
    <div class="wrapper row3" id="reserveApp" style="display: flex; width: 70%; margin: 70px auto;">
        <main class="container clear" style="flex: 1; justify-content: center; align-items: center;">
            <div class="glamping-N32" data-bid="LyLsREXLUm">
                <div class="contents-inner">
                    <div class="contents-container container-md contents-bottom">
                        <div class="textset">
                            <img alt="책 아이콘" style="width: 50px; display: inline-block;" src="${pageContext.request.contextPath}/mentoring/icons/mentoring_reserve.png">
                            <h2 class="textset-tit" style="display: inline-block; margin: 0;">&nbsp;멘토링 </h2><span class="reserve_tit" style="display: inline-block;">&nbsp;예약</span>
                        </div>

                    </div>
                </div>
            </div>
            <table class="table Calendar" style="height: 50vh; overflow: auto;">
                <tr>
                    <td class="text-center" width="60%">
                        <table class="table">
                            <tr>
                                <td>
                                    <div>
                                        <h2>
                                            <a href="#" v-on:click="onClickPrev(currentMonth)" style="color:#7918F2"> ❮ &nbsp;&nbsp;</a>
                                            {{currentYear}}년 {{currentMonth}}월
                                            <a href="#" v-on:click="onClickNext(currentMonth)" style="color:#7918F2">&nbsp;&nbsp; ❯ </a>
                                        </h2>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <td v-for="(weekName, index) in weekNames" v-bind:key="index">
                                                        {{weekName}}
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(row, index) in currentCalendarMatrix" :key="index">
                                                    <td v-for="(day, index2) in row" :key="index2" style="padding:20px;" :class="day>=realDay?'link':''">
                                                        <span v-if="day>=realDay" @click="change(day)" style="color:black">
                                                            <span v-if="day===currentDay" class="rounded">
                                                                {{day}}
                                                            </span>
                                                            <span v-else>
                                                                {{day}}
                                                            </span>
                                                        </span>
                                                        <span v-else style="color:gray">
                                                            {{day}}
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" width=60%>
                        <h4 class="text-left">날짜 선택:&nbsp;&nbsp; <span>
                                <b>{{currentYear}}</b>년&nbsp;&nbsp;
                                <b>{{currentMonth}}</b>월&nbsp;&nbsp;
                                <b>{{currentDay}}</b>일 </span></h4>
                        <h4 class="text-left">시간 선택:&nbsp;&nbsp; <span :class="{'d-none':selectedTime.length<2}">
                                <b>{{selectedTime[0]}}</b>시&nbsp;&nbsp; ~ &nbsp;&nbsp;<b>{{selectedTime[1]+1}}</b>시</span></h4>
                        <div :class="{'d-none':selectedDate==0}" style="padding: 10px 25px; display: flex; flex-direction: row;">
                            <div class="time_info_box" :class="{'time-unable' : availableHours[index] == 0, 'time-select' : availableHours[index] == 1 }" v-for="(h,index) in workingHours" @click="select_time(h)">{{h}}시
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-right" width=60%>
                        <h3 class="text-left" :class="{'d-none':selectedTime.length<2}">총 금액:&nbsp;&nbsp;
                            <b class="selectedInfo">{{ formatPrice(totalAmount) }}</b>원
                        </h3>
                    </td>
                </tr>
            </table>
        </main>
        <div class="campland-N21" data-bid="xWLSo1gi54" style="flex: 1; ">
            <div class="contents-inner">
                <div class="contents-container container-md">

                    <div class="contents-group">
                        <div class="form-wrap">
                            <div class="contents-form-group">
                                <h6 class="form-tit form-tit-deco tit-start">
                                    <span></span>문의내용
                                </h6>
                                <div class="inputset inputset-round">
                                    <textarea class="inputset-textarea" required="" placeholder="멘토에게 문의하실 내용을 입력해주세요." v-model="inquiry"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="contents-bottom">
                        <h2 class="contents-tit">개인정보수집 및 이용동의</h2>
                        <div class="contents-board">
                            - 수집하는 개인정보 항목 : 성함 및 연락처
                            <br>
                            작성해주시는 개인 정보는 문의 접수 및 고객 불만 해결을 위해 5년간 보관됩니다. 이용자는 본 동의를 거부할 수 있으나, 미동의시 문의 접수가 불가능합니다.
                        </div>
                        <div class="checkset">
                            <input id="checkset-a-1-1" class="checkset-input input-fill input-round" type="checkbox" value="">
                            <label class="checkset-label" for="checkset-a-1-1"></label>
                            <span class="checkset-text">위 내용을 읽었으며, 내용에 동의합니다. <em class="checkset-acc">(필수)</em>
                            </span>
                        </div>
                    </div>
                    <div class="contents-confirm">
                        <a href="javascript:history.back();" class="btnset btnset-round btnset-line btnset-black">돌아가기</a>
                        <button type="button" class="btnset btnset-round" @click="reserveNow()">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
let reserveApp=Vue.createApp({
	data(){
    	return {
			weekNames: ["월", "화", "수","목", "금", "토", "일"],
		      rootYear: 1904,
		      rootDayOfWeekIndex: 4, // 2000년 1월 1일은 토요일
		      currentYear: new Date().getFullYear(),
		      currentMonth: new Date().getMonth()+1,
		      currentDay: new Date().getDate(),
		      currentMonthStartWeekIndex: null,
		      currentCalendarMatrix: [],
		      endOfDay: null,
		      realDay:new Date().getDate(),
		      mno:${mno},
		      str_Mtime:${str_Mtime},
		      end_Mtime:${end_Mtime},
		      pay:${pay},
		      workingHours: [],
	          selectedTime: [],
	          availableHours: [],
	          inquiry:'',
	          totalAmount: 0
    	}
	},
	mounted(){
		this.init()
		this.workingHour()
		this.updateTotalAmount()
		IMP.init("imp64556786");
	},
	methods:{
		init(){
	        this.currentMonthStartWeekIndex = this.getStartWeek(this.currentYear, this.currentMonth);
	        this.endOfDay = this.getEndOfDay(this.currentYear, this.currentMonth);
	        this.initCalendar();
	      },
	      initCalendar(){
	        this.currentCalendarMatrix = [];
	        let day=1;
	        for(let i=0; i<6; i++){
	          let calendarRow = [];
	          for(let j=0; j<7; j++){
	            if(i==0 && j<this.currentMonthStartWeekIndex){
	              calendarRow.push("");
	            }
	            else if(day<=this.endOfDay){
	              calendarRow.push(day);
	              day++;
	            }
	            else{
	              calendarRow.push("");
	            }
	          }
	          this.currentCalendarMatrix.push(calendarRow);
	        }
	      },
	      getEndOfDay(year, month){
	          switch(month){
	              case 1:
	              case 3:
	              case 5:
	              case 7:
	              case 8:
	              case 10:
	              case 12:
	                return 31;
	                break;
	              case 4:
	              case 6:
	              case 9:
	              case 11:
	                return 30;
	                break;
	              case 2:
	                if( (year%4 == 0) && (year%100 != 0) || (year%400 == 0) ){
	                return 29;   
	                }
	                else{
	                    return 28;
	                }
	                break;
	              default:
	                console.log("unknown month " + month);
	                return 0;
	                break;
	          }
	      },
	      getStartWeek(targetYear, targetMonth){
	        let year = this.rootYear;
	        let month = 1;
	        let sumOfDay = this.rootDayOfWeekIndex;
	        while(true){
	          if(targetYear > year){
	            for(let i=0; i<12; i++){
	              sumOfDay += this.getEndOfDay(year, month+i);
	            }
	            year++;
	          }
	          else if(targetYear == year){
	            if(targetMonth > month){
	              sumOfDay += this.getEndOfDay(year, month);
	              month++;
	            }
	            else if(targetMonth == month){
	              return (sumOfDay)%7;
	            }
	          }
	        }
	      },
	      onClickPrev(month){
	        month--;
	        if(month<=0){
	          this.currentMonth = 12;
	          this.currentYear -= 1;
	        }
	        else{
	          this.currentMonth -= 1;
	        }
	        this.init();
	      },
	      onClickNext(month){
	        month++;
	        if(month>12){
	          this.currentMonth = 1;
	          this.currentYear += 1;
	        }
	        else{
	          this.currentMonth += 1;
	        }
	        this.init();
	      },
	      change(day){
	    	 this.currentDay=day;
	      },
          workingHour: function () {
              let start = this.str_Mtime;
              let end = this.end_Mtime;
              let arr = [];

              for (let i = start; i < end; i++) {
                  arr.push(i); 
                  this.availableHours.push(2);
              }
              this.workingHours = arr;
              return arr;
          },
	      select_time: function (time) {
              if(this.availableHours[this.workingHours.indexOf(time)] === 0){
                  return;
              }

              let len = this.selectedTime.length;
              if (len === 0) {
                  this.selectedTime.push(time);
                  this.availableHours[this.workingHours.indexOf(time)] = 1;
              } else if (len === 1) {
                  let old = this.selectedTime[0];
                  if (this.selectedTime[0] > time) {
                      this.selectedTime.unshift(time);
                  } else {
                      this.selectedTime.push(time);
                  }
                  let start = this.workingHours.indexOf(this.selectedTime[0]);
                  let end = this.workingHours.indexOf(this.selectedTime[1]);

                  for(let i = start ; i <= end ;i++){
                      if(this.availableHours[i] === 0){
                          this.availableHours[this.workingHours.indexOf(old)] = 2;
                          this.selectedTime = [time];
                          this.availableHours[this.workingHours.indexOf(time)] = 1;
                          return;
                      }
                  }

                  for(let i = start ; i <= end ;i++){
                      this.availableHours[i] = 1;
                  }
             	 } else if (len === 2) {
                  this.selectedTime = [];
                  this.selectedTime.push(time);

                  for(let i=0;i<this.availableHours.length;i++){
                      if(this.availableHours[i] === 1){
                          this.availableHours[i] = 2;
                      }
                  }
                  this.availableHours[this.workingHours.indexOf(this.selectedTime[0])] = 1;
              }
              if(this.selectedTime.length === 2)
              {
              	this.updateTotalAmount();
	            } 
          },
          updateTotalAmount: function () {
              if (this.selectedTime.length === 2) {
                  const hoursCount = this.selectedTime[1] - this.selectedTime[0] + 1;
                  this.totalAmount = this.pay * hoursCount
              } else {
                  this.totalAmount = 0;
              }
          },
          reserveNow() {
			    /* let Times=this.selectedTime; */
		        let ck = document.getElementById('checkset-a-1-1');
		        if(this.selectedTime.length==0){
		        	alert('예약시간을 선택해주세요.');
		        }
		        else if (!ck.checked) {
		            alert('개인정보 수집항목 및 이용 동의를 확인해주세요.');
		        }else{
		        	this.requestPay();
		        }
		   },
		   requestPay() {
	            let vm = this;
	            IMP.request_pay({
	                pg: 'html5_inicis',
	                pay_method: 'card',
	                merchant_uid: 'merchant_' + new Date().getTime(),
	                name: 'CODEV 멘토링',
	                amount: this.totalAmount,
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
				 axios.post('../mentoring/reservation_vue.do',null,{
					 params:{
						 mno:this.mno,
						 rDate:this.currentYear+"년 "+this.currentMonth+"월 "+this.currentDay+"일",
						 totalAmount: this.totalAmount,
						 inquiry: this.inquiry,
						 str_time:this.selectedTime[0],
						 end_time:this.selectedTime[1]
					 }
				 }).then(response=>{
					 if(response.data==='yes')
				     {
						 location.href="../main/main.do" 
				     }
					 else
				     {
						 alert("예약에 실패했습니다. 다시 시도해주세요.")
				     }
				 })  
			   },formatPrice(price) {
		            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		  
	}
}).mount("#reserveApp")
</script>
</html>