import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:wp_hub_flutter/const/app_url.dart';
import 'package:wp_hub_flutter/view_model/user_view_model.dart';

class SocketExample extends StatefulWidget {
  @override
  _SocketExampleState createState() => _SocketExampleState();
}

class _SocketExampleState extends State<SocketExample> {
  UserViewModel _userViewModel = UserViewModel();
  late io.Socket socket;
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFwYXdhckBpbnNwZWVyby5jb20iLCJzdWIiOiI2NGRkY2RlY2YxNTkxNTI4YjM0YzZjZDgiLCJpYXQiOjE2OTI3NzgwMjksImV4cCI6MTY5MjgxNDAyOX0.VxYNSpvwh9Xew9erG1LEWP8ruYjmap9DB7WhuGoTYuY';
  // late String message;
  // late String status;
  // late bool isConnected;

  @override
  void initState() {
    super.initState();
    socketConnect();
    // message = "";
    // status = "";
    // isConnected = false;

    // Establish the socket connection

    // socket.onDisconnect((_) {
    //   setState(() {
    //     isConnected = false;
    //   });
    // });

    // socket.on('message', (data) {
    //   setState(() {
    //     message = data;
    //   });
    // });

    // socket.on('status', (data) {
    //   setState(() {
    //     status = data;
    //   });
    // });
  }

  void socketConnect() {
    socket = io.io(
        'https://wahub-be-dev.inspeero.in:8001',
        io.OptionBuilder()
            .enableForceNew()
            .enableMultiplex()
            .setExtraHeaders({'Authorization': "Bearer $token"})
            .setTransports(['websocket'])
            .disableAutoConnect()
            .disableReconnection()
            .build());
    socket.connect();
    connectAndListen();
   
  }

  void connectAndListen() async {
    socket.onConnect((_) => print('connect'));
    socket.onDisconnect((_) => print('disconnect'));
    socket.onError((_) {print(' Error');print(_);});
    socket.onConnecting((_) => print('connecting'));
    socket.onConnectError((_) {print('connect Error');print(_);});
    socket.onConnectTimeout((data) => print(' timeout'));
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Socket Example'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

