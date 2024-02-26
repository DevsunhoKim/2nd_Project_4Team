<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="../mentoring/css_reserve/setting.css">
<link rel="stylesheet" href="../mentoring/css_reserve/plugin.css">
<link rel="stylesheet" href="../mentoring/css_reserve/template.css"> 
<link rel="stylesheet" href="../mentoring/css_reserve/style.css">
<link rel="stylesheet" href="../css/template.css">
<style type="text/css">
.campland-N12 {
    padding: 100px 20px 70px; 
}
</style>
</head>
<body>
<div class="campland-N12" data-bid="RGLt3362pz" id="noticeList">
<div class="contents-inner">
  <div class="contents-container container-md">
    <div class="textset textset-sub">
      <h2 class="textset-tit">공지사항</h2>
    </div>
    <div class="tableset tableset-fract" >
      <table class="tableset-table table">
        <colgroup>
          <col>
          <col>
          <col>
        </colgroup>
        <thead class="thead-light thead-border-top primary">
          <tr>
            <th scope="col">No.</th>
            <th scope="col">제목</th>
            <th scope="col">등록일</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="vo in notice_list">
            <td class="tableset-mobile">{{vo.no}}</td>
            <td class="text-left tableset tableset-tit-ellipsis tableset-tit">
              <a href="javascript:void(0)">
                <span>{{vo.title}}</span>
              </a>
            </td>
            <td>{{vo.dbDay}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    
        <nav class="pagiset pagiset-line" style="margin-bottom: 3rem">
          <div class="pagiset-ctrl">
            <a class="pagiset-link pagiset-first" @click="pageChange(1)">
              <span class="visually-hidden">처음</span>
            </a>
          </div>
          <div class="pagiset-ctrl">
            <a class="pagiset-link pagiset-prev" v-if="curpage > 1" @click="pageChange(curpage - 1)">
              <span class="visually-hidden">이전</span>
            </a>
          </div>
          <div class="pagiset-list">
            <a class="pagiset-link" :class="{'active-fill': curpage === i}" v-for="i in range(startPage, endPage)" :key="i" @click="pageChange(i)">
              {{ i }}
            </a>
          </div>
          <div class="pagiset-ctrl">
            <a class="pagiset-link pagiset-next" v-if="curpage < totalpage" @click="pageChange(curpage + 1)">
              <span class="visually-hidden">다음</span>
            </a>
          </div>
          <div class="pagiset-ctrl">
            <a class="pagiset-link pagiset-last" @click="pageChange(totalpage)">
              <span class="visually-hidden">마지막</span>
            </a>
          </div>
        </nav>
        
  </div>
</div>
</div>
<script>
let noticeListApp = Vue.createApp({
    data() {
        return {
            notice_list: [],
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            page_list: {}
        };
    },
    mounted() {
        this.getNoticeList();
    },
    methods: {
        getNoticeList() {
            axios.get('../notice/list_vue.do', {
                params: {
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data);
                this.notice_list = response.data;
            })

            axios.get('../notice/page_vue.do', {
                params: {
                    page: this.curpage
                }
            }).then(response => {
                console.log(response.data);
                this.page_list = response.data;
                this.curpage = response.data.curpage;
                this.totalpage = response.data.totalpage;
                this.startPage = response.data.startPage;
                this.endPage = response.data.endPage;
            }).catch(error => {
                console.log(error.response)
            })
        },
        pageChange(page) {
            if (page === this.curpage) {
                return;
            }
            this.curpage = page;
            this.getNoticeList();
        },
        range(start, end) {
            let arr = [];
            for (let i = start; i <= end; i++) {
                arr.push(i);
            }
            return arr;
        }
    }
}).mount("#noticeList");
</script>
</body>
</html>
