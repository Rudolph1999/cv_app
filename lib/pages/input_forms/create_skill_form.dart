import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/services/skill_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CreateSkill extends StatefulWidget {
  String email;
  CreateSkill(this.email, {Key? key}) : super(key: key);

  @override
  _CreateSkillState createState() => _CreateSkillState();
}

class _CreateSkillState extends State<CreateSkill> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final proficiencyController = TextEditingController();

  Future<void> click() async {
    SkillService skillService = SkillService();
    // check if a email exits because the email will be act as a primary key
    setState(() {
      if (formkey.currentState!.validate()) {
        // saves the intial detail to the api
        skillService.addUserSkill(nameController.text,
            int.parse(proficiencyController.text), widget.email);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailsLoadingPage(widget.email,true),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColour,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customInputWidget(nameController, "Skill name", Icon(Icons.poll_rounded)),
                // did not use customInputWidgit becuase the extra validation 
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      suffixIcon: Text("%"),
                      prefixIcon: Icon(Icons.person_outline_sharp),
                      labelText: "Skill proficiency"),
                  controller: proficiencyController,
                  validator: (value) {
                    //only allow numbers
                    if (RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                      if (value == null || value.isEmpty) {
                        return "Please provide the skill proficiency";
                      }
                      //check if the value is between 0-100
                      if (int.parse(value.toString()) > 100) {
                        return "Please  provide a value between 0-100";
                      }
                    } else {
                      return "Please only enter numbers";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: click, child: const Text("Create Skill"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
