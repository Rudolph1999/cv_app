import 'package:cv_app/models/user_skills_model.dart';
import 'package:cv_app/pages/input_forms/create_skill_form.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SkillsPage extends StatelessWidget {
  List<UserSkills> skills;
  String email;
  bool canEdit;
  SkillsPage(this.skills,this.email,this.canEdit, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: middelColour,
      child: ExpansionTile(
        title: Text('Skills'),
        children: <Widget>[
          for (UserSkills user in skills) SkillsCard(user.name, double.parse(user.proficiency.toString())),if(canEdit) AddSkill(email)
        ],
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  String Skill = "";
  double Progress = 0;
  SkillsCard(String skill, double progress) {
    this.Skill = skill;
    this.Progress = progress /100;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: frontColur,
        child: ListTile(
          title: Text(
            Skill,
            style: TextStyle(fontFamily: 'SpacMoon'),
          ),
          trailing: CircularPercentIndicator(
            radius: 55.0,
            lineWidth: 8.0,
            percent: Progress,
            animation: true,
            animationDuration: 1000,
            center: Text(
              (Progress * 100).toStringAsFixed(0) + "%",
              style: TextStyle(fontFamily: "SpaceMoon"),
            ),
            progressColor: Colors.blueGrey,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ));
  }
}

class AddSkill extends StatefulWidget {
  String email ;
  AddSkill(this.email, {Key? key}) : super(key: key);

  @override
  _AddSkillState createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {

  @override
  Widget build(BuildContext context) {
    return Card(
       color: backColour,
      child: TextButton(
        child: const ListTile(
          leading: Icon(Icons.add),
          title: Text("Add skill"),
          
        ),
        onPressed:() => {

                  // goes toe the details page using the email as a search parameter
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CreateSkill(widget.email),
                    ),
                  )
                } ,
      ),
    );
  }
}
