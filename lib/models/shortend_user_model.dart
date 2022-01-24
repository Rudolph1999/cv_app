

// shoretend user that will be used in the recruiter page to list all the users. 
class ShortendUser{
  String username ="" ;
  String email = "";
  String password ="";


   ShortendUser.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        password = json['password'];
        
       

}