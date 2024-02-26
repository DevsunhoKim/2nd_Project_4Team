<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.campland-N23 {
  overflow: hidden;
  background-color: var(--highlight-bg1);
}

.campland-N23 .contents-inner {
  padding: 8rem 1.6rem;
}

.campland-N23 .contents-container {
  width: 100%;
  max-width: 84rem;
  margin: 0 auto;
}

.campland-N23 .textset.textset-sub .textset-tit {
  font-size: var(--fs-h3);
  line-height: var(--lh-h3);
}

.campland-N23 .contents-group {
  padding: 2.4rem;
  background-color: var(--white);
}

.campland-N23 .contents-group+.contents-group {
  margin-top: 1.6rem;
}

.campland-N23 .contents-profile {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.campland-N23 .contents-profile-item {
  display: flex;
  align-items: center;
}

.campland-N23 .contents-profile .imageset {
  width: 4.8rem;
  height: 4.8rem;
}

.campland-N23 .contents-name {
  margin-left: 1.6rem;
  font-size: var(--fs-h5);
  line-height: var(--lh-h5);
  font-weight: 500;
}

.campland-N23 .contents-benefit {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8rem;
}

.campland-N23 .contents-benefit-link {
  position: relative;
}

.campland-N23 .contents-benefit-item .iconset {
  width: 6rem;
  height: 6rem;
}

.campland-N23 .contents-benefit-item .contents-text {
  margin-top: 0.8rem;
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
  font-weight: 500;
  text-align: center;
}

.campland-N23 .contents-reservation .contents-tit {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.4rem;
  font-size: var(--fs-h5);
  line-height: var(--lh-h5);
  font-weight: 500;
}

.campland-N23 .contents-reservation .contents-more {
  flex-shrink: 0;
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
  font-weight: 500;
  color: var(--text-color5);
}

.campland-N23 .contents-reservation .cardset {
  align-items: flex-start;
  padding: 1rem;
}

.campland-N23 .contents-reservation .cardset+.cardset {
  margin-top: 1.2rem;
}

.campland-N23 .contents-reservation .cardset-figure {
  width: 8rem;
  height: 8rem;
}

.campland-N23 .contents-reservation .cardset-body {
  margin-left: 1.6rem;
}

.campland-N23 .contents-reservation .cardset-txt {
  margin-left: 0.8rem;
}

.campland-N23 .contents-reservation .cardset-tit {
  margin-top: 0.4rem;
}

.campland-N23 .contents-notice-link {
  display: inline-block;
  position: relative;
  width: 100%;
  padding: 1.6rem 2.4rem 1.6rem 0;
  font-size: var(--fs-p2);
  line-height: var(--lh-p2);
}

.campland-N23 .contents-notice-link:first-child {
  padding-top: 0;
}

.campland-N23 .contents-notice-link:last-child {
  padding-bottom: 0;
}

.campland-N23 .contents-notice-link+.contents-notice-link {
  border-top: 1px solid var(--border-color);
}

.campland-N23 .contents-notice-link::after {
  content: "";
  position: absolute;
  top: 50%;
  right: 0;
  transform: translateY(-50%);
  width: 2.4rem;
  height: 2.4rem;
  background: url("/api/t-a/64/1708927200/resources/icons/ico_arrow_right_black.svg") no-repeat center/contain;
}

.campland-N23 .contents-notice-link span {
  display: block;
  margin-top: 0.4rem;
  font-size: var(--fs-p3);
  line-height: var(--lh-p3);
  color: var(--text-color4);
}

.campland-N23 .contents-notice-link em {
  font-style: normal;
}

.campland-N23 .contents-button {
  margin-top: 4rem;
  text-align: right;
}

@media (max-width: 992px) {
  .campland-N23 .contents-inner {
    padding: 3rem 1.6rem;
  }

  .campland-N23 .contents-profile {
    padding: 2rem;
  }

  .campland-N23 .contents-profile .imageset {
    width: 4rem;
    height: 4rem;
  }

  .campland-N23 .contents-group+.contents-group {
    margin-top: 0.8rem;
  }

  .campland-N23 .contents-benefit {
    flex-direction: column;
    align-items: flex-start;
    gap: 2rem;
  }

  .campland-N23 .contents-benefit-item {
    width: 100%;
    padding: 0;
  }

  .campland-N23 .contents-benefit-link {
    display: flex;
    align-items: center;
    gap: 0.8rem;
    width: 100%;
    padding-right: 2rem;
  }

  .campland-N23 .contents-benefit-link::after {
    content: "";
    position: absolute;
    top: 50%;
    right: 0;
    transform: translateY(-50%);
    width: 2rem;
    height: 2rem;
    background: url("/api/t-a/64/1708927200/resources/icons/ico_arrow_right_black.svg") no-repeat center/contain;
  }

  .campland-N23 .contents-benefit-item .iconset {
    width: 4rem;
    height: 4rem;
  }

  .campland-N23 .contents-reservation .cardset {
    flex-direction: row;
  }

  .campland-N23 .contents-reservation .badgeset-wrap {
    flex-direction: column;
  }

  .campland-N23 .contents-reservation .cardset-txt {
    margin-left: 0;
    margin-top: 0.4rem;
  }

  .campland-N23 .contents-reservation .cardset-figure {
    width: 6.4rem;
    height: 6.4rem;
  }

  .campland-N23 .contents-reservation .cardset-figure+.cardset-body {
    margin-top: 0;
  }
}
</style>
</head>
<body>
    <!-- [S]campland-N23 -->

<div class="campland-N23" data-bid="EKlT2jLG16">
    <div class="campland-N23" data-bid="EKlT2jLG16" id="">
      <div class="contents-inner">
        <div class="contents-container">
          <div class="textset textset-sub textset-center">
          <div class="content-wrapper" style=" display: flex;align-items: center;">
              <img alt="책 아이콘" style="width: 50px; display: inline-block;" src="${pageContext.request.contextPath}/images/search.png">
               <h2 class="textset-tit" style="display: inline-block; margin: 0;">&nbsp;<c:out value="${param.engTech}" /> </h2><span class="reserve_tit" style="display: inline-block;">&nbsp;에 대한 검색내역</span>
          </div>
          </div>
        <!-- 멘토 리스트 -->
        <c:if test="${mList!=null }">
          <div class="contents-group contents-reservation" data-aos="slide-up">
            <h2 class="contents-tit"> 멘토링 <a href="javascipt:void(0);" class="contents-more">더보기</a>
            </h2>
            <p class="contents-tit"> 해당 기술과 연관된 ${job} 멘토를 만나보세요.</p>
          <c:forEach var="vo" items="${mList}">
            <div class="cardset cardset-hor cardset-sm">
              <figure class="cardset-figure">
                <img class="cardset-img" src="${pageContext.request.contextPath}/mentoring/images/${vo.img }.png" alt="카드 이미지">
              </figure>
              <div class="cardset-body">
                <div class="badgeset-wrap">
                  <div class="badgeset-group">
                    <div class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary">이용완료</div>
                  </div>
                  <p class="cardset-txt">2023.01.09(월) ~ 2023.01.12(목)</p>
                </div>
                <h2 class="cardset-tit">${vo.mvo.nickname }</h2>
                <p class="cardset-desc"> ${vo.title } <br class="br-mo"> 3박 4일 ㅣ 성인 2명, 어린이 1명 </p>
              </div>
            </div>
            </c:forEach>
          </div>
        </c:if>
        
        <!-- 책 리스트 -->
        <c:if test="${bList!=null }">
          <div class="contents-group contents-reservation" data-aos="slide-up">
            <h2 class="contents-tit"> 최근 예약내역 <a href="javascipt:void(0);" class="contents-more">더보기</a>
            </h2>
            <div class="cardset cardset-hor cardset-sm">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/img_campland_N19_1.png" alt="카드 이미지">
              </figure>
              <div class="cardset-body">
                <div class="badgeset-wrap">
                  <div class="badgeset-group">
                    <div class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary">이용완료</div>
                  </div>
                  <p class="cardset-txt">예약번호 2023010120230101</p>
                </div>
                <h2 class="cardset-tit">캠핑장 A구역</h2>
                <p class="cardset-desc"> 2023.01.09(월) ~ 2023.01.12(목) ㅣ <br class="br-mo"> 3박 4일 ㅣ 성인 2명, 어린이 1명 </p>
              </div>
            </div>
          </div>
          </c:if>
          
        <!-- 채용공고 리스트 -->
        <c:if test="${rList!=null }">
          <div class="contents-group contents-reservation" data-aos="slide-up">
            <h2 class="contents-tit"> 최근 예약내역 <a href="javascipt:void(0);" class="contents-more">더보기</a>
            </h2>
            <div class="cardset cardset-hor cardset-sm">
              <figure class="cardset-figure">
                <img class="cardset-img" src="../resources/images/img_campland_N19_1.png" alt="카드 이미지">
              </figure>
              <div class="cardset-body">
                <div class="badgeset-wrap">
                  <div class="badgeset-group">
                    <div class="badgeset badgeset-fill badgeset-border badgeset-round badgeset-primary">이용완료</div>
                  </div>
                  <p class="cardset-txt">예약번호 2023010120230101</p>
                </div>
                <h2 class="cardset-tit">캠핑장 A구역</h2>
                <p class="cardset-desc"> 2023.01.09(월) ~ 2023.01.12(목) ㅣ <br class="br-mo"> 3박 4일 ㅣ 성인 2명, 어린이 1명 </p>
              </div>
            </div>
          </div>
          </c:if>
          <div class="contents-button">
            <button class="btnset btnset-round" type="button" data-aos="slide-up">메인으로 돌아가기</button>
          </div>
        </div>
      </div>
    </div>
</div>
    <!-- [E]campland-N23 -->
</body>
</html>