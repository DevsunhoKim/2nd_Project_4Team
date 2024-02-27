<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<!-- script -->
<script src="https://code.jquery.com/jquery.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/setting.js"></script>
<!-- <script src="../js/plugin.js"></script> -->
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style type="text/css">
#admin_main .container{
  min-height: 70rem;
  margin-top: 20rem;
  min-width: 128rem;
}
#admin_main a:focus, a:hover {
    text-decoration: none !important;
}
#admin_main .row {
  margin: 0px auto;
  width:960px;
}
#admintitle{
  font-size: 4rem;
  font-weight: 600;
}
#admin_title {
  /* border-bottom: 1px solid #a0a0a0; */
  /* padding-bottom: 3rem; */
  margin-bottom: 6rem;
}
#admin_main .col-sm-3{
  padding-left: 0px;
}
#admin_main .content{
  border-top: 1px solid var(--line-color3);
  padding-top: 3rem;
}
</style>

</head>
<body id="admin_main">
  <tiles:insertAttribute name="header"/>
  <div class="container">
    <div id="admin_title">
      <h2 id="admintitle">관리자 페이지</h2>
    </div>
    <div class="col-sm-3">
      <tiles:insertAttribute name="menu"/>
    </div>
    <div class="col-sm-9 content">
      <tiles:insertAttribute name="content"/>
    </div>
  </div>
  <tiles:insertAttribute name="footer"/>
</body>
</html>