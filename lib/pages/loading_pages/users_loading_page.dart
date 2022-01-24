
import 'package:cv_app/models/shortend_user_model.dart';
import 'package:cv_app/pages/recruiter_pages/recruiters_page.dart';
import 'package:cv_app/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// loading animation when the a user wants to view the "RecruitersPage" 
// future improvement:
//  -Make a generic loading page which replace both "details_load_page.dart" and "users_loading_page.dart"
class UsersLoading extends StatefulWidget {
  const UsersLoading({Key? key}) : super(key: key);


  @override
  _UsersLoadingState createState() => _UsersLoadingState();
}

class _UsersLoadingState extends State<UsersLoading> {
  @override
  void initState() {
  
    Navigator.of(context);
  }
  @override
  Widget build(BuildContext context) {
    getUsers();
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.black,
        ),
      ),
    );
  }

  void getUsers() async {
    UserService userService = UserService();
    List<ShortendUser> userData =  await userService.getUsers();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return  RecruitersPage(userData);
        },
      ),
    );
  }

   
}
