class DoctorModel{
  String? id;
  String? fullName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? choseSpecialist;
  String? img;
  bool? isAdmin;

  DoctorModel({
    this.id,
    this.fullName,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.choseSpecialist,
    this.img,
    this.isAdmin,
  });

  DoctorModel.fromJson(json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    choseSpecialist = json['choseSpecialist'];
    isAdmin = json['isAdmin'];
    img = json['img'];

  }

  toJson() {
    return {
      id = id,
      fullName = fullName,
      email = email,
      password = password,
      phone = phone,
      address = address,
      choseSpecialist = choseSpecialist,
      isAdmin = isAdmin,
      img = img,
    };
  }
}