import 'package:cv_app/pages/home_page.dart';
import 'package:cv_app/pages/loading_pages/details_loading_page.dart';
import 'package:cv_app/services/user_services.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:cv_app/utils/custom_widgets.dart';
import 'package:flutter/material.dart';



// This is the create user form where a user can provide his intial details to be saved
// The user will then navigated to another page where he can add skills ,education ,etc 
class CreateUserForm extends StatefulWidget {


  @override
  _CreateUserFormState createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final descriptionController = TextEditingController();
  final passwordController = TextEditingController();
  final subTileController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberControler = TextEditingController();

@override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    descriptionController.dispose();
    passwordController.dispose();
    emailController.dispose();
    subTileController.dispose();
    phoneNumberControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
         appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            onPressed: () {Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )
                  );},
          ),title: Text("Create account"),
        ),
        backgroundColor: backColour,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customInputWidget(nameController,"First name",Icon(Icons.person_outline_sharp),),
                  customInputWidget(surnameController, "surname", Icon(Icons.person_outline_sharp)),
                  customInputWidget(subTileController, "Sub title", Icon(Icons.person_outline_sharp)),             
                  customInputWidget(emailController, "Email", Icon(Icons.email)),
                  customInputWidget(phoneNumberControler, "Phone number", Icon(Icons.phone)),
                  customInputWidget(descriptionController, "Descripttion", Icon(Icons.description)),
                  customInputWidget(passwordController, "password", Icon(Icons.password)),
                  const SizedBox(height: 5),
                  ElevatedButton(
                      onPressed: click, child: const Text("Create Account"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> click() async {
     UserService userService = UserService();
     // check if a email exits because the email will be act as a primary key
     bool emailExist = await userService.emailExist(emailController.text);
    setState(()  {     
      if (emailExist){
      if(formkey.currentState!.validate()){
      // saves the intial detail to the api 
      userService.addUser(
          nameController.text,
          surnameController.text,
          subTileController.text,
          emailController.text,
          phoneNumberControler.text,
          descriptionController.text,
          passwordController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsLoadingPage(emailController.text,true),
        ),
      );
      }
       }else{
         
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Email already in use"),
    ));
       }
    });
    
  }
}




// check if the email is valid 
// found code https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}