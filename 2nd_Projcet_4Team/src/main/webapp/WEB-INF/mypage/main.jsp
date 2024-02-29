<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">

<link rel="stylesheet" href="../mypage/css/setting.css">
<link rel="stylesheet" href="../mypage/css/plugin.css">
<link rel="stylesheet" href="../mypage/css/template.css"> 
<link rel="stylesheet" href="../mypage/css/style.css">

<!-- script -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../js/setting.js"></script>
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../js/script.js"></script>
<style type="text/css">
 padding: 8rem 1.6rem;
}

.basic-N50 .contents-container {
  position: relative;
}

.basic-N50 .textset {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.basic-N50 .contents-btn {
  width: 2.4rem;
  height: 2.4rem;
  background-color: transparent;
  border: 0;
}

.basic-N50 .contents-btn img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  vertical-align: top;
}

.basic-N50 .btn-filter {
  display: none;
}

.basic-N50 .contents-body {
  display: flex;
  /* justify-content: space-between; */
  gap: 4rem;
}

.basic-N50 .contents-left {
  width: 29rem;
  background-color: var(--white);
}

.basic-N50 .contents-filter-header,
.basic-N50 .contents-filter-footer {
  display: none;
}

.basic-N50 .contents-right {
  width: 100%;
  max-width: 95rem;
  overflow: hidden;
}

.basic-N50 .contents-sort {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  align-items: center;
  gap: 2rem;
  padding: 2rem 0;
  border-top: 1px solid var(--line-color3);
  border-bottom: 1px solid var(--border-color);
}

.basic-N50 .contents-sort-total {
  font-size: var(--fs-p3);
  line-height: var(--lh-p3);
  color: var(--text-color3);
}

.basic-N50 .contents-sort-total span {
  font-weight: 600;
  color: var(--text-color1);
}

.basic-N50 .contents-sort-sel {
  display: flex;
  align-items: center;
  gap: 2rem;
}

.basic-N50 .contents-sort .tabset .tabset-list {
  justify-content: flex-start;
}

.basic-N50 .contents-sort .selectset {
  width: auto;
  min-width: 14rem;
  max-width: 14rem;
}

.basic-N50 .contents-list {
  display: flex;
  flex-wrap: wrap;
  margin: 2rem -2rem 4rem -2rem;
}

.basic-N50 .contents-list .cardset {
  width: calc(100% / 3);
  padding: 2rem;
}

.basic-N50 .contents-list .cardset-figure {
  height: 30rem;
}

.basic-N50 .contents-dim {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 200;
  width: 100%;
  height: 100%;
  background-color: rgba(17, 17, 17, 0.7);
}

@media (max-width: 992px) {
  .basic-N50.filter-active .contents-left {
    width: calc(100% - 10rem);
    top: 0;
    right: 0;
    opacity: 1;
    visibility: visible;
  }

  .basic-N50.filter-active .contents-dim {
    display: block;
  }

  .basic-N50 .contents-inner {
    padding: 5rem 1.6rem;
  }

  .basic-N50 .textset-tit {
    max-width: calc(100% - 2.4rem);
  }

  .basic-N50 .contents-filter-header,
  .basic-N50 .contents-filter-footer {
    display: block;
  }

  .basic-N50 .contents-filter-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1.6rem 1.6rem 1.6rem 2rem;
  }

  .basic-N50 .contents-filter-header strong {
    font-size: 1.6rem;
    font-weight: 500;
  }

  .basic-N50 .contents-filter-header .btn-close {
    width: 2.8rem;
    height: 2.8rem;
  }

  .basic-N50 .contents-filter-body {
    overflow-y: auto;
    height: 100%;
    padding-bottom: 22rem;
  }

  .basic-N50 .contents-filter-body .accordset {
    border-top: 0;
  }

  .basic-N50 .contents-filter-footer {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 0.4rem;
    position: absolute;
    right: 0;
    bottom: 0;
    width: 100%;
    padding: 1.6rem;
    box-shadow: 0 0 3rem 0 rgba(var(--black-rgb), 0.1);
    background-color: var(--white);
  }

  .basic-N50 .contents-filter-footer span {
    font-size: 1.4rem;
  }

  .basic-N50 .btn-filter {
    display: block;
  }

  .basic-N50 .contents-left {
    position: fixed;
    right: -100%;
    opacity: 0;
    visibility: visible;
    width: 0;
    height: 100%;
    transition: 0.4s;
    z-index: 300;
  }

  .basic-N50 .contents-sort-sel {
    flex-wrap: wrap;
    width: 100%;
  }

  .basic-N50 .contents-sort .selectset {
    width: 100%;
    max-width: 100%;
  }

  .basic-N50 .contents-list {
    margin: 2rem -1rem 2rem -1rem;
  }

  .basic-N50 .contents-list .cardset {
    width: calc(100% / 2);
    padding: 2rem 1rem;
  }

  .basic-N50 .contents-list .cardset+.cardset {
    margin-top: 0;
  }

  .basic-N50 .contents-list .cardset-figure {
    height: 15rem;
  }
}

.basic-N50 {
    padding: 100px 20px 70px; 
}
</style>
</head>
<body id="mypageMain">

  <tiles:insertAttribute name="header"/>
  
<div class="basic-N50" data-bid="PhLt40FYJq">
<div class="contents-inner mypagetop">
  <div class="contents-container container-md">
    <div class="textset">
      <h2 class="textset-tit">마이페이지</h2>
    </div>
    <div class="contents-body">
    
      <tiles:insertAttribute name="menu"/>
      
	  <tiles:insertAttribute name="content"/>
	  
    </div>
  </div>
</div>
</div>

<tiles:insertAttribute name="footer"/>

</body>
</html>