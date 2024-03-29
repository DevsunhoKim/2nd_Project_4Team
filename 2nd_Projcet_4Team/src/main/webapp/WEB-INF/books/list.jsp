<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
   
    <title>Insert title here</title>
    <link rel="stylesheet" href="../books/css/setting.css">
    <link rel="stylesheet" href="../books/css/plugin.css">
    <link rel="stylesheet" href="../books/css/template.css">
    <link rel="stylesheet" href="../books/css/style.css">
    <link rel="stylesheet" href="../css/template.css">
    <script src="https://unpkg.com/vue@3"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>

  <style>
  /* BEGIN: Add your custom styles here */

  .hooms-N31 .contents-inner {
    padding: 12rem 2.4rem 0 2.4rem;
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
    width: calc(25% - 1rem);
    height: 360px;
    padding: 2rem;
    margin: 0.5rem 0.5rem 12rem 0.5rem;
    box-sizing: border-box;
  }

  .hooms-N31 .cardset:nth-child(4n) {
    margin-right: 0;
  }

  .hooms-N31 .cardset:nth-child(4n+1) {
    margin-left: 0;
  }

  .hooms-N31 .cardset .cardset-figure {
    width: 100%;
    height: 36rem;
  }

  .hooms-N31 .cardset .cardset-body {
    margin-top: 30px;
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
    -webkit-line-clamp: 1;
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
    margin-top: 4rem;
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
  
  a.cardset:hover .cardset-img{
	  border: 2px solid #ddd;
	  border-radius: 1rem;
	}
  .cardset-img{
    border-radius: 1rem;
    overflow: hidden;
  }

  @media (max-width: 768px) {
    .hooms-N31 .cardset .cardset-figure {
      height: 12rem;
    }
  }
  

  /* END: Add your custom styles here */
  </style>

  <body>
    <main class="th-layout-main" id="books">
      <!-- [S]hooms-N31 -->
      <div class="hooms-N31" data-bid="tJlSL2O6p9">
        <div class="contents-inner">
          <div class="contents-container container-md">
            <div class="textset textset-h2">
              <h2 class="textset-tit">CODEV Books</h2>
            </div>
            
            <div class="contents-search">
              <p class="contents-result">
                전체<span> 1,000</span>개
              </p>
              <div class="inputset">
                <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." v-model="ss" aria-label="검색어" @keyup.enter="searchBooks">
                <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="검색" @click="searchBooks"></button>
              </div>
            </div>
            
            <div class="tabset tabset-brick">
              <ul class="tabset-list tabset-sm tabset-fill">
                <li class="tabset-item">
		            <a class="tabset-link" href="javascript:void(0)" @click="applyFilter('bestSeller')">
		              <span>많이 구매한</span>
		            </a>
		          </li>
		          <li class="tabset-item">
		            <a class="tabset-link" href="javascript:void(0)" @click="applyFilter('highRating')">
		              <span>평점이 높은</span>
		            </a>
		          </li>
		          <li class="tabset-item">
		            <a class="tabset-link" href="javascript:void(0)" @click="applyFilter('recent')">
		              <span>최근 출간 순</span>
		            </a>
		          </li>
		          </ul>
          
            </div>
            
            <div class="contents-group">
              <div class="contents-cardlist contents-cardlist-active">
                <a :href="'../books/detail.do?no='+vo.no" class="cardset" v-for="vo in books_list">
                  <figure class="cardset-figure">
                    <img class="cardset-img" :src="vo.poster" alt="이미지">
                  </figure>
                  <div class="cardset-body">
                    <div class="cardset-tit-group">
                      <h5 class="cardset-tit">
                        {{vo.title}}
                      </h5>
                    </div>
                    <p class="cardset-desc">
                      {{vo.author}}
                    </p>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
        <nav class="pagiset pagiset-line" style="margin-bottom: 4rem">
          <div class="pagiset-ctrl">
            <!-- 처음 페이지로 이동 -->
            <a class="pagiset-link pagiset-first" href="javascript:void(0)" @click="pageChange(1)">
              <span class="visually-hidden">처음</span>
            </a>
          </div>
          <div class="pagiset-ctrl">
            <!-- 이전 페이지로 이동 (현재 페이지가 1보다 클 경우에만 표시) -->
            <a class="pagiset-link pagiset-prev" href="javascript:void(0)" v-if="curpage > 1" @click="pageChange(curpage - 1)">
              <span class="visually-hidden">이전</span>
            </a>
          </div>
          <div class="pagiset-list">
            <!-- 페이지 번호 (startPage부터 endPage까지 반복하여 표시) -->
            <a class="pagiset-link" :class="{'active-fill': curpage === i}" href="javascript:void(0)" v-for="i in range(startPage, endPage)" :key="i" @click="pageChange(i)">
              {{ i }}
            </a>
          </div>
          <div class="pagiset-ctrl">
            <!-- 다음 페이지로 이동 (현재 페이지가 totalpage보다 작을 경우에만 표시) -->
            <a class="pagiset-link pagiset-next" href="javascript:void(0)" v-if="curpage < totalpages" @click="pageChange(curpage + 1)">
              <span class="visually-hidden">다음</span>
            </a>
          </div>
          <div class="pagiset-ctrl">
            <!-- 마지막 페이지로 이동 -->
            <a class="pagiset-link pagiset-last" href="javascript:void(0)" @click="pageChange(totalpages)">
              <span class="visually-hidden">마지막</span>
            </a>
          </div>
        </nav>
      </div>
      <!-- [E]hooms-N31 -->
    </main>
 <script>
  let booksApp = Vue.createApp({
    data() {
      return {
        books_list: [], // 책 목록을 저장하는 배열
        curpage: 1, // 현재 페이지 번호
        totalpages: 0, // 전체 페이지 수
        startPage: 1, // 표시되는 페이지네이션의 시작 페이지
        endPage: 10, // 표시되는 페이지네이션의 끝 페이지
        filter: null, // 현재 선택된 필터
        ss: '' // 검색 키워드
      }
    },
    mounted() {
      this.searchBooks(); // 컴포넌트 마운트 시 책 목록 초기 로딩
    },
    methods: {
      applyFilter(filter) {
        this.filter = filter; // 선택된 필터 상태 업데이트
        this.searchBooks(); // 변경된 필터로 책 목록 새로고침
      },
      searchBooks() {
        // 서버로부터 책 목록을 가져오는 axios 요청
        axios.get('../books/list_vue.do', {
          params: {
            page: this.curpage,
            filter: this.filter, // 필터 파라미터 추가
            keyword: this.ss // 검색 키워드 파라미터
          }
        }).then(response => {
          this.books_list = response.data; // 응답 데이터로 책 목록 업데이트
          // 필요하다면, 전체 책의 개수 등 추가적인 정보를 업데이트
        }).catch(error => {
          console.error("Error: ", error);
        });
        
        axios.get('../books/page_vue.do',{
			  params:{
				  page:this.curpage
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.curpage=response.data.curpage
			  this.totalpages=response.data.totalpage
			  this.startPage=response.data.startPage
			  this.endPage=response.data.endPage
		  })
      },
      pageChange(page) {
        this.curpage = page; // 페이지 변경
        this.searchBooks(); // 변경된 페이지로 책 목록 새로고침
      },
      
      // 페이지 범위를 계산하는 메소드
      range(start, end) {
        let arr = [];
        for (let i = start; i <= end; i++) {
          arr.push(i);
        }
        return arr;
      }
    }
  }).mount("#books");
</script>
 
  </body>

  </html>
