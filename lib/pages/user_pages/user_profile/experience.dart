import 'package:cv_app/models/user_experiance_model.dart';
import 'package:cv_app/pages/input_forms/create_experiance_form.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';


class ExperiancePage extends StatelessWidget {
  List<UserExperiance> userExperiance;
  String email;
  bool canEdit;
  ExperiancePage(this.userExperiance,this.email,this.canEdit,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: middelColour,
      child: ExpansionTile(
        title: Text('Experiance'),
        children: <Widget>[ for (UserExperiance experiance in userExperiance) ExperienceCard(experiance.name,experiance.startDate+"-"+experiance.endDate,experiance.city,experiance.company,experiance.description),
         if(canEdit) AddExperiance(email)
  
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  String experiance ;
  String date ;
  String location;
  String company ;
  String decription;

  ExperienceCard(this.experiance,this.date,this.location,this.company,this.decription, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: frontColur,
      child: ListTile(
        title:
            ExpansionTile(title: SpaceMoonText(experiance), children: <Widget>[
          ListTile(
            leading: const Icon(Icons.date_range),
            title: Text(date),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: SpaceMoonText(location),
          ),
          ListTile(
            leading: const Icon(Icons.work_sharp),
            title: SpaceMoonText(company),
          ),
          ListTile(
            title: SpaceMoonText(decription),
          ),
        ]),
      ),
    );
  }

  
}

class AddExperiance extends StatefulWidget {
  String email ;
  AddExperiance(this.email, {Key? key}) : super(key: key);

  @override
  _AddExperianceState createState() => _AddExperianceState();
}

class _AddExperianceState extends State<AddExperiance> {

  @override
  Widget build(BuildContext context) {
    return Card(
       color: backColour,
      child: TextButton(
        child: const ListTile(
          leading: Icon(Icons.add),
          title: Text("Add Experiance"),
          
        ),
        onPressed:() => {

                  // goes toe the details page using the email as a search parameter
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CreateExperiance(widget.email),
                    ),
                  )
                } ,
      ),
    );
  }
}