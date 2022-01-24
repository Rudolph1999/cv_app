import 'package:flutter/material.dart';


//This is used as a placeholder for sections that is not yet implemented.
class InProgressPage extends StatelessWidget {
  const InProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(child: Text("Work in progress")),
      ),
    );
  }
}
