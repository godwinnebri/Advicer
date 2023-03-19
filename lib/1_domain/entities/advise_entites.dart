import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String advise;
  final int id;

  const AdviceEntity({required this.advise, required this.id});

  @override
  List<Object?> get props => [advise, int];
}
