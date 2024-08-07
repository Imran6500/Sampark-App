class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.profileImage,
      this.phoneNumber,
      this.about,
      this.createdAt,
      this.lastOnlineStatus,
      this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    about = json['About'];
    createdAt = json['CreatedAt'];
    lastOnlineStatus = json['LastOnlineStatus'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profileImage'] = profileImage;
    data['phoneNumber'] = phoneNumber;
    data['About'] = about;
    data['CreatedAt'] = createdAt;
    data['LastOnlineStatus'] = lastOnlineStatus;
    data['Status'] = status;
    return data;
  }
}
