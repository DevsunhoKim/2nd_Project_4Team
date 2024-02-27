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
.campland-N13 {
    padding: 100px 20px 70px; 
}
.campland-N13 {
  overflow: hidden;
}

.campland-N13 .textset-tit+.textset-desc span {
  display: inline-block;
  margin-left: 0.8rem;
}

.campland-N13 .contents-body {
  padding: 4rem 0;
  border-top: 1px solid var(--primary);
  border-bottom: 1px solid var(--border-color);
}

.campland-N13 .contents-text {
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
  color: var(--text-color3);
}

.campland-N13 .contents-link {
  margin-top: 4rem;
  text-align: right;
}

@media (max-width: 992px) {
  .campland-N13 .contents-inner {
    padding: 3rem 1.6rem;
  }

  .campland-N13 .contents-body {
    padding: 2.8rem 0;
  }

  .campland-N13 .contents-link {
    margin-top: 4rem;
  }
}

.form-wrap {
    display: block;
    width: 100%;
    max-width: 1280px;
    text-align: right;
    margin: 0 auto;
}
.inputset-round{
border: 1px solid;
    padding: 1rem 2rem;
    border-radius: 1rem;
}
.comment_inbox_name{
text-align: left !important;
    display: flex;
    justify-content: flex-start;
}
.inputset .inputset-textarea {
    position: relative;
    width: 100%;
    height: 24rem;
    padding: 1.6rem;
    font-size: var(--fs-p3);
    border-radius: 0.6rem;
    border: 1px solid var(--border-color);
    border: none;
}
</style>
</head>
<body>
<div class="campland-N13" data-bid="vnLT3364X9">
<div class="contents-inner">
  <div class="contents-container container-md">
    <div class="textset textset-sub">
      <h2 class="textset-tit">${vo.title }</h2>

      <p class="textset-desc">관리자 <span>${vo.dbDay}</span>
      <!-- </p><button class="btnset btnset-round" type="button" th-hoverbox="true">VIEW ALL STORY</button> -->


    </div>
    <div class="contents-body">
      <p class="contents-text">
        ${vo.cont}
    </div>
    <div class="contents-link">
      <a href="../notice/list.do" class="btnset btnset-round btnset-line btnset-black">목록으로</a>
    </div>
  </div>
</div>

<div class="form-wrap">
    <h6 class="form-tit form-tit-deco tit-start">
      <span></span>댓글
    </h6>
    <div class="inputset inputset-round">
    <em class="comment_inbox_name">김연수</em>
      <textarea class="inputset-textarea form-control" placeholder="댓글을 입력하세요" rows="3"></textarea>
    </div>
      <button class="btnset btnset-round" type="button">등록</button>
</div> 

<!-- <div class="CommentBox">
    <div class="comment_option">
        <h3 class="comment_title">댓글</h3>
    </div>
    <div data-v-afadf0bc="" class="CommentWriter">
        <div data-v-afadf0bc="" class="comment_inbox">
            <strong data-v-afadf0bc="" class="blind">댓글을 입력하세요</strong>
            <em data-v-afadf0bc="" class="comment_inbox_name">김연수</em>
            <textarea data-v-afadf0bc="" placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text" style="overflow: hidden; overflow-wrap: break-word; height: 18px;"></textarea>
        </div>
    </div>
</div> -->

</div>
</body>
</html>