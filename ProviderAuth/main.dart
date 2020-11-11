import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mango/Screens/Homepage.dart';
import 'package:mango/Services/Authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: Authentication())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
  }
}
