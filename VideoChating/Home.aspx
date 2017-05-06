<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="VideoChating.client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <script src="Scripts/jquery-1.6.4.min.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.min.js"></script>
    <script src="Scripts/adapter.js"></script>
    <script src="/signalr/hubs/hubs"></script>
    <script src="resources/js/script.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <header class="page-header" style="padding-left:10px;">
        <h1>Video Chatting by Mahmoud Sharif using Webrtc & SignalR</h1>
        <ul class="nav nav-pills">
            <li class="active"><a href="Client.aspx" title="client page to make a call" target="_blank" style="text-decoration:none;">Client</a></li>
            <li><a href="https://github.com/MahmoudSharif" title="github" class="fa fa-github fa-lg" target="_blank"></a></li>
            <li><a href="https://www.facebook.com/mahmoud.sharif.31" title="facebook" class="fa fa-facebook-official fa-lg" target="_blank"></a></li>
            <li><a href="https://www.linkedin.com/in/mahmoud-sharif-580381123" title="linkedin" class="fa fa-linkedin-square fa-lg" target="_blank"></a></li>
        </ul>
    </header>
        <div id="videos">
            <video id="remote_video" autoplay="autoplay"  style="width:70%;height:500px;"></video>
            <video id="local_video" autoplay="autoplay" style="width:15%;height:23%;position: absolute;left: 44%;top: 76%;border:solid 2px #fff"></video>
        </div>
    <footer>

    </footer>
</body>
</html>
