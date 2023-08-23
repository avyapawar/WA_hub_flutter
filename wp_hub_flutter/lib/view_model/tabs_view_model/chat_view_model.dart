import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/app_url.dart';
import 'package:wp_hub_flutter/data/network/api_services.dart';
import 'package:wp_hub_flutter/model/consersation_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:wp_hub_flutter/view_model/user_view_model.dart';

class ChatViewModel extends ChangeNotifier {
  late IO.Socket socket ;
  static final ChatViewModel _instance = ChatViewModel._internal();
  factory ChatViewModel() => _instance;
  ChatViewModel._internal();
  final UserViewModel _userViewModel = UserViewModel();
  final ApiServices _apiServices = ApiServices();

  List<Conversation> userContact = [];

  Future<void> fetchContacts() async {
    final accesToken =
        await _userViewModel.getUser().then((value) => value.accessToken);
    var headers = {
      'Authorization': ' Bearer $accesToken',
    };

    Map<String, dynamic> jsonResponse = await _apiServices
        .getApiResponseWithHeader(AppUrl.getUserContacts, headers);

    final List<dynamic> paginatedData = jsonResponse['data']['paginatedData'];
    userContact =
        paginatedData.map((json) => Conversation.fromJson(json)).toList();
    notifyListeners();
  }


  void socketConnect(){
  socket = IO.io(AppUrl.baseurl,IO.OptionBuilder().setExtraHeaders({'Authorization': ' Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFwYXdhckBpbnNwZWVyby5jb20iLCJzdWIiOiI2NGRkY2RlY2YxNTkxNTI4YjM0YzZjZDgiLCJpYXQiOjE2OTI3NzU0MzgsImV4cCI6MTY5MjgxMTQzOH0.-pOQnATJRW1_AnK0TM1WCe3R8jWheyAvDEapIZ9Ul6g' ,  'Connection': 'upgrade', 'Upgrade': 'websocket'}) .enableAutoConnect().enableForceNewConnection().setTransports(["websocket"]).build());
socket.connect();
socket.onConnect((data) {
  print('connected') ;
  print(socket.connected) ;
});
 print(socket.connected) ;
 socket.onConnectError((data) {
print(data);
 });
  }
}
