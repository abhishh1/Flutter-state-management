import 'package:flutter/material.dart';
import 'package:mango/provider/randomGenerator.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ranString =
        Provider.of<RandomGenerator>(context).getString;
    void generateString(BuildContext context) {
      Provider.of<RandomGenerator>(context, listen: false).generateInteger();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          generateString(context);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.present_to_all),
      ),
      appBar: AppBar(
        title: Text('Provider'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('$ranString'),
        ),
      ),
    );
  }
}
