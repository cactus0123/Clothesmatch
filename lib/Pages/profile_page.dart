import 'package:flutter/material.dart';
class Profile extends StatelessWidget{
    const Profile ({super.key});
    
      @override
      Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.purple,
                    title :Center(
                        child: const Text('My Profile'),
                    )
                ),
      body: ListView(
        children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 152, 89, 220), Color.fromARGB(255, 185, 155, 231)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
            )]));

}}