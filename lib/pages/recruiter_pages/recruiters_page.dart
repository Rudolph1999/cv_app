import 'dart:async';

import 'package:cv_app/models/shortend_user_model.dart';
import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';

// This page will list all the users
class RecruitersPage extends StatefulWidget {
  final List<ShortendUser> users;
  RecruitersPage(this.users);

  @override
  _RecruitersPageState createState() => _RecruitersPageState();
}

class _RecruitersPageState extends State<RecruitersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColour,
          appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            onPressed: () {Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )
                  );},
          ),title: Text("Graduates"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // iterates through all the users
                for (ShortendUser user in widget.users)
                  UserCards(user.username,user.email)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// card used to display each user in a neat card
class UserCards extends StatefulWidget {
  String username;
  String email;
  UserCards(this.username,this.email);

  @override
  _UserCardsState createState() => _UserCardsState();
}

class _UserCardsState extends State<UserCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: frontColur,
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: middelColour,
          // flame-graduation.png is the default image that is curretly used.
          // The app currently does not have the functionality to save a image, but will use a web services such as cloudinary in the future.
          backgroundImage: AssetImage('assets/images/flame-graduation.png'),
        ),
        title: Text(widget.username),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            splashColor: Colors.blue,
            tooltip: "view Graduate details",
            onPressed: () => {

                  // goes toe the details page using the email as a search parameter
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DetailsLoadingPage(widget.email,false),
                    ),
                  )
                }),
      ),
    );
  }
}
