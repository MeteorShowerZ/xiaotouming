<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-04-23
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    var socket;
    if (!window.WebSocket) {
        window.WebSocket = window.MozWebSocket;
    }
    if (window.WebSocket) {
        socket = new WebSocket("ws://localhost:8081/ws");
        socket.onmessage = function (event) {
            var ta = document.getElementById('responseText');
            ta.value = ta.value + '\n' + event.data
        };
        socket.onopen = function (event) {
            var ta = document.getElementById('responseText');
            ta.value = "连接开启!";
        };
        socket.onclose = function (event) {
            var ta = document.getElementById('responseText');
            ta.value = ta.value + "连接被关闭";
        };
    } else {
        alert("你的浏览器不支持 WebSocket！");
    }

    function send(message) {
        if (!window.WebSocket) {
            return;
        }
        if (socket.readyState == WebSocket.OPEN) {
            socket.send(message);
        } else {
            alert("连接没有开启.");
        }
    }
</script>
<form onsubmit="return false;">
    <h3>WebSocket 聊天室：</h3>
    <textarea id="responseText" style="width: 500px; height: 300px;"></textarea>

    <input type="text" name="message" style="width: 300px" value="Welcome to www.waylau.com">
    <input type="button" value="发送消息" onclick="send(this.form.message.value)">
    <input type="button" onclick="javascript:document.getElementById('responseText').value=''" value="清空聊天记录">
</form>
</body>
</html>
