import 'package:cv_app/models/concatenated_user_model.dart';
import 'package:cv_app/models/full_user_model.dart';
import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/loading_pages/users_loading_page.dart';
import 'package:cv_app/pages/recruiter_pages/recruiters_page.dart';
import 'package:cv_app/pages/user_pages/user_profile/education.dart';
import 'package:cv_app/pages/user_pages/user_profile/experience.dart';
import 'package:cv_app/pages/user_pages/user_profile/skills.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';

// This was the user details page where evering about the user is shown
class UserProfile extends StatelessWidget {
  ConcatenatedUser user;
  bool canEdit;
  UserProfile(this.user, this.canEdit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_sharp),
          onPressed: () {
            if (canEdit) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            }else{
               Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => UsersLoading(),
              ));
            }
          },
        ),
      ),
      backgroundColor: backColour,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: backColour,
                  backgroundImage:
                      AssetImage('assets/images/flame-graduation.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.userDetails.username,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MoonDance'),
                ),
                Text(
                  user.userDetails.subtitle,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'SpaceMoon',
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 250,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Card(
                    color: middelColour,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: backColour,
                      ),
                      title: Text(
                        user.userDetails.phone,
                        style: TextStyle(fontFamily: 'SpaceMoon'),
                      ),
                    )),
                SizedBox(height: 5),
                Card(
                    color: middelColour,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: backColour,
                      ),
                      title: Text(
                        user.userDetails.email,
                        style: TextStyle(fontFamily: 'SpaceMoon'),
                      ),
                    )),
                SizedBox(height: 10),
                Text(
                  "About Me",
                  style: TextStyle(
                    fontFamily: 'SpaceMoon',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    user.userDetails.description,
                    style: TextStyle(
                      fontFamily: 'SpaceMoon',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 250,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SkillsPage(
                      user.userSkills, user.userDetails.email, canEdit),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ExperiancePage(
                      user.userExperiance, user.userDetails.email, canEdit),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: EducationPage(
                      user.userEducation, user.userDetails.email, canEdit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
