class DoctorsData {
  String? type;
  String? id;
  String? email;
  String? name;
  String? gender;
  String? birth;
  String? medicalTitle;
  String? phone;
  String? officeAddress;
  String? profile;
  String? universty;
  String? fieldOfStude;
  String? degree;
  String? startYearEdiction;
  String? endYearEdiction;
  String? institution;
  String? position;
  String? startYearWork;
  String? endYearWork;
  String? category;
  String? specialisty;
  String? expiryBoard;
  String? expiryCurrent;
  String? urlImage;

  DoctorsData({
    required this.id,
    this.name,
    this.gender,
    this.birth,
    this.medicalTitle,
    this.phone,
    this.officeAddress,
    this.profile,
    this.universty,
    this.fieldOfStude,
    this.degree,
    this.startYearEdiction,
    this.endYearEdiction,
    this.institution,
    this.position,
    this.startYearWork,
    this.endYearWork,
    this.category,
    this.specialisty,
    this.expiryBoard,
    this.expiryCurrent,
    this.urlImage,
    this.email,
    this.type,
  });

  factory DoctorsData.fromjson(dynamic data) {
    return DoctorsData(
      id: data["id"],
      name: data["name"],
      gender: data["gender"],
      birth: data["birth"],
      medicalTitle: data['medicalTitle'],
      phone: data["phone"],
      officeAddress: data["officeAddress"],
      profile: data["profile"],
      universty: data["universty"],
      fieldOfStude: data["fieldOfStude"],
      degree: data["degree"],
      startYearEdiction: data["startYearEdiction"],
      endYearEdiction: data["endYearEdiction"],
      institution: data["institution"],
      position: data["position"],
      startYearWork: data["startYearWork"],
      endYearWork: data["endYearWork"],
      category: data["category"],
      specialisty: data["specialisty"],
      expiryBoard: data["expiryBoard"],
      expiryCurrent: data["expiryCurrent"],
      urlImage: data["urlImage"],
      email: data["email"],
    );
  }
  toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'gender': gender,
      'birth': birth,
      'medicalTitle': medicalTitle,
      'phone': phone,
      'officeAddress': officeAddress,
      'profile': profile,
      'universty': universty,
      'fieldOfStude': fieldOfStude,
      'degree': degree,
      'startYearEdiction': startYearEdiction,
      'endYearEdiction': endYearEdiction,
      'institution': institution,
      'position': position,
      'startYearWork': startYearWork,
      'endYearWork': endYearWork,
      'category': category,
      'specialisty': specialisty,
      'expiryBoard': expiryBoard,
      'expiryCurrent': expiryCurrent,
      'urlImage': urlImage,
      'type': type,
    };
  }
}
