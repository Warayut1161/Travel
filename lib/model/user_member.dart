class UserModel {
  String? memberId;
  String? profilePer;
  String? memberPer;
  String? memberName;
  String? memberLname;
  String? address;
  String? memberTel;
  String? memberEmail;
  String? memberUsername;
  String? memberPassword;
  String? statusUser;

  UserModel(
      {this.memberId,
      this.profilePer,
      this.memberPer,
      this.memberName,
      this.memberLname,
      this.address,
      this.memberTel,
      this.memberEmail,
      this.memberUsername,
      this.memberPassword,
      this.statusUser});

  UserModel.fromJson(Map<String?, dynamic> json) {
    memberId = json['member_id'];
    profilePer = json['profile_per'];
    memberPer = json['member_per'];
    memberName = json['member_name'];
    memberLname = json['member_lname'];
    address = json['address'];
    memberTel = json['member_tel'];
    memberEmail = json['member_email'];
    memberUsername = json['member_username'];
    memberPassword = json['member_password'];
    statusUser = json['status_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['profile_per'] = this.profilePer;
    data['member_per'] = this.memberPer;
    data['member_name'] = this.memberName;
    data['member_lname'] = this.memberLname;
    data['address'] = this.address;
    data['member_tel'] = this.memberTel;
    data['member_email'] = this.memberEmail;
    data['member_username'] = this.memberUsername;
    data['member_password'] = this.memberPassword;
    data['status_user'] = this.statusUser;
    return data;
  }
}
