class UserModel {
  String name;
  String id;
  String email;
  static UserModel? currentUser;
  String phoneNumber;
  UserModel({required this.id,required this.name,required this.email,required this.phoneNumber});

  UserModel.fromjson(Map<String, dynamic> json, String id) : this(
    id: id,
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
  );
  Map<String,dynamic> tojson(){
    return{
      "id":id,
      "name":name,
      "email":email,
      "phoneNumber":phoneNumber,
    };
  }
}
