import 'dart:convert';

List<UserModel3> productModelFromJson(String str) =>
    List<UserModel3>.from(json.decode(str).map((x) => UserModel3.fromJson(x)));

String productModelToJson(List<UserModel3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel3 {
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
  String? latitude;
  String? longitude;

  UserModel3({
    this.idTourist,
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
    this.score,
    this.latitude,
    this.longitude,
  });

  UserModel3 copyWith({
    String? idTourist,
    String? memberId,
    String? idCom,
    String? nameTra,
    String? location,
    String? price,
    String? serviceRate,
    String? timeOpen,
    String? timeClose,
    String? history,
    String? contactTel,
    String? detail,
    String? linkWeb,
    String? imgProfile,
    String? imgProfile2,
    String? imgProfile3,
    String? imgProfile4,
    String? imgProfile5,
    String? statusView,
    String? score,
    String? latitude,
    String? longitude,
  }) {
    return UserModel3(
      idTourist: idTourist ?? this.idTourist,
      memberId: memberId ?? this.memberId,
      idCom: idCom ?? this.idCom,
      nameTra: nameTra ?? this.nameTra,
      location: location ?? this.location,
      price: price ?? this.price,
      serviceRate: serviceRate ?? this.serviceRate,
      timeOpen: timeOpen ?? this.timeOpen,
      timeClose: timeClose ?? this.timeClose,
      history: history ?? this.history,
      contactTel: contactTel ?? this.contactTel,
      detail: detail ?? this.detail,
      linkWeb: linkWeb ?? this.linkWeb,
      imgProfile: imgProfile ?? this.imgProfile,
      imgProfile2: imgProfile2 ?? this.imgProfile2,
      imgProfile3: imgProfile3 ?? this.imgProfile3,
      imgProfile4: imgProfile4 ?? this.imgProfile4,
      imgProfile5: imgProfile5 ?? this.imgProfile5,
      statusView: statusView ?? this.statusView,
      score: score ?? this.score,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  // UserModel3.fromJson(Map<String, dynamic> json) {
  //   idTourist = json['id_tourist'];
  //   memberId = json['member_id'];
  //   idCom = json['id_com'];
  //   nameTra = json['name_tra'];
  //   location = json['location'];
  //   price = json['price'];
  //   serviceRate = json['service_rate'];
  //   timeOpen = json['time_open'];
  //   timeClose = json['time_close'];
  //   history = json['history'];
  //   contactTel = json['contact_tel'];
  //   detail = json['detail'];
  //   linkWeb = json['link_web'];
  //   imgProfile = json['img_profile'];
  //   imgProfile2 = json['img_profile2'];
  //   imgProfile3 = json['img_profile3'];
  //   imgProfile4 = json['img_profile4'];
  //   imgProfile5 = json['img_profile5'];
  //   statusView = json['status_view'];
  //   score = json['score'];
  //   latitude = json['latitude'];
  //   longitude = json['longitude'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id_tourist'] = this.idTourist;
  //   data['member_id'] = this.memberId;
  //   data['id_com'] = this.idCom;
  //   data['name_tra'] = this.nameTra;
  //   data['location'] = this.location;
  //   data['price'] = this.price;
  //   data['service_rate'] = this.serviceRate;
  //   data['time_open'] = this.timeOpen;
  //   data['time_close'] = this.timeClose;
  //   data['history'] = this.history;
  //   data['contact_tel'] = this.contactTel;
  //   data['detail'] = this.detail;
  //   data['link_web'] = this.linkWeb;
  //   data['img_profile'] = this.imgProfile;
  //   data['img_profile2'] = this.imgProfile2;
  //   data['img_profile3'] = this.imgProfile3;
  //   data['img_profile4'] = this.imgProfile4;
  //   data['img_profile5'] = this.imgProfile5;
  //   data['status_view'] = this.statusView;
  //   data['score'] = this.score;
  //   data['latitude'] = this.latitude;
  //   data['longitude'] = this.longitude;
  //   return data;
  // }

  Map<String, dynamic> toMap() {
    return {
      'id_tourist': idTourist,
      'member_id': memberId,
      'id_com': idCom,
      'name_tra': nameTra,
      'location': location,
      'price': price,
      'service_rate': serviceRate,
      'time_open': timeOpen,
      'time_close': timeClose,
      'history': history,
      'contact_tel': contactTel,
      'detail': detail,
      'link_web': linkWeb,
      'img_profile': imgProfile,
      'img_profile2': imgProfile2,
      'img_profile3': imgProfile3,
      'img_profile4': imgProfile4,
      'img_profile5': imgProfile5,
      'status_view': statusView,
      'score': score,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserModel3.fromMap(Map<String, dynamic> map) {
    return UserModel3(
      idTourist: map['id_tourist'].toString(),
      memberId: map['member_id'].toString(),
      idCom: map['id_com'].toString(),
      nameTra: map['name_tra'].toString(),
      location: map['location'].toString(),
      price: map['price'].toString(),
      serviceRate: map['service_rate'].toString(),
      timeOpen: map['time_open'].toString(),
      timeClose: map['time_close'].toString(),
      history: map['history'].toString(),
      contactTel: map['contactTel'].toString(),
      detail: map['detail'].toString(),
      linkWeb: map['linkWeb'].toString(),
      imgProfile: map['img_profile'].toString(),
      imgProfile2: map['img_profile2'].toString(),
      imgProfile3: map['img_profile3'].toString(),
      imgProfile4: map['img_profile4'].toString(),
      imgProfile5: map['img_profile5'].toString(),
      statusView: map['status_view'].toString(),
      score: map['score'].toString(),
      latitude: map['latitude'].toString(),
      longitude: map['longitude'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel3.fromJson(String source) =>
      UserModel3.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(idTourist: $idTourist, memberId: $memberId, idCom: $idCom, nameTra: $nameTra, location: $location, price: $price, serviceRate: $serviceRate, timeOpen: $timeOpen, timeClose: $timeClose, history: $history , contactTel: $contactTel,detail: $detail,linkWeb: $linkWeb,imgProfile: $imgProfile,imgProfile: $imgProfile2,imgProfile3: $imgProfile3,imgProfile4: $imgProfile4,imgProfile5: $imgProfile5,statusView: $statusView,score: $score,latitude: $latitude,longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel3 &&
        other.idTourist == idTourist &&
        other.memberId == memberId &&
        other.nameTra == nameTra &&
        other.location == location &&
        other.price == price &&
        other.serviceRate == serviceRate &&
        other.timeOpen == timeOpen &&
        other.timeClose == timeClose &&
        other.history == history &&
        other.contactTel == contactTel &&
        other.detail == detail &&
        other.linkWeb == linkWeb &&
        other.imgProfile == imgProfile &&
        other.imgProfile2 == imgProfile2 &&
        other.imgProfile3 == imgProfile3 &&
        other.imgProfile4 == imgProfile4 &&
        other.imgProfile5 == imgProfile5 &&
        other.statusView == statusView &&
        other.score == score &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return idTourist.hashCode ^
        memberId.hashCode ^
        idCom.hashCode ^
        nameTra.hashCode ^
        location.hashCode ^
        price.hashCode ^
        serviceRate.hashCode ^
        timeOpen.hashCode ^
        timeClose.hashCode ^
        history.hashCode ^
        contactTel.hashCode ^
        detail.hashCode ^
        linkWeb.hashCode ^
        imgProfile.hashCode ^
        imgProfile2.hashCode ^
        imgProfile3.hashCode ^
        imgProfile4.hashCode ^
        imgProfile5.hashCode ^
        statusView.hashCode ^
        score.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
