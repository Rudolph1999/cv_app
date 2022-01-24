import 'dart:ui';

import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/services/user_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> click() async {
    UserService userService = UserService();
    bool valid = await userService.Login( emailController.text, passwordController.text);
    // check if a email exits because the email will be act as a primary key
    if(valid){

   
    setState(() {
      if (formkey.currentState!.validate()) {
        // saves the intial detail to the api
       

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailsLoadingPage(emailController.text, true),
          ),
        );
      }
    });
     }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Password is not valid")));
     }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            onPressed: () {Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )
                  );},
          ),
        ),
        backgroundColor: backColour,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customInputWidget(emailController, "Email", Icon(Icons.email)),
                customInputWidget(passwordController, "Password", Icon(Icons.password)),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: click, child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

