class UserSkills {
  String name;
  int proficiency;
  String email;

  UserSkills(this.name,this.proficiency,this.email);

    //convert json to Fulluser
   UserSkills.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        proficiency = json['proficiency'],
        email= json['email'];
      
        
        
// convert class to json
 Map toJson() => {
    'name': name,
    'proficiency': proficiency,
    'email': email,
 };

}