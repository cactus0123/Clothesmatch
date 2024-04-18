import 'package:clothesmatch/Components/card_swipe.dart';
import 'package:clothesmatch/Services/database_service.dart';
import 'package:clothesmatch/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return CardSwipe(
        onSwipeRight: (() => appState.swipedRight()),
        onSwipeLeft: (() => appState.getNext()));
  }
}
