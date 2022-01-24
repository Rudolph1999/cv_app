import 'package:cv_app/models/user_education_model.dart';
import 'dart:convert';
import 'package:cv_app/utils/constants.dart';
import 'package:http/http.dart' as http;


// This class handels the creation and gatherting of the users education 
class EducationService {
  Future<List<UserEducation>> getUserEducation(String email) async {
    var client = http.Client();
    List<UserEducation> userEducation = [];
    http.Response response = await client.get(Uri.parse(baseUrl + "education/$email")).whenComplete(client.close);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        for (var skill in jsonDecode(response.body)) {
          userEducation.add(UserEducation.fromJson(skill));
        }
      }
      return userEducation;
    } else {
      return throw Exception();
    }
  }

  void addUserEducation(String name, String university,String email) async {
    var client = http.Client();
    UserEducation user = UserEducation(name, university, email);
    http.Response response = await client
        .post(Uri.parse(baseUrl + "education"),
            headers: {"content-type": "application/json"},
            body: jsonEncode(user))
        .whenComplete(client.close);
    print(response.statusCode);
  }
}
