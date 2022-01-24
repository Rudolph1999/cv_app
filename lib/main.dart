import 'package:cv_app/pages/home_page.dart';
import 'package:flutter/material.dart';


// @author Rudolph Myburg
// This is an expansion of my original cv app which consisted out  of static fields.
//Improvements made:
// -This app can nou show more than one user cv
// -This app has basic input validation 
// -This app has a really basic login system
// -A user can add his own details
// -A user can add multiple Skills 
// -A user can add multiple Educations 
// -A user can add multiple work Experiances 
// -A recruiter can view all the users with all their details (He cannot edit it)


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV app',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

