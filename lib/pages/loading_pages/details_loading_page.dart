import 'package:cv_app/models/concatenated_user_model.dart';
import 'package:cv_app/models/full_user_model.dart';
import 'package:cv_app/models/user_education_model.dart';
import 'package:cv_app/models/user_experiance_model.dart';
import 'package:cv_app/models/user_skills_model.dart';
import 'package:cv_app/pages/user_pages/user_profile/user_profile_main.dart';
import 'package:cv_app/services/education_services.dart';
import 'package:cv_app/services/experiance_services.dart';
import 'package:cv_app/services/skill_services.dart';
import 'package:cv_app/services/user_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



// loading animation when the user wants to see the details page
// future improvement:
//  -Make a generic loading page which replace both "details_load_page.dart" and "users_loading_page.dart"
class DetailsLoadingPage extends StatefulWidget {
  String email;
  bool canEdit;
   DetailsLoadingPage(this.email,this.canEdit) ;

  @override
  _DetailsLoadingPageState createState() => _DetailsLoadingPageState();
}

class _DetailsLoadingPageState extends State<DetailsLoadingPage> {
  @override
  Widget build(BuildContext context) {
    // sleep(const Duration(seconds: 5));
    getUsersDetails();
    return  Scaffold(
      backgroundColor: backColour,
      body: const Center(
        child: SpinKitChasingDots(
          color: Colors.white,
        ),
      ),
    );
  }

  void getUsersDetails() async {

    // gets all the user details 
    UserService userService = UserService();
    FullUser fullUser = await userService.getDetails(widget.email);
    
    // gets all the user skills 
    SkillService skillService = SkillService();
    List<UserSkills> userSkills = await skillService.getUserSkills(widget.email);

    // gets all the user work experiances 
    ExperianceService experianceService = ExperianceService();
    List<UserExperiance> userExperiance = await experianceService.getUserExperiance(widget.email);

    // gets all the users education 
    EducationService educationService = EducationService();
    List<UserEducation> userEducation = await educationService.getUserEducation(widget.email);
    
    ConcatenatedUser concatenatedUser = ConcatenatedUser(fullUser,userSkills,userExperiance,userEducation);
    
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return UserProfile(concatenatedUser,widget.canEdit);
        },
      ),
    );
  }
}