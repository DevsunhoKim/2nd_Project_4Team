<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="../mentoring/css/setting.css">
  <link rel="stylesheet" href="../mentoring/css/plugin.css">
  <link rel="stylesheet" href="../mentoring/css/template.css"> 
  <link rel="stylesheet" href="../mentoring/css/style.css">
  <link rel="stylesheet" href="../css/template.css">
  <style type="text/css">
  .basic-N22 .contents-inner {
  padding: 8rem 1.6rem;
}

.basic-N22 .contents-form {
  display: flex;
  justify-content: flex-end;
  gap: 0.8rem;
  margin-bottom: 2rem;
}

.basic-N22 .contents-form .selectset {
  width: 12.4rem;
}

.basic-N22 .contents-form .inputset {
  width: 30rem;
}

.basic-N22 .contents-group {
  display: flex;
  flex-wrap: wrap;
  width: calc(100% + 4rem);
  margin-left: -2rem;
  margin-bottom: 4rem;
}

.basic-N22 .cardset {
  width: calc(100% / 3 - 4rem);
  margin: 2rem;
}

@media (max-width: 992px) {
  .basic-N22 .contents-inner {
    padding: 5rem 1.6rem;
  }

  .basic-N22 .contents-form {
    flex-direction: column;
  }

  .basic-N22 .contents-form .selectset,
  .basic-N22 .contents-form .inputset {
    width: 100%;
  }

  .basic-N22 .contents-group {
    width: 100%;
    margin-left: 0;
  }

  .basic-N22 .cardset {
    width: 100%;
    margin: 0;
  }

  .basic-N22 .cardset+.cardset {
    margin-top: 4rem;
  }
}
 .recruit-stack li{
  display: inline-block;
  margin-right: 0.8rem;
  color: #666;
  font-size: 1.4rem;
  padding: 0.2rem 1rem;
    border-radius: 10rem;
    border: 1px solid #eee;
    font-size: 1.4rem;
    white-space: nowrap;
}

.contents-item-name{
    margin: 0.2em 0;
}

.text-with-spacing {
    letter-spacing: 2px;
}
  </style>
  
  <script src="../mentoring/js/setting.js"></script>
  <script src="../mentoring/js/template.js"></script>
  <script src="../mentoring/js/script.js"></script>
<script type="text/javascript">
function reserve() {
    let userId = "${sessionScope.userId}";
    if (userId == null || userId == '') {
        alert("로그인 후 이용해주세요.");  
        location.href = "../member/login.do";
    } else {
        location.href = "../mentoring/reservation.do?mno=${vo.mno}&str_Mtime=${vo.str_Mtime}&end_Mtime=${vo.end_Mtime}&pay=${vo.pay}";
    }
}
</script>

</head>
<body>
<div class="campland-N10" data-bid="fmLSn6qZhU">
<div class="contents-inner">
  <div class="contents-container container-md">
<!--     <div class="textset textset-sub">
      <h2 class="textset-tit">멘토 소개</h2>
    </div> -->
    <div class="contents-body">
      <div class="contents-left">
        <div class="imageset">
          <img class="imageset-img" src="../images/img_basic_mobile_N33_1.png" alt="캠핑장 이미지" data-aos="fade-right">
        </div>
        <div class="imageset">
          <img class="imageset-img" src="${pageContext.request.contextPath}/mentoring/images/${vo.img }_.png" alt="캠핑장 이미지" data-aos="fade-left">
        </div>
      </div>
      <div class="contents-right">
        <div class="contents-group" data-aos="fade-up">
          <h5 class="contents-subtit">${vo.title }</h5>
          <div class="recruit-stack" style="margin-top: 10px;">
            <ul class="recruit-stack-list">
            <c:forEach var="kwd" items="${vo.keywords}" varStatus="i">
			  <c:if test="${i.index != 0}">
			    <li>${kwd}</li>
			  </c:if>
            </c:forEach>
            </ul>
          </div>
        </div>
        <div class="contents-group" data-aos="fade-up">
          <h5 class="contents-subtit">멘토 소개</h5>
          <ul class="contents-list">
            <li class="contents-item">
              <span class="contents-item-name"><b class="text-with-spacing">- 직무</b>: ${vo.job }</span>
            </li>
            <li class="contents-item">
              <span class="contents-item-name"><b class="text-with-spacing">- 주요경력</b> : ${vo.career }</span>
            </li>
            <li class="contents-item">
              <span class="contents-item-name"><b class="text-with-spacing">- 부서</b> : ${vo.department }</span>
            </li>
            <li class="contents-item">
              <span class="contents-item-name"><b class="text-with-spacing">- 멘토링 소개</b> : ${vo.intro }</span>
            </li>
          </ul>
        </div>
        <div class="contents-group" data-aos="fade-up">
          <h5 class="contents-subtit">멘토링 가격</h5>
          <ul class="contents-list">
            <li class="contents-item">
              <span class="contents-item-name"><b class="text-with-spacing">- 1회 멘토링</b> : 1시간당</span>
              <span class="contents-item-price"><fmt:formatNumber value="${vo.pay}" pattern="#,###" />원</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="contents-button">
      <a onclick="reserve()" class="btnset btnset-round" data-aos="fade-up">RESERVATION</a>
    </div>
  </div>
</div>

<div class="basic-N22" data-bid="Hklsn990XU">
<div class="contents-inner">
  <div class="contents-container container-md">
    <div class="textset">
      <h2 class="textset-tit" data-aos="fade-up">멘토링 리뷰</h2>
    </div>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
      <a href="javascript:void(0);" class="cardset cardset-inner cardset-hover cardset-border">
        <div class="cardset-cont">
          <h2 class="cardset-tit">템하 비즈니스 홈페이지가 리뉴얼오픈
            하였습니다.</h2>
          <p class="cardset-desc">
            안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다. 안녕하세요. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 템하 글램핑 홈페이지가 리뉴얼오픈 하였습니다. 저희 홈페이지에 여러분들의 많은 관심 부탁드립니다.
          </p>
          <span class="cardset-txt">2023. 01. 01</span>
        </div>
      </a>
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
        <a class="pagiset-link" href="javascript:void(0)">4</a>
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
</div>
</body>
</html>