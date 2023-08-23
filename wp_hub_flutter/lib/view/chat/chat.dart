import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/model/consersation_response.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view/chat/another_message_card.dart';
import 'package:wp_hub_flutter/view/chat/own_message_card.dart';
import 'package:wp_hub_flutter/view_model/tabs_view_model/chat_view_model.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, required this.conversation});
  final Conversation conversation;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // ChatViewModel _chatViewModel = ChatViewModel() ;
  TextEditingController _textEditingController = TextEditingController();
  bool isShowEmojiPicker = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _chatViewModel.socketConnect() ;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isShowEmojiPicker = false;
        });
      }
    });
  }


  
  // build method

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(),
        body: WillPopScope(
          onWillPop: () {
            if (isShowEmojiPicker) {
              setState(() {
                isShowEmojiPicker = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Column(
            children: [
              Container(
                height:isShowEmojiPicker ? height -394- MediaQuery.of(context).viewInsets.bottom  :height -145- MediaQuery.of(context).viewInsets.bottom   ,
                child: ListView(
                  shrinkWrap:  true,
                  children: const [
                    OwnMessageCard(),
                    AnotherMessageCard(),
                    OwnMessageCard(),
                    AnotherMessageCard(),
                    OwnMessageCard(),
                    AnotherMessageCard(),OwnMessageCard(),
                    AnotherMessageCard(),
                    OwnMessageCard(),
                    AnotherMessageCard(),
                    OwnMessageCard(),
                    AnotherMessageCard(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.25, color: K.colorConst.blackColor),
                            borderRadius: BorderRadius.circular(50)),
                       
                        child: Center(

                          child: TextFormField(
                            focusNode: _focusNode,
                            controller: _textEditingController,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              
                                border: InputBorder.none,
                                hintText: 'Message.....',
                                hintStyle: TextStyle(
                                    fontFamily: K.textFont.poppins,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: K.colorConst.chatHintTextColor),
                                prefixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _focusNode.unfocus();
                                      _focusNode.canRequestFocus = false;
                                      isShowEmojiPicker = !isShowEmojiPicker;
                                    });
                                  },
                                  child: Container(
                                    height: 23,
                                                                        width: 23,

                                    child: WPUtils.shared
                                      .getAssetImageSvg(K.imageConst.emoji,
                                      
                                      ),
                                  ) 
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                          onTap: _onTapAttachDocuments,
                                          child: WPUtils.shared.getAssetImageSvg(
                                              K.imageConst.attchDocuments)),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: WPUtils.shared.getAssetImageSvg(
                                              K.imageConst.microphone)),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: WPUtils.shared.getAssetImageSvg(
                                              K.imageConst.sendMessage)),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: isShowEmojiPicker, child: getEmojiboard())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      leadingWidth: MediaQuery.of(context).size.width,
      toolbarHeight: 63,
      backgroundColor: K.colorConst.screenBackgroundColor,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
          ),
          K.widgetConstants.circleAvtar(20),
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WPUtils.shared
                      .chatScrenTitle(widget.conversation.profile.name),
                  WPUtils.shared.chatScrenstatus(widget.conversation.status)
                ],
              ),
            ),
          ),
          WPUtils.shared.getAssetImageSvg(K.imageConst.chatCallImage),
          const SizedBox(
            width: 30,
          ),
          WPUtils.shared.getAssetImageSvg(K.imageConst.chatVideoImage),
          const SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: WPUtils.shared.getAssetImageSvg(K.imageConst.chatMenuImage),
          ),
        ],
      ),
    );
  }

  Widget getEmojiboard() {
    return SizedBox(
        height: 250,
        child: EmojiPicker(
            // onEmojiSelected: (category, emoji) {
            //   setState(() {
            //     _textEditingController.text =
            //         _textEditingController.text + emoji.emoji;
            //   });
            // },
            textEditingController: _textEditingController,
            config: const Config(
                columns: 7,
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                skinToneDialogBgColor: Colors.white,
                skinToneIndicatorColor: Colors.grey,
                enableSkinTones: true,
                recentTabBehavior: RecentTabBehavior.RECENT,
                recentsLimit: 28,
                replaceEmojiOnLimitExceed: false,
                noRecents: Text(
                  'No Recents',
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                  textAlign: TextAlign.center,
                ))));
  }

  void _onTapAttachDocuments() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         ),
            //        const  SizedBox(width : 30),
            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         ),
            //                            const  SizedBox(width : 30),

            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         )
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         ),
            //                            const  SizedBox(width : 30),

            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         ),
            //                            const  SizedBox(width : 30),

            //         Column(
            //           children: [
            //             K.widgetConstants.circleAvtar(20),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             const Text('doc')
            //           ],
            //         )
            //       ],
            //     )
            //   ],
            // ),
          );
        });
  }
}
