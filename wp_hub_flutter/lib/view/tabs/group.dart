import 'package:flutter/material.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child: Text('group')),
    ) ;
  }
}