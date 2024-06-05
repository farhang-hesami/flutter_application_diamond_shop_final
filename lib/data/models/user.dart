class User {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? registrationDate;

  User({this.fullName, this.email, this.phoneNumber, this.registrationDate});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    registrationDate = json['registrationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['registrationDate'] = this.registrationDate;
    return data;
  }
}

class UserComments {
  String? productTitle;
  String? productImage;
  int? id;
  String? subject;
  String? text;
  String? userFullName;
  String? userEmail;
  int? productId;
  String? createDate;

  UserComments(
      {this.productTitle,
      this.productImage,
      this.id,
      this.subject,
      this.text,
      this.userFullName,
      this.userEmail,
      this.productId,
      this.createDate});

  UserComments.fromJson(Map<String, dynamic> json) {
    productTitle = json['productTitle'];
    productImage = json['productImage'];
    id = json['id'];
    subject = json['subject'];
    text = json['text'];
    userFullName = json['userFullName'];
    userEmail = json['userEmail'];
    productId = json['productId'];
    createDate = json['createDate'];
  }
}
