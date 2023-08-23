import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';

class OwnMessageCard extends StatefulWidget {
  const OwnMessageCard({super.key});

  @override
  State<OwnMessageCard> createState() => _OwnMessageCardState();
}

class _OwnMessageCardState extends State<OwnMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width -100 ,
    
      ),
      
      child: Card(
          
          color: K.colorConst.ownMessageCardColor,
          child:  Stack(
            children:[  Padding(
              padding: const EdgeInsets.only(top: 12 ,bottom: 12 , left: 13,right: 62),
              child:   WPUtils.shared.bottomText('tSKkSJDlksDasdkwkefWJEFLWEGljFkjest')
            ),
            Positioned(
          right: 12,
          bottom: 7,
         child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             WPUtils.shared.messageCardTIme('12:12'),
            const  SizedBox(width: 4,),
WPUtils.shared.getAssetImageSvg(K.imageConst.messageRead)  , 

        ],
         ),
      )
          
       ] ),
        ) , 
      ),
    );

    
  }
}