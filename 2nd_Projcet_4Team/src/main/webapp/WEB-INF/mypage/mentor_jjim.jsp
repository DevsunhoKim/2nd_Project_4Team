<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../mypage/studyRoom/style.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style type="text/css">
.mypagetop{
	margin-top: 10rem;
}
</style>
</head>
<body>
      <div class="glamping-N7 mentorjjim" data-bid="LGLSReTjoE" id="jjim">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="textset">
            <h2 class="textset-tit jjimtitle">팔로우 목록</h2>
          </div>
          <div class="contents-swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="jj in jjimList">
                <div class="contents-slide-group container-md">
                  <a :href="'../mentoring/detail.do?mno='+jj.mno" class="cardset">
                    <figure class="cardset-figure">
                      <img class="cardset-img" :src="'../images/'+jj.img+'.png'" alt="이미지">
                    </figure>
                    <div class="cardset-body jjimname">
                      <h2 class="cardset-tit">{{jj.mvo.nickname}}</h2>
                      <img class="jjimicon" src="../mypage/icons/icon-heart.png" @click="jjim(jj.mno)">
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
<!--             <div class="swiper-button-next">dd</div>
            <div class="swiper-button-prev">ddd</div> -->
          </div>
         <!-- <div class="contents-control">
            <div class="swiper-pagination"></div>
            <a href="javascript:void(0);" class="btnset btnset-text btnset-icon">
              <div class="btnset-img">
                <img src="/api/t-a/58/1708254000/resources/icons/ico_more_black.svg" alt="자세히보기 아이콘">
              </div>
            </a>
          </div> -->
        </div>
      </div>
    </div>
    <script>
    let jjimApp=Vue.createApp({
    	data(){
    		return {
    			userId:'${sessionScope.userId}',
    			jjimList:{},
    			cateno:1
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
    				this.jjimList=response.data
    			})
    		},
    		jjim(no){
    			axios.get('../jjim/jjim_delete.do',{
    		    	params:{
    		    		userId:this.userId,
    	    			no:no,
    	    			cateno:this.cateno
    		    	}
    		    }).then(response=>{
    		    	if(response.data==0)
    		    	{
    		    		alert('팔로우가 취소되었습니다.')
    		    	}
    		    	this.dataRecv();
    		    })
    		    
    		}
    	}
    }).mount("#jjim")
    </script>
</body>
</html>