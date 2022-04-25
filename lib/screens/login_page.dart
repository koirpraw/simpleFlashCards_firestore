import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
final formkey = GlobalKey();
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formkey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
        controller: emailTextController,
            decoration: InputDecoration(

            ),
          )

        ],
      ),
    );
  }
}
