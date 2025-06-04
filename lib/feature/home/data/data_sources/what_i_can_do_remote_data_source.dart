// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio_v2/feature/home/data/models/what_i_can_do_model.dart';

abstract interface class WhatICanDoRemoteDataSource {
  Future<List<WhatICanDoModel>> getCards();
}

class WhatICanDoRemoteDataSourceImpl extends WhatICanDoRemoteDataSource {
  FirebaseFirestore firestore;
  WhatICanDoRemoteDataSourceImpl({required this.firestore});
  @override
  Future<List<WhatICanDoModel>> getCards() async {
    final cards = await firestore.collection('WhatICanDo').get();
    return cards.docs
        .map((doc) => WhatICanDoModel.fromJson(doc.data()))
        .toList();
  }
}
