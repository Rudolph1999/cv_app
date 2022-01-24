class UserExperiance {
  String name;
  String city;
  String startDate;
  String endDate;
  String company;
  String description;
  String email;
 

  UserExperiance(this.name,this.city,this.startDate,this.endDate,this.company,this.description,this.email);

    //convert json to Fulluser
   UserExperiance.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        city = json['city'],
        startDate= json['startDate'],
        endDate= json['endDate'],
        company= json['company'],
        description= json['description'],
        email= json['email'];
      
           
// convert class to json
 Map toJson() => {
    'name': name,
    'city': city,
    'startDate': startDate,
    'endDate': endDate,
    'company': company,
    'description': description,
    'email': email,
 };

}