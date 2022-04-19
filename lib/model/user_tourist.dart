class UserModel2 {
  String? idTourist;
  String? memberId;
  String? idCom;
  String nameTra = '';
  String? location;
  String? price;
  String? serviceRate;
  String? timeOpen;
  String? timeClose;
  String? history;
  String? contactTel;
  String? detail;
  String? linkWeb;
  String imgProfile = '';
  String? imgProfile2;
  String? imgProfile3;
  String? imgProfile4;
  String? imgProfile5;
  String? statusView;
  String? score;

  UserModel2(
      {this.idTourist,
      this.memberId,
      this.idCom,
      this.nameTra = '',
      this.location,
      this.price,
      this.serviceRate,
      this.timeOpen,
      this.timeClose,
      this.history,
      this.contactTel,
      this.detail,
      this.linkWeb,
      this.imgProfile = '',
      this.imgProfile2,
      this.imgProfile3,
      this.imgProfile4,
      this.imgProfile5,
      this.statusView,
      this.score});

  UserModel2.fromJson(Map<String, dynamic> json) {
    idTourist = json['id_tourist'];
    memberId = json['member_id'];
    idCom = json['id_com'];
    nameTra = json['name_tra'];
    location = json['location'];
    price = json['price'];
    serviceRate = json['service_rate'];
    timeOpen = json['time_open'];
    timeClose = json['time_close'];
    history = json['history'];
    contactTel = json['contact_tel'];
    detail = json['detail'];
    linkWeb = json['link_web'];
    imgProfile = json['img_profile'];
    imgProfile2 = json['img_profile2'];
    imgProfile3 = json['img_profile3'];
    imgProfile4 = json['img_profile4'];
    imgProfile5 = json['img_profile5'];
    statusView = json['status_view'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tourist'] = this.idTourist;
    data['member_id'] = this.memberId;
    data['id_com'] = this.idCom;
    data['name_tra'] = this.nameTra;
    data['location'] = this.location;
    data['price'] = this.price;
    data['service_rate'] = this.serviceRate;
    data['time_open'] = this.timeOpen;
    data['time_close'] = this.timeClose;
    data['history'] = this.history;
    data['contact_tel'] = this.contactTel;
    data['detail'] = this.detail;
    data['link_web'] = this.linkWeb;
    data['img_profile'] = this.imgProfile;
    data['img_profile2'] = this.imgProfile2;
    data['img_profile3'] = this.imgProfile3;
    data['img_profile4'] = this.imgProfile4;
    data['img_profile5'] = this.imgProfile5;
    data['status_view'] = this.statusView;
    data['score'] = this.score;
    return data;
  }
}
