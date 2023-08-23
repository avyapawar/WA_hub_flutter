import 'package:flutter/material.dart';
import 'package:wp_hub_flutter/util/utils.dart';
import 'package:wp_hub_flutter/view_model/user_view_model.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
   final UserViewModel _userViewModel = UserViewModel();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(child: IconButton(onPressed: ()async {
       _userViewModel.removeUser();
         WPUtils.flushBarMessage('logged off Successfully ', context) ;
     await Future.delayed(const Duration(seconds: 2));
       // ignore: use_build_context_synchronously
       Navigator.pushReplacementNamed(context,"login" ) ;

        }, icon:  const Icon(Icons.logout)),
        ),
    ) ;
  }
}