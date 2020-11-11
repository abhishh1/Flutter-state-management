import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mango/Services/Authentication.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String emailData = Provider.of<Authentication>(context).getEmail;
    Future regEmail(BuildContext context) {
      Provider.of<Authentication>(context, listen: false)
          .registerWithEmailAndPassword(
              emailController.text, passwordController.text);
    }

    Future signUpEmail(BuildContext context) {
      Provider.of<Authentication>(context, listen: false)
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Authentication'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter password',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey)),
            ),
          ),
          FlatButton.icon(
              color: Colors.redAccent,
              onPressed: () {
                regEmail(context).then((value) {
                  print(value);
                }).whenComplete(() {});
              },
              icon: Icon(EvaIcons.logIn),
              label: Text('Login')),
          FlatButton.icon(
              color: Colors.redAccent,
              onPressed: () {
                signUpEmail(context).then((value) {
                  print(value);
                });
              },
              icon: Icon(EvaIcons.logIn),
              label: Text('Signin'))
        ],
      )),
    );
  }
}
