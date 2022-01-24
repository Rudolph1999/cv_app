
// Will be used in the userprofile page
class FullUser{
 
  String username ;
  String surname;
  String password;
  String description;
  String subtitle;
  String email;
  String phone;
 
  FullUser(this.username,this.surname,this.subtitle,this.email,this.phone,this.description,this.password);


  //convert json to Fulluser
   FullUser.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        surname = json['surname'],
        subtitle = json['subtitle'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        description = json['description'];
        
// convert class to json
 Map toJson() => {
    'username': username,
    'surname': surname,
    'subtitle': subtitle,
    'email':email,
    'phone':phone,
    'password':password,
    'description': description,
  
 };
}