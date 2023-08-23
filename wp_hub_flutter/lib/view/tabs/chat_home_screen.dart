import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/model/consersation_response.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view/chat/chat.dart';
import 'package:wp_hub_flutter/view/socket.dart';
import 'package:wp_hub_flutter/view_model/tabs_view_model/chat_view_model.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  ChatViewModel _chatViewModel = ChatViewModel();
  @override
  void initState() {
    fetchContacts();

    super.initState();
  }

  void fetchContacts() async {
    await _chatViewModel.fetchContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void onTapConversationContact(Conversation contact) {
      //  Navigator.push(context,MaterialPageRoute(builder: (context){
      //   return SocketExample() ;
      // })) ;
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return Chat(conversation: contact) ;
      })) ;
    }
    return Scaffold(
        backgroundColor: K.colorConst.colorWhite,
        body: Stack(children: [
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _chatViewModel.userContact.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 12, right: 12, bottom: 9),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 55,
                        width: 341,
                        child: InkWell(
                            onTap:(){
                               onTapConversationContact(_chatViewModel.userContact[index]) ;
                            },
                            child: K.widgetConstants.conversationListTile(
                                _chatViewModel.userContact[index])),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Container(
                        height: 1,
                        width: 343,
                        color: K.colorConst.chatScreenLineColor,
                      )
                    ],
                  ),
                );
              }),
          Positioned(
              right: 90,
              bottom: 28,
              child: InkWell(
                  onTap: () {},
                  child: WPUtils.shared
                      .getAssetImageSvg(K.imageConst.chatHomeScreenMessageIcon)))
        ]));
  }
}
