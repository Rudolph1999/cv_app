import 'dart:convert';
import 'package:cv_app/models/full_user_model.dart';
import 'package:cv_app/models/shortend_user_model.dart';
import 'package:cv_app/utils/constants.dart';
import 'package:http/http.dart' as http;



class UserService {
  Future<List<ShortendUser>> getUsers() async {
    var client = http.Client();
    List<ShortendUser> limitedUser = [];
    http.Response response = await client.get(Uri.parse(baseUrl + "users")).whenComplete(client.close);
    if (response.statusCode == 200) {

     for (var user in jsonDecode(response.body)){
       limitedUser.add(ShortendUser.fromJson(user));
     }
  
      return   limitedUser;
    } else {
      return throw Exception();
    }
  }

  Future<bool> emailExist (String email) async{
      var client = http.Client();
      http.Response response = await client.get(Uri.parse(baseUrl + "users/$email")).whenComplete(client.close);
    if (response.statusCode == 404) {
      return true;
    } else {
      return false;
    }

  }

  Future<bool> Login(String email,String password) async{
      var client = http.Client();
      http.Response response = await client.get(Uri.parse(baseUrl + "users/$email/$password")).whenComplete(client.close);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }

    Future<FullUser> getDetails(String email) async {
    http.Response response = await http.get(Uri.parse(baseUrl + "userdetails/$email"));
    if (response.statusCode == 200) {
      return   FullUser.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception(response.statusCode);
    }
  }



  void addUser(String username, String surname,String subtitle ,String email,String phone, String password,String description ) async {
    var client = http.Client();
  print("name: "+ username);
    FullUser user =FullUser(username,surname,subtitle,email,phone,password,description);

    http.Response response = await client.post(Uri.parse(baseUrl + "users"),headers: {"content-type": "application/json"},
        body: jsonEncode(user))
.whenComplete(client.close);
    print(response.statusCode);
  }
}
