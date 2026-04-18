import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocalBloc extends Bloc<LocalEvent, LocalState> {
  LocalBloc() : super(LocalInitial()) {
    on<ChangeLanguage>((event, emit) {
      emit(LocaleUpdate(event.newLang));
    });
  }
}
