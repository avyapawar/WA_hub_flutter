import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/Constants.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
 final TextEditingController _emailController = TextEditingController();
 final  TextEditingController _passWordController = TextEditingController();
  

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passWordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
     
  
    return Scaffold(
      backgroundColor: K.colorConst.screenBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              _getAppLogo(),
              _getHeaderText(),
              _getHeaderText2(),
              const SizedBox(
                height: 8,
              ),
              _getEnteredEmailField(),
              const SizedBox(
                height: 15,
              ),
              _getEnteredPassword(),
              const SizedBox(
                height: 67,
              ),
              InkWell(
                  onTap: (){
                  loginViewModel.onTapLogin(_emailController.text,_passWordController.text,context);

                  },
                  child: _getRoundTextBotton(loginViewModel.loading)),
                  const SizedBox(
                height: 10,
              ),
                InkWell(
                  onTap: (){
                    loginViewModel.onTapForgotPassword(context) ;
                  },
                  child: _forgotPasswordText()),
              const SizedBox(
                height: 80,
              ),
              _getbottomText(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: _inspeeroLogo(),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _getRoundTextBotton(bool isLoading) {
    return K.widgetConstants.roundTextButton("Login" ,isLoading );
  }

  Widget _getAppLogo() {
    return WPUtils.shared.getAssetImage(K.imageConst.on_boarding_wp_img);
  }

  Widget _inspeeroLogo() {
    return WPUtils.shared.getAssetImageSvg(K.imageConst.inspeeroImage);
  }

  Widget _getHeaderText() {
    return WPUtils.shared.getHeaderText("Welcome to WhatsApp");
  }

  Widget _getHeaderText2() {
    return WPUtils.shared.getHeaderText2("Business");
  }

  Widget _getbottomText() {
    return WPUtils.shared.bottomText("from");
  }
   Widget _forgotPasswordText() {
    return WPUtils.shared.bottomText("Forgot password ?");
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
        focusNode: emailFocusNode,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter email',
           
            prefixIcon: Icon(Icons.alternate_email)),
        onFieldSubmitted: (value) {
        
          WPUtils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
          
        },
      ),
    );
  }

  Widget _getEnteredPassword() {
    return ValueListenableBuilder(
      valueListenable: _obsecurePassword,
      builder: (context, value, child) => Container(
        height: 45,
        width: 303,
        decoration: BoxDecoration(
          color: K.colorConst.colorWhite,
          borderRadius: BorderRadius.circular(9),
        ),
        child: TextFormField(
          controller: _passWordController,
          obscureText: _obsecurePassword.value,
          focusNode: passwordFocusNode,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Password',
            prefixIcon: const Icon(Icons.lock_open_rounded),
            suffixIcon: InkWell(
                onTap: () {
                  _obsecurePassword.value = !_obsecurePassword.value;
                },
                child: Icon(_obsecurePassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility)),
          ),
        ),
      ),
    );
  }

 

}
