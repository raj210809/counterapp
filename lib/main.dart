

import 'package:counterapp/features/binary/binary_sreen.dart';
import 'package:counterapp/features/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/features/counter/bloc/counterbloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  int index = 0;

  // Provide CounterBloc in BlocProvider to CounterScreen
  final _pages = [
    BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterScreen(),
    ),
    BinaryView()
  ];

  void onClick(int index) {
    setState(() => this.index = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'int to binary',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        body: _pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: onClick,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'counter'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'binary')
          ],
        ),
      ),
    );
  }
}