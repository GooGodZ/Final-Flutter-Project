import 'dart:convert';

class SouthModel {
  final String name;
  final String province;
  final String district;
  final String cover;
  final String detail;
  final String image1;
  final String image2;
  final String image3;
  SouthModel({
    this.name,
    this.province,
    this.district,
    this.cover,
    this.detail,
    this.image1,
    this.image2,
    this.image3,
  });

  SouthModel copyWith({
    String name,
    String province,
    String district,
    String cover,
    String detail,
    String image1,
    String image2,
    String image3,
  }) {
    return SouthModel(
      name: name ?? this.name,
      province: province ?? this.province,
      district: district ?? this.district,
      cover: cover ?? this.cover,
      detail: detail ?? this.detail,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'province': province,
      'district': district,
      'cover': cover,
      'detail': detail,
      'image1': image1,
      'image2': image2,
      'image3': image3,
    };
  }

  factory SouthModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SouthModel(
      name: map['name'],
      province: map['province'],
      district: map['district'],
      cover: map['cover'],
      detail: map['detail'],
      image1: map['image1'],
      image2: map['image2'],
      image3: map['image3'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SouthModel.fromJson(String source) => SouthModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SouthModel(name: $name, province: $province, district: $district, cover: $cover, detail: $detail, image1: $image1, image2: $image2, image3: $image3)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SouthModel &&
      o.name == name &&
      o.province == province &&
      o.district == district &&
      o.cover == cover &&
      o.detail == detail &&
      o.image1 == image1 &&
      o.image2 == image2 &&
      o.image3 == image3;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      province.hashCode ^
      district.hashCode ^
      cover.hashCode ^
      detail.hashCode ^
      image1.hashCode ^
      image2.hashCode ^
      image3.hashCode;
  }
}
