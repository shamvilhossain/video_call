<?php

 namespace App\Http\Controllers;

 use Illuminate\Http\Request;
 use Illuminate\Support\Facades\Auth;
 use Twilio\Rest\Client;
 use Twilio\Jwt\AccessToken;
 use Twilio\Jwt\Grants\VideoGrant;
 use DB;

 class VideoRoomsController extends Controller
 {
     protected $sid;
     protected $token;
     protected $key;
     protected $secret;

     public function __construct()
     {
         $this->sid = config('services.twilio.sid');
         $this->token = config('services.twilio.token');
         $this->key = config('services.twilio.key');
         $this->secret = config('services.twilio.secret');
     }

     public function index()
     {
         $rooms = [];
         try {
             $client = new Client($this->sid, $this->token);
             $allRooms = $client->video->rooms->read([]);

             $rooms = array_map(function ($room) {
                 return $room->uniqueName;
             }, $allRooms);
         } catch (Exception $e) {
             echo "Error: " . $e->getMessage();
         }
         return view('index', ['rooms' => $rooms]);
     }

     public function createRoom(Request $request)
     {
         $client = new Client($this->sid, $this->token);
         $exists = $client->video->rooms->read(['uniqueName' => $request->roomName]);

         if (empty($exists)) {
             $room_info = $client->video->rooms->create([
                 'uniqueName' => $request->roomName,
                 'type' => 'group',
                 'maxParticipants' => 3,
                 'recordParticipantsOnConnect' => false
             ]);

             \Log::debug("created new room: " . $request->roomName);
         
        // insert in room tbl
                  
	        $room_data=array();
	        $room_data['sid']= $room_info->sid;
	        $room_data['room_name']= $room_info->uniqueName;
	        $room_data['type']= $room_info->type;
	        $room_data['max_participant']= $room_info->maxParticipants;
	        $room_data['start_time']= date("Y-m-d H:i:s");
	        $room_data['duration']= 0;
	        $room_data['url']= $room_info->url;
	        $room_data['active_status']= $room_info->status;
	        DB::table('conf_rooms')->insert($room_data);
        }
         return redirect()->action('VideoRoomsController@joinRoom', [
             'roomName' => $request->roomName,
             'user_id' => $request->user_id,
             'room_sid' => $room_info->sid
         ]);
     }

     public function joinRoom($roomName,$user_id,$room_sid)
     {
        // A unique identifier for this user
        // $identity = Auth::user()->name;
        // $identity = uniqid();
        $identity = rand(3,1000);
        $user_info=DB::table('users')->where('id',$user_id)->first();
        $identity = $user_info->name;

         \Log::debug("joined with identity: $identity");
         $token = new AccessToken($this->sid, $this->key, $this->secret, 3600, $identity);
         //print_r($token);exit; 
         // update token in user tbl // no need
         //DB::table('users')->where('id',$user_id)->update(['token' => $token->accountSid]);
         $videoGrant = new VideoGrant();
         $videoGrant->setRoom($roomName);

         $token->addGrant($videoGrant);
        
         // insert into room-participant tbl + individual join time
			$room_member=array();
	        $room_member['user_id']= $user_id;
	        $room_member['room_sid']= $room_sid;
	        $room_member['join_time']= date("Y-m-d H:i:s");
	        $room_member['status']= 1;
	        DB::table('conf_room_participants')->insert($room_member);
	        // var_dump($token->toJWT());
	        // var_dump($roomName);
	        // dd();
         return view('room', ['accessToken' => $token->toJWT(), 'roomName' => $roomName]);
     }

     public function disconnectRoom($room_sid)
     {
        // http://localhost/video_call_3/public/room/disconnect/abcd or sid
        $client = new Client($this->sid, $this->token);
        $room = $client->video->rooms($room_sid)->update("completed");
 
        // update into room tbl
        $room_data=array();
    	$room_data['end_time']=date("Y-m-d H:i:s");
    	$room_data['duration']=$room->duration;
    	$room_data['active_status']=$room->status;
    	DB::table('conf_rooms')->where('sid',$room_sid)->update($room_data);  // or where roomName
        // update into room-participant tbl individual disconnect time
        $room_member=array();
    	$room_member['disconnect_time']=date("Y-m-d H:i:s");
    	$room_member['status']=0;
    	DB::table('conf_room_participants')->where('room_sid',$room_sid)->update($room_member);  // or where roomname
        echo '<pre>';                  
		print_r($room->endTime);
		echo '</pre>';  
		exit;
       
     }
 }