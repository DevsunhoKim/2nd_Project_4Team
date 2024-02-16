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
  <style type="text/css">
  .cardset {
  display: inline-block;
  width: calc(33.33% - 23px); 
  margin-right: 20px; 
  margin-bottom: 20px; 
  vertical-align: top;
}

@media (max-width: 768px) {
  .cardset {
    width: calc(50% - 20px);
  }
}
.col-md-4 {
  width: 70%;
  margin: 60px auto; 
}

.contents-container {
  width: 50%; 
  margin: 0 auto;
  text-align: center; 
}

.inputset {
    max-width: 64rem;
    display: flex;
    justify-content: center;
    margin: 20px auto;
}

.selectset {
  width: 30%; 
  margin-right: 10px; 
}

.inputset-input {
  width: 70%;
}

.glamping-N9 .contents-inner {
    padding: 8rem 2.4rem 0rem 2.4rem;
}

.pagiset {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 35px;
}
.tabset .tabset-list {
    width: 83.5%;
    display: flex;
    justify-content: right;
}
  </style>
</head>
<body>
<div class="glamping-N9" data-bid="AqLsk0m3p5">
  <div class="contents-inner">
    <div class="contents-container container-md">
      <div class="textset">
        <h2 class="textset-tit">CODEV만의 멘토진</h2>
        <p class="textset-desc">실력과 경험을 모두 갖춘 CODEV의 멘토를 만나보세요.</p>
      </div>
    </div>
      <div class="inputset inputset-lg">
    <div class="selectset selectset-round selectset-lg">
        <button class="selectset-toggle btn" type="button">
          <span>선택해주세요</span>
        </button>
        <ul class="selectset-list">
          <li class="selectset-item">
            <button class="selectset-link btn" type="button" data-value="전체">
              <span>멘토명</span>
            </button>
          </li>
          <li class="selectset-item">
            <button class="selectset-link btn" type="button" data-value="선택1">
              <span>멘토링제목</span>
            </button>
          </li>
        </ul>
      </div>
    <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="icon"></button>
    <input type="text" class="inputset-input form-control" placeholder="Please enter a search term." aria-label="Content">
  </div> 
  <!-- 정렬 버튼 -->
  <div class="tabset tabset-text">
    <ul class="tabset-list">
      <li class="tabset-item">
        <a class="tabset-link active" href="javascript:void(0)">
          <span>예약많은순</span>
        </a>
      </li>
      <li class="tabset-item">
        <a class="tabset-link" href="javascript:void(0)">
          <span>리뷰많은순</span>
        </a>
      </li>
      <li class="tabset-item">
        <a class="tabset-link" href="javascript:void(0)">
          <span>팔로워순</span>
        </a>
      </li>
    </ul>
  </div>
        <div class="row">
       	 <div class="col-md-4">
          <div class="cardset cardset-user">
            <figure class="cardset-figure">
            <a href="../mentoring/detail.do">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </a>
            </figure>
            <a href="../mentoring/detail.do">
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
            </a>
          </div>

        <!-- 복제하여 3개씩 출력되도록 수정 -->
          <div class="cardset cardset-user">
            <figure class="cardset-figure">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </figure>
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
          </div>

          <div class="cardset cardset-user">
            <figure class="cardset-figure">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </figure>
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
          </div>
        <!-- 복제하여 3개씩 출력되도록 수정 -->
        <div class="cardset cardset-user">
            <figure class="cardset-figure">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </figure>
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
          </div>
          <div class="cardset cardset-user">
            <figure class="cardset-figure">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </figure>
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
          </div>
          <div class="cardset cardset-user">
            <figure class="cardset-figure">
              <img class="cardset-img" src="../images/img_basic_mobile_N33_1.png" alt="이미지">
            </figure>
            <div class="cardset-profile">
              <p class="cardset-text">
                템플릿하우스로 사용 으로 업무 시간과 생산성을
                높일 수있습니다. 다양한 프로젝트 활용과
                자주 쓰는 코딩을 미리 저장하고 빠르게 적용할 수
                있어서 너무 편리하고 좋아요
              </p>
              <p class="cardset-info">글램핑 구매자</p>
            </div>
          </div>

      </div>
    </div>
  </div>
  </div>
    <nav class="pagiset pagiset-circ">
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
</body>
</html>