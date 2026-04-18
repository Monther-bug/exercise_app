part of 'local_bloc.dart';

@immutable
sealed class LocalEvent {}

class ChangeLanguage extends LocalEvent{
  final Locale newLang;
  ChangeLanguage(this.newLang);
}
