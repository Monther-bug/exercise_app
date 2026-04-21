import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'local_event.dart';
part 'local_state.dart';

class LocalBloc extends Bloc<LocalEvent, LocalState> {
  LocalBloc() : super(LocalInitial()) {
    on<ChangeLanguage>((event, emit) {
      emit(state.copyWith(locale: event.newLang));
    });

    // Update Theme - Notice we don't have to pass locale here!
    on<TehmeToggle>((event, emit) {
      final newMode = state.themeMode == ThemeMode.light 
          ? ThemeMode.dark 
          : ThemeMode.light;
      emit(state.copyWith(themeMode: newMode));
    });
  }
  }

