import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/services/education_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CreateEducation extends StatefulWidget {
 final String email;
  const CreateEducation(this.email, {Key? key}) : super(key: key);

  @override
  _CreateEducationState createState() => _CreateEducationState();
}

class _CreateEducationState extends State<CreateEducation> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final univercityController = TextEditingController();

  Future<void> click() async {
    EducationService educationService = EducationService();
    // check if a email exits because the email will be act as a primary key
    setState(() {
      if (formkey.currentState!.validate()) {
        // saves the intial detail to the api
        educationService.addUserEducation(
            nameController.text, univercityController.text, widget.email);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailsLoadingPage(widget.email, true),
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
                customInputWidget(nameController, "Degree", Icon(Icons.school)),
                customInputWidget(univercityController, "University", Icon(Icons.school)),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: click, child: const Text("Create Degree"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
