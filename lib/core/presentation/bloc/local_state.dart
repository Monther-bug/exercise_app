part of 'local_bloc.dart';

@immutable
sealed class LocalState {
  final Locale locale;
  LocalState(this.locale);
}

final class LocalInitial extends LocalState {
  LocalInitial(): super (Locale('en'));
}

final class LocaleUpdate extends LocalState{
   LocaleUpdate(super.locale);
}
