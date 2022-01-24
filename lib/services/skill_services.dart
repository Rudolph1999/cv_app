import 'package:cv_app/models/user_skills_model.dart';

import 'dart:convert';
import 'package:cv_app/models/full_user_model.dart';
import 'package:cv_app/models/shortend_user_model.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:http/http.dart' as http;


// This class handels the creation and gathering of the User skills fields via the api
class SkillService {
  Future<List<UserSkills>> getUserSkills(String email) async {
    var client = http.Client();
    List<UserSkills> userSkills = [];
    http.Response response = await client.get(Uri.parse(baseUrl + "skills/$email")).whenComplete(client.close);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        for (var skill in jsonDecode(response.body)) {
          userSkills.add(UserSkills.fromJson(skill));
        }
      }else{
          userSkills.add(UserSkills("No Skills",100," "));
      }

      return userSkills;
    } else {
      return throw Exception();
    }
  }

  void addUserSkill(String name, int proficiency, String email) async {
    var client = http.Client();
    UserSkills user = UserSkills(name, proficiency, email);

    http.Response response = await client
        .post(Uri.parse(baseUrl + "skills"),
            headers: {"content-type": "application/json"},
            body: jsonEncode(user))
        .whenComplete(client.close);
    print(response.statusCode);
  }
}
