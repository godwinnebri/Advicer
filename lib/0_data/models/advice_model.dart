import 'package:adviser_app/1_domain/entities/advice_entites.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advise, required int id})
      : super(advise: advise, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advise: json['advice'], id: json['advice_id']);
  }
}
