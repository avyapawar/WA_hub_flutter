import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view_model/forgot_password_view_model.dart';
import 'package:wp_hub_flutter/view_model/login_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
          final loginViewModel = Provider.of<LoginViewModel>(context);
          final forgotPasswordViewModel = Provider.of<ForgotPasswordViewModel>(context);

    return Scaffold(
      backgroundColor: K.colorConst.screenBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 183),
            Center(child: WPUtils.shared.getAssetImageSvg(K.imageConst.forgotPasswordScreenLogo)),
            const SizedBox(
              height: 35,
            ),
            WPUtils.shared.getHeaderText2("Forgot Password"),
            const SizedBox(
              height: 30,
            ),
            _getEnteredEmailField(),
            const SizedBox(
              height: 58,
            ),
            InkWell(
              onTap: (){
                loginViewModel.onTapSensEmail(_emailController.text,context) ;
              },
              child: _getRoundTextBotton(loginViewModel.forgotLoading)),
              const SizedBox(
                height: 10,
              ),
               InkWell(
                  onTap: (){
                   forgotPasswordViewModel.onTapAlredyAccound(context) ;
                  },
                  child: _forgotPasswordText()),
             const SizedBox(
                height: 70,
              ),
             _getbottomText(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: _inspeeroLogo(),
              )
          ],
        ),
      ),
    );
  }

   Widget _forgotPasswordText() {
    return WPUtils.shared.bottomText("alredy have an account? Login");
  }

  Widget _getRoundTextBotton(bool isLoading) {
    return K.widgetConstants.roundTextButton("Send email", isLoading);
  }

   Widget _getbottomText() {
    return WPUtils.shared.bottomText("from");
  }

   Widget _inspeeroLogo() {
    return WPUtils.shared.getAssetImage(K.imageConst.inspeeroImage);
  }

  Widget _getEnteredEmailField() {
    return Container(
      height: 45,
      width: 303,
      decoration: BoxDecoration(
        color: K.colorConst.colorWhite,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Email to reset password',hintStyle: TextStyle(
              fontSize: 15
            ),
            prefixIcon: Icon(Icons.alternate_email)),
      ),
    );
  }
}
