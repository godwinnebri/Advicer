import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:equatable/equatable.dart';

class AdviseModel extends AdviceEntity with EquatableMixin {
  AdviseModel({required String advise, required int id})
      : super(advise: advise, id: id);

  factory AdviseModel.fromJson(Map<String, dynamic> json) {
    return AdviseModel(advise: json['advice'], id: json['advice_id']);
  }
}
