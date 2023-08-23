import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view_model/welcome_page_view_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final welcomePageViewModel = Provider.of<WelcomePageViewModel>(context);

    return Scaffold(
      backgroundColor: K.colorConst.screenBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 300,
            ),
            _getAppLogo(),
            const SizedBox(
              height: 19,
            ),
            _getHeaderText(),
            _getHeaderText2(),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                  onTap: () {
                    welcomePageViewModel.checkAuthentication(context);
                  },
                  child: _getRoundTextBotton(welcomePageViewModel.isLoading)),
            ),
            const SizedBox(
              height: 100,
            ),
            _getbottomText(),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _inspeeroLogo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppLogo() {
    return WPUtils.shared.getAssetImageSvg(K.imageConst.appLogo);
  }

  Widget _inspeeroLogo() {
    return WPUtils.shared.getAssetImageSvg(K.imageConst.inspeeroImage);
  }

  Widget _getHeaderText() {
    return WPUtils.shared.getHeaderText('Welcome to WhatsApp');
  }

  Widget _getHeaderText2() {
    return WPUtils.shared.getHeaderText2("Business");
  }

  Widget _getbottomText() {
    return WPUtils.shared.bottomText("from");
  }

  Widget _getRoundTextBotton(bool isLoading) {
    return K.widgetConstants.roundTextButton("Continue", isLoading);
  }
}
