import 'package:cv_app/models/full_user_model.dart';
import 'package:cv_app/models/user_education_model.dart';
import 'package:cv_app/models/user_experiance_model.dart';
import 'package:cv_app/models/user_skills_model.dart';



class ConcatenatedUser{
  FullUser userDetails;
  List<UserSkills> userSkills;
  List<UserExperiance> userExperiance;
  List<UserEducation> userEducation;
  ConcatenatedUser(this.userDetails,this.userSkills,this.userExperiance,this.userEducation);

  
}