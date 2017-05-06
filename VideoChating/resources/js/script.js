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

hubProxy.client.acceptOffer = function(offer)
{
    pc.setRemoteDescription(new RTCSessionDescription(JSON.parse(offer)), function () {
        navigator.getUserMedia({ audio: true, video: true }, function (stream) {
            var local_video = document.getElementById("local_video");
            local_video.srcObject = stream;
            pc.addStream(stream);
            pc.createAnswer().then(function (answer) {
                pc.setLocalDescription(answer, function () {
                    hubProxy.server.sendAnswer(JSON.stringify(pc.localDescription));
                }, logError);
            });
        }, logError);
    },logError);
}

hubProxy.client.acceptIceCandidate = function(candidate)
{
    pc.addIceCandidate(new RTCIceCandidate(JSON.parse(candidate)));
}

pc.onaddstream = function (evt) {
    //var remote_video = document.createElement("video");
    var remote_video = document.getElementById("remote_video");
    //remote_video.autoplay = "autoplay";
    remote_video.srcObject = evt.stream;
    //document.getElementById("videos").appendChild(remote_video);
}

$.connection.hub.start().done(hubProxy.client.AcceptMessage);

function logError(err) { console.log(err); }
