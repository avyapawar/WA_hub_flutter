import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';

class AnotherMessageCard extends StatefulWidget {
  const AnotherMessageCard({super.key});

  @override
  State<AnotherMessageCard> createState() => _AnotherMessageCardState();
}

class _AnotherMessageCardState extends State<AnotherMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100,
        ),
        child: Card(
          color: K.colorConst.anothersMessageCardColor,
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 13, right: 62),
                child: WPUtils.shared
                    .bottomText('kjegkjii')),
            Positioned(
              right: 12,
              bottom: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WPUtils.shared.messageCardTIme('12:12'),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
