import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
       routes: {
        SignupScreen.routeName:(ctx)=> SignupScreen(),
        LoginScreen.routeName:(ctx)=> LoginScreen(),
        HomeScreen.routeName:(ctx)=> HomeScreen(),
      },
    );
  }
}

