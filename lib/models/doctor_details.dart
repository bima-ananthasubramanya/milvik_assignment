 import 'dart:convert';

class DoctorsMain {
  DoctorsMain(this.doctors);

  List<Doctor>? doctors;

  factory DoctorsMain.fromJson(Map<String, dynamic> json) =>
      DoctorsMain(
        json["doctors"] == null ? null : List<Doctor>.from(
            json["Doctor"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "doctors": doctors == null ? null : List<dynamic>.from(
            doctors!.map((x) => x.toJson())),
      };
}


class Doctor {
  Doctor({
      this.id,
      this.first_name,
      this.last_name,
      this.profile_pic,
      this.primary_contact_no,
      this.rating,
      this.email_address,
      this.qualification,
      this.description,
      this.specialization,
      this.languagesKnown});

  int? id;
  String? first_name;
  String? last_name;
  String? profile_pic;
  String? primary_contact_no;
  double? rating;
  String? email_address;
  String? qualification;
  String? description;
  String? specialization;
  String? languagesKnown;

  /// A factory constructor is a constructor that can be used when you dont necessarily want a constructor
  /// to create new instances from a class.

  /// This method takes a Map(json)and transforms into an object of type Employee
  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    first_name: json["first_name"],
    last_name:json["last_name"],
    profile_pic:json["profile_pic"],
    primary_contact_no:json["primary_contact_no"],
    rating:double.parse(json["rating"]),
    email_address:json["email_address"],
    qualification:json["qualification"],
    description:json["description"],
    specialization:json["specialization"],
    languagesKnown:json["languagesKnown"],
  );

  // List<Doctor>? get doctors => doctors;

  // this method takes an object and converts it into an map as key value pair.

    Map<String,dynamic> toJson() => {
      'id': id,
      'firstName': first_name,
      'lastName':last_name,
      'profilePic': profile_pic,
      'primaryContactNo': primary_contact_no,
      'rating': rating,
      'emailAddress': email_address,
      'qualification': qualification,
      'description': description,
      'specialization': specialization,
      'languagesKnown': languagesKnown,
    };

  @override
  String toString() {
    return 'Doctor{id: $id, first_name: $first_name, last_name: $last_name, profile_pic: $profile_pic, primary_contact_no: $primary_contact_no, rating: $rating, email_address: $email_address, qualification: $qualification, description: $description, specialization: $specialization, languagesKnown: $languagesKnown}';
  }
}


