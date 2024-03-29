import 'package:bloc/bloc.dart';
import 'package:coin_tracker/blocs/SimpleBlocDelegate.dart';
import 'package:flutter/material.dart';

import 'widgets/HomeWidget.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Coin tracker board'),
    );
  }
}
