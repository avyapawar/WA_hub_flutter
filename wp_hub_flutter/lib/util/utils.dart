import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

class WPUtils {
  static final shared = WPUtils._();
  WPUtils._();

  ///LOAD ASSET IMAGE FROM LOCAL
  Image getAssetImage(String path) {
    return Image.asset(path,
    );
  }

    getAssetImageSvg(String path) {
    return SvgPicture.asset(path,
    fit: BoxFit.none,
    );
  }
  

  Widget getHeaderText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: K.colorConst.colorWhite,
        fontFamily: K.textFont.avenirNextCyr,
      ),
    );
  }

  Widget getHeaderText2(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: K.textFont.avenirNextCyr,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: K.colorConst.colorWhite),
    );
  }

  Widget bottomText(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.avenirNextCyr,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: K.colorConst.colorWhite));
  }

  Widget homeScreenTitle(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.avenirNextCyr,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: K.colorConst.colorWhite));
  }
   Widget chatScrenTitle(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.poppins,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: K.colorConst.colorWhite));
  }
  Widget chatScrenstatus(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.poppins,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: K.colorConst.colorWhite));
  }

  
  Widget tabsTitle(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.calibri,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: K.colorConst.tabsNameColor));
  }

  Widget listTileTitle(String text) {
    return Text(text,
    
        style: TextStyle(
          
            fontFamily: K.textFont.avenirNextCyr,
            fontSize: 16,
          fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: K.colorConst.blackColor));
  }

   Widget listTileSubTitle(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.avenirNextCyr,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: K.colorConst.blackColor));
  }

  Widget messageCardTIme(String text) {
    return Text(text,
        style: TextStyle(
            fontFamily: K.textFont.avenirNextCyr,
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: K.colorConst.colorWhite));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 2),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
      )..show(context),
    );
  }
}
