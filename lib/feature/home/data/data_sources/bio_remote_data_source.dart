import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_v2/feature/home/data/models/bio_model.dart';

abstract interface class BioRemoteDataSource {
  Future<BioModel> getDetails();
}

class BioRemoteDataSourceImpl extends BioRemoteDataSource {
  FirebaseFirestore firestore;
  BioRemoteDataSourceImpl(this.firestore);
  @override
  Future<BioModel> getDetails() async {
    final bio = await firestore.collection('portfolio').doc('bio').get();
    return BioModel.fromJson(bio.data()!);
  }
}
