<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width:700px;
}
#chatArea{
  height: 450px;
  overflow-y:auto;
  border: 1px solid black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
let name;
function connection()
{
	 name=$('#name').val();
	 if(name.trim()==="")
	 {
		 $('#name').focus();
		 return;
	 }
	 websocket=new WebSocket("ws://211.238.142.115:8080/web/site/chat/chat-ws");
	 websocket.onopen=onOpen;
	 websocket.onclose=onClose;
	 websocket.onmessage=onMessage;
	 // CallBack등록 
}
function onOpen(event)
{
	alert("채팅 서버와 연결되었습니다...")
}
function onClose(event)
{
	alert("채팅서버가 연결 종료하셨습니다...")
}
function onMessage(event)
{
	let data=event.data; // 보낸 데이터 => "msg[이름]:message"
	if(data.substring(0,4)=="msg:")
	{
		appendMessage(data.substring(4));
	}
}
function appendMessage(msg)
{
	 $('#recvMsg').append(msg+"<br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function send()
{
	let msg=$('#sendMsg').val()
	if(msg.trim()==="")
	{
		$('#sendMsg').focus()
		return
	}
	websocket.send('msg:['+name+']'+msg)
	$('#sendMsg').val("")
	$('#sendMsg').focus()
}
$(function(){
	$('#startBtn').click(function(){
		connection();
	})
	$('#endBtn').click(function(){
		websocket.close();
	})
	$('#sendBtn').click(function(){
		send()
	})
	$('#sendMsg').keydown(function(key){
		if(key.keyCode==13)
		{
			send()
		}
	})
})
</script>
</head>
<body>
   <div class="container">
     <h1 class="text-center">실시간 채팅(WebSocket)</h1>
     <div class="row">
       <table class="table">
        <tr>
         <td>
           <input type=text class="input-sm" id="name" size=15>
           <input type=button class="btn-sm btn-danger" id="startBtn" value="입장">
           <input type=button class="btn-sm btn-primary" id="endBtn" value="퇴장">
         </td>
        </tr>
        <tr>
          <td>
            <div id="chatArea">
              <div id="recvMsg"></div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
           <input type=text id="sendMsg" size=80 class="input-sm">
           <input type=button id="sendBtn" value="전송" class="btn-sm btn-success">
          </td>
        </tr>
       </table>
     </div>
   </div>
    
  
</body>
</html>