<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../books/css/commons.css"> -->
  <link rel="stylesheet" href="../books/css/setting.css">
  <link rel="stylesheet" href="../books/css/plugin.css">
 <!--  <link rel="stylesheet" href="../books/css/template.css"> -->
  <link rel="stylesheet" href="../books/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <style>
  .hooms-N31 .contents-inner {
  padding: 10rem 2.4rem;
}

.hooms-N31 .textset {
  margin-top: 0;
  margin-bottom: 4rem;
}

.hooms-N31 .tabset.tabset-brick {
  margin-bottom: 4rem;
}

.hooms-N31 .contents-search {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.hooms-N31 .inputset {
  width: 40.3rem;
}

.hooms-N31 .contents-result {
  font-size: 1.8rem;
  font-weight: 500;
}

.hooms-N31 .contents-result span {
  color: var(--secondary);
}

.hooms-N31 .contents-cardlist {
  display: none;
}

.hooms-N31 .contents-cardlist.contents-cardlist-active {
  display: flex;
  flex-wrap: wrap;
}

.hooms-N31 .cardset {
  width: calc(100% / 4);
  height: 100%;
  padding: 2rem;
}

.hooms-N31 .cardset:nth-child(4n) {
  padding-right: 0;
}

.hooms-N31 .cardset:nth-child(4n + 1) {
  padding-left: 0;
}

.hooms-N31 .cardset .cardset-figure {
  width: 100%;
  height: 25rem;
}

.hooms-N31 .cardset .cardset-body {
  margin-top: 1.4rem;
}

.hooms-N31 .cardset-tit-group {
  display: flex;
  align-items: center;
}

.hooms-N31 .cardset-tit {
  width: 100%;
  flex-shrink: 0;
  font-size: var(--fs-p1);
  line-height: var(--lh-p1);
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
  font-weight: 500;
}

.hooms-N31 .cardset-desc {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  line-height: var(--lh-p2);
  text-overflow: ellipsis;
  overflow: hidden;
  font-size: var(--fs-p2);
}

.hooms-N31 .cardset-badge {
  display: inline-block;
  flex-shrink: 0;
  width: 7.8rem;
  height: 3.2rem;
  line-height: 3.2rem;
  margin-right: 0.8rem;
  color: var(--text-color5);
  font-size: var(--fs-p2);
  text-align: center;
}

.hooms-N31 .cardset-badge.badge-color1 {
  background-color: var(--secondary);
}

.hooms-N31 .cardset-badge.badge-color2 {
  background-color: #666666;
}

.hooms-N31 .cardset-desc {
  margin-top: 0.8rem;
}

.hooms-N31 .pagiset {
  margin-top: 6rem;
}

@media (max-width: 992px) {
  .hooms-N31 .contents-inner {
    padding: 6rem 2.4rem;
  }

  .hooms-N31 .textset {
    margin-bottom: 2.4rem;
  }

  .hooms-N31 .tabset.tabset-brick {
    margin-bottom: 2.4rem;
  }

  .hooms-N31 .cardset {
    width: 100%;
    padding: 0;
  }

  .hooms-N31 .cardset+.cardset {
    padding-top: 2.4rem;
  }

  .hooms-N31 .contents-cardlist.contents-cardlist-active {
    flex-direction: column;
  }

  .hooms-N31 .cardset .cardset-body {
    width: 100%;
    padding: 0;
  }

  .hooms-N31 .contents-search {
    flex-direction: column;
    align-items: flex-start;
    margin-bottom: 2.4rem;
  }

  .hooms-N31 .contents-result {
    margin-bottom: 0.8rem;
    font-size: 1.4rem;
  }

  .hooms-N31 .inputset {
    width: 100%;
  }

  .hooms-N31 .cardset-tit {
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }

  .hooms-N31 .cardset-badge {
    width: 5.6em;
    height: 2.5rem;
    line-height: 2.5rem;
  }

  .hooms-N31 .cardset .cardset-figure {
    width: 100%;
  }

  .hooms-N31 .cardset-desc {
    display: block;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }

  .hooms-N31 .pagiset-link {
    width: 3.2rem;
    height: 3.2rem;
  }
}

@media (max-width: 768px) {
  .hooms-N31 .cardset .cardset-figure {
    height: 12rem;
  }
}
  </style>
</head>
<body id="books">
 <main class="th-layout-main ">
    <!-- [S]hooms-N31 -->
    <div class="hooms-N31" data-bid="fbLSK3yjoF" id="">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset textset-h2">
            <h2 class="textset-tit">PRESS CENTER</h2>
          </div>
          <div class="tabset tabset-brick">
            <ul class="tabset-list tabset-sm tabset-fill">
              <li class="tabset-item">
                <a class="tabset-link" href="javascript:void(0)">
                  <span>보도자료</span>
                </a>
              </li>
              <li class="tabset-item">
                <a class="tabset-link" href="javascript:void(0)">
                  <span>인스타그램</span>
                </a>
              </li>
              <li class="tabset-item">
                <a class="tabset-link" href="javascript:void(0)">
                  <span>홍보영상</span>
                </a>
              </li>
            </ul>
          </div>
          <div class="contents-search">
            <p class="contents-result">
              전체<span> 24</span>개
            </p>
            <div class="inputset">
              <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
              <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
            </div>
          </div>
          <div class="contents-group">
            <div class="contents-cardlist contents-cardlist-active">
              <a href="javascript:void(0)" class="cardset" v-for="vo in books_list">
                <figure class="cardset-figure">
                  <img class="cardset-img" :src="vo.poster" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_2.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_3.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_4.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_1.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_2.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_3.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
              <a href="javascript:void(0)" class="cardset">
                <figure class="cardset-figure">
                  <img class="cardset-img" src="/api/t-a/56/1707811200/resources/images/img_press_01_4.png" alt="이미지">
                </figure>
                <div class="cardset-body">
                  <div class="cardset-tit-group">
                    <h5 class="cardset-tit">
                      템플릿하우스, 웹페이지를 더 쉽고 빠르게!
                    </h5>
                  </div>
                  <p class="cardset-desc">
                    템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
                  </p>
                </div>
              </a>
            </div>
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
    </div>
    <!-- [E]hooms-N31 -->
  </main>
  <script src="../resources/js/setting.js"></script>
  <script src="../resources/js/plugin.js"></script>
  <script src="../resources/js/template.js"></script>
  <script src="../resources/js/common.js"></script>
  <script src="../resources/js/script.js"></script>
   <script>
    let booksApp=Vue.createApp({
    	data(){
    		return {
    			books_list:[],
    			curpage:1,
    			totalpage:0
    		}
    	},
    	mounted(){
    		// 시작과 동시에 처리 
    		this.dataRecv()
    	},
    	updated(){
    		
    	},
    	methods:{
    		// mounted , prev , next
    		dataRecv(){
    			axios.get('../books/list_vue.do',{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.books_list=response.data
    				/*
    				    response={
    					    config: ,
    					    data: ,
    					    header: 
    					    	...
    				    }
    				*/
    			})
    			
    			axios.get("../books/page_vue.do",{
    				params:{
    					page:this.curpage
    				}
    			}).then(response=>{
    				// response={data:{curpage:1,totalpage:10}} => Map
    				this.curpage=response.data.curpage
    				this.totalpage=response.data.totalpage
    			})
    		},
    		prev(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage
    			this.dataRecv()
    		},
    		next(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage
    			this.dataRecv()
    		}
    	}
    }).mount("#books")
  </script>
  </body>
</html>