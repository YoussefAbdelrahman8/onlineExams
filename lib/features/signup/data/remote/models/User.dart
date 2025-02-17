/// username : "Ashraf"
/// firstName : "Elevatee"
/// lastName : "Tech"
/// email : "youssef@1elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67b0b6b586a024f06ea26dfd"
/// createdAt : "2025-02-15T15:45:57.213Z"

class User {
  User({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.id, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

}