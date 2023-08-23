import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/model/consersation_response.dart';
import 'package:wp_hub_flutter/util/utils.dart';

class WidgetConstantas {
  Container roundTextButton(String text, bool isLoading) {
    return Container(
      height: 45,
      width: 236,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: K.colorConst.containerBackgroundColor),
      child: Stack(alignment: Alignment.center, children: [
        Visibility(
            visible: isLoading,
            child: CircularProgressIndicator(
              color: K.colorConst.colorWhite,
            )),
        Visibility(
          visible: !isLoading,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: K.colorConst.colorWhite),
          ),
        ),
      ]),
    );
  }

  Tab tab(String image, String text) {
    return Tab(
      child: Column(
        children: [
          SizedBox(height: 22, width: 22, child: WPUtils.shared.getAssetImageSvg (image)),
          WPUtils.shared.tabsTitle(text),
        ],
      ),
    );
  }

  CircleAvatar unReadMessagesAvator(int noOfMessages) {
    return CircleAvatar(
        maxRadius: 11,
        backgroundColor: K.colorConst.unReadMessagesAvatorColor,
        child: Center(child: Text('$noOfMessages')));
  }

  CircleAvatar circleAvtar(double maxRadius) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      maxRadius: maxRadius,
    );
  }

  ListTile conversationListTile(Conversation conversation) {
    return ListTile(
      leading:circleAvtar(27.5),
      
      title: WPUtils.shared.listTileTitle(conversation.profile.name),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: WPUtils.shared.listTileSubTitle(conversation.phoneNumber),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
              ),
              child: WPUtils.shared.listTileSubTitle('12:12'),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: false,
                child: K.widgetConstants.unReadMessagesAvator(1)),
            Visibility(
              visible: true,
              child: Stack(children: [
                Icon(
                  Icons.done_all,
                  color: K.colorConst.messageReadColor,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
