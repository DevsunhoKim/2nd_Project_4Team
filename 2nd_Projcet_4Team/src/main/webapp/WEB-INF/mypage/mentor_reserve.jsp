<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../studyRoom/css/setting.css">
  <link rel="stylesheet" href="../studyRoom/css/plugin.css">
  <link rel="stylesheet" href="../studyRoom/css/style.css">
  <link rel="stylesheet" href="../adminpage/studyRoom/style.css">
  
<style type="text/css">

.mypageMentorRev#admin_ask #popup {
  height: auto;
}
.mypageMentorRev #ask_detail .hooms-N37 .contents-btn{
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 auto;
}
.mypageMentorRev .hooms-N37 .contents-tit span::after {
     background: url() no-repeat center/cover;
}

.mypageMentorRev .hooms-N37 .contents-date i {
    font-style: normal;
    margin-right: 0.8rem;
    font-weight: 550;
}

.tableset-mobile,
.tableset-tit {
    white-space: nowrap; 
    overflow: hidden; 
    max-width: 150px; 
}
</style>
</head>
<body style="width: 100%">
  <div class="hooms-N36 mypageMentorRev" data-bid="rxlskcGXa1" id="admin_ask">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-search">
            <div class="askANDsearch">
	          <p class="contents-result"> 전체 <span> {{totalCount}}</span>개 </p>
            </div>
            <div class="contents-btn askBtn">
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
                  <th scope="col">멘토명</th>
                  <th scope="col">멘토링명</th>
                  <th scope="col">예약일</th>
                  <th scope="col">결제금액</th>
                  <th scope="col" style="white-space: nowrap; ">승인상태</th>
                  <th scope="col">예약정보</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(vo, index) in mr_list" :key="vo.no">
                  <td class="tableset-mobile">{{vo.num}}</td>
                   <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                    {{vo.mvo.nickname}}
					</a>
                  </td>
                  <td class="tableset-order05">{{vo.mtvo.title}}시</td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
						  {{ vo.rdate }}
				    </a>
                  </td>
                 <td class="tableset-tit tableset-order02">{{ formatPrice(vo.totalAmount) }}원</td>
                <td class="tableset-tit tableset-order02">
                    <i v-if="vo.ok == 0">미승인</i>
              		<i v-if="vo.ok == 1">승인</i>
                  </td>
                  <td class="tableset-tit tableset-order02">
                    <a class="tableset-ico" href="javascript:void(0)">
                    <button class="badgeset state" @click="info(index)">상세보기</button>
					</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <nav class="pagiset pagiset-line">
            <div class="pagiset-ctrl">
              <a v-if="startpage>1" class="pagiset-link pagiset-prev" @click="prev()">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list">
              <a v-for="i in range(startpage,endpage)" :class="i==curpage?'pagiset-link active-fill':'pagiset-link'" @click="pageChange(i)">{{i}}</a>
            </div>
            <div class="pagiset-ctrl">
              <a v-if="endpage<totalpage" class="pagiset-link pagiset-next" @click="next()">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
          </nav>
        </div>
      </div>
      
 
   <div class="th-layout-main pop black-bg mr" id="ask_detail" v-show="pop">
    <div class="hooms-N37" data-bid="NiLT00VHDB" id="popup">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">예약 상세</h2>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>멘토</span>
            </h5>
            <span class="contents-date">
              <i>{{nickname}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>멘토링명</span>
            </h5>
            <span class="contents-date">
              <i>{{title}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>직무</span>
            </h5>
            <span class="contents-date">
              <i>{{job}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>예약시간</span>
            </h5>
            <span class="contents-date">
              <i>{{str_time}}시 ~ {{end_time}}시</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>결제일</span>
            </h5>
            <span class="contents-date">
              <i>{{rdate}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>결제정보</span>
            </h5>
            <span class="contents-date">
              <i>신용카드</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>결제금액</span>
            </h5>
            <span class="contents-date">
              <i>{{totalAmount}}원</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>승인상태</span>
            </h5>
            <span class="contents-date">
              <i v-if="ok == 0">미승인</i></span>
              <i v-if="ok == 1">승인</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>문의사항</span>
            </h5>
            <span class="contents-date">
              <i v-if="inquiry == null">없음</i></span>
              <i v-if="inquiry !== null">{{inquiry}}</i></span>
          </div>
          <div class="contents-btn">
            <a class="btnset" @click="close()">닫기</a>
          </div>
        </div>
      </div>
    </div>
  </div>   
    </div>
<script>
let mypageMentorRev = Vue.createApp({
    data() {
        return {
            curpage: 1,
            totalpage: 0,
            endpage: 0,
            startpage: 0,
            totalCount: 0,
            pop: false,
            mr_list: [],
            mr_detail: {},
            nickname: '',
            title: '',
            job: '',
            str_time: 0,
            end_time: 0,
            rDate: '',
            totalAmount: 0,
            rdate:'',
            ok:0,
            inquiry: ''
        }
    },
    mounted() {
        this.dataRecv();
    },
    methods: {
        dataRecv() {
            axios.get('../mypage/mentor_MyReserve_vue.do', {
                params: {
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data)
                this.mr_list = response.data.list
                this.curpage = response.data.curpage
                this.totalpage = response.data.totalpage
                this.startpage = response.data.startpage
                this.endpage = response.data.endpage
                this.totalCount = response.data.totalCount
            })
        },
        range(start, end) {
            let arr = []
            let lang = end - start
            for (let i = 0; i <= lang; i++) {
                arr[i] = start
                start++
            }
            return arr
            console.log(i)
        },
        prev() {
            this.curpage = this.startpage - 1
            this.dataRecv()
        },
        next() {
            this.curpage = this.endpage + 1
            this.dataRecv()
        },
        pageChange(page) {
            this.curpage = page;
            this.dataRecv()
        },
        close() {
            this.pop = false
        },
        formatPrice(price) {
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        info(i) {
            this.pop = true;
            this.mr_detail = this.mr_list[i]
            this.nickname = this.mr_detail.mvo.nickname
            this.title = this.mr_detail.mtvo.title
            this.job = this.mr_detail.mtvo.job
            this.str_time = this.mr_detail.str_time
            this.end_time = this.mr_detail.end_time
            this.rdate = this.mr_detail.rdate
            this.totalAmount = this.mr_detail.totalAmount
            this.inquiry = this.mr_detail.inquiry
        }
    }
}).mount('.mypageMentorRev')
</script>

</body>
</html>