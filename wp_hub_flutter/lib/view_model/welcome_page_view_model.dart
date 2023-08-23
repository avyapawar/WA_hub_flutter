import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/const/constants.dart';
import 'package:wp_hub_flutter/model/user_model.dart';
import 'package:wp_hub_flutter/view_model/user_view_model.dart';

class WelcomePageViewModel with ChangeNotifier {
static final WelcomePageViewModel _instance = WelcomePageViewModel._internal();
  factory WelcomePageViewModel() => _instance;
  WelcomePageViewModel._internal();
  
  Future<Data> getUserData = UserViewModel().getUser();

  bool isLoading = false  ;

  void checkAuthentication(BuildContext context) async {
    isLoading = true ;
    notifyListeners() ;
    await Future.delayed(const Duration(seconds: 1));
    getUserData.then((value) {
      if (value.accessToken == 'null' || value.accessToken == '') {
         
        Navigator.of(context).pushNamed(K.appRuotes.login);
         isLoading = false ;
         notifyListeners() ;
       
        
      } else {
         
        Navigator.of(context).pushReplacementNamed(K.appRuotes.home);
         isLoading = false ;
    notifyListeners() ;
       
        
      }
       
    }).onError((error, stackTrace) {});
   
  }
  
}












//   user  logging off

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final UserViewModel _userViewModel = UserViewModel();
//   final WelcomePageViewModel _welcomePageViewModel = WelcomePageViewModel();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         actions: [IconButton(onPressed: (){
//        _userViewModel.removeUser();
//         _welcomePageViewModel.checkAuthentication(context) ;

//         }, icon:  const Icon(Icons.logout))],
//         backgroundColor: K.colorConst.screenBackgroundColor,
//         title:   Text('WhatsApp',
//         style: TextStyle(color: K.colorConst.colorWhite),),
//       ),
//       backgroundColor: K.colorConst.colorWhite,
//       body: const  Center(child: Text('Home screen'),
//       ),
//     ) ;
//   }
// }