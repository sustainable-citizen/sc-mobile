import 'package:flutter/material.dart';
import 'screens/navigation.dart';
import 'screens/login/login.dart';

final routes = {
  '/login': (BuildContext context) => LoginScreen(),
  '/home': (BuildContext context) => HomeScreen(),
  '/': (BuildContext context) => LoginScreen(),
};
