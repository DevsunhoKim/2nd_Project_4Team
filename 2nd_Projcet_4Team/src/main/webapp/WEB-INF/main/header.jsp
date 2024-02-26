<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function chat() {
    var width = 832; // 팝업 창의 너비
    var height = 902; // 팝업 창의 높이
    var leftPosition = (window.screen.width - width) / 2;
    var topPosition = (window.screen.height - height) / 2;

    var windowFeatures = 'width=' + width + ',height=' + height + ',left=' + leftPosition + ',top=' + topPosition + ',resizable=yes,scrollbars=yes';

    window.open("../chat/chat.do", "_blank", windowFeatures);
}
</script>

</head>
<body>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal"/>
</sec:authorize>
  <!-- [S]basic-N3 Header -->
  <header class="basic-N3" data-bid="uFLsb2Fh4v" id="">
    <div class="header-inner">
      <div class="header-container container-md">
        <div class="header-left">
          <h1 class="header-title">
            <a href="../main/main.do">
              CODEV
            </a>
          </h1>
          <div class="header-mobile-group">
<!--             <div class="header-mobile-top">
              <p>로그인이 필요합니다.</p>
              <a href="javascript:void(0)">로그인</a>
            </div> -->
            <ul class="header-gnblist">
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../mentoring/list.do">
                  <span>Mentoring</span>
                </a>
              </li>
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../studyRoom/room_main.do">
                  <span>Study Room</span>
                </a>
              </li>
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../books/list.do">
                  <span>Bookstore</span>
                </a>
              </li>
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../recruitment/recruit_list.do">
                  <span>Recruitment</span>
                </a>
              </li>
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../notice/list.do">
                  <span>Notice</span>
                </a>
              </li>
              <sec:authorize access="hasRole('ROLE_USER')">
              <li class="header-gnbitem">
                <a class="header-gnblink" href="javascript:void(0)">
                  <span>MyPage</span>
                </a>
              </li>
              </sec:authorize>
              <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li class="header-gnbitem">
                <a class="header-gnblink" href="../adminpage/admin.do">
                  <span>AdminPage</span>
                </a>
              </li>
              </sec:authorize>
            </ul>
            <button class="header-btn btn-close">
              <img src="../images/icons/ico_close_white.svg" alt="닫기 아이콘">
            </button>
          </div>
        </div>
        <div class="header-right">
          <div class="header-utils">
            <button class="header-btn btn-seach">
              <img src="../images/icons/ico_seach_black.svg" alt="검색 아이콘">
            </button>
            <c:if test="${principal.username!=null }">
            <button onclick="chat()" class="header-btn btn-user">
              <img src="../images/icons/icon-chat1.png" alt="채팅 아이콘">
            </button>
            </c:if>
            <c:if test="${principal.username==null }">
            <a href="../member/login.do" class="header-btn btn-user">
              <img src="../images/icons/loginout.png" alt="로그인 아이콘">
            </a>
            </c:if>
            <c:if test="${principal.username!=null }">
            <!-- <a href="#" class="header-btn btn-user">
              <img src="../images/icons/ico_user_black.svg" alt="마이페이지 아이콘">
            </a> -->
            <a href="../member/logout.do" class="header-btn btn-user">
              <img src="../images/icons/free-icon-logout.png" alt="로그아웃 아이콘">
            </a>
            </c:if>
            <button class="header-btn btn-cart badgeset badgeset-circle badgeset-position badgeset-bottom-right">
              <img src="../images/icons/ico_cart_black.svg" alt="쇼핑백 아이콘">
              <span class="badgeset-text">1</span>
            </button>
            <button class="header-btn btn-allmenu">
              <img src="../images/icons/ico_menu2_black.svg" alt="PC메뉴 아이콘">
            </button>
            <button class="header-btn btn-momenu">
              <img src="../images/icons/ico_menu2_black.svg" alt="모바일메뉴 아이콘">
            </button>
            <button class="header-btn btn-close">
              <img src="../images/icons/ico_close_black.svg" alt="닫기 아이콘">
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="header-dim"></div>
  </header>
  <!-- [E]basic-N3 Content -->
</body>
</html>