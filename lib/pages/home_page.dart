import 'package:cv_app/pages/loading_pages/users_loading_page.dart';
import 'package:cv_app/pages/user_pages/login_page.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'input_forms/create_user_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        backgroundColor: backColour,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Column(
              children: const [
                Text(
                  "Find a Graduate",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Moondance",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Create an account or if your are a recruiter view all the graduates",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Moondance",
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Expanded(child: UserColumn()),
            Expanded(child: RecruterColumn())
          ]),
        ),
      ),
    );
  }
}

class LogInButton extends StatefulWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  void click() {
    setState(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: click,
        child: Column(
          children: [
            Expanded(
              child: Text("Login in",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "MoonDance",
                      fontWeight: FontWeight.bold)),
              flex: 1,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/sign-in.png"),
                          fit: BoxFit.fill),
                      shape: BoxShape.rectangle),
                )),
          ],
        ));
  }
}

class RecruterButton extends StatefulWidget {
  const RecruterButton({Key? key}) : super(key: key);

  @override
  _RecruterButtonState createState() => _RecruterButtonState();
}

class _RecruterButtonState extends State<RecruterButton> {
  void click() {
    setState(() {
      UsersLoading();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const UsersLoading(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: click,
        child: Column(
          children: [
            Expanded(
              child: Text("View graduates",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "MoonDance",
                      fontWeight: FontWeight.bold)),
              flex: 1,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/flame-find.png"),
                          fit: BoxFit.fill),
                      shape: BoxShape.rectangle),
                )),
          ],
        ));
  }
}

class CreateUserButton extends StatefulWidget {
  const CreateUserButton({Key? key}) : super(key: key);

  @override
  _CreateUserButtonState createState() => _CreateUserButtonState();
}

class _CreateUserButtonState extends State<CreateUserButton> {
  void click() {
    setState(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CreateUserForm(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: click,
        child: Column(
          children: [
            Expanded(
              child: Text("Create account",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "MoonDance",
                      fontWeight: FontWeight.bold)),
              flex: 1,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/flame-create.png"),
                          fit: BoxFit.fitWidth),
                      shape: BoxShape.rectangle),
                )),
          ],
        ));
  }
}

class UserColumn extends StatelessWidget {
  const UserColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Card(color: frontColur, child: LogInButton())),
        Expanded(child: Card(color: frontColur, child: CreateUserButton()))
      ],
    );
  }
}

class RecruterColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(color: frontColur, child: RecruterButton());
  }
}
