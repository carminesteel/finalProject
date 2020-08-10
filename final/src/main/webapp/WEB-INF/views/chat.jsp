<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>웹 채팅</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

/* pc 화면 */
@media ( min-width : 768px) {
   #kakao-talk-channel-chat-button {
      position: fixed;
      z-index: 999;
      right: 30px; /* 화면 오른쪽으로부터의 거리 */
      bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
   }
}
/* 모바일 화면 */
@media ( max-width :767px) {
   #kakao-talk-channel-chat-button {
      position: fixed;
      z-index: 999;
      right: 15px; /* 화면 오른쪽으로부터의 거리 */
      bottom: 30px; /* 화면 아래쪽으로부터의 거리 */
   }
}
</style>
</head>
<body>
   <div id="kakao-talk-channel-chat-button"></div>

   <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <script type='text/javascript'>
      //<![CDATA[
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('a934dccdfec31255af5433afc94847bd');
      // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
      Kakao.Channel.createChatButton({
         container : '#kakao-talk-channel-chat-button',
         channelPublicId : '_xnZBgxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
      });
      //]]>
   </script>
</html>