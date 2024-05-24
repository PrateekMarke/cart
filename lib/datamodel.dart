class LoginDataModel {
  String email;
  String password;
  LoginDataModel({required this.email, required this.password});
}
class SignDataMOdel {
  
  String first;
  String last;
  String confirmpass;
  String phone;

  SignDataMOdel({required this.confirmpass, required this.first, required this.last, required this.phone});
}
class ItemDataModel {
  final String name;
  final String image;
  final double price;
  final String desc;

  ItemDataModel({
    required this.name,
    required this.image,
    required this.price,
    required this.desc,
  });
}


