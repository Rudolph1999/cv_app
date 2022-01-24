import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/services/experiance_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CreateExperiance extends StatefulWidget {
  String email;
  CreateExperiance(this.email, {Key? key}) : super(key: key);

  @override
  _CreateExperianceState createState() => _CreateExperianceState();
}

class _CreateExperianceState extends State<CreateExperiance> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final companyController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> click() async {
    ExperianceService experianceService = ExperianceService();
    // check if a email exits because the email will be act as a primary key
    setState(() {
      if (formkey.currentState!.validate()) {
        // saves the intial detail to the api
        experianceService.addUserExperiance(
            nameController.text,
            cityController.text,
            startDateController.text,
            endDateController.text,
            companyController.text,
            descriptionController.text,
            widget.email);

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
                customInputWidget(nameController, "Experiance title", Icon(Icons.person_outline_sharp)),
                customInputWidget(cityController, "City", Icon(Icons.location_city)),
                // The dates is simple text input at the moment ,might upgrade to a datepicker in the futer.
                customInputWidget(startDateController, "Start Date", Icon(Icons.date_range)),
                customInputWidget(endDateController, "End Date", Icon(Icons.date_range)),
                customInputWidget(companyController, "Company", Icon(Icons.house)),
                customInputWidget(descriptionController, "Description", Icon(Icons.description)),
                const SizedBox(height: 5),
                ElevatedButton(
                    onPressed: click, child: const Text("Add Experiance"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
