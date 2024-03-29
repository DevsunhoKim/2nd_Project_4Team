<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../studyRoom/css/setting.css">
<link rel="stylesheet" href="../studyRoom/css/plugin.css">
<link rel="stylesheet" href="../studyRoom/css/template.css">
<link rel="stylesheet" href="../studyRoom/css/common.css">
<link rel="stylesheet" href="../studyRoom/css/style.css">
<style type="text/css">
.nick{
   font-size: 1.5rem;
}
#chatting {
  margin-bottom: 2rem;

}
#chatting .msg{
    text-align: center;
    font-size: 1.3rem;
    margin-top: 1rem;
    /* border: 1px solid #c7c7c7;
    border-radius: 3rem;
    width: 19rem;
    padding: 0.4rem 0 0.4rem 0; */
}
}
#chattitle {
   font-size: 2.5rem;
    FONT-WEIGHT: 600;
}
#chatting #nameinput{
    height: 3.5rem;
    border-radius: 3rem;
    border: 2.5px solid #e5e5e5;
    padding: 14px;
}
#chatting .namearea{
    font-size: 1.3rem;
    font-weight: 600;
}
#chatting #sendBtn{
      background: white;
    border: 0;
    /* width: 0.1rem; */
    margin-left: 0.5rem;
    border-radius: 3rem;
    width: 3rem;
    height: 3rem;
}
#chatting input:focus {
    outline:none;
}
#chatting .into{
    margin: 2rem 0 1rem;
    padding-left: 0;
    text-align: right;
    
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
}
#chatting .btnset{
   min-width: 0;
   width: 0.5rem;
   border-radius: 0.5rem;
   height: 3.5rem;
   font-size: 1.5rem;
   margin-top: 1rem;
}
#chatting .btnset:hover{
   background-color:#6713d2;
   color:white;
   border-color: transparent;
}
#chatting #sendMsg{
    background-color: #ffffff;
    border: 0;
    border-radius: 3rem;
    margin-left: 1rem;
    padding: 0 1rem;
    height: 3rem;
    font-size: 1.5rem;
}
#chatting .sendArea{
   max-width: 64rem;
    height: 5rem;
    background-color: #efefef;
    width: 100%;
    /* position: absolute; */
    /* bottom: 0; */
    border-radius: 0 0 1rem 1rem;
}
#chatting #sendIcon{
   width: 1.8rem;
   height: 1.8rem;
   filter: invert(16%) sepia(75%) saturate(5889%) hue-rotate(267deg) brightness(80%) contrast(108%);
}
.container{
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width:65rem;
}
#chatArea{
    max-width: 64rem;
    height: 70rem;
    overflow-y: auto;
    /* border: 1px solid black; */
    width: 100%;
    border-radius: 1rem 1rem 0 0;
    /* overflow: hidden; */
    padding: 1rem 1.5rem;
    box-shadow: 0 10px 21px rgba(0,0,0,0.19), 0 25px 9px rgba(0,0,0,0.23);
}
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.wrap {
    /* padding: 40px 0; */
    background-color: #efefef;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 1rem 1rem 0 1rem;
    flex-direction: column;
}

.wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 4.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 0.5rem 1.5rem;
    margin-top: 0px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    
    background-color: #ddd;
}

/* .wrap .ch1 .textbox::before {
    left: -10px;
    content: "◀";
    color: #ddd;
} */

.wrap .ch2 {
    
    align-items: flex-end;
}

.wrap .ch2 .textbox {
    
    background-color: #6713d2;
    color: white;
}

/* .wrap .ch2 .textbox::before {
    right: -10px;
    content: "▶";
    color: #F9EB54;
} */

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
let user;
let userset;
//서버 연결
function connection()
{
	websocket=new WebSocket("ws://43.200.169.222:8080/web/chat/chat-ws")
	websocket.onopen=onOpen
	websocket.onclose=onClose
	websocket.onmessage=OnMessage
}
function disConnection()
{
	websocket.close()
}
// 연결 처리 => CallBack
function onOpen(event)
{ 
	alert("채팅 접속이 완료되었습니다.")
}
function onClose(event)
{
	alert("채팅이 종료되었습니다.")
	window.close();
}
function OnMessage(event)
{
	 
	 let data=event.data // 전송된 데이터 
	 if(data.substring(0,3)==="my:") // oto , makeroom  ==> 100 200 300...
		 // msg:[이름] 메세지
	 {
		    appendMyMessage(data.substring(data.indexOf("[")))
			console.log(user)
	 		userset='my'
	 }
	 if(data.substring(0,4)==="you:") // oto , makeroom  ==> 100 200 300...
	 // msg:[이름] 메세지
	 {
		    appendYouMessage(data.substring(data.indexOf("[")))
			userset='you'
	  }
	 if(data.substring(0,4)==="msg:") // oto , makeroom  ==> 100 200 300...
		 // msg:[이름] 메세지
	 {
		     appendMsgMessage(data.substring(data.indexOf("[")))
			 userset='msg'
	  }
}

//메세지 띄우기
function appendMyMessage(msg)
{
	let content=msg.substring(msg.lastIndexOf("]")+1)
	console.log(msg)
	console.log(content)
	let name=msg.substring(msg.indexOf("[")+1,msg.lastIndexOf("]"))
    $('#recvMsg').append(
	     "<div class=\"chat ch2\"><div class=\"namearea\"><p>"+name+"</p></div><div class=\"textbox\">"+content+"</div></div>"
    )
	let ch=$('#chatArea').height()
	let m=$('#recvMsg').height()-ch
	$('#chatArea').scrollTop(m)
}
function appendYouMessage(msg)
{
	let content=msg.substring(msg.lastIndexOf("]")+1)
	console.log(msg)
	console.log(content)
	let name=msg.substring(msg.indexOf("[")+1,msg.lastIndexOf("]"))
    $('#recvMsg').append("<div class=\"chat ch1\"><div class=\"namearea\"><p>"+name+"</p></div><div class=\"textbox\">"+content+"</div></div>")
	let ch=$('#chatArea').height()
	let m=$('#recvMsg').height()-ch
	$('#chatArea').scrollTop(m)
}
function appendMsgMessage(msg)
{
	let Msgcontent=msg.substring(msg.lastIndexOf("]")+1)
	console.log(msg)
	console.log(Msgcontent)
    $('#recvMsg').append("<p class=\"msg\">"+Msgcontent+"</p>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function send(){
	let nick=$('#name').attr("data-nickname");
	let name=$('#name').attr("data-name");
	let msg=$('#sendMsg').val()
	if(msg.trim()==="")
	{
		$('#sendMsg').focus()
		return
	}
	websocket.send(msg)
	$('#sendMsg').val("")
	$('#sendMsg').focus()
}
$(function(){
	$('#startBtn').click(function(){
		connection()
	})
	$('#endBtn').click(function(){
		disConnection()
	})
	$('#sendBtn').click(function(){
		send()
	})
	$('#sendMsg').keydown(function(key){
		if(key.keyCode===13)
	    {
			send()
	    }
	})
})
</script>
</head>
<body>
  <div class="container" id="chatting">
   <h1 class="text-center" id="chattitle" style="font-size: 2rem;
    FONT-WEIGHT: 600;margin-bottom: 1rem;">CODEV LIVE CHAT</h1>
   <div class="row">
     <div class="input-Btn into">
          <input type=hidden id="name" size=15 class="input-sm">
          <p class="nick">* 가입시 입력한 닉네임으로 입장됩니다.</p>
          <div style="margin-right: 0.4rem;">
          <input type=button class="btnset" id="startBtn" value="입장">
          <input type=button class="btnset" id="endBtn" value="퇴장">
          </div>
    </div>
    <div class="wrap" id="chatArea">
      <div id="recvMsg">
      </div>
    </div>
    <div class="input-Btn sendArea">
      <input type=text id="sendMsg" size=64>
      <button id="sendBtn">
         <img src="../images/icons/icon-top.png" id="sendIcon">
      </button>
    </div>
   </div>
  </div>
</body>
</html>