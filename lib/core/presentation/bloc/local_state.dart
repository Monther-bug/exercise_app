part of 'local_bloc.dart';

@immutable


class LocalState {
  final Locale locale;
  final ThemeMode? themeMode;

  const LocalState({
    required this.locale,
    required this.themeMode,
  });

  // copyWith allows you to update one without passing the other
  LocalState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return LocalState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

// Initial state with your defaults
class LocalInitial extends LocalState {
  LocalInitial() : super(
    locale: const Locale('en'), 
    themeMode: ThemeMode.light
  );
}
