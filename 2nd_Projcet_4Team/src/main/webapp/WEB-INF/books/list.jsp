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
</head>
<style>
.hooms-N40 .contents-inner {
  padding: 10rem 2.4rem;
}

.hooms-N40 .contents-container {
  display: flex;
  align-items: flex-end;
  position: relative;
}

.hooms-N40 .contents-left {
  align-self: flex-start;
  width: calc(50% + 9rem);
}

.hooms-N40 .contents-thumbnail {
  width: 100%;
  height: 60rem;
}

.hooms-N40 .contents-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.hooms-N40 .contents-thumblist {
  display: flex;
  align-items: center;
  margin-top: 2.4rem;
}

.hooms-N40 .contents-thumbitem {
  width: calc(100% / 5);
  height: 13rem;
}

.hooms-N40 .contents-thumbitem+.contents-thumbitem {
  margin-left: 2rem;
}

.hooms-N40 .contents-thumbitem img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  cursor: pointer;
}

.hooms-N40 .contents-right {
  width: calc(50% - 13rem);
  margin-left: 4rem;
  margin-bottom: 15.4rem;
}

.hooms-N40 .textset.textset-h2 {
  padding: 0;
  font-family: var(--ff-ko2);
}

.hooms-N40 .contents-desc {
  padding: 4rem 0;
  font-size: var(--fs-p1);
  line-height: var(--lh-p1);
  font-weight: 400;
  color: var(--text-color2);
}

.hooms-N40 .selectset {
  margin-bottom: 1.2rem;
}

.hooms-N40 .selectset-toggle {
  font-weight: 400;
}

.hooms-N40 .contents-sum {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-top: 1.2rem;
  font-size: var(--fs-p1);
  font-weight: 400;
  border-top: 1px solid var(--border-color);
}

.hooms-N40 .contents-sum span {
  font-size: 2.4rem;
  font-weight: 500;
  color: var(--secondary);
}

.hooms-N40 .contents-btn .btnset {
  width: 100%;
  margin-top: 4rem;
}

@media (max-width: 992px) {
  .hooms-N40 .contents-inner {
    padding: 6rem 2.4rem;
  }

  .hooms-N40 .contents-container {
    flex-direction: column;
  }

  .hooms-N40 .contents-left {
    width: 100%;
  }

  .hooms-N40 .contents-thumbnail {
    height: 40rem;
  }

  .hooms-N40 .contents-thumblist {
    width: calc(100% + 2.4rem);
    margin-right: -2.4rem;
    margin-top: 1.6rem;
    overflow-x: auto;
  }

  .hooms-N40 .contents-thumbitem {
    width: calc(100% / 3.5);
    flex: 0 0 auto;
  }

  .hooms-N40 .contents-thumbitem+.contents-thumbitem {
    margin-left: 1.2rem;
  }

  .hooms-N40 .contents-right {
    width: 100%;
    margin: 0;
    margin-top: 2.4rem;
  }

  .hooms-N40 .contents-desc {
    padding: 2.4rem 0;
  }

  .hooms-N40 .selectset {
    margin-bottom: 2.4rem;
  }

  .hooms-N40 .contents-sum span {
    font-size: 1.6rem;
  }
}

@media (max-width: 768px) {
  .hooms-N40 .contents-thumbnail {
    height: 30rem;
  }

  .hooms-N40 .contents-thumbitem {
    height: 9rem;
  }
}
</style>
<body>
 <div class="contents-inner">
  <div class="contents-container container-md">
    <div class="contents-search">
      <p class="contents-result">
        전체<span> 24</span>개
      </p>
      <div class="inputset">
        <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
        <input type="text" class="inputset-input form-control" placeholder="검색어를 입력해주세요." aria-label="내용">
      </div>
    </div>
    <div class="contents-group">
      <div class="contents-cardlist contents-cardlist-active">
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="../books/images/img_press_01_1.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="../resources/images/img_press_01_2.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_3.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_4.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_1.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_2.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_3.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
        <a href="javascript:void(0)" class="cardset">
          <figure class="cardset-figure">
            <img class="cardset-img" src="/api/t-a/56/1707807600/resources/images/img_press_01_4.png" alt="이미지">
          </figure>
          <div class="cardset-body">
            <div class="cardset-tit-group">
              <h5 class="cardset-tit">
                템플릿하우스, 웹페이지를 더 쉽고 빠르게!
              </h5>
            </div>
            <p class="cardset-desc">
              템플릿하우스는 원 클릭과 드래그앤 드랍만으로도 누구나 쉽고 아름답게 웹 페이지를 만들 수 있습니다.
            </p>
          </div>
        </a>
      </div>
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
</body>
</html>