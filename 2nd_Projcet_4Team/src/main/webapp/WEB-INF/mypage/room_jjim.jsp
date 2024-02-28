<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../mypage/studyRoom/style.css">
</head>
<body>
      <div class="glamping-N7" data-bid="LGLSReTjoE" id="jjim">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit jjimtitle">담은 목록</h2>
          </div>
          <div class="contents-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="javascript:void(0);" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/api/t-a/58/1708254000/resources/images/img_glamping_N7_1.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">캠프랜드에서의 하루</h2>
                      <!-- <p class="cardset-desc">
                        강촌에 캠프랜드가 새로 생겼습니다. 캠핑장
                        <br>
                        에서 서향의 노을이 아릅답습니다.
                      </p> -->
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="javascript:void(0);" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/api/t-a/58/1708254000/resources/images/img_glamping_N7_2.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">자연경관 글램핑</h2>
                      <!-- <p class="cardset-desc">
                        강촌에 캠프랜드가 새로 생겼습니다. 캠핑장
                        <br>
                        에서 서향의 노을이 아릅답습니다.
                      </p> -->
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="javascript:void(0);" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/api/t-a/58/1708254000/resources/images/img_glamping_N7_3.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">힐링파크 스팟</h2>
                      <!-- <p class="cardset-desc">
                        강촌에 캠프랜드가 새로 생겼습니다. 캠핑장
                        <br>
                        에서 서향의 노을이 아릅답습니다.
                      </p> -->
                    </div>
                  </a>
                </div>
              </div>
              <div class="swiper-slide">
                <div class="contents-slide-group container-md">
                  <a href="javascript:void(0);" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" src="/api/t-a/58/1708254000/resources/images/img_glamping_N7_4.png" alt="이미지">
                    </figure>
                    <div class="cardset-body">
                      <h2 class="cardset-tit">여유로운 글램핑</h2>
                      <!-- <p class="cardset-desc">
                        강촌에 캠프랜드가 새로 생겼습니다. 캠핑장
                        <br>
                        에서 서향의 노을이 아릅답습니다.
                      </p> -->
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
          </div>
          <div class="contents-control">
            <div class="swiper-pagination"></div>
            <a href="javascript:void(0);" class="btnset btnset-text btnset-icon">
              <div class="btnset-img">
                <img src="/api/t-a/58/1708254000/resources/icons/ico_more_black.svg" alt="자세히보기 아이콘">
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <script>
    let jjimApp=Vue.createApp({
    	data(){
    		return {
    			userId:'${sessionScope.userId}',
    			jjimList:{},
    			cateno:2
    		}
    	},
    	mounted(){
    		this.dataRecv();
    	},
    	methods:{
    		dataRecv(){
    			axios.get('../mypage/jjim_vue.do',{
    				params:{
    					userId:this.userId,
    					cateno:this.cateno
    				}
    			}).then(response=>{
    				console.log(response.data)
    			})
    		}
    	}
    }).mount("#jjim")
    </script>
</body>
</html>