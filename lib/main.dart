 import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blogify_app/views/splash_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blogify App',
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}