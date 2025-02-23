/// _id : "67b3d89086a024f06ea27c2f"
/// username : "ashaff"
/// firstName : "youssef"
/// lastName : "ashra"
/// email : "youssef.abdelrahman158@gmail.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// createdAt : "2025-02-18T00:47:12.820Z"
/// passwordChangedAt : "2025-02-23T19:29:15.660Z"

class User {
  User({
      this.id, 
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.createdAt, 
      this.passwordChangedAt,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? createdAt;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    return map;
  }

}