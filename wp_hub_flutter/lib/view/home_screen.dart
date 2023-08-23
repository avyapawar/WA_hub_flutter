import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view/tabs/call.dart';
import 'package:wp_hub_flutter/view/tabs/camera.dart';
import 'package:wp_hub_flutter/view/tabs/chat_home_screen.dart';
import 'package:wp_hub_flutter/view/tabs/group.dart';
import 'package:wp_hub_flutter/view/tabs/meet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
      late  TabController _tabController ;


@override
  void initState() {
_tabController = TabController(length: 5, vsync: this);    super.initState();
_tabController.animateTo(1) ;
  }
   @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: K.colorConst.screenBackgroundColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 22, bottom: 2, left: 11, right: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 267),
                        child: WPUtils.shared.homeScreenTitle('WhatsApp'),
                      ),
                      Container(
                        height: 15,
                      ),
                      SizedBox(
                        width: 360,
                        child: TabBar(
                            controller: _tabController,
                            tabs: getAllTabsIcons()),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: K.colorConst.colorWhite,
        body: TabBarView(
          controller: _tabController,
          children: getAllTabs())
      ),
    );
  }

  getAllTabsIcons() {
    return [
      K.widgetConstants.tab(K.imageConst.tabCameraImage, ''),
      K.widgetConstants.tab(K.imageConst.tabChatImage, 'Chat'),
      K.widgetConstants.tab(K.imageConst.tabGroupImage, 'Group'),
      K.widgetConstants.tab(K.imageConst.tabMeetImage, 'Meet'),
      K.widgetConstants.tab(K.imageConst.tabCallImage, 'Call'),
    ];
  }
   getAllTabs() {
    return const [
    Camera(),
    ChatHomeScreen(),
    Group(),
    Meet(),
    Call(),

    ];
  }
}
