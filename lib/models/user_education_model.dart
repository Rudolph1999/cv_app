class UserEducation{
  String name;
  String university;
  String email;
  
 

  UserEducation(this.name,this.university,this.email);

    //convert json to Fulluser
   UserEducation.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        university = json['university'],
        email = json['email'];
    
           
// convert class to json
 Map toJson() => {
    'name': name,
    'university': university,
     'email': email,
   
 };

}