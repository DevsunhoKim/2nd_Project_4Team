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
  <link rel="stylesheet" href="../mypage/studyRoom/style.css">
  <script src="http://code.jquery.com/jquery.js"></script>
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="../studyRoom/js/setting.js"></script>
  <script src="../studyRoom/js/template.js"></script>
  <script src="../studyRoom/js/common.js"></script>
  <script src="../studyRoom/js/script.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body style="width: 100%">
  <div class="hooms-N36 myRoom" data-bid="rxlskcGXa1" id="admin_ask">
      <div class="contents-inner">
        <div class="contents-container container-md reserve">
          <div class="contents-search">
            <!--<div class="askANDsearch">
	           <p class="contents-result"> 전체 <span> {{}}</span>개 </p> 
            </div>-->

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
                  <th scope="col">예약번호</th>
                  <!-- <th scope="col"></th> -->
                  <th scope="col">룸명</th>
                  <th scope="col">방문일</th>
                  <th scope="col">예약시간</th>
                  <th scope="col">가격</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="res in res_list">
                  <td class="tableset-mobile">{{res.no}}</td>
<!--                   <td class="tableset-category tableset-order03"><img :src="res.svo.poster" style="width: 5rem;height: 5rem"></td>
 -->                  <td class="tableset-order05">
                   
                    <a class="tableset-ico" :href="'../studyRoom/room_detail.do?no='+res.sno+'&infoShow=true'">
						  {{res.svo.name}}
				    </a>
                    
                   
                  </td>
                  <td class="tableset-order05">{{res.rdate}}</td>
                  <td class="tableset-order04">{{res.time}}</td>
                  <td class="tableset-order01">
                    <!-- <button class="badgeset state" @click="askReturn(ask.ano)"></button> -->
                    {{ formatPrice(res.price) }}원
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
    </div>
    <script>
    let myRoomApp=Vue.createApp({
    	data(){
    		return {
    			curpage:1,
    	        totalpage:0,
    	        endpage:0,
    	        startpage:0,
    	        res_list:[],
    	        totalCount:0,
    	        userId:'${sessionScope.userId}'
    		}
    	},
    	mounted(){
    		this.dataRecv();
    	},
    	methods:{
    		dataRecv(){
    			axios.get('../mypage/myRoom_vue.do',{
    				params:{
    					page:this.curpage,
    					userId:this.userId
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.res_list=response.data.list
          		    this.curpage=response.data.curpage
          		    this.totalpage=response.data.totalpage
          		    this.startpage=response.data.startpage
          		    this.endpage=response.data.endpage
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
		  formatPrice(price) {
	            // 가격을 적절한 형식으로 변환하여 반환
	            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	      }
    	}
    	
    }).mount('.myRoom')
    </script>
</body>
</html>