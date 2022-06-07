// class SpecialityModel {
//   int? specialtyId;
//   String? specialtyName;

//   SpecialityModel({this.specialtyId, this.specialtyName});

//   SpecialityModel.fromJson(Map<String, dynamic> json) {
//     specialtyId = json['specialtyId'];
//     specialtyName = json['specialtyName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['specialtyId'] = this.specialtyId;
//     data['specialtyName'] = this.specialtyName;
//     return data;
//   }
// }

class SpecialityModel {
  List<Data>? data;

  SpecialityModel({this.data});

  SpecialityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  num? specialtyId;
  String? specialtyName;

  Data({this.specialtyId, this.specialtyName});

  Data.fromJson(Map<String, dynamic> json) {
    specialtyId = json['specialtyId'];
    specialtyName = json['specialtyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialtyId'] = this.specialtyId;
    data['specialtyName'] = this.specialtyName;
    return data;
  }
}
