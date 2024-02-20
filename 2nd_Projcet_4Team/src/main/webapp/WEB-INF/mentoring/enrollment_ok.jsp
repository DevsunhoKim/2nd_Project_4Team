<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style type="text/css">
    .glamping-N48 {
    padding: 100px 20px 20px; 
  }
  .contents-inner {
    margin: 0 auto;
    max-width: 800px; 
  }
  .contents-top {
    margin-bottom: 20px;
  }
  .glamping-N48 .contents-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 8rem;
  height: 8rem;
  margin: 0 auto;
  padding: 2rem;
  border-radius: 50%;
  background-color: var(--primary);
}

.glamping-N48 .contents-icon img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.glamping-N48 .textset {
  margin-top: 4rem;
  text-align: center;
}

.glamping-N48 .textset-tit {
  font-size: var(--fs-h2);
  line-height: var(--lh-h2);
  font-weight: 500;
}

.glamping-N48 .textset-tit+.textset-desc {
  margin-top: 1.8rem;
}

.glamping-N48 .contents-btnset {
  margin-top: 8rem;
  text-align: center;
}

@media (max-width: 992px) {
  .glamping-N48 .contents-inner {
    padding: 5rem 2.4rem;
  }

  .glamping-N48 .contents-icon {
    width: 6rem;
    height: 6rem;
    padding: 1.4rem;
  }

  .glamping-N48 .textset {
    margin-top: 2rem;
  }

  .glamping-N48 .textset-tit+.textset-desc {
    margin-top: 0.8rem;
  }

  .glamping-N48 .contents-btnset {
    margin-top: 4rem;
    text-align: center;
  }
}
  </style>
</head>
<body>
<div class="glamping-N48" data-bid="pTLSJXDN2V">
<div class="contents-inner">
  <div class="contents-container container-md">
    <div class="contents-icon">
      <img src="../member/icons/ico_check_xl_white.svg" alt="체크 아이콘 이미지">
    </div>
    <div class="textset">
      <h2 class="textset-tit">멘토 등록이 완료되었습니다</h2>
      <p class="textset-desc">
        CODEV의 멘토로서의 여정이 시작되었습니다. 
        <br>
        함께 성장하고 배우는 소중한 시간이 될 것입니다. 환영합니다!
      </p>
    </div>
    <div class="contents-btnset">
      <a href="../mentoring/list.do" class="btnset btnset-round">멘토목록 보러가기</a>
    </div>
  </div>
</div>
</div>
</body>
</html>