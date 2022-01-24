import 'package:cv_app/models/user_experiance_model.dart';
import 'dart:convert';
import 'package:cv_app/utils/constants.dart';
import 'package:http/http.dart' as http;


// This class handels the creation and gathering of the User experience fields via the api
class ExperianceService {
  Future<List<UserExperiance>> getUserExperiance(String email) async {
    var client = http.Client();
    List<UserExperiance> userExperiance = [];
    http.Response response = await client.get(Uri.parse(baseUrl + "experiance/$email")).whenComplete(client.close);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        for (var skill in jsonDecode(response.body)) {
          userExperiance.add(UserExperiance.fromJson(skill));
        }
      }
      return userExperiance;
    } else {
      return throw Exception();
    }
  }

  void addUserExperiance(String name, String city, String startDate,String endDate,String company,String description, String email) async {
    var client = http.Client();
    UserExperiance user = UserExperiance(name, city, startDate,endDate,company,description,email);

    http.Response response = await client
        .post(Uri.parse(baseUrl + "experiance"),
            headers: {"content-type": "application/json"},
            body: jsonEncode(user))
        .whenComplete(client.close);
    print(response.statusCode);
  }
}