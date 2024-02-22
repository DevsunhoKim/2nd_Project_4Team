<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="../member/css/setting.css">
  <link rel="stylesheet" href="../member/css/plugin.css">
  <link rel="stylesheet" href="../member/css/template.css"> 
  <link rel="stylesheet" href="../member/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <script src="https://unpkg.com/vue@3"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.inputset {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px; /* Adjust as needed */
}

.inputset-input {
    flex: 1;
    margin-right: 10px; /* Adjust as needed */
}
</style>
</head>
<body>
<div class="glamping-N44" data-bid="oFlSD6Ca9n" th-id="lsd6ca9m" th-index="0" th-relative="true" id="findIdApp">
  <div class="contents-inner" draggable="true" th-dragitem="true">
    <div class="contents-container" draggable="false">
      <div class="textset" draggable="false">
        <h2 class="textset-tit" draggable="false">아이디 찾기</h2>
        <p class="textset-desc" draggable="false">회원님의 아이디는 ${userId } 입니다.</p>
      </div>
    </div>
    <a href="../member/login.do" class="btnset btnset-round" draggable="false">로그인</a>
  </div>
</div>
</body>
</html>