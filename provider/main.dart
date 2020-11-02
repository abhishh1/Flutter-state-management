import 'package:flutter/material.dart';
import 'package:mango/provider/homepage.dart';
import 'package:mango/provider/randomGenerator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: RandomGenerator())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()));
  }
}
