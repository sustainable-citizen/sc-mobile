import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};
