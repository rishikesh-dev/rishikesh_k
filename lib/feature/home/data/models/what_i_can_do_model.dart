import 'package:portfolio_v2/feature/home/domain/entity/what_i_can_do_entity.dart';

class WhatICanDoModel extends WhatICanDoEntity {
  WhatICanDoModel({required super.title, required super.imgUrl});

  factory WhatICanDoModel.fromJson(Map<String, dynamic> json) {
    return WhatICanDoModel(title: json['title'], imgUrl: json['imgUrl']);
  }
  Map<String, dynamic> toJson() {
    return {'title': title, 'imgUrl': imgUrl};
  }
}
