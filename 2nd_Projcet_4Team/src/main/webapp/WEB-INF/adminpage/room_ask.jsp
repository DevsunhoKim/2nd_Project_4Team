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
  <div class="hooms-N36" data-bid="rxlskcGXa1" id="admin_ask">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <!-- <div class="textset textset-h2">
            <h2 class="textset-tit">1:1 문의</h2>
          </div> -->
         
          <div class="contents-search">
            
            <div class="askANDsearch">
             
             
             
             
            
              <p class="contents-result"> 전체 <span> {{totalCount}}</span>개 </p>
              
              
              <!-- <div class="inputset inputset-lg">
                <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
                <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
              </div> -->
             
             
             
             
            </div>
            <div class="contents-btn askBtn">
            <%-- <c:if test="${sessionScope.userId!=null }">
               <a class="btnset modalset-btn" :href="'../studyRoom/ask.do?no='+detail_list.no">문의하기</a>
            </c:if> --%>
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
                </tr>
              </thead>
              <tbody>
                <tr v-for="ask in ask_list">
                  <td class="tableset-mobile">{{ask.ano}}</td>
                  <td class="tableset-category tableset-order03">{{ask.cate}}</td>
                  <td class="tableset-tit tableset-order02">
                   
                    <a class="tableset-ico" :href="ask.userId !== userId ? 'javascript:void(0)' : '../studyRoom/ask_detail.do?ano=' + ask.ano">
						  {{ ask.subject }}
				    </a>
                    
                   
                  </td>
                  <td class="tableset-order05">{{ask.dbday}}</td>
                  <td class="tableset-order04">{{ask.name}}</td>
                  <td class="tableset-order01" v-if="ask.state===0">
                    <div class="badgeset state">답변대기</div>
                  </td>
                  <td class="tableset-order01" v-if="ask.state===1">
                    <div class="badgeset badgeset-active state state1">답변완료</div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <nav class="pagiset pagiset-line">
            <!-- <a class="btn" @click="prev()">이전</a>
              {{curpage }} page / {{totalpage }} pages
             <a class="btn" @click="next()">다음</a> -->
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div> -->
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
    let AskApp=Vue.createApp({
    	data(){
    		return {
    			curpage:1,
    	        totalpage:0,
    	        endpage:0,
    	        startpage:0,
    	        ask_list:[],
    	        totalCount:0
    		}
    	},
    	mounted(){
    		this.dataRecv();
    	},
    	methods:{
    		dataRecv(){
    			axios.get('../adminpage/admin_ask_vue.do',{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.ask_list=response.data.list
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
		  }
    	}
    	
    }).mount('#admin_ask')
    </script>
</body>
</html>