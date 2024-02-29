<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.radioset{
	margin: 10px
}
.radioset .radioset-text {
    margin: 10px;
    display: inline-block;
    margin-left: 0.8rem;
    font-size: 18px;
    cursor: pointer;
}

.checkset .checkset-text{
    margin: 10px;
    display: inline-block;
    margin-left: 0.8rem;
    font-size: 18px;
    cursor: pointer;
}
.accordset .accordset-button {
    display: flex;
    align-items: flex-start;
    width: 100%;
    padding: 2rem 6rem 2rem 2.4rem;
    border: none;
    font-size: 18.5px;
    line-height: var(--lh-p3);
    text-align: left;
    font-weight: 600;
    word-break: keep-all;
    border-radius: 0;
    transition: none;
}
.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {
    outline: 0px;
    outline-offset: unset;
    box-shadow: none;
    
}
.accordset.accordset-plus .accordset-item.active .accordset-header::after {
    content: none;
}
.accordset.accordset-plus .accordset-header::after {
    content: none;
}
#admin_ask .state:hover{
   background-color: #6713d2;
}
</style>
<script type="text/javascript">
(function() {
	  $(function() {
	    $(".basic-N50").each(function() {
	      const $block = $(this);
	      const $dim = $block.find('.contents-dim');
	      // Mobile Filter Open
	      $block.find('.btn-filter').on('click', function() {
	        $block.addClass('filter-active');
	        $dim.fadeIn();
	      });
	      // Mobile Filter Close
	      $block.find('.btn-close, .contents-dim').on('click', function() {
	        $block.removeClass('filter-active');
	        $dim.fadeOut();
	      });
	    });
	  });
	})();
</script>
</head>
<body>
<div class="contents-left">
<!--         <div class="contents-filter-header">
          <strong>필터</strong>
          <button class="contents-btn btn-close">
            <img src="../mypage/icons/ico_close_black.svg" alt="닫기 아이콘">
          </button>
        </div> -->
        <div class="contents-filter-body">
          <div class="accordset accordset-plus">
            <div class="accordset-item active">
             <a href="../adminpage/room_ask.do">
              <div class="accordset-header">
                <button class="accordset-button btn" type="button">1:1문의</button>
              </div>
             </a>
              <!-- 멘토컬럼이 1이면 -->
              <!-- <div class="accordset-body">
                <div class="accordset-content">
                  <div class="checkset">
                    <span class="checkset-text">멘토정보수정</span>
                  </div>
              </div>
            </div> -->
           </div>
            <div class="accordset-item">
             <a href="../adminpage/room_reserve.do">
              <div class="accordset-header">
                <button class="accordset-button btn" type="button">스터디룸 예약</button>
              </div>
             </a>
              <!-- <div class="accordset-body">
                <div class="accordset-content">
                  <div class="radioset">
                    <span class="radioset-text">멘토링 예약</span>
                  </div>
                  <a href="../adminpage/room_reserve.do">
                  <div class="radioset">
                    <span class="radioset-text">스터디룸 예약</span>
                  </div>
                  </a>
                </div>
              </div> -->
            </div>




          </div>
        </div>
<!--         <div class="contents-filter-footer">
          <span>필터초기화</span>
          <button class="contents-btn btn-refresh">
            <img src="../mypage/icons/ico_refresh_black.svg" alt="닫기 아이콘">
          </button>
        </div> -->
      </div>
</body>
</html>