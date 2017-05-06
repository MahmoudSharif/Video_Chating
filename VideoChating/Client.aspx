<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="VideoChating._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client</title>
    <script src="Scripts/jquery-1.6.4.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.min.js"></script>
    <script src="Scripts/adapter.js"></script>
    <script src="/signalr/hubs/hubs"></script>
    <script src="resources/js/clientScript.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
    <header class="page-header" style="padding-left:10px;">
        <h1>Video Chatting by Mahmoud Sharif using Webrtc & SignalR</h1>
        <button id="btn_call" type="button" class="btn btn-success">Call</button>
    </header>
        <div id="videos">
            <video id="remote_video" autoplay="autoplay"  style="width:70%;height:500px;"></video>
            <video id="local_video" autoplay="autoplay" style="width:15%;height:23%;position: absolute;left: 44%;top: 76%;border:solid 2px #fff"></video>
        </div>
    <footer>

    </footer>
</body>
</html>
