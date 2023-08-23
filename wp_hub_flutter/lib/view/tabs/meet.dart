import 'package:flutter/material.dart';

class Meet extends StatefulWidget {
  const Meet({super.key});

  @override
  State<Meet> createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child: Text('meet')),
    ) ;
  }
}