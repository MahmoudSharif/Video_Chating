using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace VideoChating.Hubs
{
    [HubName("WebrtcHub")]
    public class WebrtcHub : Hub
    {
        public void sendOffer(string offer)
        {
            Clients.Others.acceptOffer(offer);
        }

        public void sendAnswer(string answer)
        {
            Clients.Others.acceptAnswer(answer);
        }

        public void sendIceCandidate(string candidate)
        {
            Clients.Others.acceptIceCandidate(candidate);
        }

        //public void sendAnswer(string Message)
        //{
        //    Clients.AllExcept(Context.ConnectionId).AcceptMessage(Message);
        //}
    }
}