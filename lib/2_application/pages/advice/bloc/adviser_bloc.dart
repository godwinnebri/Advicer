import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
//

    on<AdviseRequestEvent>((event, emit) async {
      emit(AdviseLoading());
      //execute business logic eg get advice
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(AdviseLoaded(advice: 'Fake advice to test bloc'));
    });
  }
}
