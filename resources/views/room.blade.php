<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>

        <script src="//media.twiliocdn.com/sdk/js/video/v1/twilio-video.min.js"></script>
        <script>

        // Set the date we're counting down to
        var countDownDate = new Date().getTime()+(1000 * 20);

        // Update the count down every 1 second
        var x = setInterval(function() {

          // Get today's date and time
          var now = new Date().getTime();
            
          // Find the distance between now and the count down date
          var distance = countDownDate - now;
            
          // Time calculations for days, hours, minutes and seconds
          var days = Math.floor(distance / (1000 * 60 * 60 * 24));
          var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
          var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
          // Output the result in an element with id="demo"
          document.getElementById("timer_div").innerHTML =  "<p style='color:green'> Time Left :" + minutes + "m " + seconds + "s </p> ";
            // If the count down is over, write some text 
          if (distance < 0) {
            clearInterval(x);
            document.getElementById("timer_div").innerHTML = "<p style='color:red'>EXPIRED</p>";
          }
        }, 1000);

        </script>
   
        <script>
            Twilio.Video.createLocalTracks({
                audio: true,
                video: { width: 300 }
            }).then(function(localTracks) {
                 return Twilio.Video.connect('{{ $accessToken }}', {
                   name: '{{ $roomName }}',
                   tracks: localTracks,
                   video: { width: 300 },
                   dominantSpeaker: true
               });
            }).then(function(room) {
                console.log('Successfully joined a Room: ', room.name);
         
                room.participants.forEach(participantConnected);
         
                var previewContainer = document.getElementById(room.localParticipant.sid);
                if (!previewContainer || !previewContainer.querySelector('video')) {
                    participantConnected(room.localParticipant);
                }
             
                room.on('participantConnected', function(participant) {
                    console.log("Joining: '" + participant.identity + "'");
                    participantConnected(participant);
                });
         
                room.on('participantDisconnected', function(participant) {
                    console.log("Disconnected: '" + participant.identity + "'");
                    participantDisconnected(participant);
                });

                room.on('dominantSpeakerChanged', participant => {
                    console.log('The new dominant speaker in the Room is:', participant);
                });

            });
         
            function participantConnected(participant) {
                console.log('Participant "%s" connected', participant.identity);
         
                const div = document.createElement('div');
                div.id = participant.sid;
                div.setAttribute("style", "float: left; margin: 10px;");
                div.innerHTML = "<div style='clear:both'>"+participant.identity+"</div>";
         
                participant.tracks.forEach(function(track) {
                    trackAdded(div, track)
                });
         
                participant.on('trackAdded', function(track) {
                    trackAdded(div, track)
                });
                participant.on('trackRemoved', trackRemoved);
         
                document.getElementById('media-div').appendChild(div);
            }
         
            function participantDisconnected(participant) {
                console.log('Participant "%s" disconnected', participant.identity);
                document.getElementById("msg").innerHTML +=  
                      "<span style='color:red'> ID: " +participant.identity+ " Disconnected</span>"; 
         
                participant.tracks.forEach(trackRemoved);
                document.getElementById(participant.sid).remove();
                
            }
         
            function trackAdded(div, track) {
                div.appendChild(track.attach());
                var video = div.getElementsByTagName("video")[0];
                if (video) {
                    video.setAttribute("style", "max-width:300px;");
                    video.setAttribute("controls", "");
                }
            }
         
            function trackRemoved(track) {
                track.detach().forEach( function(element) { element.remove() });
            }
         
        </script>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif
            
            <div class="content">
                <div class="title m-b-md">
                    Video Chat Rooms
                </div>
                <div id="timer_div"></div>
                <div id="msg"></div>
                    
                <div id="media-div"></div>
            </div>
        </div>
    </body>
</html>
