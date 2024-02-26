<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.panel-success{
    border-color: #6713d2;
}
.panel-success>.panel-heading {
    color: white;
    background-color: #6713d2;
    border-color: #6713d2;
</style>
</head>
<body>
  <div class="panel panel-success">
    <div class="panel-heading">
      <h3 class="panel-title">
      <span>상품 메뉴</span>
      </h3>
    </div>
    <ul class="list-group">
      <li class="list-group-item"><a href="../adminpage/admin.do">회원관리</a></li>
      <li class="list-group-item"><a href="../adminpage/room_reserve.do">스터디룸 예약</a></li>
      <li class="list-group-item"><a href="../adminpage/room_ask.do">스터디룸 문의</a></li>
      <li class="list-group-item"><a href="#">리뷰 목록</a></li>
      <li class="list-group-item"><a href="#">도서 결제목록</a></li>
    </ul>
  </div>
</body>
</html>