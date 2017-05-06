var ice = {
    "iceServers": [
        { "url": "stun:stunserver.com:12345" },
        { "url": "turn:turnserver.com", "username": "user", "credential": "pass" }
    ]
};

var hub = $.hubConnection("/signalr/hubs/hubs", { useDefaultPath: false });

var hubProxy = $.connection.WebrtcHub;
$.connection.hub.logging = true;

var pc = new RTCPeerConnection(ice);

hubProxy.client.acceptAnswer = function(answer)
{
    pc.setRemoteDescription(new RTCSessionDescription(JSON.parse(answer)));
}

$.connection.hub.start().done(function(){
    console.log("Connected to hub");
    
});

$(document).ready(function () {
    $("#btn_call").click(function () {
        navigator.getUserMedia({ audio: true, video: true }, function (stream) {
            var local_video = document.getElementById('local_video');
            local_video.srcObject = stream;
            pc.addStream(stream);

            pc.createOffer().then(function (offer) {
                pc.setLocalDescription(offer);
                hubProxy.server.sendOffer(JSON.stringify(offer));
            }, logError);
        }, logError);
    });
});

pc.onicecandidate = function (evt) {
    if (evt.candidate) {
        console.log("Collecting Ice");
        hubProxy.server.sendIceCandidate(JSON.stringify(evt.candidate));
    }
    else
        console.log("Ice gathering complete .. ");
}

pc.onaddstream = function (evt) {
    //var remote_video = document.createElement("video");
    var remote_video = document.getElementById("remote_video");
    //remote_video.autoplay = "autoplay";
    remote_video.srcObject = evt.stream;
    //document.getElementById("videos").appendChild(remote_video);
}

function logError(err) { console.log(err.message); }