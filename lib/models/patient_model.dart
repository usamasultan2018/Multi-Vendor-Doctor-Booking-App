class PatientModel {
  String? id;
  String? fullName;
  String? email;
  String? password;
  String? phone;
  String? img;
  String? address;
  bool? isAdmin;

  PatientModel({
    this.id,
    this.fullName,
    this.img,
    this.email,
    this.address,
    this.password,
    this.phone,
    this.isAdmin,
  });
  PatientModel.fromJson(json) {
    id = json['id'];
    fullName = json['fullName'];
    img = json['img'];
    address = json['address'];
    email = json["email"];
    password = json['password'];
    phone = json["phone"];
    isAdmin = json['isAdmin'];
  }

  toJson() {
    return {
      "id": id,
      "name": fullName,
      "img": img,
      "email": email,
      "address":address,
      "password": password,
      "phone": phone,
      "isAdmin": isAdmin,
    };
  }
}