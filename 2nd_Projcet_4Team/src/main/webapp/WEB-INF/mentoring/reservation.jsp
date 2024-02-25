<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../mentoring/css_reserve/setting.css">
<link rel="stylesheet" href="../mentoring/css_reserve/plugin.css">
<link rel="stylesheet" href="../mentoring/css_reserve/template.css"> 
<link rel="stylesheet" href="../mentoring/css_reserve/style.css">
<link rel="stylesheet" href="../css/template.css">

<style type="text/css">
#reserveApp {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
 .rounded {
      -moz-border-radius:20px 20px 20px 20px; 
      border-radius:20px 20px 20px 20px;
      border:solid 1px #ffffff;
      background-color:#2b6bd1;
      padding:10px;
      color:#ffffff;
    }
  td.link:hover,tr.tr_link:hover{
    cursor: pointer;
  }
.campland-N21 {
  overflow: hidden;
}

.campland-N21 .contents-inner {
  padding: 8rem 1.6rem;
}

.campland-N21 .form-wrap+.form-wrap {
  margin-top: 1.6rem;
}

.campland-N21 .form-wrap .form-tit {
  min-width: 8.9rem;
}

.campland-N21 .contents-form-group {
  display: flex;
  width: 100%;
}

.campland-N21 .contents-form-group+.contents-form-group {
  margin-left: 8rem;
}

.campland-N21 .form-wrap .inputset {
  width: 100%;
}

.campland-N21 .inputset-textarea {
  height: 12rem;
}

.campland-N21 .contents-bottom {
  margin-top: 2.8rem;
}

.campland-N21 .contents-tit {
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
  font-weight: 500;
}

.campland-N21 .contents-board {
  max-height: 14rem;
  overflow-y: auto;
  margin: 0.8rem 0;
  padding: 1.6rem 1.6rem 4rem 1.6rem;
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
  color: #767676;
  border: 1px solid var(--border-color);
  border-radius: 0.8rem;
}

.campland-N21 .contents-confirm {
  margin-top: 8rem;
  text-align: center;
}

@media (max-width: 992px) {
  .campland-N21 .contents-inner {
    padding: 3rem 1.6rem;
  }

  .campland-N21 .form-wrap {
    flex-direction: column;
  }

  .campland-N21 .contents-form-group+.contents-form-group {
    margin-left: 0;
  }

  .campland-N21 .contents-form-group {
    flex-direction: column;
    gap: 0.8rem;
  }

  .campland-N21 .contents-confirm {
    margin-top: 4rem;
    text-align: center;
  }
}
</style>
</head>
<body>
<div class="wrapper row3" id="reserveApp" style="display: flex;">
  <main class="container clear" style="flex: 1;"> 
   <table class="table">
     <tr>
       <td class="text-center" width="60%">
         <table class="table">
           <caption><h3 class="text-center">예약일 정보</h3></caption>
           <tr>
             <td>
                <div class="calendar">
				      <h2>
				        <a href="#" v-on:click="onClickPrev(currentMonth)">⟪</a>
				        {{currentYear}}년 {{currentMonth}}월
				        <a href="#" v-on:click="onClickNext(currentMonth)">⟫</a>
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
        <table class="table">
          <caption><h3 class="text-center">시간 정보</h3></caption>
          <tr v-show="tShow">
            <td class="text-center">
              <span class="btn btn-xs btn-success" v-for="time in time_list" style="margin-left: 2px" @click="timeSelect(time)">¿{{time}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr>
      <td class="text-center" width=60%>
        <table class="table">
          <caption><h3 class="text-center">인원 정보</h3></caption>
          <tr v-show="iShow">
            <td class="text-center">
              <span class="btn btn-warning btn-xs" v-for="inwon in inwon_list" style="margin-left: 2px" @click="inwonSelect(inwon)">{{inwon}}</span>
            </td>
          </tr>
        </table>
      </td>
     </tr>
     <tr v-show="rShow">
       <td class="text-right" width=60%>
        <input type=button class="btn-lg btn-primary" value="예약하기" @click="reserveOk()">
       </td>
     </tr>
   </table>
  </main>
  <div class="campland-N21" data-bid="xWLSo1gi54" style="flex: 1;">
<div class="contents-inner">
  <div class="contents-container container-md">
    <div class="textset textset-sub">
      <span class="textset-txt">Step. 03</span>
      <h2 class="textset-tit">예약자 정보</h2>
    </div>
    <div class="contents-group">
      <div class="form-wrap">
        <div class="contents-form-group">
          <h6 class="form-tit form-tit-deco">
            <span></span>성함
          </h6>
          <div class="inputset inputset-round">
            <input type="text" class="inputset-input form-control" aria-label="내용" placeholder="예약자의 성함을 입력해주세요.">
          </div>
        </div>
        <div class="contents-form-group">
          <h6 class="form-tit form-tit-deco">
            <span></span>연락처
          </h6>
          <div class="inputset inputset-round">
            <input type="text" class="inputset-input form-control" aria-label="내용" placeholder="연락처를 입력해주세요.">
          </div>
        </div>
      </div>
      <div class="form-wrap">
        <div class="contents-form-group">
          <h6 class="form-tit form-tit-deco">
            <span></span>인원수
          </h6>
          <div class="inputset inputset-round">
            <input type="text" class="inputset-input form-control" aria-label="내용" placeholder="인원수를 입력해주세요. 예시) 성인 2명, 어린이 1명">
          </div>
        </div>
      </div>
      <div class="form-wrap">
        <div class="contents-form-group">
          <h6 class="form-tit form-tit-deco tit-start">
            <span></span>요청내용
          </h6>
          <div class="inputset inputset-round">
            <textarea class="inputset-textarea" required="" placeholder="캠프랜드에 요청하실 내용을 입력해주세요."></textarea>
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
      <a href="javascript:void(0);" class="btnset btnset-round btnset-line btnset-black">돌아가기</a>
      <a href="javascript:void(0);" class="btnset btnset-round">예약하기</a>
    </div>
  </div>
</div>
</div>
</div>
</body>
<script>
let rApp=Vue.createApp({
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
		      memoDatas: [],
		      realDay:new Date().getDate(),
		      type:'한식',
		      food_list:[],
		      fno:0,
		      time_list:['12:00','13:00','14:00','17:00','18:00','19:00','20:00','21:00'],
		      tShow:false,
		      time:'',
		      inwon_list:['2명','3명','4명','5명','6명','7명','8명','9명','10명','단체'],
		      iShow:false,
		      inwon:'',
		      rShow:false
		}
	},
	mounted(){
		this.init()
		this.dataSend()
	},
	methods:{
		   reserveOk(){
			 axios.post('../reserve/reserve_ok.do',null,{
				 params:{
					 fno:this.fno,
					 rDate:this.currentYear+"년도 "+this.currentMonth+"월 "+this.currentDay,
					 rTime:this.time,
					 rInwon:this.inwon
				 }
			 }).then(response=>{
				 if(response.data==='yes')
			     {
					 location.href="../mypage/mypage.do" 
			     }
				 else
			     {
					 alert("맛집 예약에 실패하셨습니다")
			     }
			 })  
		   },
		   inwonSelect(inwon){
			 this.inwon=inwon
			 this.rShow=true
		   },
		   timeSelect(time){
			 this.time=time;
			 this.iShow=true
		   },
		
		   foodNumber(fno){
			 this.fno=fno;  
		   },
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
	      isToday: function(year, month, day){
	        let date = new Date();
	        return year == date.getFullYear() && month == date.getMonth()+1 && day == day; 
	      },
	      change(day){
	    	 this.currentDay=day;
	    	 this.tShow=true
	    	 //this.isToday(this.currentYear,.this.currentMonth,this.currentDay)
	      },
	      // 맛집
	      dataSend(){
	    	axios.get('../reserve/food_list_vue.do',{
	    		params:{
	    			type:this.type
	    		}
	    	}).then(response=>{
	    		console.log(response.data)
	    		this.food_list=response.data
	    	})  
	      },
	      foodSelect(type){
	    	  this.type=type;
	    	  this.dataSend()
	      }
	      // 시간 
	      // 인원
	      // 데이터 전송(예약처리) => 화면 변경 (마이페이지로 이동)
	  }
}).mount("#reserveApp")
</script>
</html>