<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../studyRoom/css/setting.css">
  <link rel="stylesheet" href="../studyRoom/css/plugin.css">
<!--   <link rel="stylesheet" href="../studyRoom/css/template.css"> -->
  <link rel="stylesheet" href="../studyRoom/css/style.css">
  <!-- <link rel="stylesheet" href="../css/template.css"> -->
  
  <link rel="stylesheet" href="../adminpage/studyRoom/style.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../studyRoom/js/setting.js"></script>
  <script src="../studyRoom/js/template.js"></script>
  <script src="../studyRoom/js/common.js"></script>
  <script src="../studyRoom/js/script.js"></script>
  
</head>
<body style="width: 100%">
  <div class="hooms-N36 Admin_room_reserve" data-bid="rxlskcGXa1" id="admin_ask">
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
                  <th scope="col">룸명</th>
                  <th scope="col">방문일</th>
                  <th scope="col">이용시간</th>
                  <th scope="col">결제금액</th>
                  <th scope="col">회원정보</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="re in res_list">
                  <td class="tableset-mobile">{{re.no}}</td>
                  <td class="tableset-category tableset-order03" v-if="re.sno===1">포커스룸</td>
                  <td class="tableset-category tableset-order03" v-if="re.sno===2">베이룸</td>
                  <td class="tableset-category tableset-order03" v-if="re.sno===3">포트룸</td>
                  <td class="tableset-category tableset-order03" v-if="re.sno===4">포레스트룸</td>
                  <td class="tableset-tit tableset-order02">
                   
                    <a class="tableset-ico" href="javascript:void(0)">
						  {{ re.rdate }}
				    </a>
                    
                   
                  </td>
                  <td class="tableset-order05">{{re.amount}}시간</td>
                  <td class="tableset-order04">{{ formatPrice(re.price) }}원</td>
                  <td class="tableset-order01">
                    <button class="badgeset state" @click="info(re.no,re.userId)">상세보기</button>
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
              <!-- <a class="pagiset-link" href="javascript:void(0)">2</a>
              <a class="pagiset-link" href="javascript:void(0)">3</a> -->
            </div>
            <div class="pagiset-ctrl">
              <a v-if="endpage<totalpage" class="pagiset-link pagiset-next" @click="next()">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div> -->
          </nav>
        </div>
      </div>
      
 
   <div class="th-layout-main pop black-bg" id="ask_detail" v-show="pop">
    <!-- [E]hooms-N58 -->
    <!-- [S]hooms-N37 -->
    <div class="hooms-N37" data-bid="NiLT00VHDB" id="popup">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">예약 상세</h2>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>예약자명</span>
            </h5>
            <span class="contents-date">
              <i>{{member.userName}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>전화번호</span>
            </h5>
            <span class="contents-date">
              <i>{{member.phone}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>이메일</span>
            </h5>
            <span class="contents-date">
              <i>{{member.email}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>예약시간</span>
            </h5>
            <span class="contents-date">
              <i>{{res_detail.time}}</i></span>
          </div>
          <div class="contents-titgroup">
            <h5 class="contents-tit">
                                 
              <span>결제일</span>
            </h5>
            <span class="contents-date">
              <i>{{res_detail.dbday}}</i></span>
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
              <i>{{price}}원</i></span>
          </div>
          <!-- <div class="contents-group">
            <div class="contents-group-top">        
              <div class="contents-file">
                <span class="contents-file-txt">첨부파일</span>
                <a class="contents-file-link" href="#">{{}}</a>
              </div>
              <p class="contents-ask">{{}}</p>
            </div>
            <div class="contents-group-bottom">
              <textarea cols="110" rows="7" id="returnText"></textarea>
            </div>
          </div> -->
          <div class="contents-btn">
            <!-- <a class="btnset" @click="returnOk()">답변하기</a> -->
            <a class="btnset" @click="close()">닫기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
    <script>
    let AskApp=Vue.createApp({
    	data(){
    		return {
    			curpage:1,
    	        totalpage:0,
    	        endpage:0,
    	        startpage:0,
    	        totalCount:0,
    	        pop:false,
    	        res_list:{},
    	        member:{},
    	        res_detail:{},
    	        price:''
    		}
    	},
    	mounted(){
    		this.dataRecv();
    	},
    	methods:{
    		dataRecv(){
    			axios.get('../adminpage/admin_room_vue.do',{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.res_list=response.data.list
          		    this.curpage=response.data.curpage
          		    this.totalpage=response.data.totalpage
          		    this.startpage=response.data.startpage
          		    this.endpage=response.data.endpage
          		    this.totalCount=response.data.totalCount
    			})
    		},
    		range(start,end){
			  let arr=[]
			  let lang=end-start
			  for(let i=0;i<=lang;i++)
			  {
				  arr[i]=start
				  start++
			  }
			  return arr
			  console.log(i)
		  },
		  prev(){
			  this.curpage=this.startpage-1
			  this.dataRecv()
		  },
		  next(){
			  this.curpage=this.endpage+1
			  this.dataRecv()
		  },
		  pageChange(page){
			  this.curpage=page;
			  this.dataRecv()
		  },
		  close(){
			  this.pop=false
		  },
		  info(no, id) {
			    this.pop = true;
			    axios.get('../adminpage/admin_room_info.do', {
			        params: {
			            no: no,
			            userId: id
			        }
			    }).then(response => {
			        console.log(response.data);
			        this.member=response.data.mvo
			        this.res_detail=res_detail=response.data.rvo
			        this.price=this.formatPrice(response.data.rvo.price)
			        
			    });
			},
			formatPrice(price) {
	            // 가격을 적절한 형식으로 변환하여 반환
	            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        }

    	}
    	
    }).mount('.Admin_room_reserve')
    </script>
</body>
</html>