

import 'package:cv_app/models/user_education_model.dart';
import 'package:cv_app/pages/input_forms/create_education_form.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';


class EducationPage extends StatelessWidget {
  List<UserEducation> userEducation;
  String email;
  bool canEdit;
   EducationPage(this.userEducation,this.email,this.canEdit,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: middelColour,
      child: ExpansionTile(title: const Text('Education'), children: <Widget>[for (UserEducation education in userEducation) EducationCard(education.name,education.university),
      if(canEdit) AddEducation(email)
      ]),
    );
  }
}

class EducationCard extends StatelessWidget {
  String  name ;
  String university;
  EducationCard(this.name,this.university,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
                color: frontColur,
              child:  Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(name,
                      style: const TextStyle(fontFamily: "SpaceMoon"),
                    ),
                  ),
                  ListTile(
                leading: const Icon(Icons.location_city),
                title: Text(university,
                  style: const TextStyle(fontFamily: "SpaceMoon"),
                ),
              ),
                ],
              ),
            ),
            
      ],
    );
  }
}

class AddEducation extends StatefulWidget {
  String email ;
  AddEducation(this.email, {Key? key}) : super(key: key);

  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backColour,
      child: TextButton(
        child: const ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Education"),
          
        ),
        onPressed:() => {

                  // goes toe the details page using the email as a search parameter
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CreateEducation(widget.email),
                    ),
                  )
                } ,
      ),
    );
  }
}
