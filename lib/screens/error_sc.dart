import 'package:flutter/material.dart';

class ErrorSc extends StatelessWidget {
  static const String route = 'error-screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(child: Text('an error has occured , Try again Later'))),
    );
  }
}
